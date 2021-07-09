/*
;;------------------------------LuzAzul------------------------------------
;;
;;    This program is free software: you can redistribute it and/or modify
;;    it under the terms of the GNU General Public License as published by
;;    the Free Software Foundation, either version 3 of the License, or
;;    any later version.
;;
;;    This program is distributed in the hope that it will be useful,
;;    but WITHOUT ANY WARRANTY; without even the implied warranty of
;;    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;    GNU General Public License for more details.
;;
;;    You should have received a copy of the GNU General Public License
;;    along with this program.  If not, see <https://www.gnu.org/licenses/>.
;;
;;---------------------------------------------------------------------------------
;;
;;======================================================================================================================================================
;; Title:  LuzAzul                                                               
;; Team: Code Of Light                     -- 
;; Programmer and music designer: 
;; Jesús Cuadra Téllez             --  cuadrabc2015@gmail.com
;; https://www.linkedin.com/in/jesus-cuadra-tellez-0931a6189/
;; Art director and game designer:
;; Ignacio Naranjo Ruiz                     --  i_naranjo_ruiz@hotmail.com      ;; https://www.linkedin.com/in/inaranjoruiz/
;;   
;; Date: 03/11/2020
;;=======================================================================================================================================================
*/
#include "niveles.h"
#include "mapa/mapa.h"
#include "constantes.h"

#include "nivel01.h"
#include "nivel01_01.h"
#include "nivel02.h"
#include "nivel01_trap.h"
#include "nivel03.h"
#include "nivel03_01.h"
#include "nivel04.h"
#include "nivel04_01.h"
#include "nivel05.h"
#include "nivel06.h"
#include "nivel07.h"
#include "nivel08.h"
#include "nivel08_01.h"
#include "nivel09.h"
#include "nivel09_01.h"
#include "nivel09_02.h"
#include "nivel09_03.h"
#include "niveltrap_03.h"
#include "nivel10.h"
#include "nivel10_01.h"
#include "nivel10_03.h"
#include "nivel10_04.h"
#include "nivel10_05.h"
#include "nivel11.h"
#include "nivel12.h"
#include "nivel13.h"
#include "niveltrap_04.h"
#include "nivel14.h"
#include "niveltrap_05.h"
#include "nivel15.h"
#include "nivel15_01.h"
#include "nivel16.h"
#include "nivel17.h"
#include "nivel18.h"
#include "nivel18_01.h"
#include "nivel19.h"
#include "nivel20.h"
#include "nivelFinal.h"






#include <stdio.h>
#include <stdlib.h>

void (*niveles[nivel_final]) ();
void initNiveles(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* portales,TGameObject* puertas,TGameObjectCol* colec,u8* colLuz,u8* colFam,u8* colAms,u8* colList,u8* posicion){
    P_player=player;
    P_rocas=rocas;
    P_rocasEspejo=rocasEspejo;
    P_portal=portales;
    P_puertas=puertas;
    P_posicion=posicion;
    P_col=colec;
    P_luz=colLuz;
    P_fam=colFam;
    P_ams=colAms;
    P_colList=colList;
    movimientoRep=sin_Movimiento; 

    for (u8 i=nivel_01;i<nivel_final;i++){
        niveles[i]=crearnivel01;
    }
    niveles[nivel_01]=crearnivel01;
    niveles[nivel_01_01]=crearnivel01_01;    
    niveles[nivel_02]=crearnivel02;
    niveles[nivel_TRAP_01]=crearnivel01trap;  
    niveles[nivel_03]=crearnivel03;
    niveles[nivel_03_01]=crearnivel03_01;
    niveles[nivel_04]=crearnivel04;
    niveles[nivel_04_01]=crearnivel04_01;
    niveles[nivel_05]=crearnivel05;
    niveles[nivel_06]=crearnivel06;
    niveles[nivel_07]=crearnivel07;
    niveles[nivel_08]=crearnivel08;
    niveles[nivel_08_01]=crearnivel08_01;    
    niveles[nivel_09]=crearnivel09;
    niveles[nivel_09_01]=crearnivel09_01;
    niveles[nivel_09_02]=crearnivel09_02;
    niveles[nivel_09_03]=crearnivel09_03;
    niveles[nivel_trap_03]=crearniveltrap3;
    niveles[nivel_10]=crearnivel10;
    niveles[nivel_10_01]=crearnivel10_01;    
    niveles[nivel_10_03]=crearnivel10_03;
    niveles[nivel_10_04]=crearnivel10_04;
    niveles[nivel_10_05]=crearnivel10_05;
    niveles[nivel_11]=crearnivel11;
    niveles[nivel_12]=crearnivel12;
    niveles[nivel_13]=crearnivel13;
    niveles[nivel_trap_04]=createniveltrap04;
    niveles[nivel_14]=crearnivel14;
    niveles[nivel_trap_05]=crearniveltrap05;
    niveles[nivel_15]=crearnivel15;
    niveles[nivel_15_01]=crearnivel15_01;
    niveles[nivel_16]=crearnivel16;
    niveles[nivel_17]=crearnivel17;
    niveles[nivel_18]=crearnivel18;
    niveles[nivel_18_01]=crearnivel18_01;        
    niveles[nivel_19]=crearnivel19;
    niveles[nivel_20]=crearnivel20;
    niveles[nivel_21]=crearnivelFinal;    


    
    contadorRocas=0;
    contadorRocasEspejo=0;
    contadorPuertas=0;
    contadorColeccionables=0;
    
}

