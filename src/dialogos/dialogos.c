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
    dialogos[0]=dialogo01_1;
    dialogos[2]=dialogo01_2;
    //nivel 01_01
    dialogos[3]=dialogo01__01_0;
    dialogos[4]=dialogo01__01_1;
    dialogos[5]=dialogo01__01_2;
    //nivel02
    dialogos[6]=dialogo02_0;
    dialogos[7]=dialogo02_1;
    dialogos[8]=dialogo02_2;
    //niveltrap1
    dialogos[9]=dialogotrap1_0;
    dialogos[10]=dialogotrap1_1;
    //nivel03
    dialogos[11]=dialogo03_0;
    dialogos[12]=dialogo03_1;
    dialogos[13]=dialogo03_2;
    //nivel04
    dialogos[14]=dialogo04_0;
    dialogos[15]=dialogo04_1;
    //nivel 05
    dialogos[16]=dialogo05_0;

    //nivel 06
    dialogos[18]=dialogo06_0;

    //nivel 07
    dialogos[20]=dialogo07_0;
    dialogos[21]=dialogo07_1;
    dialogos[22]=dialogo07_2;
    //nivel 08
    dialogos[23]=dialogo08_0;   

    dialogos[25]=dialogo08_2; 
    //nivel 08_01
    dialogos[26]=dialogo08_01_0;   
    dialogos[27]=dialogo08_01_1;   
    dialogos[28]=dialogo08_01_2; 
    //nivel 09
    dialogos[29]=dialogo09_0;   
    dialogos[30]=dialogo09_1;   
    dialogos[31]=dialogo09_2;   
    dialogos[32]=dialogo09_3;   
    //nivel 10
    dialogos[33]=dialogo10_0;  
    dialogos[34]=dialogo10_1;  
    dialogos[35]=dialogo10_2;  
    dialogos[36]=dialogo10_3;
    //nivel 11
    dialogos[37]=dialogo11_0;   
    dialogos[38]=dialogo11_1;   
    //nivel 12
    dialogos[39]=dialogo12_0;   
    dialogos[40]=dialogo12_1;   
    //nivel 13
    dialogos[41]=dialogo13_0;
    dialogos[42]=dialogo13_1;
    dialogos[43]=dialogo13_2;
    dialogos[44]=dialogo13_3;
    //nivel 14
    dialogos[45]=dialogo14_0;   
    dialogos[46]=dialogo14_1;
    //nivel 15
    dialogos[47]=dialogo15_0;   
    dialogos[48]=dialogo15_1;  

    //nivel 16
    dialogos[50]=dialogo16_0;   
    dialogos[51]=dialogo16_1;
    //nivel 17
    dialogos[52]=dialogo17_0;

    //nivel 18
    dialogos[54]=dialogo18_0;   

    //nivel 19
    dialogos[56]=dialogo19_0;
    dialogos[57]=dialogo19_1;  
    //nivel 20
    dialogos[58]=dialogo20_0; 
    dialogos[59]=dialogo20_1; 
    dialogos[60]=dialogo20_2; 
    dialogos[61]=dialogo20_3; 
    dialogos[62]=dialogo20_4; 




    //nivel10_05
    dialogos[63]=dialogo10_05_0; 
    //nivel21
    dialogos[64]=dialogo21_0; 
    dialogos[65]=dialogo21_1; 
    dialogos[66]=dialogo21_2; 

 

    
    


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
    anadirDialogo(0,nivel_01,3);
    anadirDialogo(2,nivel_01,6);
    //nivel01_01
    anadirDialogo(3,nivel_01_01,0); 
    anadirDialogo(4,nivel_01_01,1); 
    anadirDialogo(5,nivel_01_01,4); 
    //nivel 02
    anadirDialogo(6,nivel_02,0); 
    anadirDialogo(7,nivel_02,3); 
    anadirDialogo(8,nivel_02,15); 
    //nivel trap1
    anadirDialogo(9,nivel_TRAP_01,0);
    anadirDialogo(10,nivel_TRAP_01,1);
    //nivel 03 
    anadirDialogo(11,nivel_03,0);
    anadirDialogo(12,nivel_03,5);
    anadirDialogo(13,nivel_03,10);
    //nivel 04
    anadirDialogo(14,nivel_04,0);
    anadirDialogo(15,nivel_04,3);
    //nivel 05
    anadirDialogo(16,nivel_05,0);

    //nivel 06
    anadirDialogo(18,nivel_06,0);

    //nivel 07
    anadirDialogo(20,nivel_07,0);
    anadirDialogo(21,nivel_07,3);
    anadirDialogo(22,nivel_07,6);
    //nivel 08
    anadirDialogo(23,nivel_08,0);

    anadirDialogo(25,nivel_08,6);
    //nivel 08_01
    anadirDialogo(26,nivel_08_01,0);
    anadirDialogo(27,nivel_08_01,1);
    anadirDialogo(28,nivel_08_01,5);    
    //nivel 09
    anadirDialogo(29,nivel_09,0);
    anadirDialogo(30,nivel_09,6);
    anadirDialogo(31,nivel_09,15);
    anadirDialogo(32,nivel_09,30);
    //nivel 10
    anadirDialogo(33,nivel_10,0);
    anadirDialogo(34,nivel_10,3);
    anadirDialogo(35,nivel_10,10);
    anadirDialogo(36,nivel_10,12);
    //nivel 11
    anadirDialogo(37,nivel_11,0);
    anadirDialogo(38,nivel_11,15);
    //nivel 12
    anadirDialogo(39,nivel_12,0);
    anadirDialogo(40,nivel_12,15);
    //nivel 13
    anadirDialogo(41,nivel_13,0);
    anadirDialogo(42,nivel_13,2);
    anadirDialogo(43,nivel_13,3);
    anadirDialogo(44,nivel_13,4);
    //nivel 14
    anadirDialogo(45,nivel_14,0);
    anadirDialogo(46,nivel_14,15);
    //nivel 15
    anadirDialogo(47,nivel_15,0);
    anadirDialogo(48,nivel_15,3);

    //nivel 16
    anadirDialogo(50,nivel_16,0);
    anadirDialogo(51,nivel_16,1);
    //nivel 17
    anadirDialogo(52,nivel_17,0);

    //nivel 18
    anadirDialogo(54,nivel_18,0);

    //nivel 19
    anadirDialogo(56,nivel_19,0);
    anadirDialogo(57,nivel_19,20);

    //nivel 20
    anadirDialogo(58,nivel_20,0);
    anadirDialogo(59,nivel_20,3);
    anadirDialogo(60,nivel_20,10);
    anadirDialogo(61,nivel_20,15);
    anadirDialogo(61,nivel_20,25);




    //nivel 10_05
     anadirDialogo(63,nivel_10_05,1);

     //nivel 21
     anadirDialogo(64,nivel_21,1);
     anadirDialogo(65,nivel_21,3);
     anadirDialogo(66,nivel_21,15);






    

    












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
    cpct_setDrawCharM0(3, 0);
    cpct_drawStringM0("Tu cuarto",PuntoEscribir);
    cpct_setDrawCharM0(1, 0);    
}
void dialogo01_1(){
     cpct_drawStringM0("Una luz brillaba al otro lado. ",PuntoEscribir); 
}


