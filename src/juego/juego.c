#include "juego.h"
#include "input/input.h"
#include "niveles/niveles.h"
#include "sprites/sprites.h"
#include "hud/hud.h"
#include "dialogos/dialogos.h"
#include "enemigos/enemigos.h"




#include <stdio.h>
#include <stdlib.h>

#define     Punto_Inicial_De_Pantalla   cpctm_screenPtr(CPCT_VMEM_START, 4, 16)
#define     frecuenciaMaxIA     20


TGameObject player;
TGameObject rocas[RocasMaximas];
TGameObject rocasEspejo[RocasMaximas];
TGameObject portal[2];
TGameObject puertas[10];
TGameObjectCol coleccionables[ColeccionablesMaximos];
u8 colList[ColeccionablesMaximosTotales];


u8 posicion;
u8 coleccionablesLuz;
u8 coleccionablesFam;
u8 coleccionablesAms;
u8 nivelActual;
u8 pasos;
u8 frecuenciaIA;



void game(){
    initGame();           
    while(1){
    
        cpct_waitVSYNC();        
    //    cpct_akp_musicPlay();
    //    frecuenciaIA--;
    //             
//
        scanKey();
        if(keyR()==si){            
            resetGameobjects(nivelActual);
        }
        if(keyD()==si){            
            for(u8 i=0;i<RocasMaximas;i++){
                rocas[i].posx=0;
                rocasEspejo[i].posx=0;
            }
        }             
        comprobarMovimiento();
    //          
        moverPlayer();
        actualizarHud(coleccionablesLuz,coleccionablesFam,coleccionablesAms,pasos);
        if(comprobarPasos()==si){
            //managerDialogo(nivelActual,pasos);
        }       
    //if(activarIAS(player.posx,player.posy,posicion,rocas,rocasEspejo,frecuenciaIA)==player_muere){
    //    resetGameobjects(nivelActual);
    //}
    //  if(frecuenciaIA==0){
    //      frecuenciaIA=frecuenciaMaxIA;
    //  }
    //         
    }
}
void initGame(){
    for(u8 i =0;i<ColeccionablesMaximosTotales;i++){
        colList[i]=coleccionable_activo;
    }
    posicion=posicion_Izquieda;
    coleccionablesLuz=0;
    coleccionablesFam=0;
    coleccionablesAms=0;
    nivelActual=nivel_01;
    pasos=0;
    //frecuenciaIA=frecuenciaMaxIA;
    initGameobjest(rocas,rocasEspejo,portal,puertas,coleccionables,&coleccionablesLuz,&coleccionablesFam,&coleccionablesAms,colList,&posicion);
    initNiveles(&player,rocas,rocasEspejo,portal,puertas,coleccionables,&coleccionablesLuz,&coleccionablesFam,&coleccionablesAms,colList,&posicion);    
    initHud();
    //initDialogos();
    //initEnemigos();
    crearNivel(nivel_01);
    //crearEnemigos(nivelActual);    
    dibujarGameObjects();
    
}
void moverPlayer(){
    u8 nivel=seguir_En_Nivel;
    if(posicion==posicion_Izquieda){
        nivel=moverGameObject(&player,movimientoGuardado);
    }else{
        nivel=moverGameObject(&player,movimientoGuardado);
    }

    if(nivel!=seguir_En_Nivel){
       
        nivelActual=nivel;      
        resetGameobjects(nivel);
    }
}



void dibujarGameObjects(){
    dibujarGameObject(&player);
    for (u8 i =0; i<RocasMaximas;i++){        
        dibujarGameObject(&rocas[i]);        
    }
    for (u8 i =0; i<RocasMaximas;i++){        
        dibujarGameObject(&rocasEspejo[i]);
        
    } 
    for(u8 i=0;i<2;i++){
        dibujarGameObject(&portal[i]);
    }
    for(u8 i=0;i<PuertasMaximas;i++){
        dibujarGameObject(&puertas[i]);
    }
     for(u8 i=0;i<ColeccionablesMaximos;i++){
        dibujarGameObjectCol(&coleccionables[i]);
    }  
}

void comprobarMovimiento(){
    if(player.cronoMovimiento==0){
        movimientoGuardado=mover_SinMovimiento;
    }
    if(movimientoPlayer()!=mover_SinMovimiento){
        movimientoGuardado=movimientoPlayer();
    }
}
u8 comprobarPasos(){
    if(player.pasos!=pasos){               
        pasos=player.pasos;
        return si;
    }
    return no;
}

void resetGameobjects(u8 nivel){
         
    posicion=posicion_Izquieda;
    player.pasos=0;
    pasos=0;    
    crearNivel(nivel);
    //crearEnemigos(nivelActual);        
    dibujarGameObjects();     
}