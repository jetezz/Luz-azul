#include "nivel04_01.h"

void crearnivel04_01(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* col,u8* posicion){
       //player  portal puertas y marco
createPlayer(player,6,4,posicion);
createMarco(no);
createPortal(portales,rocas,rocasEspejo,no);
createPuerta(puertas,7,4,sprite_Puerta_B,nivel_04);
createPuerta(puertas,1,4,sprite_Puerta_B,nivel_TRAP_01);

//rocas móviles (separando id por espacios)
createRoca(rocas,5,4,mover_1,sprite_Rock_B,1);


//collecionables
createColeccionabeAmstr(col,3,4,4);


//decoracion izquierda
createRoca(rocas,1,1,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,2,1,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,3,1,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,4,1,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,5,1,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,6,1,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,7,1,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,8,1,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,1,7,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,2,7,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,3,7,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,4,7,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,5,7,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,6,7,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,7,7,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,8,7,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,1,2,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,1,3,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,1,4,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,1,5,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,1,6,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,8,2,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,8,3,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,8,4,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,8,5,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,8,6,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,2,3,sin_Movimiento,sprite_RockInmovil1_B,1);
createRoca(rocas,2,5,sin_Movimiento,sprite_RockInmovil1_B,1);
createRoca(rocas,7,3,sin_Movimiento,sprite_RockInmovil1_B,1);
createRoca(rocas,7,5,sin_Movimiento,sprite_RockInmovil1_B,1);
createRoca(rocas,2,2,sin_Movimiento,sprite_RockInmovil2_B,1);
createRoca(rocas,2,6,sin_Movimiento,sprite_RockInmovil2_B,1);
createHoleIzquierda(rocas,2,4,sprite_hole,4);

}
