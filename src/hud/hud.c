#include "hud.h"
#include <stdio.h>
#include "constantes.h"
#include "gameObject/gameObject.h"
#define     PuntoLuz   cpctm_screenPtr(CPCT_VMEM_START, 74, 20)
#define     PuntoFamilia   cpctm_screenPtr(CPCT_VMEM_START, 74, 52)
#define     PuntoCartuchos   cpctm_screenPtr(CPCT_VMEM_START, 74, 84)

u8 contadorLuz;
u8 contadorFamilia;

void asd(){
   
    //char text[] = "x";
    //u8 digit=1;
    //cpct_setVideoMode(1);
    //text[0] = digit + '0';
   
    //cpct_setDrawCharM0(1, 0);
    //cpct_drawStringM0(text,PuntoLuz );
    
}
void initHud(){
    char text[] = "0";
    cpct_setDrawCharM0(1, 0);
    
    dibujarGameObjectColSprite(sprite_luz,17,1);
    dibujarGameObjectColSprite(sprite_familia2,17,3);
    dibujarGameObjectColSprite(sprite_amstradTape,17,5);

    cpct_drawStringM0(text,PuntoLuz);
    cpct_drawStringM0(text,PuntoFamilia);
    cpct_drawStringM0(text,PuntoCartuchos);

    contadorLuz=0;
    contadorFamilia=0;
}
void actualizarHud(u8 luz, u8 familia){
    
}

