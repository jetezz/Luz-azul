#include "nivel10.h"

void crearnivel10(){
  //player  portal puertas y marco
createPlayer(4,6);
createMarco(si);
createPortal(si);
createPuerta(4,7,sprite_Puerta_G,nivel_09);
createPuerta(12,7,sprite_Puerta_B,nivel_10_01);



//rocas móviles (separando id por espacios)
cambiarMov(mover_1);
createRoca(6,1,sprite_Rock_G,2);
createRocaEspejo(15,6,sprite_Rock_B,3);
createRoca(1,6,sprite_Rock_G,3);
createRocaEspejo(10,1,sprite_Rock_B,2);


cambiarMov(mover_Linea);
createRoca(4,4,sprite_RockLineal1_G,4);
createRoca(6,6,sprite_RockLineal1_G,5);
createRocaEspejo(10,6,sprite_RockLineal1_B,5);


cambiarMov(sin_Movimiento);
createRocaEspejo(12,4,sprite_Rock_nomove_B,4);

//collecionables

//decoracion muros

//decoracion simetricos
crearRocaYsimetrico(4,3,sprite_RockInmovil1_G,sprite_RockInmovil1_B,1);
crearRocaYsimetrico(4,5,sprite_RockInmovil1_G,sprite_RockInmovil1_B,1);
crearRocaYsimetrico(3,6,sprite_RockInmovil1_G,sprite_RockInmovil1_B,1);
crearRocaYsimetrico(6,4,sprite_RockInmovil2_G,sprite_RockInmovil2_B,1);
crearRocaYsimetrico(1,1,sprite_Rock_G,sprite_Rock_B,1);
crearRocaYsimetrico(2,1,sprite_Rock_G,sprite_Rock_B,1);


//decoracion izquierda
createHoleIzquierda(1,3,sprite_hole,1);
createHoleIzquierda(5,1,sprite_hole,1);
createHoleIzquierda(6,7,sprite_hole,1);
createHoleIzquierda(7,3,sprite_hole,1);

//decoracionDerecha
createHoleDerecha(9,1,sprite_hole,1);
createHoleDerecha(11,7,sprite_hole,1);
createHoleDerecha(13,1,sprite_hole,1);
createHoleDerecha(13,2,sprite_hole,1);
createHoleDerecha(13,7,sprite_hole,1);
createHoleDerecha(12,6,sprite_hole,1);
createRocaEspejo(15,2,sprite_familia3,1);
createRocaEspejo(14,3,sprite_RockInmovil1_B,1);
createRocaEspejo(15,3,sprite_RockInmovil1_B,1);




}
