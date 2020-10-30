#include "nivel09_02.h"

void crearnivel09_02(){

//player  portal puertas y marco
createPlayer(3,3);
createMarco(no);
createPortal(no);
createPuerta(3,2,sprite_Puerta_B,nivel_09);
createPuerta(3,6,sprite_Puerta_B,nivel_09_03);

//rocas móviles (separando id por espacios)


cambiarMov(mover_1);
createRoca(7,5,sprite_Rock_B,2);


cambiarMov(mover_Linea);
createRoca(4,4,sprite_RockLineal1_B,3);
createRoca(5,3,sprite_RockLineal1_B,4);
createRoca(6,5,sprite_RockLineal1_B,5);


cambiarMov(sin_Movimiento);

//collecionables


//decoracion muro
crearMuro(1,1,8,7,sprite_Muro_Polvo1,posicion_Izquieda);

//decoracion izquierda
createRoca(2,5,sprite_RockInmovil8_B,1);
createRoca(2,6,sprite_RockInmovil9_B,1);
createRoca(4,5,sprite_RockInmovil8_B,1);
createRoca(4,6,sprite_RockInmovil9_B,1);
createHoleIzquierda(3,5,sprite_hole,1);
}
