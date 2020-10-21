#include "nivel09_01.h"

void crearnivel09_01(){
//player  portal puertas y marco
createPlayer(4,5);
createMarco(no);
createPortal(no);
createPuerta(4,6,sprite_Puerta_B,nivel_09);

//collecionables
createColeccionabeLuz(4,3,9);

//rocas móviles (separando id por espacios)
cambiarMov(mover_Linea);
createRoca(2,4, sprite_RockLineal1_B,2);
cambiarMov(mover_1);
createRoca(2,6, sprite_Rock_B,3);
cambiarMov(mover_Linea);
createRoca(7,3, sprite_RockLineal1_B,4);
cambiarMov(mover_1);
createRoca(6,6, sprite_Rock_B,3);

//decoracion izquierda
createRoca(4,2,sprite_RockInmovil1_B,1);
createRoca(4,4,sprite_RockInmovil1_B,1);
createHoleIzquierda(3,3,sprite_hole,5);
createHoleIzquierda(5,3,sprite_hole,5);
createRoca(0,1, sprite_Muro_Polvo1,1);
createRoca(1,1, sprite_Muro_Polvo1,1);
createRoca(2,1, sprite_Muro_Polvo1,1);
createRoca(3,1, sprite_Muro_Polvo1,1);
createRoca(4,1, sprite_Muro_Polvo1,1);
createRoca(5,1, sprite_Muro_Polvo1,1);
createRoca(6,1, sprite_Muro_Polvo1,1);
createRoca(7,1, sprite_Muro_Polvo1,1);
createRoca(8,1, sprite_Muro_Polvo1,1);
createRoca(0,7, sprite_Muro_Polvo1,1);
createRoca(1,7, sprite_Muro_Polvo1,1);
createRoca(2,7, sprite_Muro_Polvo1,1);
createRoca(3,7, sprite_Muro_Polvo1,1);
createRoca(4,7, sprite_Muro_Polvo1,1);
createRoca(5,7, sprite_Muro_Polvo1,1);
createRoca(6,7, sprite_Muro_Polvo1,1);
createRoca(7,7, sprite_Muro_Polvo1,1);
createRoca(8,7, sprite_Muro_Polvo1,1);
createRoca(0,2, sprite_Muro_Polvo1,1);
createRoca(0,3, sprite_Muro_Polvo1,1);
createRoca(0,4, sprite_Muro_Polvo1,1);
createRoca(0,5, sprite_Muro_Polvo1,1);
createRoca(0,6, sprite_Muro_Polvo1,1);
createRoca(8,2, sprite_Muro_Polvo1,1);
createRoca(8,3, sprite_Muro_Polvo1,1);
createRoca(8,4, sprite_Muro_Polvo1,1);
createRoca(8,5, sprite_Muro_Polvo1,1);
createRoca(8,6, sprite_Muro_Polvo1,1);

}