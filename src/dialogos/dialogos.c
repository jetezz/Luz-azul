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

#define PunteroMapa cpctm_screenPtr(CPCT_VMEM_START, 6, 150)


#include "sprites/mapa1.h"
#include "sprites/mapa2.h"
#include "sprites/mapa3.h"
#include "sprites/mapa4.h"




TDialogo dialogosTotales[numDialogosTotales];


u8 contadorDialogos;
void initDialogos(u8* pasos, u8* pasos2,u8* muertes,u8* muertes2){
    P_pasosTotales=pasos;
    P_pasosTotales2=pasos2;
    P_murtes=muertes;
    P_muertes2=muertes2;

    for(u8 i =0; i<numDialogosTotales;i++){
        dialogos[i]=dialogovacio;
    }
    
    dialogos[0]=dialogo01_0;
    dialogos[1]=dialogo01_3;
    dialogos[2]=dialogo01_6;
    dialogos[3]=dialogo01_9;
    dialogos[4]=dialogo01_15;
    dialogos[5]=dialogo01_20;
 

    
    


    contadorDialogos=0;
    dialogosNivel1();
  

}


void managerDialogo(u8 nivel, u8 pasos){
    for(u8 i=0;i<numDialogosTotales;i++){
        if(nivel==dialogosTotales[i].nivel){
            if(dialogosTotales[i].pasos==pasos){               
                cpct_drawSolidBox(cpctm_screenPtr(CPCT_VMEM_START, 0, 150),0,50,38);
                cpct_drawSolidBox(cpctm_screenPtr(CPCT_VMEM_START, 50, 150),0,50,38);
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
    anadirDialogo(0,nivel_01,0);
    anadirDialogo(1,nivel_01,3);
    anadirDialogo(2,nivel_01,6);
    anadirDialogo(3,nivel_01,9);
    anadirDialogo(4,nivel_01,15);
    anadirDialogo(5,nivel_01,20);
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
    
    cpct_drawSolidBox(cpctm_screenPtr(CPCT_VMEM_START, 0, 150),0,50,38);
    cpct_drawSolidBox(cpctm_screenPtr(CPCT_VMEM_START, 50, 150),0,50,38);

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
    cpct_drawSolidBox(cpctm_screenPtr(CPCT_VMEM_START, 0, 150),0,50,38);
    cpct_drawSolidBox(cpctm_screenPtr(CPCT_VMEM_START, 50, 150),0,50,38);
    if(nivel<nivel_07){
        cpct_drawSprite(mapa1_0,PunteroMapa, 11, 44);
    }else if(nivel<nivel_12 && nivel>nivel_07){
        cpct_drawSprite(mapa2_0,PunteroMapa, 11, 44);
    }else if(nivel==12){
        cpct_drawSprite(mapa3_0,PunteroMapa, 11, 44);
    }else{
        cpct_drawSprite(mapa4_0,PunteroMapa, 11, 44);

    }
}
void dialogovacio(){

}

//nivel 1
void dialogo01_0(){
    cpct_setDrawCharM0(3, 0);
    cpct_drawStringM0("YOUR ROOM",PuntoEscribir);
    cpct_setDrawCharM0(1, 0);
}
void dialogo01_3(){
    cpct_setDrawCharM0(2, 0);
    cpct_drawStringM0("Las luces se        apagaron,y una      intensa luz surgio  de la pared.",PuntoEscribir);
    cpct_setDrawCharM0(1, 0);
}
void dialogo01_6(){    
    cpct_drawStringM0("Que ha pasado? Un   portal en mi        habitacion",PuntoEscribir);    
}
void dialogo01_9(){    
    cpct_drawStringM0("Hay una habitacion  al otro lado,y es   igual que la mia",PuntoEscribir);    
}
void dialogo01_15(){    
    cpct_drawStringM0("Hay una luz,        intentare llegar a  ella.",PuntoEscribir);    
}
void dialogo01_20(){    
    cpct_drawStringM0("Tengo que saber que ha pasado.",PuntoEscribir);    
}

