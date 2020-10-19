#include "niveles.h"
#include "mapa/mapa.h"
#include "constantes.h"

#include "nivel01.h"
#include "nivel01_01.h"
#include "nivel02.h"
#include "nivel01_trap.h"
#include "nivel03.h"
#include "nivel04.h"
#include "nivel04_01.h"
#include "nivel05.h"
#include "nivel06.h"
#include "nivel07.h"




#include <stdio.h>
#include <stdlib.h>

void (*niveles[50]) (TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* col,u8* posicion);
void initNiveles(u8* collist){
    
    niveles[nivel_01]=crearnivel01;
    niveles[nivel_01_01]=crearnivel01_01;    
    niveles[nivel_02]=crearnivel02;
    niveles[nivel_TRAP_01]=crearnivel01trap;  
    niveles[nivel_03]=crearnivel03;
    niveles[nivel_04]=crearnivel04;
    niveles[nivel_04_01]=crearnivel04_01;
    niveles[nivel_05]=crearnivel05;
    niveles[nivel_06]=crearnivel06;
    niveles[nivel_07]=crearnivel07;


    

    P_colList2=collist;
    contadorRocas=0;
    contadorRocasEspejo=0;
    contadorPuertas=0;
    contadorColeccionables=0;
    
}

void crearNivel(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* coleccionables,u8* posicion,u8 nivel){
      
    limpiarPantalla();    
    resetLevel(player,rocas,rocasEspejo,puertas,portales,coleccionables);
     
    niveles[nivel](player,rocas,rocasEspejo,puertas,portales,coleccionables,posicion);
    
        
}
void resetLevel(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* coleccionables){
    player->posx=0;
    for(u8 i =0;i<RocasMaximas;i++){
       rocas[i].posx=0; 
    }
    for(u8 i =0;i<RocasMaximas;i++){
       rocasEspejo[i].posx=0; 
    }
    for(u8 i =0;i<PuertasMaximas;i++){
       puertas[i].posx=0; 
    }
    portales[0].posx=0;
    portales[1].posx=0;

     for(u8 i =0;i<ColeccionablesMaximos;i++){
       coleccionables[i].posx=0; 
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

void createPlayer(TGameObject* player,u8 posx, u8 posy,u8* posicion){
    if(posx<9){
        *posicion=posicion_Izquieda;
    }else{
        *posicion=posicion_Derecha;        
    }
    //player->num=-1;
    player->posx=posx;
    player->posy=posy;   
    player->sprite=sprite_Player;
    player->movimiento=mover_1;
    player->pasos=0;
}
void createRoca(TGameObject* rocas,u8 posx, u8 posy,u8 mivimiento,u8 sprite, u8 simetria){
    rocas[contadorRocas].num=simetria;
    rocas[contadorRocas].posx=posx;
    rocas[contadorRocas].posy=posy;
    rocas[contadorRocas].sprite=sprite;
    rocas[contadorRocas].movimiento=mivimiento;
    contadorRocas++;    
}
void createRocaEspejo(TGameObject* rocasEspejo,u8 posx, u8 posy,u8 mivimiento,u8 sprite, u8 simetria){
    rocasEspejo[contadorRocasEspejo].num=simetria;
    rocasEspejo[contadorRocasEspejo].posx=posx;
    rocasEspejo[contadorRocasEspejo].posy=posy;
    rocasEspejo[contadorRocasEspejo].sprite=sprite;
    rocasEspejo[contadorRocasEspejo].movimiento=mivimiento;
    contadorRocasEspejo++;
}
void createPuerta(TGameObject* puertas,u8 posx,u8 posy,u8 sprite,u8 nivel){
    puertas[contadorPuertas].num=nivel;
    puertas[contadorPuertas].posx=posx;
    puertas[contadorPuertas].posy=posy;
    puertas[contadorPuertas].sprite=sprite;
    contadorPuertas++;
}
void createPortal(TGameObject* portal,TGameObject* roca,TGameObject* rocasEspejo,u8 hay){
    if(hay==si){
        portal[0].posx=7;
        portal[0].posy=4;
        portal[0].sprite=sprite_PuertaPortal_G;

        portal[1].posx=9;
        portal[1].posy=4;
        portal[1].sprite=sprite_PuertaPortal_B;
        createRoca(roca,8,4,sin_Movimiento,sprite_PortalMuro,1);
    }
    
}

void createHoleIzquierda(TGameObject* rocas,u8 posx, u8 posy,u8 sprite, u8 simetria){
    rocas[contadorRocas].num=simetria;
    rocas[contadorRocas].posx=posx;
    rocas[contadorRocas].posy=posy;
    rocas[contadorRocas].sprite=sprite;
    rocas[contadorRocas].movimiento=sin_Movimiento;
    contadorRocas++;
}
void createHoleDerecha(TGameObject* rocasEspejo,u8 posx, u8 posy,u8 sprite, u8 simetria){
    rocasEspejo[contadorRocasEspejo].num=simetria;
    rocasEspejo[contadorRocasEspejo].posx=posx;
    rocasEspejo[contadorRocasEspejo].posy=posy;
    rocasEspejo[contadorRocasEspejo].sprite=sprite;
    rocasEspejo[contadorRocasEspejo].movimiento=sin_Movimiento;
    contadorRocasEspejo++;
}
void createColeccionabeLuz(TGameObjectCol* coleccionable,u8 posx, u8 posy,u8 id){
    if(P_colList2[id]==coleccionable_activo){
        coleccionable[contadorColeccionables].num=id;
        coleccionable[contadorColeccionables].posx=posx;
        coleccionable[contadorColeccionables].posy=posy;
        coleccionable[contadorColeccionables].sprite=sprite_luz;
    }
}
void createColeccionabeFamilia(TGameObjectCol* coleccionable,u8 posx, u8 posy,u8 sprite,u8 id){
    if(P_colList2[id]==coleccionable_activo){
        coleccionable[contadorColeccionables].num=id;
        coleccionable[contadorColeccionables].posx=posx;
        coleccionable[contadorColeccionables].posy=posy;
        coleccionable[contadorColeccionables].sprite=sprite;
    }
}
void createColeccionabeAmstr(TGameObjectCol* coleccionable,u8 posx, u8 posy,u8 id){
    if(P_colList2[id]==coleccionable_activo){
        coleccionable[contadorColeccionables].num=id;
        coleccionable[contadorColeccionables].posx=posx;
        coleccionable[contadorColeccionables].posy=posy;
        coleccionable[contadorColeccionables].sprite=sprite_amstradTape;
    }
}