void dialogo01_2(){
    cpct_setDrawCharM0(2, 0);
    cpct_drawStringM0("Si intentara mover  algo...",PuntoEscribir);
    cpct_setDrawCharM0(1, 0);
}

//nivel 01_01
void dialogo01__01_0(){ 
    cpct_setDrawCharM0(3, 0);   
    cpct_drawStringM0("Un monstruo",PuntoEscribir);
    cpct_setDrawCharM0(1, 0);    
}
void dialogo01__01_1(){    
    cpct_drawStringM0("Lejos de asustarse, caminaba a lo       desconocido.",PuntoEscribir);    
}
void dialogo01__01_2(){    
    cpct_drawStringM0("Su juego favorito   estaba destrozado.  Hazte con todas.",PuntoEscribir);    
}


//nivel02
void dialogo02_0(){
    cpct_setDrawCharM0(3, 0);
     cpct_drawStringM0("El pasillo",PuntoEscribir);
    cpct_setDrawCharM0(1, 0); 
}
void dialogo02_1(){
     cpct_drawStringM0("Un pasillo oscuro,  una voz pidiendo    ayuda",PuntoEscribir);
}
void dialogo02_2(){
     cpct_drawStringM0("Debo encontrar a mi familia.",PuntoEscribir);
}

//nivel trap1
void dialogotrap1_0(){
    cpct_setDrawCharM0(3, 0);
     cpct_drawStringM0("Una trampa!",PuntoEscribir); 
     cpct_setDrawCharM0(1, 0);
}
void dialogotrap1_1(){
     cpct_drawStringM0("Tengo que salir de  aqui.",PuntoEscribir);
}

//nivel 03
void dialogo03_0(){
    cpct_setDrawCharM0(3, 0);
     cpct_drawStringM0("Hermano!",PuntoEscribir);
     cpct_setDrawCharM0(1, 0);
}
void dialogo03_1(){
    cpct_drawStringM0("Escuchaba gritos al otro lado del       portal.",PuntoEscribir);
}
void dialogo03_2(){
    cpct_drawStringM0("Necesitaba salvar   el abismo.",PuntoEscribir);
}

