# Pokemon

Pokemon App

## Aplicación móvil en Flutter;

Consumir el servicio desde https://pokeapi.co, para ello acceder a la documentación de la
página y utilizar el recurso de paginación para obtener una lista de 3 elementos
https://pokeapi.co/docs/v2#resource-listspagination-section, estos elementos deben ser
mostrados en una barra debajo del App Bar y deben ser seleccionables, es decir la vista
cambia conforme seleccione un elemento en mi barra seleccionable.

Los elementos por mostrarse del item seleccionado son:
• Imagen
• Vida en barra
• Ataque en barra
• Defensa en barra
• Velocidad en barra

La barra debe mostrar hasta un máximo de 250 unidades.


Para el selector de habilidades el usuario puede elegir hasta dos de las listadas a
continuación

Intimidación: Aumenta ataque en 10 y velocidad en 15, reduce vida 5 y defensa en 10
Inmunidad: Aumenta vida en 10, defensa en 20, reduce ataque en 20 y velocidad en 10
Potencia: Aumenta ataque en 15, velocidad en 15, reduce vida en 20 y defensa en 10
Regeneración: Aumenta vida en 10, velocidad en 5 y defensa en 5 reduce ataque 20
Impasible: Aumenta velocidad en 30, reduce vida en 10, defensa en 10 y ataque en 3
Tóxico: Aumenta defensa en 20, reduce vida en 15, velocidad en 3 y ataque 0

Una vez seleccionada las dos habilidades no se permite al usuario seleccionar más, si el
usuario pulsa en una previamente seleccionada esta se desmarca y permite seleccionar
habilidades nuevamente, la barra debe ir cambiando conforme se seleccione las
habilidades.

El estado de la app se debe mantener mientras se navega entre los ítems que están
disponibles en la barra de selección

Al hacer scroll vertical abajo “scroll Twitter” se deben recargar los siguientes 3 elementos
disponibles en mi paginación, el estado de la App se reinicia.
