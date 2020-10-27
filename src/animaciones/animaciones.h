#include "constantes.h"

#include "tAnimaciones.h"

static void (*animaciones[animacinesMaximas]) (u8 sprite,u8 posx, u8 posy, u8 posxFinal, u8 posyFinal);
extern TAnimaciones animacionesActivas [animacionesMaximasEnLista];



void initAnimaciones();
void animacionesManager();
void iniciarAnimacion(u8 anim,u8 sprite,u8 posx, u8 posy, u8 posxFinal, u8 posyFinal);
u8 porcentajeDesplazamiento(u8 numInteraciones,u8 casillas,u8 repeticiones);


//animaciones
void animacionAndar(u8 sprite,u8 posx, u8 posy, u8 posxFinal, u8 posyFinal);
void animacionRoca1(u8 sprite,u8 posx, u8 posy, u8 posxFinal, u8 posyFinal);



