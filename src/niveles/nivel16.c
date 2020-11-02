#include "nivel16.h"

void crearnivel16(){
     //player  portal puertas y marco
 createPlayer(2,4);
 createMarco(no);
 createPortal(si);
 createPuerta(1,2,sprite_Puerta_G,nivel_15);
 createPuerta(1,6,sprite_Puerta_G,nivel_14);
 createPuerta(15,2,sprite_Puerta_B,nivel_17);
 createPuerta(15,6,sprite_Puerta_B,nivel_17);


 //rocas móviles (separando id por espacios)
 cambiarMov(mover_1);
createRoca(3,4,sprite_Rock_G,2);
createRocaEspejo(13,4,sprite_Rock_B,2);

 cambiarMov(mover_Linea);

  cambiarMov(sin_Movimiento);
   //decoracion muros
  crearMuro(1,1,7,1,sprite_Muro_Solid1,posicion_Izquieda);
  crearMuro(1,7,7,7,sprite_Muro_Solid1,posicion_Izquieda);
  crearMuro(9,7,14,7,sprite_Muro_Polvo1,posicion_Derecha);
  crearMuro(9,1,15,1,sprite_Muro_Polvo1,posicion_Derecha);
  crearMuro(15,1,15,7,sprite_Muro_Polvo1,posicion_Derecha);
 
   //decoracion simetricos
  crearRocaYsimetrico(1,3,sprite_Muro_Solid1,sprite_Muro_Polvo1,1);
  crearRocaYsimetrico(1,4,sprite_Muro_Solid1,sprite_Muro_Polvo1,1);
  crearRocaYsimetrico(1,5,sprite_Muro_Solid1,sprite_Muro_Polvo1,1);
  crearRocaYsimetrico(7,2,sprite_Muro_Solid1,sprite_Muro_Polvo1,1);
  crearRocaYsimetrico(7,3,sprite_Muro_Solid1,sprite_Muro_Polvo1,1);
  crearRocaYsimetrico(7,5,sprite_Muro_Solid1,sprite_Muro_Polvo1,1);
  crearRocaYsimetrico(7,6,sprite_Muro_Solid1,sprite_Muro_Polvo1,1);
  crearRocaYsimetrico(6,3,sprite_RockInmovil2_G,sprite_RockInmovil2_B,1);
  crearRocaYsimetrico(6,5,sprite_RockInmovil2_G,sprite_RockInmovil2_B,1);
  

  //decoracion izquierda
  createRoca(4,3,sprite_zul1_1,1);
  createRoca(4,4,sprite_zul1_2,1);
  createRoca(8,2,sprite_RockInmovil8_G,1);
  createRoca(8,3,sprite_RockInmovil9_G,1);
  createRoca(8,5,sprite_RockInmovil8_G,1);
  createRoca(8,6,sprite_RockInmovil9_G,1);

 
  //decoracionDerecha



}
