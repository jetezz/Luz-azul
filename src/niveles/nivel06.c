#include "nivel06.h"

void crearnivel06(){
//player  portal puertas y marco
createPlayer(4,2);
createMarco(no);
createPortal(si);
createPuerta(3,2,sprite_Puerta_G,nivel_04);
createPuerta(13,2,sprite_Puerta_B,nivel_07);

//rocas móviles (separando id por espacios)
cambiarMov(mover_Linea);
createRoca(5,4,sprite_RockLineal1_G,2);
createRoca(6,4,sprite_RockLineal1_G,3);
cambiarMov(sin_Movimiento);
createRocaEspejo(10,4,sprite_Rock_nomove_B,3);
createRocaEspejo(11,4,sprite_Rock_nomove_B,2);

//collecionables

//decoracion muros
crearMuro(2,1,2,7,sprite_Muro_Solid1,posicion_Izquieda);
crearMuro(3,1,5,1,sprite_Muro_Solid1,posicion_Izquieda);
crearMuro(3,7,5,7,sprite_Muro_Solid1,posicion_Izquieda);
crearMuro(5,2,7,2,sprite_Muro_Solid1,posicion_Izquieda);
crearMuro(5,6,7,6,sprite_Muro_Solid1,posicion_Izquieda);
crearMuro(8,2,8,3,sprite_Muro_Solid1,posicion_Izquieda);
crearMuro(8,5,8,6,sprite_Muro_Solid1,posicion_Izquieda);

crearMuro(14,1,14,7,sprite_Muro_Solid1,posicion_Derecha);
crearMuro(11,1,13,1,sprite_Muro_Solid1,posicion_Derecha);
crearMuro(9,2,11,2,sprite_Muro_Solid1,posicion_Derecha);
crearMuro(11,7,13,7,sprite_Muro_Solid1,posicion_Derecha);
crearMuro(9,6,11,6,sprite_Muro_Solid1,posicion_Derecha);
crearMuro(11,3,12,3,sprite_hole,posicion_Derecha);


//decoracion simetricos
crearRocaYsimetrico(3,3,sprite_RockInmovil5_G,sprite_RockInmovil5_B,1);

//decoracion izquierda

//decoracionDerecha
}
