
#pragma once
#ifndef DECLARACIONTGAMEOBJECT
#define DECLARACIONTGAMEOBJECT


#include <cpctelera.h>

typedef struct {
    u8 num;
    u8 posx,posy;    
    u8 sprite;
    u8 movimiento;
    u8 cronoMovimiento;    
} TGameObject;

#endif // DECLARACIONTGAMEOBJECT