void crearNivel(u8 nivel){
      
    limpiarPantalla();    
    resetLevel();
     
    niveles[nivel]();
    
        
}
void resetLevel(){
    P_player->posx=0;
    for(u8 i =0;i<RocasMaximas;i++){
       P_rocas[i].posx=0; 
    }
    for(u8 i =0;i<RocasMaximas;i++){
       P_rocasEspejo[i].posx=0; 
    }
    for(u8 i =0;i<PuertasMaximas;i++){
       P_puertas[i].posx=0; 
    }
    P_portal[0].posx=0;
    P_portal[1].posx=0;

     for(u8 i =0;i<ColeccionablesMaximos;i++){
       P_col[i].posx=0; 
    }

    contadorRocas=0;
    contadorRocasEspejo=0;
    contadorPuertas=0;
    contadorColeccionables=0;
}
void limpiarPantalla(){
    cpct_drawSolidBox(cpctm_screenPtr(CPCT_VMEM_START, 0, 0),0x00,36,144);
    cpct_drawSolidBox(cpctm_screenPtr(CPCT_VMEM_START, 36, 0),0x00,33,144);

}

void createMarco(u8 hay){
    if (hay==si){
      crearMapa(0);  
    }
    
}
void cambiarMov(u8 mov){
    movimientoRep=mov;
}



void createPlayer(u8 posx, u8 posy){
    if(posx<9){
        *P_posicion=posicion_Izquieda;
    }else{
        *P_posicion=posicion_Derecha;        
    }
    P_player->num=0;
    P_player->posx=posx;
    P_player->posy=posy;   
    P_player->sprite=sprite_Player;
    P_player->movimiento=mover_1;
    P_player->pasos=0;
}
void createRoca(u8 posx, u8 posy,u8 sprite, u8 simetria){
    
    P_rocas[contadorRocas].num=simetria;
    P_rocas[contadorRocas].posx=posx;
    P_rocas[contadorRocas].posy=posy;
    P_rocas[contadorRocas].sprite=sprite;
    P_rocas[contadorRocas].movimiento=movimientoRep;
    contadorRocas++;    
}
void createRocaEspejo(u8 posx, u8 posy,u8 sprite, u8 simetria){
    P_rocasEspejo[contadorRocasEspejo].num=simetria;
    P_rocasEspejo[contadorRocasEspejo].posx=posx;
    P_rocasEspejo[contadorRocasEspejo].posy=posy;
    P_rocasEspejo[contadorRocasEspejo].sprite=sprite;
    P_rocasEspejo[contadorRocasEspejo].movimiento=movimientoRep;
    contadorRocasEspejo++;
}
void crearMuro(u8 posx, u8 posy,u8 posxFinal,u8 posyFinal,u8 sprite,u8 lado){
    u8* contador;
    TGameObject* rocas;    
    u8 completadox=0;
    u8 completadoy=0;
    
   if(lado==posicion_Izquieda){
       rocas=P_rocas;
       contador=&contadorRocas;
   }else{
       rocas=P_rocasEspejo;
       contador=&contadorRocasEspejo;
   }
   for (u8 x=posx;completadox==0;x++){
       completadoy=0;
       for (u8 y=posy;completadoy==0;y++){
           if(y>posyFinal){
               completadoy=1;               
           }else{
               if(x==posx || x==posxFinal || y==posy || y==posyFinal) {
                    rocas[*contador].num=1;
                    rocas[*contador].posx=x;
                    rocas[*contador].posy=y;
                    rocas[*contador].sprite=sprite;
                    rocas[*contador].movimiento=sin_Movimiento;
                    *contador=*contador+1;
               }              
               
           }
           if(x==posxFinal){
               completadox=1;
           }
       }
   }
}
void crearRocaYsimetrico(u8 posx, u8 posy,u8 sprite,u8 spriteSimetrico,u8 simetria){
    P_rocas[contadorRocas].num=simetria;
    P_rocas[contadorRocas].posx=posx;
    P_rocas[contadorRocas].posy=posy;
    P_rocas[contadorRocas].sprite=sprite;
    P_rocas[contadorRocas].movimiento=movimientoRep;
    contadorRocas++;

    P_rocasEspejo[contadorRocasEspejo].num=simetria;
    P_rocasEspejo[contadorRocasEspejo].posx=16-posx;
    P_rocasEspejo[contadorRocasEspejo].posy=posy;
    P_rocasEspejo[contadorRocasEspejo].sprite=spriteSimetrico;
    P_rocasEspejo[contadorRocasEspejo].movimiento=movimientoRep;
    contadorRocasEspejo++;
}


