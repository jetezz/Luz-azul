#include "nivel20.h"

void crearnivel20(){
   //player  portal puertas y marco
createPlayer(2,4);
createMarco(no);
createPortal(si);
createPuerta(1,4,sprite_Puerta_B,nivel_19);
createPuerta(15,4,sprite_Puerta_B,nivel_final);


//rocas móviles (separando id por espacios)
cambiarMov(mover_1);
createRoca(2,2,sprite_Rock_B,2);
createRoca(2,6,sprite_Rock_B,3);
createRoca(3,4,sprite_Rock_B,4);
createRoca(4,4,sprite_Rock_B,5);
createRoca(5,4,sprite_Rock_B,6);
createRoca(6,4,sprite_Rock_B,7);
createRocaEspejo(12,3,sprite_zul1_1,8);
createRocaEspejo(12,4,sprite_zul1_2,9);


cambiarMov(mover_Linea);



cambiarMov(sin_Movimiento);


//collecionables
createColeccionabeLuz(10,4,18);

//decoracion muros

//decoracion simetricos


//decoracion izquierda

//decoracionDerecha
createHoleDerecha(13,4,sprite_hole,1);
createHoleDerecha(14,3,sprite_hole,1);
createHoleDerecha(14,4,sprite_hole,1);
createHoleDerecha(14,5,sprite_hole,1);
createHoleDerecha(15,3,sprite_hole,1);
createHoleDerecha(15,5,sprite_hole,1);
 
}