//nivel 4
void dialogo04_0(){
    cpct_setDrawCharM0(3, 0);
     cpct_drawStringM0("La entrada",PuntoEscribir);
     cpct_setDrawCharM0(1, 0);
}
void dialogo04_1(){    
    cpct_drawStringM0("La luz era la unica manera de derrotar  a Zul.",PuntoEscribir);    
}

//nivel 05
void dialogo05_0(){
    cpct_setDrawCharM0(3, 0);
     cpct_drawStringM0("La cocina",PuntoEscribir);
     cpct_setDrawCharM0(1, 0);
}

//nivel 06
void dialogo06_0(){
    cpct_setDrawCharM0(3, 0);
    cpct_drawStringM0("El lavabo",PuntoEscribir);
    cpct_setDrawCharM0(1, 0);
}


//nivel 07
void dialogo07_0(){
    cpct_setDrawCharM0(3, 0);
     cpct_drawStringM0("Al otro lado",PuntoEscribir);
     cpct_setDrawCharM0(1, 0);
}
void dialogo07_1(){
    cpct_drawStringM0("El otro lado estaba repleto monstruos.",PuntoEscribir);
}
void dialogo07_2(){
    cpct_drawStringM0("Tambien de una luz  poderosa.",PuntoEscribir);
}

//nivel 08
void dialogo08_0(){
    cpct_setDrawCharM0(3, 0);
     cpct_drawStringM0("Las escaleras",PuntoEscribir);
     cpct_setDrawCharM0(1, 0);
}
void dialogo08_2(){
     cpct_drawStringM0("El aire era muy     denso, el mal       estaba cerca...",PuntoEscribir);
}

//nivel 08_01

void dialogo08_01_0(){
    cpct_setDrawCharM0(3, 0);
    cpct_drawStringM0("ZUL",PuntoEscribir);
    cpct_setDrawCharM0(1, 0);
}
void dialogo08_01_1(){
    cpct_drawStringM0("Delante, aparece la sombra de Zul.",PuntoEscribir);   
}

void dialogo08_01_2(){
     cpct_setDrawCharM0(5, 0);
    cpct_drawStringM0("Sigue asi. No vas a conseguir nada.",PuntoEscribir);
    cpct_setDrawCharM0(1, 0);
}

//nivel 09
void dialogo09_0(){
    cpct_setDrawCharM0(3, 0);
     cpct_drawStringM0("El pasillo II",PuntoEscribir);
     cpct_setDrawCharM0(1, 0);
}
void dialogo09_1(){
    cpct_drawStringM0("Avanzaba solo",PuntoEscribir);
}
void dialogo09_2(){
    cpct_drawStringM0("Espero que esten    bien.",PuntoEscribir);
}
void dialogo09_3(){
    cpct_drawStringM0("Los necesito.",PuntoEscribir);
}
//nivel 10
void dialogo10_0(){
    cpct_setDrawCharM0(3, 0);    
     cpct_drawStringM0("Madre",PuntoEscribir);
     cpct_setDrawCharM0(1, 0);
}
void dialogo10_1(){
    cpct_drawStringM0("La sala estaba      helada, su madre    estaba...",PuntoEscribir);
}
void dialogo10_2(){
    cpct_drawStringM0("Quieta, una estatua sin vida.",PuntoEscribir);
}
void dialogo10_3(){
    cpct_drawStringM0("No era ella.",PuntoEscribir);
}

//nivel 11
void dialogo11_0(){
    cpct_setDrawCharM0(3, 0);
    cpct_drawStringM0("Padre?",PuntoEscribir);
    cpct_setDrawCharM0(1, 0);
}
void dialogo11_1(){
    cpct_drawStringM0("No estaba en su     habitacion, ni al   otro lado",PuntoEscribir);
}


//nivel 12
void dialogo12_0(){
    cpct_setDrawCharM0(3, 0);
    cpct_drawStringM0("A la buhardilla",PuntoEscribir);
    cpct_setDrawCharM0(1, 0);
}
void dialogo12_1(){
    cpct_drawStringM0("Su hermana le       miraba aterrada, al otro lado.",PuntoEscribir);
}

