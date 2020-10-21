#include "nivel09.h"

void crearnivel09(){
    //player  portal puertas y marco
   createPlayer(2,4);
   createMarco(si);
   createPortal(si);
   createPuerta(1,4,sprite_Puerta_G,nivel_08);
   //createPuerta(5,2,sprite_Puerta_G,nivel_10);
   //createPuerta(5,6,sprite_Puerta_G,nivel_11);
   createPuerta(11,2,sprite_Puerta_B,nivel_09_01);
   //createPuerta(11,6,sprite_Puerta_B,nivel_09_02);
   //createPuerta(15,4,sprite_Puerta_B,nivel_TRAP_03);

   //rocas móviles (separando id por espacios)
   cambiarMov(mover_1);
   createRocaEspejo(13,3,sprite_Rock_B,2);
   cambiarMov(mover_Linea);
   createRoca(3,4,sprite_RockLineal1_G,3);
   cambiarMov(sin_Movimiento);
   createRoca(4,2,sprite_Rock_nomove_G,2);
   createRoca(5,3,sprite_Rock_nomove_G,2);
   createRoca(6,2,sprite_Rock_nomove_G,2);
   createRoca(4,6,sprite_Rock_nomove_G,2);
   createRoca(5,5,sprite_Rock_nomove_G,2);
   createRoca(6,6,sprite_Rock_nomove_G,2);

    //decoracion muros
   crearMuro(1,1,7,1,sprite_Muro_Solid1,posicion_Izquieda);
   crearMuro(1,7,7,7,sprite_Muro_Solid1,posicion_Izquieda);
   crearMuro(9,1,15,1,sprite_Muro_Solid1,posicion_Derecha);
   crearMuro(9,7,15,7,sprite_Muro_Solid1,posicion_Derecha);
   
  
   //decoracion simetricos
   crearRocaYsimetrico(3,5,sprite_RockInmovil5_G,sprite_RockInmovil5_B,1);
   crearRocaYsimetrico(4,5,sprite_RockInmovil5_G,sprite_RockInmovil5_B,1);

   //decoracion izquierda     
  

   //decoracionDerecha
   createHoleDerecha(10,2,sprite_hole,3);
   createHoleDerecha(11,3,sprite_hole,3);
   createHoleDerecha(12,2,sprite_hole,3);
   createHoleDerecha(10,6,sprite_hole,3);
   createHoleDerecha(11,5,sprite_hole,3);
   createHoleDerecha(12,6,sprite_hole,3);
   createHoleDerecha(13,4,sprite_hole,3);
   createHoleDerecha(15,3,sprite_hole,3);
   createHoleDerecha(15,6,sprite_hole,3);

}
