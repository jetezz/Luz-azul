#include "nivel01_01.h"

void crearnivel01_01(){
    //player  portal puertas y marco
    createPlayer(2,3);
    createMarco(no);
    createPortal(no);
    createPuerta(3,1,sprite_Puerta_B,nivel_01);
    

    //collecionables
    createColeccionabeAmstr(5,3,1);

    //decoracion muros
    crearMuro(1,1,7,5,sprite_Muro_Polvo1,posicion_Izquieda);

    //decoracion simetricos

    
    //decoracion izquierda
    createRoca(4,3,sprite_enemigo1,1);
    

    
    //decoracion derecha
    
}