//nivel 13
void dialogo13_0(){
    cpct_setDrawCharM0(3, 0);
     cpct_drawStringM0("Las Catatumbas",PuntoEscribir);
     cpct_setDrawCharM0(1, 0);
}
void dialogo13_1(){
     cpct_setDrawCharM0(2, 0);
     cpct_drawStringM0("DASTAN - Que la luz te acompane.",PuntoEscribir);
      cpct_setDrawCharM0(1, 0);
}
void dialogo13_2(){
     cpct_setDrawCharM0(6, 0);
    cpct_drawStringM0("Gracias.",PuntoEscribir);
      cpct_setDrawCharM0(1, 0);

}
void dialogo13_3(){
    cpct_drawStringM0("No diferenciaba ya  entre sueno y       verdad.",PuntoEscribir);
}

//nivel 14
void dialogo14_0(){
    cpct_setDrawCharM0(3, 0);
   cpct_drawStringM0("Entre la tierra",PuntoEscribir); 
   cpct_setDrawCharM0(1, 0);
}
void dialogo14_1(){
    cpct_drawStringM0("Se acercaba al fin. Debe protegerse de  los monstruos.",PuntoEscribir); 
}


//nivel 15
void dialogo15_0(){
    cpct_setDrawCharM0(3, 0);
     cpct_drawStringM0("No! Padre!",PuntoEscribir);
     cpct_setDrawCharM0(1, 0); 
}
void dialogo15_1(){
     cpct_setDrawCharM0(2, 0);
    cpct_drawStringM0("Te voy a sacar de   ese lugar!",PuntoEscribir);
     cpct_setDrawCharM0(1, 0);
}



//nivel 16
void dialogo16_0(){
    cpct_setDrawCharM0(3, 0);
     cpct_drawStringM0("Al lado de Zul",PuntoEscribir); 
     cpct_setDrawCharM0(1, 0);    
}
void dialogo16_1(){
    cpct_setDrawCharM0(5, 0);
     cpct_drawStringM0("Avanzas...pero no   es posible. No      puedes huir.",PuntoEscribir); 
     cpct_setDrawCharM0(1, 0);    
}


//nivel 17
void dialogo17_0(){
    cpct_setDrawCharM0(3, 0);
     cpct_drawStringM0("La oscuridad",PuntoEscribir); 
     cpct_setDrawCharM0(1, 0);

}
//nivel 18
void dialogo18_0(){
    cpct_setDrawCharM0(3, 0);
     cpct_drawStringM0("La profunda         oscuridad",PuntoEscribir); 
     cpct_setDrawCharM0(1, 0);

}
//nivel 19
void dialogo19_0(){
    cpct_setDrawCharM0(3, 0);
    cpct_drawStringM0("La ultima pesadilla",PuntoEscribir);
    cpct_setDrawCharM0(1, 0);
}
void dialogo19_1(){
    cpct_setDrawCharM0(5, 0);
    cpct_drawStringM0("Crees que puedes    conmigo.",PuntoEscribir);
    cpct_setDrawCharM0(1, 0);
}

//nivel 20
void dialogo20_0(){
    cpct_setDrawCharM0(3, 0);
    cpct_drawStringM0("LUZ A ZUL",PuntoEscribir);
    cpct_setDrawCharM0(1, 0);
}
void dialogo20_1(){
    cpct_drawStringM0("Ahora Zul no era    solo una sombra...",PuntoEscribir);
}
void dialogo20_2(){
     cpct_setDrawCharM0(2, 0);
    cpct_drawStringM0("Vas a desaparecer.",PuntoEscribir);
    cpct_setDrawCharM0(1, 0);
}
void dialogo20_3(){
    cpct_setDrawCharM0(5, 0);
    cpct_drawStringM0("No hay final para   el mal.",PuntoEscribir);
    cpct_setDrawCharM0(1, 0);
}
void dialogo20_4(){
    cpct_setDrawCharM0(5, 0);
    cpct_drawStringM0("Con la fuerza de la luz, pudo destrozar para siempre a     todos sus fantasmas.",PuntoEscribir);
    cpct_setDrawCharM0(1, 0);
}


//nivel 10_5
void dialogo10_05_0(){
     cpct_drawStringM0("Al fin.  Nos        volvemos a          encontrar.",PuntoEscribir);
}

//nivel 21

void dialogo21_0(){
    cpct_setDrawCharM0(3, 0);
    cpct_drawStringM0("Te has quedado      dormido, Dastan",PuntoEscribir);
    cpct_setDrawCharM0(1, 0);
}
void dialogo21_1(){
    cpct_drawStringM0("Tu hermano te       espera para jugar   al Prince of Persia",PuntoEscribir);
}
void dialogo21_2(){
    cpct_setDrawCharM0(5, 0);
    cpct_drawStringM0("I WILL FIND YOU.",PuntoEscribir);
    cpct_setDrawCharM0(1, 0);
}