#include "nivel09_03.h"

void crearnivel09_03(){

    //player  portal puertas y marco
createPlayer(4,3);
createMarco(no);
createPortal(no);
createPuerta(4,2,sprite_Puerta_B,nivel_09);



//rocas móviles (separando id por espacios)



//collecionables
createColeccionabeAmstr(4,4,10);

//decoracion muro
crearMuro(1,1,7,5,sprite_Muro_Polvo1,posicion_Izquieda);

//decoracion izquierda
createRoca(3,2,sprite_RockInmovil1_B,1);
createRoca(5,2,sprite_RockInmovil1_B,1);
createRoca(3,4,sprite_RockInmovil1_B,1);
createRoca(5,4,sprite_RockInmovil1_B,1);
createRoca(2,3,sprite_RockInmovil2_B,1);
createRoca(6,3,sprite_RockInmovil2_B,1);

}
