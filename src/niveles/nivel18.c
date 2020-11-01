#include "nivel18.h"

void crearnivel18(){
     //player  portal puertas y marco
  createPlayer(2,4);
  createMarco(no);
  createPortal(no);
  createPuerta(1,4,sprite_Puerta_B,nivel_16);
  createPuerta(15,2,sprite_Puerta_B,nivel_18_01);
  createPuerta(15,4,sprite_Puerta_B,nivel_trap_06);
  createPuerta(15,6,sprite_Puerta_B,nivel_19);
  

  //rocas móviles (separando id por espacios)
  cambiarMov(mover_1);
 createRoca(5,3,sprite_Rock_B,2);
 createRocaEspejo(11,3,sprite_Rock_B,2);
 createRoca(3,5,sprite_Rock_G,3);
 createRocaEspejo(13,5,sprite_Rock_B,3);
 createRoca(3,2,sprite_Rock_G,4);
 createRocaEspejo(11,5,sprite_Rock_B,5);

  cambiarMov(mover_Linea);
 createRoca(5,5,sprite_RockLineal1_B,5);



  cambiarMov(sin_Movimiento);
 createRocaEspejo(13,2,sprite_Rock_nomove_B,4);


   //decoracion muros
  crearMuro(1,1,7,1,sprite_Muro_Solid1,posicion_Izquieda);
  crearMuro(1,7,7,7,sprite_Muro_Solid1,posicion_Izquieda);
  crearMuro(9,1,15,1,sprite_Muro_Polvo1,posicion_Derecha);
  crearMuro(15,1,15,7,sprite_Muro_Polvo1,posicion_Derecha);
 
   //decoracion simetricos
  crearRocaYsimetrico(1,3,sprite_Muro_Solid1,sprite_Muro_Polvo1,1);
  crearRocaYsimetrico(1,5,sprite_Muro_Solid1,sprite_Muro_Polvo1,1);
  crearRocaYsimetrico(7,2,sprite_Muro_Solid1,sprite_Muro_Polvo1,1);
  crearRocaYsimetrico(7,3,sprite_Muro_Solid1,sprite_Muro_Polvo1,1);
  crearRocaYsimetrico(7,5,sprite_Muro_Solid1,sprite_Muro_Polvo1,1);
  crearRocaYsimetrico(7,6,sprite_Muro_Solid1,sprite_Muro_Polvo1,1);
  

  //decoracion izquierda
  createRoca(1,2,sprite_Muro_Solid1,1);
  createRoca(1,6,sprite_Muro_Solid1,1);
  createRoca(8,3,sprite_RockInmovil1_B,1);
  createRoca(8,5,sprite_RockInmovil1_B,1);
  createHoleIzquierda(4,2,sprite_hole,1);
 
 
  //decoracionDerecha
 createHoleDerecha(10,5,sprite_hole,1);
 createHoleDerecha(14,2,sprite_hole,1);

}
