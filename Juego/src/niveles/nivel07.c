#include "nivel07.h"

void crearnivel07(){
      
//player  portal puertas y marco
createPlayer(7,4);
createMarco(no);
createPortal(no);
createPuerta(7,2,sprite_Puerta_B,nivel_05);
createPuerta(7,6,sprite_Puerta_B,nivel_06);

//rocas móviles (separando id por espacios)
cambiarMov(mover_Linea);
createRoca(5,2,sprite_RockLineal1_B,2);
createRoca(4,3,sprite_RockLineal1_B,3);
createRoca(4,4,sprite_RockLineal1_B,4);
createRoca(4,5,sprite_RockLineal1_B,5);
createRoca(5,6,sprite_RockLineal1_B,6);
createRoca(6,4,sprite_RockLineal1_B,7);
cambiarMov(sin_Movimiento);

//collecionables
createColeccionabeLuz(2,4,6);

//decoracion muro
crearMuro(1,1,8,7,sprite_Muro_Polvo1,posicion_Izquieda);

//decoracion izquierda
createRoca(2,2,sprite_RockInmovil2_B,1);
createRoca(2,6,sprite_RockInmovil2_B,1);


}
