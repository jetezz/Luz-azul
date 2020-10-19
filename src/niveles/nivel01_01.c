#include "nivel01_01.h"

void crearnivel01_01(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* col,u8* posicion){
    //player  portal puertas y marco
    createPlayer(player,2,3,posicion);
    createMarco(no);
    createPortal(portales,rocas,rocasEspejo,no);
    createPuerta(puertas,3,1,sprite_Puerta_B,nivel_01);
    createPuerta(puertas,3,5,sprite_Puerta_B,nivel_03);

    //collecionables
    createColeccionabeAmstr(col,5,3,3);

    //decoracion izquierda
    createRoca(rocas,4,3,sin_Movimiento,sprite_enemigo1,1);
    createRoca(rocas,1,1,sin_Movimiento, sprite_Muro_Polvo1,1);
    createRoca(rocas,1,2,sin_Movimiento, sprite_Muro_Polvo1,1);
    createRoca(rocas,1,3,sin_Movimiento, sprite_Muro_Polvo1,1);
    createRoca(rocas,1,4,sin_Movimiento, sprite_Muro_Polvo1,1);
    createRoca(rocas,1,5,sin_Movimiento, sprite_Muro_Polvo1,1);
    createRoca(rocas,7,1,sin_Movimiento, sprite_Muro_Polvo1,1);
    createRoca(rocas,7,2,sin_Movimiento, sprite_Muro_Polvo1,1);
    createRoca(rocas,7,3,sin_Movimiento, sprite_Muro_Polvo1,1);
    createRoca(rocas,7,4,sin_Movimiento, sprite_Muro_Polvo1,1);
    createRoca(rocas,7,5,sin_Movimiento, sprite_Muro_Polvo1,1);
    createRoca(rocas,2,1,sin_Movimiento, sprite_Muro_Polvo1,1);
    createRoca(rocas,4,1,sin_Movimiento, sprite_Muro_Polvo1,1);
    createRoca(rocas,5,1,sin_Movimiento, sprite_Muro_Polvo1,1);
    createRoca(rocas,6,1,sin_Movimiento, sprite_Muro_Polvo1,1);
    createRoca(rocas,2,5,sin_Movimiento, sprite_Muro_Polvo1,1);
    createRoca(rocas,4,5,sin_Movimiento, sprite_Muro_Polvo1,1);
    createRoca(rocas,5,5,sin_Movimiento, sprite_Muro_Polvo1,1);
    createRoca(rocas,6,5,sin_Movimiento, sprite_Muro_Polvo1,1);
}
