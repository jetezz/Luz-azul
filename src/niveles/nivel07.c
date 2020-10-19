#include "nivel07.h"

void crearnivel07(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* col,u8* posicion){
      
    //player  portal puertas y marco
createPlayer(player,7,4,posicion);
createMarco(no);
createPortal(portales,rocas,rocasEspejo,no);
createPuerta(puertas,8,2,sprite_Puerta_B,nivel_05);
createPuerta(puertas,8,6,sprite_Puerta_B,nivel_06);

//rocas móviles (separando id por espacios)
createRoca(rocas,6,4,mover_1,sprite_Rock_B,2);
createRoca(rocas,6,2,mover_Linea,sprite_RockLineal1_B,2);
createRoca(rocas,6,6,mover_Linea,sprite_RockLineal1_B,2);
createRoca(rocas,5,4,mover_Linea,sprite_RockLineal1_B,2);
createRoca(rocas,4,4,mover_Linea,sprite_RockLineal1_B,2);
createRoca(rocas,4,3,mover_Linea,sprite_RockLineal1_B,2);
createRoca(rocas,4,5,mover_Linea,sprite_RockLineal1_B,2);


//collecionables
createColeccionabeLuz(col,2,4,6);


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
createRoca(rocas,8,3,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,8,4,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,8,5,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,2,2,sin_Movimiento,sprite_RockInmovil2_B,1);
createRoca(rocas,2,6,sin_Movimiento,sprite_RockInmovil2_B,1);
}
