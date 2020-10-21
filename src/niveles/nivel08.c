#include "nivel08.h"

void crearnivel08(){
//player  portal puertas y marco
createPlayer(12,4);
createMarco(si);
createPortal(si);
createPuerta(15,4,sprite_Puerta_G,nivel_09);
createPuerta(1,4,sprite_Puerta_B,nivel_08_01);
//createPuerta(puertas,11,3,sprite_StairUp1_G,nivel_13);
createPuerta(11,5, sprite_StairDown1_G,nivel_04);
createPuerta(5,3,sprite_StairUp1_B,niveltrap_02);
createPuerta(5,5, sprite_StairDown1_B,niveltrap_02);

//rocas móviles (separando id por espacios)
createRoca(5,2,sprite_Rock_nomove_B,2);
cambiarMov(mover_1);
createRocaEspejo(13,4,sprite_Rock_G,2);
cambiarMov(sin_Movimiento);
createRoca(5,6,sprite_Rock_nomove_B,2);



//collecionables

//decoracion muro
crearMuro(1,2,1,3,sprite_hole,posicion_Izquieda);
crearMuro(1,5,1,6,sprite_hole,posicion_Izquieda);
crearMuro(2,3,2,5,sprite_hole,posicion_Izquieda);

//decoracion simetricos
crearRocaYsimetrico(5,4,sprite_RockInmovil1_B,sprite_RockInmovil1_B,1);

//decoracion izquierda
createHoleIzquierda(3,4,sprite_hole,1);

//decoracionDerecha
createRocaEspejo(11,4,sprite_RockInmovil1_B,1);

}
