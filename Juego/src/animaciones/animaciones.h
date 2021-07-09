#pragma once
#ifndef DECLARACIONTANIMACIONESH
#define DECLARACIONTANIMACIONESH

#include "constantes.h"

#include "tAnimaciones.h"

static void (*animaciones[animacinesMaximas]) (u8 sprite,u8 posx, u8 posy, u8 posxFinal, u8 posyFinal,u8 borrado,u8 retardo);
extern TAnimaciones animacionesActivas [animacionesMaximasEnLista];



void initAnimaciones();
void animacionesManager();
void iniciarAnimacion(u8 anim,u8 sprite,u8 posx, u8 posy, u8 posxFinal, u8 posyFinal,u8 borrado,u8 retardo);
u8 porcentajeDesplazamiento(u8 numInteraciones,u8 casillas,u8 repeticiones);
void resetAnimaciones();


//animaciones
void animacionAndar(u8 sprite,u8 posx, u8 posy, u8 posxFinal, u8 posyFinal,u8 borrado,u8 retardo);
void animacionRoca1(u8 sprite,u8 posx, u8 posy, u8 posxFinal, u8 posyFinal,u8 borrado,u8 retardo);
void animacionHole(u8 sprite,u8 posx, u8 posy, u8 posxFinal, u8 posyFinal,u8 borrado,u8 retardo);
void animacionMuerte(u8 sprite,u8 posx, u8 posy, u8 posxFinal, u8 posyFinal,u8 borrado,u8 retardo);




#endif // DECLARACIONTGAMEOBJECTCOLH