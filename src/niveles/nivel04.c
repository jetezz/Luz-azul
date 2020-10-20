#include "nivel04.h"

void crearnivel04(){
//player  portal puertas y marco
createPlayer(14,4);
createMarco(si);
createPortal(si);
createPuerta(15,4,sprite_Puerta_G,nivel_02);
createPuerta(3,1,sprite_Puerta_G,nivel_05);
createPuerta(1,4,sprite_Puerta_G,nivel_04_01);
//createPuerta(puertas,3,7,sprite_Puerta_G,nivel_06);
createPuerta(11,3,sprite_StairUp1_G,nivel_08);
//createPuerta(puertas,11,5, sprite_StairDown1_G,nivel_15);

//rocas móviles (separando id por espacios)
cambiarMov(mover_1);
createRoca(3,4,sprite_Rock_G,2);
createRocaEspejo(13,4,sprite_Rock_G,2);
createRoca(3,3,sprite_Rock_G,3);
cambiarMov(sin_Movimiento);
createRocaEspejo(13,3,sprite_Rock_nomove_B,3);
cambiarMov(mover_1);
createRoca(3,5,sprite_Rock_G,4);
cambiarMov(mover_Linea);
createRocaEspejo(13,5,sprite_RockLineal1_G,4);
cambiarMov(sin_Movimiento);

//collecionables

//decoracion izquierda
createRoca(1,2,sprite_RockInmovil8_G,1);
createRoca(1,3,sprite_RockInmovil9_G,1);
createRoca(6,2,sprite_RockInmovil8_G,1);
createRoca(6,3,sprite_RockInmovil9_G,1);
createRoca(1,5,sprite_RockInmovil8_G,1);
createRoca(1,6,sprite_RockInmovil9_G,1);
createRoca(6,5,sprite_RockInmovil8_G,1);
createRoca(6,6,sprite_RockInmovil9_G,1);
createRoca(4,2,sprite_RockInmovil1_G,1);
createRoca(4,6,sprite_RockInmovil1_G,1);
createRoca(2,3,sprite_RockInmovil2_G,1);
createRoca(2,5,sprite_RockInmovil2_G,1);
createRoca(2,2,sprite_RockInmovil5_G,1);
createRoca(2,6,sprite_RockInmovil5_G,1);
createHoleIzquierda(4,1,sprite_hole,1);
createHoleIzquierda(4,7,sprite_hole,1);

//decoracionDerecha
createRocaEspejo(12,4,sprite_RockInmovil1_B,1);
createHoleDerecha(10,3,sprite_hole,4);
createHoleDerecha(10,5,sprite_hole,4);
createHoleDerecha(11,2,sprite_hole,4);
createHoleDerecha(11,4,sprite_hole,4);
createHoleDerecha(11,6,sprite_hole,4);
}
