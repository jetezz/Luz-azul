#include "nivel04.h"

void crearnivel04(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* col,u8* posicion){
      //player  portal puertas y marco
createPlayer(player,14,4,posicion);
createMarco(si);
createPortal(portales,rocas,rocasEspejo,si);
createPuerta(puertas,15,4,sprite_Puerta_G,nivel_02);
createPuerta(puertas,3,1,sprite_Puerta_G,nivel_05);
createPuerta(puertas,1,4,sprite_Puerta_G,nivel_04_01);
//createPuerta(puertas,3,7,sprite_Puerta_G,nivel_06);
//createPuerta(puertas,11,3,sprite_StairUp1_G,nivel_08);
//createPuerta(puertas,11,5, sprite_StairDown1_G,nivel_15);

//rocas móviles (separando id por espacios)
createRoca(rocas,3,4,mover_1,sprite_Rock_G,2);
createRocaEspejo(rocasEspejo,13,4,mover_1,sprite_Rock_G,2);
createRoca(rocas,3,3,mover_1,sprite_Rock_G,3);
createRocaEspejo(rocasEspejo,13,3,sin_Movimiento,sprite_Rock_nomove_B,3);
createRoca(rocas,3,5,mover_1,sprite_Rock_G,4);
createRocaEspejo(rocasEspejo,13,5,mover_Linea,sprite_RockLineal1_G,4);

//collecionables

//decoracion izquierda
createRoca(rocas,1,2,sin_Movimiento,sprite_RockInmovil8_G,1);
createRoca(rocas,1,3,sin_Movimiento,sprite_RockInmovil9_G,1);
createRoca(rocas,6,2,sin_Movimiento,sprite_RockInmovil8_G,1);
createRoca(rocas,6,3,sin_Movimiento,sprite_RockInmovil9_G,1);
createRoca(rocas,1,5,sin_Movimiento,sprite_RockInmovil8_G,1);
createRoca(rocas,1,6,sin_Movimiento,sprite_RockInmovil9_G,1);
createRoca(rocas,6,5,sin_Movimiento,sprite_RockInmovil8_G,1);
createRoca(rocas,6,6,sin_Movimiento,sprite_RockInmovil9_G,1);
createRoca(rocas,4,2,sin_Movimiento,sprite_RockInmovil1_G,1);
createRoca(rocas,4,6,sin_Movimiento,sprite_RockInmovil1_G,1);
createRoca(rocas,2,3,sin_Movimiento,sprite_RockInmovil2_G,1);
createRoca(rocas,2,5,sin_Movimiento,sprite_RockInmovil2_G,1);
createRoca(rocas,2,2,sin_Movimiento,sprite_RockInmovil5_G,1);
createRoca(rocas,2,6,sin_Movimiento,sprite_RockInmovil5_G,1);
createHoleIzquierda(rocas,4,1,sprite_hole,4);
createHoleIzquierda(rocas,4,7,sprite_hole,4);




//decoracionDerecha
createRocaEspejo(rocasEspejo,12,4,sin_Movimiento,sprite_RockInmovil1_B,1);
createHoleDerecha(rocasEspejo,10,3,sprite_hole,4);
createHoleDerecha(rocasEspejo,10,5,sprite_hole,4);
createHoleDerecha(rocasEspejo,11,2,sprite_hole,4);
createHoleDerecha(rocasEspejo,11,4,sprite_hole,4);
createHoleDerecha(rocasEspejo,11,6,sprite_hole,4);
}
