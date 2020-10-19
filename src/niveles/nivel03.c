#include "nivel03.h"

void crearnivel03(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* col,u8* posicion){
        //player  portal puertas y marco
createPlayer(player,3,3,posicion);
createMarco(si);
createPortal(portales,rocas,rocasEspejo,si);
createPuerta(puertas,3,1,sprite_Puerta_G,nivel_02);
createPuerta(puertas,13,1,sprite_Puerta_B,nivel_01_01);
//createPuerta(puertas,5,7,sprite_StairDown1_G,nivel_17);
//createPuerta(puertas,7,7,sprite_StairUp1_G,nivel_11);
createPuerta(puertas,11,7,sprite_StairDown1_B,nivel_TRAP_01);
createPuerta(puertas,9,7,sprite_StairUp1_B,nivel_TRAP_01);


//rocas móviles (separando id por espacios)
createRoca(rocas,5,4,mover_1,sprite_Rock_G,2);
createRoca(rocas,1,6,mover_1,sprite_Rock_G,3);
createRocaEspejo(rocasEspejo,11,4,mover_Linea,sprite_RockLineal1_G,2);


//collecionables
createColeccionabeFamilia(col,15,5,sprite_familia1,5);

//decoracion izquierda
createRoca(rocas,4,2,sin_Movimiento,sprite_RockInmovil1_G,1);
createRoca(rocas,4,6,sin_Movimiento,sprite_RockInmovil1_G,1);
createRoca(rocas,6,2,sin_Movimiento,sprite_RockInmovil2_G,1);
createRoca(rocas,6,6,sin_Movimiento,sprite_RockInmovil2_G,1);
createRoca(rocas,2,5,sin_Movimiento,sprite_RockInmovil6_G,1);
createRoca(rocas,2,4,sin_Movimiento,sprite_RockInmovil7_G,1);
createRoca(rocas,4,7,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,5,6,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,7,6,sin_Movimiento, sprite_Muro_Solid1,1);


//decoracionDerecha
createRocaEspejo(rocasEspejo,12,2,sin_Movimiento,sprite_RockInmovil1_B,1);
createRocaEspejo(rocasEspejo,12,6,sin_Movimiento,sprite_RockInmovil1_B,1);
createRocaEspejo(rocasEspejo,10,2,sin_Movimiento,sprite_RockInmovil2_B,1);
createRocaEspejo(rocasEspejo,10,6,sin_Movimiento,sprite_RockInmovil2_B,1);
createRocaEspejo(rocasEspejo,14,5,sin_Movimiento,sprite_RockInmovil6_B,1);
createRocaEspejo(rocasEspejo,14,4,sin_Movimiento,sprite_RockInmovil7_B,1);
createRocaEspejo(rocasEspejo,12,7,sin_Movimiento, sprite_Muro_Solid1,1);
createRocaEspejo(rocasEspejo,9,6,sin_Movimiento, sprite_Muro_Solid1,1);
createRocaEspejo(rocasEspejo,11,6,sin_Movimiento, sprite_Muro_Solid1,1);
createHoleDerecha(rocasEspejo,15,3,sprite_hole,1);
createHoleDerecha(rocasEspejo,15,6,sprite_hole,1);


}
