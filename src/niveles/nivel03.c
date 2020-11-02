#include "nivel03.h"

void crearnivel03(){
//player  portal puertas y marco
createPlayer(3,3);
createMarco(si);
createPortal(si);
createPuerta(3,1,sprite_Puerta_G,nivel_02);
createPuerta(13,1,sprite_Puerta_B,nivel_01_01);
createPuerta(5,7,sprite_StairDown1_G,nivel_17);
createPuerta(7,7,sprite_StairUp1_G,nivel_11);
createPuerta(11,7,sprite_StairDown1_B,nivel_TRAP_01);
createPuerta(9,7,sprite_StairUp1_B,nivel_TRAP_01);


//rocas móviles (separando id por espacios)
cambiarMov(mover_1);
createRoca(5,4,sprite_Rock_G,2);
createRoca(1,6,sprite_Rock_G,3);
cambiarMov(mover_Linea);
createRocaEspejo(11,4,sprite_RockLineal1_G,2);
cambiarMov(sin_Movimiento);


//collecionables
createColeccionabeFamilia(15,5,sprite_familia1,3);

//decoracion muros

//decoracion simetricos
crearRocaYsimetrico(4,2,sprite_RockInmovil1_G,sprite_RockInmovil1_B,1);
crearRocaYsimetrico(4,6,sprite_RockInmovil1_G,sprite_RockInmovil1_B,1);
crearRocaYsimetrico(6,2,sprite_RockInmovil2_G,sprite_RockInmovil2_B,1);
crearRocaYsimetrico(6,6,sprite_RockInmovil2_G,sprite_RockInmovil2_B,1);
crearRocaYsimetrico(2,5,sprite_Rock_nomove_G,sprite_Rock_nomove_B,1);
crearRocaYsimetrico(2,4,sprite_Rock_nomove_G,sprite_Rock_nomove_B,1);
crearRocaYsimetrico(4,7,sprite_Muro_Solid1,sprite_Muro_Solid1,1);
crearRocaYsimetrico(5,6,sprite_Muro_Solid1,sprite_Muro_Solid1,1);
crearRocaYsimetrico(7,6,sprite_Muro_Solid1,sprite_Muro_Solid1,1);

//decoracion izquierda
createRoca(1,3,sprite_RockInmovil1_G,1);

//decoracionDerecha
createHoleDerecha(15,3,sprite_hole,1);
createHoleDerecha(15,6,sprite_hole,1);

}
