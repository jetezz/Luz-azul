#include "hud.h"
#include <stdio.h>
#include "constantes.h"
#include "gameObject/gameObject.h"
#define     PuntoLuz   cpctm_screenPtr(CPCT_VMEM_START, 74, 20)
#define     PuntoFamilia   cpctm_screenPtr(CPCT_VMEM_START, 74, 52)
#define     PuntoCartuchos   cpctm_screenPtr(CPCT_VMEM_START, 74, 84)
#define     PuntoPasos   cpctm_screenPtr(CPCT_VMEM_START, 72, 116)
#define     PuntoPasos2   cpctm_screenPtr(CPCT_VMEM_START, 76, 116)





u8 contadorLuz;
u8 contadorFamilia;
u8 contadorAmstr;
u8 contadorPasos;


void asd(){
   
    //char text[] = "x";
    //u8 digit=1;
    //cpct_setVideoMode(1);
    //text[0] = digit + '0';
   
    
    //cpct_drawStringM0("asd asd as asdasd   asd asdasd  ",PuntoEscribir);
    
    
}
void initHud(){
    char text[2] = "0";
    
    cpct_setDrawCharM0(1, 0);
    
    dibujarGameObjectColSprite(sprite_luz,17,1);
    dibujarGameObjectColSprite(sprite_familia2,17,3);
    dibujarGameObjectColSprite(sprite_amstradTape,17,5);

    cpct_drawStringM0(text,PuntoLuz);
    cpct_drawStringM0(text,PuntoFamilia);
    cpct_drawStringM0(text,PuntoCartuchos);
    //cpct_drawStringM0(text2,PuntoPasos);

    contadorLuz=0;
    contadorFamilia=0;
    contadorAmstr=0;
    contadorPasos=0;

}
void actualizarHud(u8 luz, u8 familia,u8 amstr,u8 pasos){
    char text[2] = "X";    
    int decimas=0;
    int unidades=0;

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
    if(pasos!=contadorPasos){        
        cpct_drawSolidBox(cpctm_screenPtr(CPCT_VMEM_START, 72, 116),0x00,4,16);
        decimas=pasos/10;
        unidades=pasos%10;       
        text[0]=decimas+'0';
        cpct_drawStringM0(text,PuntoPasos);
        text[0]=unidades +'0';
        cpct_drawStringM0(text,PuntoPasos2);       
        contadorPasos=pasos;
        
        
    }    
    
}

