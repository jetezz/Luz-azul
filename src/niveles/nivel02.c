#include "nivel02.h"

void crearnivel02(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* col,u8* posicion){
     //player  portal puertas y marco
    createPlayer(player,3,4,posicion);
    createMarco(si);
    createPortal(portales,rocas,rocasEspejo,si);
    createPuerta(puertas,3,2,sprite_Puerta_G,nivel_01);
    createPuerta(puertas,3,6,sprite_Puerta_G,nivel_03);
    createPuerta(puertas,1,4,sprite_Puerta_G,nivel_04);
    createPuerta(puertas,13,2,sprite_Puerta_B,nivel_TRAP_01);
    createPuerta(puertas,13,6,sprite_Puerta_B,nivel_TRAP_01);
    createPuerta(puertas,15,4,sprite_Puerta_B,nivel_TRAP_01);

    //rocas móviles (separando id por espacios)
    createRoca(rocas,5,4,mover_1,sprite_Rock_G,1);
    createRocaEspejo(rocasEspejo,11,4,sin_Movimiento,sprite_Rock_nomove_B,1);

    //collecionables
    createColeccionabeLuz(col,13,4,1);

    //decoracion izquierda
    createRoca(rocas,1,1,sin_Movimiento, sprite_Muro_Solid1,1);
    createRoca(rocas,2,1,sin_Movimiento, sprite_Muro_Solid1,1);
    createRoca(rocas,3,1,sin_Movimiento, sprite_Muro_Solid1,1);
    createRoca(rocas,4,1,sin_Movimiento, sprite_Muro_Solid1,1);
    createRoca(rocas,5,1,sin_Movimiento, sprite_Muro_Solid1,1);
    createRoca(rocas,6,1,sin_Movimiento, sprite_Muro_Solid1,1);
    createRoca(rocas,7,1,sin_Movimiento, sprite_Muro_Solid1,1);
    createRoca(rocas,1,7,sin_Movimiento, sprite_Muro_Solid1,1);
    createRoca(rocas,2,7,sin_Movimiento, sprite_Muro_Solid1,1);
    createRoca(rocas,3,7,sin_Movimiento, sprite_Muro_Solid1,1);
    createRoca(rocas,4,7,sin_Movimiento, sprite_Muro_Solid1,1);
    createRoca(rocas,5,7,sin_Movimiento, sprite_Muro_Solid1,1);
    createRoca(rocas,6,7,sin_Movimiento, sprite_Muro_Solid1,1);
    createRoca(rocas,7,7,sin_Movimiento, sprite_Muro_Solid1,1);
    createRoca(rocas,5,3,sin_Movimiento,sprite_RockInmovil1_G,1);
    createRoca(rocas,5,5,sin_Movimiento,sprite_RockInmovil1_G,1);
    createRoca(rocas,1,3,sin_Movimiento,sprite_RockInmovil2_G,1);
    createRoca(rocas,1,5,sin_Movimiento,sprite_RockInmovil2_G,1);
    createRoca(rocas,7,3,sin_Movimiento,sprite_RockInmovil5_G,1);
    createRoca(rocas,7,5,sin_Movimiento,sprite_RockInmovil5_G,1);



    //decoracionDerecha
    createRocaEspejo(rocasEspejo,9,1,sin_Movimiento,sprite_Muro_Solid1,1);
    createRocaEspejo(rocasEspejo,10,1,sin_Movimiento,sprite_Muro_Solid1,1);
    createRocaEspejo(rocasEspejo,11,1,sin_Movimiento,sprite_Muro_Solid1,1);
    createRocaEspejo(rocasEspejo,12,1,sin_Movimiento,sprite_Muro_Solid1,1);
    createRocaEspejo(rocasEspejo,13,1,sin_Movimiento,sprite_Muro_Solid1,1);
    createRocaEspejo(rocasEspejo,14,1,sin_Movimiento,sprite_Muro_Solid1,1);
    createRocaEspejo(rocasEspejo,15,1,sin_Movimiento,sprite_Muro_Solid1,1);
    createRocaEspejo(rocasEspejo,9,7,sin_Movimiento,sprite_Muro_Solid1,1);
    createRocaEspejo(rocasEspejo,10,7,sin_Movimiento,sprite_Muro_Solid1,1);
    createRocaEspejo(rocasEspejo,11,7,sin_Movimiento,sprite_Muro_Solid1,1);
    createRocaEspejo(rocasEspejo,12,7,sin_Movimiento,sprite_Muro_Solid1,1);
    createRocaEspejo(rocasEspejo,13,7,sin_Movimiento,sprite_Muro_Solid1,1);
    createRocaEspejo(rocasEspejo,14,7,sin_Movimiento,sprite_Muro_Solid1,1);
    createRocaEspejo(rocasEspejo,15,7,sin_Movimiento,sprite_Muro_Solid1,1);
    createHoleDerecha(rocasEspejo,10,3,sprite_hole,1);
    createHoleDerecha(rocasEspejo,11,3,sprite_hole,1);
    createHoleDerecha(rocasEspejo,10,5,sprite_hole,1);
    createHoleDerecha(rocasEspejo,11,5,sprite_hole,1);
    createRocaEspejo(rocasEspejo,15,3,sin_Movimiento,sprite_RockInmovil2_B,1);
    createRocaEspejo(rocasEspejo,15,5,sin_Movimiento,sprite_RockInmovil2_B,1);
    createRocaEspejo(rocasEspejo,9,3,sin_Movimiento,sprite_RockInmovil5_B,1);
    createRocaEspejo(rocasEspejo,9,5,sin_Movimiento,sprite_RockInmovil5_B,1);

}
