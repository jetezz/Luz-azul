#include "nivel05.h"

void crearnivel05(){
//player  portal puertas y marco
createPlayer(3,5);
createMarco(no);
createPortal(si);
createPuerta(3,6,sprite_Puerta_G,nivel_04);
createPuerta(13,6,sprite_Puerta_B,nivel_07);

////rocas móviles (separando id por espacios)
cambiarMov(mover_1);
createRoca(5,5,sprite_Rock_G,2);
createRocaEspejo(11,5, sprite_Rock_B,2);
cambiarMov(mover_Linea);
createRoca(4,3,sprite_RockLineal1_G,3);
cambiarMov(mover_1);
createRocaEspejo(12,3, sprite_Rock_B,3);
cambiarMov(sin_Movimiento);

////collecionables
createColeccionabeLuz(12,2,5);

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

//decoracion simetrico
crearRocaYsimetrico(7,3,sprite_RockInmovil1_G,sprite_RockInmovil1_B,1);
crearRocaYsimetrico(7,5,sprite_RockInmovil1_G,sprite_RockInmovil1_B,1);

//decoracion izquierda

//decoracionDerecha
createHoleDerecha(10,4,sprite_hole,1);
}
