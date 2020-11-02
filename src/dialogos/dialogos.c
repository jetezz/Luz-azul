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
    //nivel 01
    dialogos[0]=dialogo01_0;

    dialogos[2]=dialogo01_2;
    //nivel 01_01
    dialogos[3]=dialogo01__01_0;


    //nivel02
    dialogos[6]=dialogo02_0;


    //niveltrap1
    dialogos[9]=dialogotrap1_0;

    //nivel03
    dialogos[11]=dialogo03_0;


    //nivel04
    dialogos[14]=dialogo04_0;
    dialogos[15]=dialogo04_1;
    //nivel 05
    dialogos[16]=dialogo05_0;

    //nivel 06
    dialogos[18]=dialogo06_0;

    //nivel 07
    dialogos[20]=dialogo07_0;


    //nivel 08
    dialogos[23]=dialogo08_0;   


    //nivel 08_01
    dialogos[26]=dialogo08_01_0;   


    //nivel 09
    dialogos[29]=dialogo09_0;   



    //nivel 10
    dialogos[33]=dialogo10_0;  



    //nivel 11
    dialogos[37]=dialogo11_0;   

    //nivel 12
    dialogos[39]=dialogo12_0;   

    //nivel 13
    dialogos[41]=dialogo13_0;



    //nivel 14
    dialogos[45]=dialogo14_0;   

    //nivel 15
    dialogos[47]=dialogo15_0;   








 

    
    


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
    //nivel1
    anadirDialogo(0,nivel_01,0); 
    anadirDialogo(2,nivel_01,6);

    //nivel01_01
    anadirDialogo(3,nivel_01_01,0); 


    //nivel 02
    anadirDialogo(6,nivel_02,0); 


    //nivel trap1
    anadirDialogo(9,nivel_TRAP_01,0);

    //nivel 03 
    anadirDialogo(11,nivel_03,0);


    //nivel 04
    anadirDialogo(14,nivel_04,0);
    anadirDialogo(15,nivel_04,3);
    //nivel 05
    anadirDialogo(16,nivel_05,0);

    //nivel 06
    anadirDialogo(18,nivel_06,0);

    //nivel 07
    anadirDialogo(20,nivel_07,0);


    //nivel 08
    anadirDialogo(23,nivel_08,0);


    //nivel 08_01
    anadirDialogo(26,nivel_08_01,0);


    //nivel 09
    anadirDialogo(29,nivel_09,0);



    //nivel 10
    anadirDialogo(33,nivel_10,0);



    //nivel 11
    anadirDialogo(37,nivel_11,0);

    //nivel 12
    anadirDialogo(39,nivel_12,0);

    //nivel 13
    anadirDialogo(41,nivel_13,0);



    //nivel 14
    anadirDialogo(45,nivel_14,0);

    //nivel 15
    anadirDialogo(47,nivel_15,0);



    

    












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
    }else if(nivel==nivel_12){
        cpct_drawSprite(mapa3_0,PunteroMapa, 11, 44);
    }else if(nivel>nivel_12 && nivel<nivel_17){
        cpct_drawSprite(mapa4_0,PunteroMapa, 11, 44);
    }
}
void dialogovacio(){

}

//nivel 1
void dialogo01_0(){   
    cpct_drawStringM0("Tu cuarto",PuntoEscribir);    
}

void dialogo01_2(){
    cpct_setDrawCharM0(2, 0);
    cpct_drawStringM0("Si intentara mover  algo...",PuntoEscribir);
    cpct_setDrawCharM0(1, 0);
}

//nivel 01_01
void dialogo01__01_0(){    
    cpct_drawStringM0("Un monstruo",PuntoEscribir);    
}


//nivel02
void dialogo02_0(){
     cpct_drawStringM0("El pasillo",PuntoEscribir); 
}

//nivel trap1
void dialogotrap1_0(){
     cpct_drawStringM0("Una trampa!",PuntoEscribir); 
}

//nivel 03
void dialogo03_0(){
     cpct_drawStringM0("Hermano!",PuntoEscribir);
}

//nivel 4
void dialogo04_0(){
     cpct_drawStringM0("La entrada",PuntoEscribir);
}
void dialogo04_1(){
    cpct_setDrawCharM0(2, 0);
    cpct_drawStringM0("La luz era la unica manera de derrotar  a Zul.",PuntoEscribir);
    cpct_setDrawCharM0(1, 0);
}

//nivel 05
void dialogo05_0(){
     cpct_drawStringM0("La cocina",PuntoEscribir);
}

//nivel 06
void dialogo06_0(){
    cpct_drawStringM0("El lavabo",PuntoEscribir);
}


//nivel 07
void dialogo07_0(){
     cpct_drawStringM0("Al otro lado",PuntoEscribir);
}

//nivel 08
void dialogo08_0(){
     cpct_drawStringM0("Las escaleras",PuntoEscribir);
}
//nivel 08_01

void dialogo08_01_0(){
    cpct_drawStringM0("ZUL",PuntoEscribir);
}

//nivel 09
void dialogo09_0(){
     cpct_drawStringM0("El pasillo II",PuntoEscribir);
}
//nivel 10
void dialogo10_0(){    
     cpct_drawStringM0("Madre",PuntoEscribir);
}

//nivel 11
void dialogo11_0(){
    cpct_drawStringM0("Padre?",PuntoEscribir);
}

//nivel 12
void dialogo12_0(){
    cpct_drawStringM0("A la buhardilla",PuntoEscribir);
}
//nivel 13
void dialogo13_0(){
     cpct_drawStringM0("Las Catatumbas",PuntoEscribir);
}

//nivel 14
void dialogo14_0(){
   cpct_drawStringM0("Entre la tierra",PuntoEscribir); 
}

//nivel 15
void dialogo15_0(){
     cpct_drawStringM0("No! Padre!",PuntoEscribir); 
}


