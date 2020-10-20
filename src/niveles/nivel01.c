#include "nivel01.h"

void crearnivel01(){
     //player  portal puertas y marco
    createPlayer(3,4);
    createMarco(si);
    createPortal(si);
    createPuerta(3,7,sprite_Puerta_G,nivel_02);
    createPuerta(13,7,sprite_Puerta_B,nivel_01_01);

    //rocas móviles (separando id por espacios)
    cambiarMov(mover_1);
    createRoca(2,4,sprite_Rock_G,2);
    cambiarMov(sin_Movimiento);
    createRocaEspejo(14,4,sprite_Rock_nomove_B,2);

    //collecionables
    createColeccionabeLuz(15,4,0);

    //decoracion izquierda
    
    createRoca(1,2,sprite_RockInmovil3_G,1);
    createRoca(2,2,sprite_RockInmovil4_G,1);
    createRoca(1,3,sprite_RockInmovil1_G,1);
    createRoca(6,3,sprite_RockInmovil1_G,1);
    createRoca(1,5,sprite_RockInmovil1_G,1);
    createRoca(6,5,sprite_RockInmovil1_G,1);
    createRoca(7,1,sprite_RockInmovil2_G,1);
    createRoca(7,7,sprite_RockInmovil2_G,1);
    createRoca(1,4,sprite_amstrad,1);
    createRoca(1,1,sprite_PrinceofPersia2_G,1);
    createRoca(2,1,sprite_PrinceofPersia1_G,1);


    //decoracionDerecha
    createRocaEspejo(14,2,sprite_RockInmovil3_B,1);
    createRocaEspejo(15,2,sprite_RockInmovil4_B,1);
    createRocaEspejo(15,3,sprite_RockInmovil1_B,1);
    createRocaEspejo(10,3,sprite_RockInmovil1_B,1);
    createRocaEspejo(15,5,sprite_RockInmovil1_B,1);
    createRocaEspejo(10,5,sprite_RockInmovil1_B,1);
    createRocaEspejo(9,1,sprite_RockInmovil2_B,1);
    createRocaEspejo(9,7,sprite_RockInmovil2_B,1);
    createRocaEspejo(14,1,sprite_PrinceofPersia1_B,1);
    createRocaEspejo(15,1,sprite_PrinceofPersia2_B,1);
}
