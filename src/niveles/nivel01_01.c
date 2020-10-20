#include "nivel01_01.h"

void crearnivel01_01(){
    //player  portal puertas y marco
    createPlayer(2,3);
    createMarco(no);
    createPortal(no);
    createPuerta(3,1,sprite_Puerta_B,nivel_01);
    createPuerta(3,5,sprite_Puerta_B,nivel_03);

    //collecionables
    createColeccionabeAmstr(5,3,3);

    //decoracion izquierda
    createRoca(4,3,sprite_enemigo1,1);
    createRoca(1,1, sprite_Muro_Polvo1,1);
    createRoca(1,2, sprite_Muro_Polvo1,1);
    createRoca(1,3, sprite_Muro_Polvo1,1);
    createRoca(1,4, sprite_Muro_Polvo1,1);
    createRoca(1,5, sprite_Muro_Polvo1,1);
    createRoca(7,1, sprite_Muro_Polvo1,1);
    createRoca(7,2, sprite_Muro_Polvo1,1);
    createRoca(7,3, sprite_Muro_Polvo1,1);
    createRoca(7,4, sprite_Muro_Polvo1,1);
    createRoca(7,5, sprite_Muro_Polvo1,1);
    createRoca(2,1, sprite_Muro_Polvo1,1);
    createRoca(4,1, sprite_Muro_Polvo1,1);
    createRoca(5,1, sprite_Muro_Polvo1,1);
    createRoca(6,1, sprite_Muro_Polvo1,1);
    createRoca(2,5, sprite_Muro_Polvo1,1);
    createRoca(4,5, sprite_Muro_Polvo1,1);
    createRoca(5,5, sprite_Muro_Polvo1,1);
    createRoca(6,5, sprite_Muro_Polvo1,1);
}
