#include "nivel10.h"

void crearnivel10(){
    //player  portal puertas y marco
createPlayer(5,6);
createMarco(si);
createPortal(si);
createPuerta(5,7,sprite_Puerta_G,nivel_09);
createPuerta(11,7,sprite_Puerta_B,nivel_10_01);



//rocas móviles (separando id por espacios)
cambiarMov(mover_1);
createRoca(1,6,sprite_Rock_G,2);
createRocaEspejo(15,6,sprite_Rock_B,2);
createRocaEspejo(10,1,sprite_Rock_B,3);
createRocaEspejo(10,6,sprite_Rock_B,4);
cambiarMov(mover_Linea);
createRoca(4,4,sprite_RockLineal1_G,5);
createRoca(6,1,sprite_RockLineal1_G,3);
createRoca(6,6,sprite_RockLineal1_G,4);
cambiarMov(mover_1);
createRocaEspejo(12,4,sprite_Rock_nomove_B,5);
cambiarMov(sin_Movimiento);

//collecionables

//decoracion muros

//decoracion simetricos
crearRocaYsimetrico(4,3,sprite_RockInmovil1_G,sprite_RockInmovil1_B,1);
crearRocaYsimetrico(4,5,sprite_RockInmovil1_G,sprite_RockInmovil1_B,1);
crearRocaYsimetrico(3,6,sprite_RockInmovil2_G,sprite_RockInmovil2_B,1);
crearRocaYsimetrico(6,4,sprite_RockInmovil2_G,sprite_RockInmovil2_B,1);


//decoracion izquierda
createHoleIzquierda(5,1,sprite_hole,1);
createHoleIzquierda(6,7,sprite_hole,1);

createRoca(1,1,sprite_RockInmovil3_G,1);
createRoca(2,1,sprite_RockInmovil4_G,1);



//decoracionDerecha
createHoleDerecha(11,5,sprite_hole,1);
createHoleDerecha(13,1,sprite_hole,1);
createHoleDerecha(13,2,sprite_hole,1);
createHoleDerecha(13,7,sprite_hole,1);
createHoleDerecha(14,3,sprite_hole,1);
createHoleDerecha(14,5,sprite_hole,1);
createRocaEspejo(15,2,sprite_familia3,1);
createRocaEspejo(14,1,sprite_RockInmovil3_B,1);
createRocaEspejo(15,1,sprite_RockInmovil4_B,1);

}
