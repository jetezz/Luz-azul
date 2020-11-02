#include "nivel15.h"

void crearnivel15(){
    //player  portal puertas y marco
  createPlayer(5,7);
  createMarco(si);
  createPortal(si);
  createPuerta(2,6,sprite_Puerta_G,nivel_13);
  createPuerta(7,5,sprite_Puerta_G,nivel_16);
  createPuerta(14,6,sprite_Puerta_B,nivel_15_01);
  createPuerta(6,7,sprite_StairUp1_G,nivel_03_01);


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
createColeccionabeFamilia(7,7,sprite_familia4,14);


   //decoracion muros
  crearMuro(1,1,7,1,sprite_Muro_Solid1,posicion_Izquieda);
  crearMuro(1,2,1,7,sprite_Muro_Solid1,posicion_Izquieda);
  crearMuro(9,1,15,1,sprite_Muro_Polvo1,posicion_Derecha);
  crearMuro(15,2,15,7,sprite_Muro_Polvo1,posicion_Derecha);
 
  
   //decoracion simetricos
crearRocaYsimetrico(7,2,sprite_Muro_Solid1,sprite_Muro_Polvo1,1);
crearRocaYsimetrico(7,3,sprite_Muro_Solid1,sprite_Muro_Polvo1,1);
crearRocaYsimetrico(2,7,sprite_Muro_Solid1,sprite_Muro_Polvo1,1);
crearRocaYsimetrico(3,7,sprite_Muro_Solid1,sprite_Muro_Polvo1,1);
crearRocaYsimetrico(3,6,sprite_RockInmovil1_G,sprite_RockInmovil1_B,1);
crearRocaYsimetrico(4,5,sprite_RockInmovil1_G,sprite_RockInmovil1_B,1);
crearRocaYsimetrico(3,5,sprite_RockInmovil2_G,sprite_RockInmovil2_B,1);
 
  //decoracion izquierda

 
 
  //decoracionDerecha
  createHoleDerecha(9,5,sprite_hole,1);
  createHoleDerecha(11,6,sprite_hole,1);


}
