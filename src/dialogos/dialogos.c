#include "dialogos.h"
#include "constantes.h"
#define     PuntoEscribir   cpctm_screenPtr(CPCT_VMEM_START, 2, 150)
#define     PuntoEscribirPasos   cpctm_screenPtr(CPCT_VMEM_START, 56, 150)
#define     PuntoEscribirPasos2   cpctm_screenPtr(CPCT_VMEM_START, 60, 150)
#define     PuntoEscribirPasos3   cpctm_screenPtr(CPCT_VMEM_START, 64, 150)
#define     PuntoEscribirPasos4   cpctm_screenPtr(CPCT_VMEM_START, 68, 150)

#define     PuntoEscribir2   cpctm_screenPtr(CPCT_VMEM_START, 2, 158)
#define     PuntoEscribirMuertes   cpctm_screenPtr(CPCT_VMEM_START, 56, 158)
#define     PuntoEscribirMuertes2   cpctm_screenPtr(CPCT_VMEM_START, 60, 158)
#define     PuntoEscribirMuertes3   cpctm_screenPtr(CPCT_VMEM_START, 64, 158)
#define     PuntoEscribirMuertes4   cpctm_screenPtr(CPCT_VMEM_START, 68, 158)

#define PunteroMapa cpctm_screenPtr(CPCT_VMEM_START, 30, 150)


#include "sprites/mapa1.h"
#include "sprites/mapa2.h"
#include "sprites/mapa3.h"
#include "sprites/mapa4.h"


#include <stdio.h>
#include <stdlib.h>

TDialogo dialogosTotales[numDialogosTotales];
u8 contadorDialogos;
void initDialogos(u8* pasos, u8* pasos2,u8* muertes,u8* muertes2){
    P_pasosTotales=pasos;
    P_pasosTotales2=pasos2;
    P_murtes=muertes;
    P_muertes2=muertes2;

    dialogos[0]=dialogo0;
    dialogos[1]=dialogo1;
    


    contadorDialogos=0;
    dialogosNivel1();
    dialogosNivel01_01();

}


void managerDialogo(u8 nivel, u8 pasos){
    for(u8 i=0;i<numDialogosTotales;i++){
        if(nivel==dialogosTotales[i].nivel){
            if(dialogosTotales[i].pasos==pasos){
                cpct_drawSolidBox(cpctm_screenPtr(CPCT_VMEM_START, 0, 150),0,50,35);
                cpct_drawSolidBox(cpctm_screenPtr(CPCT_VMEM_START, 50, 150),0,50,35);

                dialogos[dialogosTotales[i].id]();  
            }
        }
    }   
}

void anadirDialogo(u8 id, u8 nivel,u8 pasos){
    dialogosTotales[contadorDialogos].id=id;
    dialogosTotales[contadorDialogos].nivel=nivel;
    dialogosTotales[contadorDialogos].pasos=pasos;
    contadorDialogos++;
}
void dialogosNivel1(){
    anadirDialogo(0,nivel_01,5);
    anadirDialogo(1,nivel_01,10);

}
void dialogosNivel01_01(){
    
    

    

}
void dialogopasos(){
    char text[2] = "X";
    u8 milesimas=0;
    u8 centesimas=0;
    u8 decimas=0;
    u8 unidades=0;
   
    
    
    milesimas=*P_pasosTotales2/10;
    centesimas=*P_pasosTotales2%10;
    decimas=*P_pasosTotales/10;
    unidades=*P_pasosTotales%10; 
    
    cpct_drawSolidBox(cpctm_screenPtr(CPCT_VMEM_START, 0, 150),0,50,35);
    cpct_drawSolidBox(cpctm_screenPtr(CPCT_VMEM_START, 50, 150),0,50,35);

    cpct_drawStringM0("Pasos totales",PuntoEscribir);   
     
     
    text[0]=milesimas+'0';
    cpct_drawStringM0(text,PuntoEscribirPasos);    

    text[0]=centesimas+'0';
    cpct_drawStringM0(text,PuntoEscribirPasos2);

    text[0]=decimas+'0';
    cpct_drawStringM0(text,PuntoEscribirPasos3);

    text[0]=unidades+'0';
    cpct_drawStringM0(text,PuntoEscribirPasos4);

}

void dialogosMuertes(){
    char text[2] = "X";
    u8 milesimas=0;
    u8 centesimas=0;
    u8 decimas=0;
    u8 unidades=0;
   
    
    
    milesimas=*P_muertes2/10;
    centesimas=*P_muertes2%10;
    decimas=*P_murtes/10;
    unidades=*P_murtes%10; 
    
    

    cpct_drawStringM0("Muertes",PuntoEscribir2);   
     
     
    text[0]=milesimas+'0';
    cpct_drawStringM0(text,PuntoEscribirMuertes);    

    text[0]=centesimas+'0';
    cpct_drawStringM0(text,PuntoEscribirMuertes2);

    text[0]=decimas+'0';
    cpct_drawStringM0(text,PuntoEscribirMuertes3);

    text[0]=unidades+'0';
    cpct_drawStringM0(text,PuntoEscribirMuertes4);
}

void dialogoMapas(u8 nivel){
    cpct_drawSolidBox(cpctm_screenPtr(CPCT_VMEM_START, 0, 150),0,50,35);
    cpct_drawSolidBox(cpctm_screenPtr(CPCT_VMEM_START, 50, 150),0,50,35);
    if(nivel<nivel_07){
        cpct_drawSprite(mapa1_0,PunteroMapa, 17, 30);
    }else if(nivel<nivel_12 && nivel>nivel_07){
        cpct_drawSprite(mapa2_0,PunteroMapa, 17, 30);
    }else if(nivel==12){
        cpct_drawSprite(mapa3_0,PunteroMapa, 17, 30);
    }else{
        cpct_drawSprite(mapa4_0,PunteroMapa, 17, 30);

    }
}


void dialogo0(){
    cpct_drawStringM0("dialogo muy tocho",PuntoEscribir);
}
void dialogo1(){
    cpct_drawStringM0("dialogo no",PuntoEscribir);
}