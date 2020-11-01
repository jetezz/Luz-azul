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
 createRoca(3,3,sprite_Rock_B,2);




  cambiarMov(mover_Linea);
 createRoca(4,3,sprite_RockLineal1_B,3);



  cambiarMov(sin_Movimiento);



//decoracion muro


//decoracion izquierda
createRoca(7,4,sprite_RockInmovil1_B,1);
createHoleIzquierda(6,2,sprite_hole,1);

}
