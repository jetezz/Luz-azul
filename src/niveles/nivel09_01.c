#include "nivel09_01.h"

void crearnivel09_01(){
//player  portal puertas y marco
createPlayer(3,5);
createMarco(no);
createPortal(no);
createPuerta(3,6,sprite_Puerta_B,nivel_09);

//rocas móviles (separando id por espacios)


cambiarMov(mover_1);
createRoca(6,6,sprite_Rock_G,2);


cambiarMov(mover_Linea);
createRoca(3,4,sprite_RockLineal1_B,3);
createRoca(7,3,sprite_RockLineal1_B,4);


cambiarMov(sin_Movimiento);

//collecionables
createColeccionabeLuz(4,2,9);

//decoracion muro
crearMuro(1,1,8,7,sprite_Muro_Polvo1,posicion_Izquieda);

//decoracion izquierda
createRoca(3,2,sprite_RockInmovil1_B,1);
createRoca(4,3,sprite_RockInmovil1_B,1);
createRoca(2,6,sprite_RockInmovil1_B,1);
createRoca(4,6,sprite_RockInmovil1_B,1);
createHoleIzquierda(5,2,sprite_hole,1);


}