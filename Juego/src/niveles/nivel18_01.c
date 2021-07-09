#include "nivel18_01.h"

void crearnivel18_01(){
    //player  portal puertas y marco
createPlayer(2,3);
createMarco(no);
createPortal(no);
createPuerta(2,2,sprite_Puerta_B,nivel_18);

//rocas móviles (separando id por espacios)


cambiarMov(mover_1);


cambiarMov(mover_Linea);
createRoca(3,5,sprite_RockLineal1_B,2);
createRoca(4,5,sprite_RockLineal1_B,3);
createRoca(5,5,sprite_RockLineal1_B,4);


cambiarMov(sin_Movimiento);

//collecionables
createColeccionabeAmstr(3,2,16);

//decoracion muro
crearMuro(1,1,8,7,sprite_Muro_Polvo1,posicion_Izquieda);

//decoracion izquierda
createRoca(3,3,sprite_RockInmovil1_B,1);
createRoca(4,3,sprite_RockInmovil1_B,1);
createRoca(5,3,sprite_RockInmovil1_B,1);
createRoca(7,3,sprite_RockInmovil1_B,1);
createRoca(2,6,sprite_RockInmovil2_B,1);
createRoca(7,2,sprite_RockInmovil2_B,1);
createRoca(7,6,sprite_RockInmovil2_B,1);
createHoleIzquierda(6,3,sprite_hole,1);
createHoleIzquierda(7,4,sprite_hole,1);

}
