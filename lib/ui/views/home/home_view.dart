import 'package:chip_list/chip_list.dart';
import 'package:pokemon/bloc/pokemons_bloc.dart';
import 'package:pokemon/models/pokemon.dart';
import 'package:pokemon/ui/views/home/abilities_indicator.dart';
import 'package:pokemon/ui/views/home/abilities_info.dart';
import 'package:pokemon/ui/views/home/photos_carousel.dart';
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
    _pokemonBloc.dispose();
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
        _header(),
        const SizedBox(height: 8),
        _pokemonInfo(),
      ],
    );
  }

  Widget _header() {
    return StreamBuilder<List<Pokemon>?>(
        key: scaffoldKey,
        stream: _pokemonBloc.getPokemons,
        builder: (_, AsyncSnapshot<List<Pokemon>?> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            List<Pokemon>? pokemons = snapshot.data;
            if (pokemons != null && pokemons.isNotEmpty) {
              List<String> names =
                  pokemons.map((e) => (e.name ?? "").toUpperCase()).toList();
              return ChipList(
                listOfChipNames: names,
                activeBgColorList: [Theme.of(context).primaryColor],
                inactiveBgColorList: const [Colors.white],
                activeTextColorList: const [Colors.white],
                inactiveTextColorList: [Theme.of(context).primaryColor],
                shouldWrap: true,
                listOfChipIndicesCurrentlySeclected: [_currentIndex],
                extraOnToggle: (val) {
                  _pokemonBloc.setPokemon = pokemons[val];
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
        });
  }

  Widget _pokemonInfo() {
    return StreamBuilder(
        stream: _pokemonBloc.getPokemon,
        builder: (_, AsyncSnapshot<Pokemon?> snapshot) {
          Pokemon? pokemon = snapshot.data;
          if (pokemon != null) {
            return Column(
              children: [
                const Text(
                  "Habilidades",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                _abilitiesChips(pokemon),
                AbilitiesInfo(
                    currentAvilities: _currentAvilities, infoKeys: infoKeys),
                PhotosCarousel(
                    key: ValueKey(pokemon.photos), photos: pokemon.photos),
                AbilitiesIndicator(pokemon: pokemon)
              ],
            );
          } else {
            return Container();
          }
        });
  }

  Widget _abilitiesChips(Pokemon pokemon) {
    return ChipList(
      listOfChipNames: infoKeys,
      activeBgColorList: const [AppColors.bayteqOrange],
      inactiveBgColorList: const [Colors.white],
      activeTextColorList: const [Colors.white],
      supportsMultiSelect: true,
      shouldWrap: true,
      inactiveTextColorList: [Theme.of(context).primaryColor],
      listOfChipIndicesCurrentlySeclected: [..._currentAvilities],
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
            pokemon.calculateAbilities(_currentAvilities);
      },
    );
  }
}
