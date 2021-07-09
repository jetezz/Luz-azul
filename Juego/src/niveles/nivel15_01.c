#include "nivel15_01.h"

void crearnivel15_01(){
   //player  portal puertas y marco
createPlayer(2,3);
createMarco(no);
createPortal(no);
createPuerta(2,4,sprite_Puerta_B,nivel_15);



//rocas móviles (separando id por espacios)



//collecionables
createColeccionabeLuz(7,2,15);

  //rocas móviles (separando id por espacios)
  cambiarMov(mover_1);
 createRoca(3,3,sprite_Rock_G,2);




  cambiarMov(mover_Linea);
 createRoca(4,3,sprite_RockLineal1_G,3);



  cambiarMov(sin_Movimiento);



//decoracion muro
crearMuro(1,1,8,5,sprite_Muro_Polvo1,posicion_Izquieda);

//decoracion izquierda
createRoca(7,3,sprite_RockInmovil1_B,1);
createHoleIzquierda(6,2,sprite_hole,1);


}
