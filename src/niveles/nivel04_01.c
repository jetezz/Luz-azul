#include "nivel04_01.h"

void crearnivel04_01(){
//player  portal puertas y marco
createPlayer(6,4);
createMarco(no);
createPortal(no);
createPuerta(7,4,sprite_Puerta_B,nivel_04);
createPuerta(1,4,sprite_Puerta_B,nivel_TRAP_01);

//rocas móviles (separando id por espacios)
cambiarMov(mover_1);
createRoca(5,4,sprite_Rock_B,1);
cambiarMov(sin_Movimiento);

//collecionables
createColeccionabeAmstr(3,4,4);

//decoracion muro
crearMuro(1,1,8,7,sprite_Muro_Polvo1,posicion_Izquieda);

//decoracion izquierda
createRoca(2,3,sprite_RockInmovil1_B,1);
createRoca(2,5,sprite_RockInmovil1_B,1);
createRoca(7,3,sprite_RockInmovil1_B,1);
createRoca(7,5,sprite_RockInmovil1_B,1);
createRoca(2,2,sprite_RockInmovil2_B,1);
createRoca(2,6,sprite_RockInmovil2_B,1);
createHoleIzquierda(2,4,sprite_hole,4);
}
