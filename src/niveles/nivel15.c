#include "nivel15.h"

void crearnivel15(){
     //player  portal puertas y marco
  createPlayer(2,2);
  createMarco(si);
  createPortal(si);
  createPuerta(2,6,sprite_Puerta_G,nivel_13);
  createPuerta(7,5,sprite_Puerta_G,nivel_16);
  createPuerta(14,6,sprite_Puerta_B,nivel_15_01);


  //rocas móviles (separando id por espacios)
  cambiarMov(mover_1);
 createRoca(5,5,sprite_Rock_G,2);
 createRoca(6,5,sprite_Rock_G,3);
 createRocaEspejo(10,6,sprite_Rock_B,4);


  cambiarMov(mover_Linea);


  cambiarMov(sin_Movimiento);
 createRoca(6,6,sprite_Rock_nomove_G,4);
 createRocaEspejo(10,5,sprite_Rock_nomove_B,3);
 createRocaEspejo(11,5,sprite_Rock_nomove_B,2);

//collecionables
createColeccionabeAmstr(14, 4,14);


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


}
