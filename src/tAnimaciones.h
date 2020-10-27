#pragma once
#ifndef DECLARACIONTANIMACIONES
#define DECLARACIONTANIMACIONES

#include <cpctelera.h>


typedef struct {
    u8 id;   
    u8 spriteInit;    
    u8 spriteLast;
    u8 spriteActual;       
    u8 latencia;       
    u8 contador;
    u8 posx,posy,posxFinal,posyFinal;       
} TAnimaciones;

#endif // DECLARACIONTANIMACIONES