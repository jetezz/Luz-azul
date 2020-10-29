#include "nivel12.h"

void crearnivel12(){
  //player  portal puertas y marco
createPlayer(4,1);
createMarco(si);
createPortal(si);
createPuerta(5,1,sprite_Puerta_G,nivel_09);
//createPuerta(11,1,sprite_Puerta_B,nivel_11_01);
//createPuerta(5,7,sprite_StairDown1_G,nivel_03_01);

//rocas móviles (separando id por espacios)

cambiarMov(mover_1);
createRoca(2,2,sprite_Rock_G,2);
createRoca(3,2,sprite_Rock_G,3);
createRoca(4,2,sprite_Rock_G,4);
createRoca(6,3,sprite_Rock_G,5);
createRoca(3,4,sprite_Rock_G,6);
createRoca(3,6,sprite_Rock_G,7);
createRocaEspejo(10,4,sprite_Rock_B,10);



cambiarMov(mover_Linea);
createRoca(2,6,sprite_RockLineal1_G,8);
createRocaEspejo(12,6,sprite_RockLineal1_G,9);


cambiarMov(sin_Movimiento);
createRoca(6,4,sprite_Rock_nomove_G,10);
createRoca(4,6,sprite_Rock_nomove_G,9);
createRocaEspejo(12,2,sprite_Rock_nomove_B,4);
createRocaEspejo(13,2,sprite_Rock_nomove_B,3);
createRocaEspejo(14,2,sprite_Rock_nomove_B,2);
createRocaEspejo(13,4,sprite_Rock_nomove_B,6);
createRocaEspejo(10,3,sprite_Rock_nomove_B,5);
createRocaEspejo(13,6,sprite_Rock_nomove_B,7);
createRocaEspejo(14,6,sprite_Rock_nomove_B,8);

//collecionables
createColeccionabeLuz(15,5,12);

//decoracion muros

//decoracion simetricos
crearRocaYsimetrico(2,3,sprite_RockInmovil1_G,sprite_RockInmovil1_B,1);
crearRocaYsimetrico(2,5,sprite_RockInmovil1_G,sprite_RockInmovil1_B,1);
crearRocaYsimetrico(4,3,sprite_RockInmovil2_G,sprite_RockInmovil2_B,1);
crearRocaYsimetrico(4,5,sprite_RockInmovil2_G,sprite_RockInmovil2_B,1);


//decoracion izquierda
createRoca(6,5,sprite_RockInmovil1_G,1);
createHoleIzquierda(5,2,sprite_hole,1);
createHoleIzquierda(5,3,sprite_hole,1);
createHoleIzquierda(5,4,sprite_hole,1);
createHoleIzquierda(5,5,sprite_hole,1);
createHoleIzquierda(6,2,sprite_hole,1);
createHoleIzquierda(2,4,sprite_hole,1);

//decoracionDerecha
createHoleDerecha(11,2,sprite_hole,1);
createHoleDerecha(11,3,sprite_hole,1);
createHoleDerecha(11,4,sprite_hole,1);
createHoleDerecha(11,5,sprite_hole,1);
createHoleDerecha(10,2,sprite_hole,1);
createHoleDerecha(10,4,sprite_hole,1);
createHoleDerecha(9,7,sprite_hole,1);
createHoleDerecha(14,4,sprite_hole,1);
  
}
