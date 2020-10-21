#include "niveltrap_02.h"


void crearniveltrap02(){
//player  portal puertas y marco
createPlayer(4,4);
createMarco(no);
createPortal(no);
createPuerta(4,2,sprite_StairUp1_B,nivel_08);
createPuerta(4,6,sprite_StairDown1_B,nivel_08);

//collecionables

//decoracion muros
crearMuro(1,1,7,7,sprite_Muro_Polvo1,posicion_Izquieda);

//decoracionSimetricos

//decoracion izquierda
createRoca(3,3,sprite_RockInmovil1_B,1);
createRoca(3,5,sprite_RockInmovil1_B,1);
createRoca(5,3,sprite_RockInmovil1_B,1);
createRoca(5,5,sprite_RockInmovil1_B,1);


}
