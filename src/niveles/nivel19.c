#include "nivel19.h"

void crearnivel19(){
  //player  portal puertas y marco
createPlayer(2,4);
createMarco(no);
createPortal(si);
createPuerta(1,4,sprite_Puerta_B,nivel_18);
createPuerta(15,4,sprite_Puerta_B,nivel_20);



//rocas móviles (separando id por espacios)
cambiarMov(mover_1);
createRoca(3,2,sprite_Rock_B,2);
createRoca(6,2,sprite_Rock_B,3);
createRoca(6,6,sprite_Rock_B,4);
createRocaEspejo(11,4,sprite_Rock_B,6);
createRoca(4,4,sprite_Rock_B,7);


cambiarMov(mover_Linea);
createRoca(3,6,sprite_RockLineal1_B,5);
createRoca(3,6,sprite_RockLineal1_B,7);


cambiarMov(sin_Movimiento);
createRocaEspejo(13,2,sprite_Rock_nomove_B,2);
createRocaEspejo(13,6,sprite_Rock_nomove_B,5);
createRocaEspejo(10,6,sprite_Rock_nomove_B,7);
createRocaEspejo(10,2,sprite_Rock_nomove_B,7);
createRoca(5,4,sprite_Rock_nomove_B,6);

//collecionables
createColeccionabeAmstr(14,4,17);

//decoracion muros

//decoracion simetricos


//decoracion izquierda
createHoleIzquierda(2,2,sprite_hole,1);

//decoracionDerecha
createHoleDerecha(13,3,sprite_hole,1);
createHoleDerecha(13,4,sprite_hole,1);
createHoleDerecha(13,5,sprite_hole,1);
createHoleDerecha(14,3,sprite_hole,1);
createHoleDerecha(14,5,sprite_hole,1);
createRocaEspejo(15,3,sprite_RockInmovil2_B,2);
createRocaEspejo(15,5,sprite_RockInmovil2_B,2);

 
}
