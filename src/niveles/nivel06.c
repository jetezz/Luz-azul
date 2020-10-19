#include "nivel06.h"

void crearnivel06(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* col,u8* posicion){
      //player  portal puertas y marco
createPlayer(player,4,2,posicion);
createMarco(no);
createPortal(portales,rocas,rocasEspejo,si);
createPuerta(puertas,3,2,sprite_Puerta_G,nivel_04);
//createPuerta(puertas,13,2,sprite_Puerta_B,nivel_07);

//rocas móviles (separando id por espacios)
createRoca(rocas,5,4,mover_Linea,sprite_RockLineal1_G,2);
createRoca(rocas,6,4,mover_Linea,sprite_RockLineal1_G,3);
createRocaEspejo(rocasEspejo,10,4,sin_Movimiento,sprite_Rock_nomove_B,3);
createRocaEspejo(rocasEspejo,11,4,sin_Movimiento,sprite_Rock_nomove_B,2);

//collecionables


//decoracion izquierda
createRoca(rocas,2,1,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,2,2,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,2,3,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,2,4,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,2,5,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,2,6,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,2,7,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,3,1,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,4,1,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,5,1,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,5,2,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,6,2,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,7,2,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,3,7,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,4,7,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,5,7,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,5,6,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,6,6,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,7,6,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,8,2,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,8,3,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,8,5,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,8,6,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,3,3,sin_Movimiento,sprite_RockInmovil5_G,1);



//decoracionDerecha
createRocaEspejo(rocasEspejo,14,1,sin_Movimiento, sprite_Muro_Solid1,1);
createRocaEspejo(rocasEspejo,14,2,sin_Movimiento, sprite_Muro_Solid1,1);
createRocaEspejo(rocasEspejo,14,3,sin_Movimiento, sprite_Muro_Solid1,1);
createRocaEspejo(rocasEspejo,14,4,sin_Movimiento, sprite_Muro_Solid1,1);
createRocaEspejo(rocasEspejo,14,5,sin_Movimiento, sprite_Muro_Solid1,1);
createRocaEspejo(rocasEspejo,14,6,sin_Movimiento, sprite_Muro_Solid1,1);
createRocaEspejo(rocasEspejo,14,7,sin_Movimiento, sprite_Muro_Solid1,1);
createRocaEspejo(rocasEspejo,11,1,sin_Movimiento, sprite_Muro_Solid1,1);
createRocaEspejo(rocasEspejo,12,1,sin_Movimiento, sprite_Muro_Solid1,1);
createRocaEspejo(rocasEspejo,13,1,sin_Movimiento, sprite_Muro_Solid1,1);
createRocaEspejo(rocasEspejo,11,2,sin_Movimiento, sprite_Muro_Solid1,1);
createRocaEspejo(rocasEspejo,10,2,sin_Movimiento, sprite_Muro_Solid1,1);
createRocaEspejo(rocasEspejo,9,2,sin_Movimiento, sprite_Muro_Solid1,1);
createRocaEspejo(rocasEspejo,11,7,sin_Movimiento, sprite_Muro_Solid1,1);
createRocaEspejo(rocasEspejo,12,7,sin_Movimiento, sprite_Muro_Solid1,1);
createRocaEspejo(rocasEspejo,13,7,sin_Movimiento, sprite_Muro_Solid1,1);
createRocaEspejo(rocasEspejo,11,6,sin_Movimiento, sprite_Muro_Solid1,1);
createRocaEspejo(rocasEspejo,10,6,sin_Movimiento, sprite_Muro_Solid1,1);
createRocaEspejo(rocasEspejo,9,6,sin_Movimiento, sprite_Muro_Solid1,1);
createHoleDerecha(rocasEspejo,11,3,sprite_hole,1);
createHoleDerecha(rocasEspejo,12,3,sprite_hole,1);
createRocaEspejo(rocasEspejo,13,3,sin_Movimiento,sprite_RockInmovil5_B,1);

}
