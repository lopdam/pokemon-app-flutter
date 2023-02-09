import 'package:carousel_slider/carousel_slider.dart';
import 'package:chip_list/chip_list.dart';
import 'package:pokemon/bloc/pokemons_bloc.dart';
import 'package:pokemon/models/pokemon.dart';
import 'package:pokemon/ui/widgets/ability_indicator.dart';
import 'package:pokemon/ui/widgets/ability_info.dart';
import 'package:pokemon/utils/util.dart';
import 'package:pokemon/values/colors.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  static const String route = "/home";

  @override
  _HomeView createState() => _HomeView();
}

class _HomeView extends State<HomeView> {
  final PokemonsBloc _pokemonBloc = PokemonsBloc();
  int _currentIndex = 0;
  List<int> _currentAvilities = [];
  int maxSelect = 2;

  List<String> infoKeys = Pokemon.info.keys.toList();

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pokemonBloc.disponse();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      left: false,
      top: false,
      right: false,
      child: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: AppColors.colorPrimary,
            title: StreamBuilder(
                stream: _pokemonBloc.getPokemonName,
                builder:
                    (BuildContext context, AsyncSnapshot<String?> snapshot) =>
                        Text((snapshot.data ?? "").toUpperCase()))),
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 36),
          child: _body(),
        ),
      ),
    );
  }

  Widget _body() {
    return ListView(
      children: [
        StreamBuilder<List<Pokemon>?>(
            key: scaffoldKey,
            stream: _pokemonBloc.getPokemons,
            builder: (_, AsyncSnapshot<List<Pokemon>?> snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                List<Pokemon>? _pokemons = snapshot.data;
                if (_pokemons != null && _pokemons.isNotEmpty) {
                  List<String> names = _pokemons
                      .map((e) => (e.name ?? "").toUpperCase())
                      .toList();
                  return ChipList(
                    listOfChipNames: names,
                    activeBgColorList: [Theme.of(context).primaryColor],
                    inactiveBgColorList: [Colors.white],
                    activeTextColorList: [Colors.white],
                    inactiveTextColorList: [Theme.of(context).primaryColor],
                    shouldWrap: true,
                    listOfChipIndicesCurrentlySeclected: [_currentIndex],
                    extraOnToggle: (val) {
                      _pokemonBloc.setPokemon = _pokemons[val];
                      setState(() {
                        _currentAvilities.clear();
                        _currentIndex = val;
                      });
                    },
                  );
                } else {
                  return Container();
                }
              } else {
                return Center(
                    child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ));
              }
            }),
        const SizedBox(height: 8),
        StreamBuilder(
            stream: _pokemonBloc.getPokemon,
            builder: (_, AsyncSnapshot<Pokemon?> snapshot) {
              Pokemon? _pokemon = snapshot.data;
              if (_pokemon != null) {
                return Column(
                  children: [
                    const Text(
                      "Habilidades",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    ChipList(
                      listOfChipNames: infoKeys,
                      activeBgColorList: [AppColors.bayteqOrange],
                      inactiveBgColorList: [Colors.white],
                      activeTextColorList: [Colors.white],
                      supportsMultiSelect: true,
                      shouldWrap: true,
                      inactiveTextColorList: [Theme.of(context).primaryColor],
                      listOfChipIndicesCurrentlySeclected: [
                        ..._currentAvilities
                      ],
                      extraOnToggle: (val) {
                        if (_currentAvilities.contains(val)) {
                          setState(() {
                            _currentAvilities.remove(val);
                          });
                        } else {
                          if (_currentAvilities.length >= maxSelect) {
                            Util.longToast(
                                "No puede seleccionar más de $maxSelect habilidades");
                          } else {
                            setState(() {
                              _currentAvilities.add(val);
                            });
                          }
                        }
                        _pokemonBloc.updatePokemon =
                            _pokemon.calculateAbilities(_currentAvilities);
                      },
                    ),
                    ..._currentAvilities
                        .map(
                          (e) => AbilityInfo(
                              ability: infoKeys[e],
                              info: Pokemon.info[infoKeys[e]] ?? ""),
                        )
                        .toList(),
                    CarouselSlider(
                        items: _pokemon.photos
                            .map((e) => Image.network(
                                  e,
                                  scale: 0.5,
                                ))
                            .toList(),
                        options: CarouselOptions(
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.3,
                          scrollDirection: Axis.horizontal,
                        )),
                    AbilityIndicator(
                      ability: "Vida",
                      value: _pokemon.hpCurrent,
                    ),
                    AbilityIndicator(
                      ability: "Ataque",
                      value: _pokemon.attackCurrent,
                    ),
                    AbilityIndicator(
                      ability: "Defensa",
                      value: _pokemon.defenseCurrent,
                    ),
                    AbilityIndicator(
                      ability: "Velocidad",
                      value: _pokemon.speedCurrent,
                    )
                  ],
                );
              } else {
                return Container();
              }
            }),
      ],
    );
  }
}
