#include "nivel02.h"

void crearnivel02(){
     //player  portal puertas y marco
    createPlayer(3,4);
    createMarco(si);
    createPortal(si);
    createPuerta(3,2,sprite_Puerta_G,nivel_01);
    createPuerta(3,6,sprite_Puerta_G,nivel_03);
    createPuerta(1,4,sprite_Puerta_G,nivel_04);
    createPuerta(13,2,sprite_Puerta_B,nivel_TRAP_01);
    createPuerta(13,6,sprite_Puerta_B,nivel_TRAP_01);
    createPuerta(15,4,sprite_Puerta_B,nivel_TRAP_01);

    //rocas móviles (separando id por espacios)
    cambiarMov(mover_1);
    createRoca(5,4,sprite_Rock_G,2);
    cambiarMov(sin_Movimiento);
    createRocaEspejo(11,4,sprite_Rock_nomove_B,2);

    //collecionables
    createColeccionabeLuz(13,4,1);

    //decoracion izquierda
   
    createRoca(1,1, sprite_Muro_Solid1,1);
    createRoca(2,1, sprite_Muro_Solid1,1);
    createRoca(3,1, sprite_Muro_Solid1,1);
    createRoca(4,1, sprite_Muro_Solid1,1);
    createRoca(5,1, sprite_Muro_Solid1,1);
    createRoca(6,1, sprite_Muro_Solid1,1);
    createRoca(7,1, sprite_Muro_Solid1,1);
    createRoca(1,7, sprite_Muro_Solid1,1);
    createRoca(2,7, sprite_Muro_Solid1,1);
    createRoca(3,7, sprite_Muro_Solid1,1);
    createRoca(4,7, sprite_Muro_Solid1,1);
    createRoca(5,7, sprite_Muro_Solid1,1);
    createRoca(6,7, sprite_Muro_Solid1,1);
    createRoca(7,7, sprite_Muro_Solid1,1);
    createRoca(5,3,sprite_RockInmovil1_G,1);
    createRoca(5,5,sprite_RockInmovil1_G,1);
    createRoca(1,3,sprite_RockInmovil2_G,1);
    createRoca(1,5,sprite_RockInmovil2_G,1);
    createRoca(7,3,sprite_RockInmovil5_G,1);
    createRoca(7,5,sprite_RockInmovil5_G,1);




    //decoracionDerecha
    createRocaEspejo(9,1,sprite_Muro_Solid1,1);
    createRocaEspejo(10,1,sprite_Muro_Solid1,1);
    createRocaEspejo(11,1,sprite_Muro_Solid1,1);
    createRocaEspejo(12,1,sprite_Muro_Solid1,1);
    createRocaEspejo(13,1,sprite_Muro_Solid1,1);
    createRocaEspejo(14,1,sprite_Muro_Solid1,1);
    createRocaEspejo(15,1,sprite_Muro_Solid1,1);
    createRocaEspejo(9,7,sprite_Muro_Solid1,1);
    createRocaEspejo(10,7,sprite_Muro_Solid1,1);
    createRocaEspejo(11,7,sprite_Muro_Solid1,1);
    createRocaEspejo(12,7,sprite_Muro_Solid1,1);
    createRocaEspejo(13,7,sprite_Muro_Solid1,1);
    createRocaEspejo(14,7,sprite_Muro_Solid1,1);
    createRocaEspejo(15,7,sprite_Muro_Solid1,1);
    createHoleDerecha(10,3,sprite_hole,1);
    createHoleDerecha(11,3,sprite_hole,1);
    createHoleDerecha(10,5,sprite_hole,1);
    createHoleDerecha(11,5,sprite_hole,1);
    createRocaEspejo(15,3,sprite_RockInmovil2_B,1);
    createRocaEspejo(15,5,sprite_RockInmovil2_B,1);
    createRocaEspejo(9,3,sprite_RockInmovil5_B,1);
    createRocaEspejo(9,5,sprite_RockInmovil5_B,1);

}
