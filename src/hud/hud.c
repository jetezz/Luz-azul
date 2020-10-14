#include "hud.h"
#include <stdio.h>
#include "constantes.h"
#include "gameObject/gameObject.h"
#define     PuntoLuz   cpctm_screenPtr(CPCT_VMEM_START, 74, 20)
#define     PuntoFamilia   cpctm_screenPtr(CPCT_VMEM_START, 74, 52)
#define     PuntoCartuchos   cpctm_screenPtr(CPCT_VMEM_START, 74, 84)
#define     PuntoEscribir   cpctm_screenPtr(CPCT_VMEM_START, 2, 150)


u8 contadorLuz;
u8 contadorFamilia;
u8 contadorAmstr;


void asd(){
   
    //char text[] = "x";
    //u8 digit=1;
    //cpct_setVideoMode(1);
    //text[0] = digit + '0';
   
    
    cpct_drawStringM0("asd asd as asdasd   asd asdasd  ",PuntoEscribir);
    
    
}
void initHud(){
    char text[] = "0";
    cpct_setDrawCharM0(3, 0);
    
    dibujarGameObjectColSprite(sprite_luz,17,1);
    dibujarGameObjectColSprite(sprite_familia2,17,3);
    dibujarGameObjectColSprite(sprite_amstradTape,17,5);

    cpct_drawStringM0(text,PuntoLuz);
    cpct_drawStringM0(text,PuntoFamilia);
    cpct_drawStringM0(text,PuntoCartuchos);

    contadorLuz=0;
    contadorFamilia=0;
    contadorAmstr=0;
}
void actualizarHud(u8 luz, u8 familia,u8 amstr){
    char text[1] = "X";
    if(luz!=contadorLuz){
        cpct_drawSolidBox(cpctm_screenPtr(CPCT_VMEM_START, 74, 20),0x00,4,16);
        text[0]=luz+'0';
        cpct_drawStringM0(text,PuntoLuz);
        contadorLuz=luz;
    }
    if(familia!=contadorFamilia){
        cpct_drawSolidBox(cpctm_screenPtr(CPCT_VMEM_START, 74, 52),0x00,4,16);
        text[0]=familia+'0';
        cpct_drawStringM0(text,PuntoFamilia);
        contadorFamilia=familia;
    }
    if(amstr!=contadorAmstr){
        cpct_drawSolidBox(cpctm_screenPtr(CPCT_VMEM_START, 74, 84),0x00,4,16);
        text[0]=amstr+'0';
        cpct_drawStringM0(text,PuntoCartuchos);
        contadorAmstr=amstr;
    }    
    
}

