#include "nivel12.h"

void crearnivel12(){
  //player  portal puertas y marco
createPlayer(1,3);
createMarco(si);
createPortal(si);
createPuerta(1,4,sprite_StairDown1_G,nivel_08);

//rocas móviles (separando id por espacios)

cambiarMov(mover_1);
createRoca(2,2,sprite_Rock_G,2);
createRoca(2,3,sprite_Rock_G,3);
createRoca(2,4,sprite_Rock_G,4);
createRoca(2,5,sprite_Rock_G,5);
createRoca(2,6,sprite_Rock_G,6);
createRoca(4,2,sprite_Rock_G,7);
createRoca(4,6,sprite_Rock_G,8);
createRoca(5,2,sprite_Rock_G,9);
createRoca(5,4,sprite_Rock_G,10);
createRoca(5,6,sprite_Rock_G,11);
createRoca(6,2,sprite_Rock_G,12);
createRoca(6,6,sprite_Rock_G,13);
createRocaEspejo(10,2,sprite_Rock_B,12);
createRocaEspejo(11,2,sprite_Rock_B,9);
createRocaEspejo(12,2,sprite_Rock_B,7);
createRocaEspejo(13,2,sprite_Rock_B,14);
createRocaEspejo(14,2,sprite_Rock_B,2);
createRocaEspejo(14,3,sprite_Rock_B,3);
createRocaEspejo(14,4,sprite_Rock_B,4);
createRocaEspejo(14,5,sprite_Rock_B,5);
createRocaEspejo(14,6,sprite_Rock_B,6);
createRocaEspejo(13,6,sprite_Rock_B,15);
createRocaEspejo(12,6,sprite_Rock_B,8);
createRocaEspejo(11,6,sprite_Rock_B,11);
createRocaEspejo(10,6,sprite_Rock_B,13);
createRocaEspejo(10,3,sprite_Rock_B,16);
createRocaEspejo(10,5,sprite_Rock_B,17);


cambiarMov(mover_Linea);



cambiarMov(sin_Movimiento);
createRoca(3,2,sprite_Rock_nomove_G,14);
createRoca(3,6,sprite_Rock_nomove_G,15);
createRoca(6,3,sprite_Rock_nomove_G,16);
createRoca(6,5,sprite_Rock_nomove_G,17);
createRocaEspejo(11,4,sprite_Rock_nomove_B,10);

//collecionables
createColeccionabeFamilia(12,4,sprite_familia2,13);
createColeccionabeLuz(13,4,18);

//decoracion muros

//decoracion simetricos
crearRocaYsimetrico(4,3,sprite_RockInmovil1_G,sprite_RockInmovil1_B,1);
crearRocaYsimetrico(4,5,sprite_RockInmovil1_G,sprite_RockInmovil1_B,1);


//decoracion izquierda
createHoleIzquierda(3,3,sprite_hole,1);
createHoleIzquierda(3,4,sprite_hole,1);
createHoleIzquierda(3,5,sprite_hole,1);


//decoracionDerecha
createHoleDerecha(10,4,sprite_hole,1);
createRocaEspejo(15,4,sprite_RockInmovil1_B,1);

  
}