void createPuerta(u8 posx,u8 posy,u8 sprite,u8 nivel){
    if(contadorPuertas<PuertasMaximas){
        P_puertas[contadorPuertas].num=nivel;
        P_puertas[contadorPuertas].posx=posx;
        P_puertas[contadorPuertas].posy=posy;
        P_puertas[contadorPuertas].sprite=sprite;
        contadorPuertas++;
    }
}
void createPortal(u8 hay){
    if(hay==si){
        P_portal[0].posx=7;
        P_portal[0].posy=4;
        P_portal[0].sprite=sprite_PuertaPortal_G;

        P_portal[1].posx=9;
        P_portal[1].posy=4;
        P_portal[1].sprite=sprite_PuertaPortal_B;
        createRoca(8,4,sprite_PortalMuro,1);
    }
    
}

void createHoleIzquierda(u8 posx, u8 posy,u8 sprite, u8 simetria){
    P_rocas[contadorRocas].num=simetria;
    P_rocas[contadorRocas].posx=posx;
    P_rocas[contadorRocas].posy=posy;
    P_rocas[contadorRocas].sprite=sprite;
    P_rocas[contadorRocas].movimiento=sin_Movimiento;
    contadorRocas++;
}
void createHoleDerecha(u8 posx, u8 posy,u8 sprite, u8 simetria){
    P_rocasEspejo[contadorRocasEspejo].num=simetria;
    P_rocasEspejo[contadorRocasEspejo].posx=posx;
    P_rocasEspejo[contadorRocasEspejo].posy=posy;
    P_rocasEspejo[contadorRocasEspejo].sprite=sprite;
    P_rocasEspejo[contadorRocasEspejo].movimiento=sin_Movimiento;
    contadorRocasEspejo++;
}
void createColeccionabeLuz(u8 posx, u8 posy,u8 id){
    if(P_colList[id]==coleccionable_activo){
        P_col[contadorColeccionables].num=id;
        P_col[contadorColeccionables].posx=posx;
        P_col[contadorColeccionables].posy=posy;
        P_col[contadorColeccionables].sprite=sprite_luz;
    }
    contadorColeccionables++;
}
void createColeccionabeFamilia(u8 posx, u8 posy,u8 sprite,u8 id){
    if(P_colList[id]==coleccionable_activo){
        P_col[contadorColeccionables].num=id;
        P_col[contadorColeccionables].posx=posx;
        P_col[contadorColeccionables].posy=posy;
        P_col[contadorColeccionables].sprite=sprite;
    }
    contadorColeccionables++;
}
void createColeccionabeAmstr(u8 posx, u8 posy,u8 id){
    if(P_colList[id]==coleccionable_activo){
        P_col[contadorColeccionables].num=id;
        P_col[contadorColeccionables].posx=posx;
        P_col[contadorColeccionables].posy=posy;
        P_col[contadorColeccionables].sprite=sprite_amstradTape;
    }
    contadorColeccionables++;
}








