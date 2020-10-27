#include "constantes.h"

#include "tAnimaciones.h"

static void (*animaciones[animacinesMaximas]) (u8 posx, u8 posy, u8 posxFinal, u8 posyFinal);
extern TAnimaciones animacionesActivas [animacionesMaximasEnLista];
extern u8 posicionLista;


void initAnimaciones();
void animacionesManager();
void iniciarAnimacion(u8 anim,u8 posx, u8 posy, u8 posxFinal, u8 posyFinal);
void ajustarArray();


//animaciones
void animacionAndar(u8 posx, u8 posy, u8 posxFinal, u8 posyFinal);


