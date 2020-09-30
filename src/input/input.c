#include "input.h"

void scanKey(){
    cpct_scanKeyboard_f();
}

u8 keyScape(){
    u8 pulsada=0;
    if(cpct_isKeyPressed (Key_Esc))
        pulsada=1;
    return pulsada;    
}
u8 keyUp(){
    u8 pulsada=0;
    if(cpct_isKeyPressed (Key_CursorUp))
        pulsada=1;
    return pulsada; 
}
u8 keyDown(){
    u8 pulsada=0;
    if(cpct_isKeyPressed (Key_CursorDown))
        pulsada=1;
    return pulsada; 
}
u8 keyLeft(){
    u8 pulsada=0;
    if(cpct_isKeyPressed (Key_CursorLeft))
        pulsada=1;
    return pulsada; 
}
u8 keyRight(){
    u8 pulsada=0;
    if(cpct_isKeyPressed (Key_CursorRight))
        pulsada=1;
    return pulsada; 
}
u8 keyFire(){
    u8 pulsada=0;
    if(cpct_isKeyPressed (Key_Space))
        pulsada=1;
    return pulsada; 
}