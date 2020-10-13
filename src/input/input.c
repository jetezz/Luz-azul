#include "input.h"
#include "constantes.h"

void scanKey(){
    cpct_scanKeyboard_f();
}

u8 keyScape(){
    u8 pulsada=0;
    if(cpct_isKeyPressed (Key_Esc))
        pulsada=1;
    return pulsada;    
}
u8 keyFire(){
    u8 pulsada=0;
    if(cpct_isKeyPressed (Key_Space))
        pulsada=1;
    return pulsada; 
}
u8 keyR(){
    u8 pulsada=no;
    if(cpct_isKeyPressed (Key_R))
        pulsada=si;
    return pulsada; 
}


u8 movimientoPlayer(){
    u8 pulsada=0;
    u8 movimiento=mover_SinMovimiento;
    if(cpct_isKeyPressed (Key_CursorUp)){
        movimiento=mover_Arriba;
        pulsada=1;
    }
    if(cpct_isKeyPressed (Key_CursorDown)){
         movimiento=mover_Abajo;
         if(pulsada==1)
         return mover_SinMovimiento;
         pulsada=1;
    }
    if(cpct_isKeyPressed (Key_CursorLeft)){
        movimiento=mover_Izquierda;
         if(pulsada==1)
         return mover_SinMovimiento;
         pulsada=1;
    }
    if(cpct_isKeyPressed (Key_CursorRight)){
        movimiento=mover_Derecha;
         if(pulsada==1)
         return mover_SinMovimiento;         
    }
    return movimiento;
}