#include "fisicas.h"
#include "constantes.h"

#include <stdio.h>
#include <stdlib.h>


#define     Punto_Inicial_De_Pantalla   cpctm_screenPtr(CPCT_VMEM_START, 4, 16)
#define     posxMax                     7
#define     posyMax                     9
#define     posxMaxEspejo               16
#define     posxminEspejo               10

#define     posMin                      1



u8* calcularPosicionEnPantalla(u8 posx, u8 posy){

    return cpctm_screenPtr(CPCT_VMEM_START, posx*4, posy*16);
}
u8 calcularMaximosyMinimos(u8 movimiento,u8 posx, u8 posy,u8 posicion){   
    u8 maximox;
    u8 minimox;
    if(posicion==posicion_Izquieda){        
        maximox=posxMax;
        minimox=posMin;
    }else{             
        maximox=posxMaxEspejo;
        minimox=posxminEspejo;
    }

    if(movimiento!=mover_SinMovimiento){
        if(movimiento==mover_Izquierda){
            if(posx-1<minimox)
            movimiento=mover_SinMovimiento;
        }else if(movimiento==mover_Arriba){
            if(posy-1<posMin)
            movimiento=mover_SinMovimiento;
        }else if(movimiento==mover_Derecha){
            if(posx+1>maximox)
            movimiento=mover_SinMovimiento;
        }else if(movimiento==mover_Abajo){
            if(posy+1>posyMax)
            movimiento=mover_SinMovimiento;
        }
    }
    return movimiento;
}
u8 comprobarColisiones1vs1(u8 posx, u8 posy,u8 posxRock, u8 posyRock){    
    if(posx==posxRock && posy==posyRock){        
        return hay_Colision;
    }else{
        return no_Hay_Colision;
    }
}