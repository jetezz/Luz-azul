#include "nivel08_01.h"

void crearnivel08_01(){
    //player  portal puertas y marco
createPlayer(6,3);
createMarco(no);
createPortal(no);
createPuerta(7,3,sprite_Puerta_B,nivel_08);

//collecionables
createColeccionabeAmstr(2,3,7);
createColeccionabeLuz(3,3,8);

//decoracion muri
crearMuro(1,1,7,5,sprite_Muro_Polvo1,posicion_Izquieda);

//decoracion izquierda
createRoca(4,2,sprite_zul1_1,1);
createRoca(4,3,sprite_zul1_2,1);
createRoca(2,2,sprite_RockInmovil2_B,1);
createRoca(2,4,sprite_RockInmovil2_B,1);
createRoca(6,2,sprite_RockInmovil2_B,1);
createRoca(6,4,sprite_RockInmovil2_B,1);

}
