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
    createColeccionabeLuz(13,4,2);
    
    //decoracion muros
    crearMuro(1,1,7,1,sprite_Muro_Solid1,posicion_Izquieda);
    crearMuro(1,7,7,7,sprite_Muro_Solid1,posicion_Izquieda); 
    crearMuro(9,1,15,1,sprite_Muro_Solid1,posicion_Derecha);
    crearMuro(9,7,15,7,sprite_Muro_Solid1,posicion_Derecha);
    crearMuro(10,3,11,3,sprite_hole,posicion_Derecha);
    crearMuro(10,5,11,5,sprite_hole,posicion_Derecha); 
    
    //decoracion simetricos
    crearRocaYsimetrico(1,3,sprite_RockInmovil2_G,sprite_RockInmovil2_B,1);
    crearRocaYsimetrico(1,5,sprite_RockInmovil2_G,sprite_RockInmovil2_B,1);
    crearRocaYsimetrico(7,3,sprite_RockInmovil5_G,sprite_RockInmovil5_B,1);
    crearRocaYsimetrico(7,5,sprite_RockInmovil5_G,sprite_RockInmovil5_B,1);

    //decoracion izquierda      
    createRoca(5,3,sprite_RockInmovil1_G,1);
    createRoca(5,5,sprite_RockInmovil1_G,1);

    //decoracionDerecha
}
