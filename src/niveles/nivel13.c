#include "nivel13.h"

void crearnivel13(){
     //player  portal puertas y marco
  createPlayer(12,5);
  createMarco(no);
  createPortal(si);
  createPuerta(13,3,sprite_Puerta_G,nivel_15);
  createPuerta(13,5,sprite_Puerta_G,nivel_14);
  createPuerta(11,5,sprite_StairUp1_G,nivel_04);
  createPuerta(3,3,sprite_Puerta_B,nivel_trap_04);
  createPuerta(3,5,sprite_Puerta_B,nivel_trap_04);


  //rocas móviles (separando id por espacios)
  cambiarMov(mover_1);
 


  cambiarMov(mover_Linea);



  cambiarMov(sin_Movimiento);



   //decoracion muros
  crearMuro(3,2,7,2,sprite_Muro_Polvo1,posicion_Izquieda);
  crearMuro(3,6,7,6,sprite_Muro_Polvo1,posicion_Izquieda);
  crearMuro(8,2,13,2,sprite_Muro_Solid1,posicion_Derecha);
  crearMuro(8,6,13,6,sprite_Muro_Solid1,posicion_Derecha);
 
   //decoracion simetricos
  crearRocaYsimetrico(5,4,sprite_RockInmovil1_B,sprite_RockInmovil1_G,1);
  

  //decoracion izquierda
  createRoca(3,4,sprite_Muro_Polvo1,1);    
  createHoleIzquierda(5,5,sprite_hole,1);
 
  //decoracionDerecha
  createRocaEspejo(8,3,sprite_Muro_Solid1,1);
  createRocaEspejo(8,5,sprite_Muro_Solid1,1);
  createRocaEspejo(13,4,sprite_Muro_Solid1,1);

}
