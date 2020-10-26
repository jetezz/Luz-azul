#include "dialogos.h"
#include "constantes.h"
#define     PuntoEscribir   cpctm_screenPtr(CPCT_VMEM_START, 2, 150)
#define     PuntoEscribirPasos   cpctm_screenPtr(CPCT_VMEM_START, 50, 150)
#define     PuntoEscribirPasos2   cpctm_screenPtr(CPCT_VMEM_START, 54, 150)
#define     PuntoEscribirPasos3   cpctm_screenPtr(CPCT_VMEM_START, 58, 150)



#include <stdio.h>
#include <stdlib.h>

TDialogo dialogosTotales[numDialogosTotales];
u8 contadorDialogos;
void initDialogos(){
    dialogos[0]=dialogo0;
    dialogos[1]=dialogo1;
    dialogos[2]=dialogopasos;


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
    anadirDialogo(2,nivel_01_01,1);
    

    

}
void dialogopasos(){
    char text[2] = "X";
    u8 centesimas=0;
    u8 decimas=0;
    u8 unidades=0;
    u8 pasos=0;
    u8 pasos2=0;
    
    
        pasos=pasosTotales;
        centesimas=pasosTotalescentesimas;
        decimas=pasos/10;
        unidades=pasos%10; 
    
        
       
         

    text[0]=centesimas+'0';
    cpct_drawStringM0(text,PuntoEscribirPasos);

    text[0]=decimas+'0';
    cpct_drawStringM0(text,PuntoEscribirPasos2);

    text[0]=unidades+'0';
    cpct_drawStringM0(text,PuntoEscribirPasos3);

}
void dialogo0(){
    cpct_drawStringM0("dialogo muy tocho",PuntoEscribir);
}
void dialogo1(){
    cpct_drawStringM0("dialogo no",PuntoEscribir);
}