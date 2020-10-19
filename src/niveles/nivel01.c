#include "nivel01.h"

void crearnivel01(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* col,u8* posicion){
     //player  portal puertas y marco
    createPlayer(player,3,4,posicion);
    createMarco(si);
    createPortal(portales,rocas,rocasEspejo,si);
    createPuerta(puertas,3,7,sprite_Puerta_G,nivel_02);
    createPuerta(puertas,13,7,sprite_Puerta_B,nivel_01_01);

    //rocas móviles (separando id por espacios)
    createRoca(rocas,2,4,mover_1,sprite_Rock_G,2);
    createRocaEspejo(rocasEspejo,14,4,sin_Movimiento,sprite_Rock_nomove_B,2);

    //collecionables
    createColeccionabeLuz(col,15,4,0);

    //decoracion izquierda
    createRoca(rocas,1,2,sin_Movimiento,sprite_RockInmovil3_G,1);
    createRoca(rocas,2,2,sin_Movimiento,sprite_RockInmovil4_G,1);
    createRoca(rocas,1,3,sin_Movimiento,sprite_RockInmovil1_G,1);
    createRoca(rocas,6,3,sin_Movimiento,sprite_RockInmovil1_G,1);
    createRoca(rocas,1,5,sin_Movimiento,sprite_RockInmovil1_G,1);
    createRoca(rocas,6,5,sin_Movimiento,sprite_RockInmovil1_G,1);
    createRoca(rocas,7,1,sin_Movimiento,sprite_RockInmovil2_G,1);
    createRoca(rocas,7,7,sin_Movimiento,sprite_RockInmovil2_G,1);
    createRoca(rocas,1,4,sin_Movimiento,sprite_amstrad,1);
    createRoca(rocas,1,1,sin_Movimiento,sprite_PrinceofPersia2_G,1);
    createRoca(rocas,2,1,sin_Movimiento,sprite_PrinceofPersia1_G,1);


    //decoracionDerecha
    createRocaEspejo(rocasEspejo,14,2,sin_Movimiento,sprite_RockInmovil3_B,1);
    createRocaEspejo(rocasEspejo,15,2,sin_Movimiento,sprite_RockInmovil4_B,1);
    createRocaEspejo(rocasEspejo,15,3,sin_Movimiento,sprite_RockInmovil1_B,1);
    createRocaEspejo(rocasEspejo,10,3,sin_Movimiento,sprite_RockInmovil1_B,1);
    createRocaEspejo(rocasEspejo,15,5,sin_Movimiento,sprite_RockInmovil1_B,1);
    createRocaEspejo(rocasEspejo,10,5,sin_Movimiento,sprite_RockInmovil1_B,1);
    createRocaEspejo(rocasEspejo,9,1,sin_Movimiento,sprite_RockInmovil2_B,1);
    createRocaEspejo(rocasEspejo,9,7,sin_Movimiento,sprite_RockInmovil2_B,1);
    createRocaEspejo(rocasEspejo,14,1,sin_Movimiento,sprite_PrinceofPersia1_B,1);
    createRocaEspejo(rocasEspejo,15,1,sin_Movimiento,sprite_PrinceofPersia2_B,1);
}
