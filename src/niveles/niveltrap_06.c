#include "niveltrap_06.h"

void crearniveltrap_06(){
    //player  portal puertas y marco
createPlayer(3,4);
createMarco(no);
createPortal(no);
createPuerta(2,4,sprite_Puerta_B,nivel_18);


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
