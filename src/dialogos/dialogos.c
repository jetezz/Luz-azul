#include "dialogos.h"
#include "constantes.h"
#define     PuntoEscribir   cpctm_screenPtr(CPCT_VMEM_START, 2, 150)

TDialogo dialogosTotales[numDialogosTotales];
u8 contadorDialogos;
void initDialogos(){
    dialogos[0]=dialogo0;
    dialogos[1]=dialogo1;

    contadorDialogos=0;
    dialogosNivel0();
}


void managerDialogo(u8 nivel, u8 pasos){
    for(u8 i=0;i<numDialogosTotales;i++){
        if(nivel==dialogosTotales[i].nivel){
            if(dialogosTotales[i].pasos==pasos){
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
void dialogosNivel0(){
    anadirDialogo(0,nivel_01,5);
    anadirDialogo(1,nivel_01,10);

}
void dialogo0(){
    cpct_drawStringM0("dialogo 5 pasos",PuntoEscribir);
}
void dialogo1(){
    cpct_drawStringM0("dialogo 10 pasos",PuntoEscribir);
}