#include "dialogos.h"
#include "constantes.h"
#define     PuntoEscribir   cpctm_screenPtr(CPCT_VMEM_START, 2, 150)
#define     PuntoEscribirPasos   cpctm_screenPtr(CPCT_VMEM_START, 56, 150)
#define     PuntoEscribirPasos2   cpctm_screenPtr(CPCT_VMEM_START, 60, 150)
#define     PuntoEscribirPasos3   cpctm_screenPtr(CPCT_VMEM_START, 64, 150)
#define     PuntoEscribirPasos4   cpctm_screenPtr(CPCT_VMEM_START, 68, 150)




#include <stdio.h>
#include <stdlib.h>

TDialogo dialogosTotales[numDialogosTotales];
u8 contadorDialogos;
void initDialogos(u8* pasos, u8* pasos2){
    P_pasosTotales=pasos;
    P_pasosTotales2=pasos2;

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
                cpct_drawSolidBox(cpctm_screenPtr(CPCT_VMEM_START, 0, 150),0,50,25);
                cpct_drawSolidBox(cpctm_screenPtr(CPCT_VMEM_START, 50, 150),0,50,25);

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
    
    cpct_drawSolidBox(cpctm_screenPtr(CPCT_VMEM_START, 0, 150),0,50,25);
    cpct_drawSolidBox(cpctm_screenPtr(CPCT_VMEM_START, 50, 150),0,50,25);

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
void dialogo0(){
    cpct_drawStringM0("dialogo muy tocho",PuntoEscribir);
}
void dialogo1(){
    cpct_drawStringM0("dialogo no",PuntoEscribir);
}