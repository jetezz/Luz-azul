#include "juego.h"
#include "input/input.h"
#include "niveles/niveles.h"
#include "sprites/sprites.h"
#include "hud/hud.h"


#include <stdio.h>
#include <stdlib.h>

#define     Punto_Inicial_De_Pantalla   cpctm_screenPtr(CPCT_VMEM_START, 4, 16)


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
u8 nivelActual;



void game(){
    initGame();       
    while(1){ 
        scanKey();
        if(keyR()==si){
            resetGameobjects(nivelActual);
        }
        comprobarMovimiento();      
        moverPlayer();
        actualizarHud(coleccionablesLuz,coleccionablesFam);       
    }
}
void initGame(){
    for(u8 i =0;i<ColeccionablesMaximosTotales;i++){
        colList[i]=coleccionable_activo;
    }
    posicion=posicion_Izquieda;
    coleccionablesLuz=0;
    coleccionablesFam=0;
    nivelActual=nivel_0;
    initNiveles(colList);
    crearNivel(&player,rocas,rocasEspejo,puertas,portal,coleccionables,&posicion,nivel_0);    
    initGameobjest(portal,puertas,coleccionables,&coleccionablesLuz,&coleccionablesFam,colList);
    dibujarGameObjects();
    initHud();    
}
void moverPlayer(){
    u8 nivel=seguir_En_Nivel;
    if(posicion==posicion_Izquieda){
        nivel=moverGameObject(&player,movimientoGuardado,rocas,rocasEspejo,&posicion);
    }else{
        nivel=moverGameObject(&player,movimientoGuardado,rocasEspejo,rocas,&posicion);
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

void resetGameobjects(u8 nivel){
    posicion=posicion_Izquieda;
    crearNivel(&player,rocas,rocasEspejo,puertas,portal,coleccionables,&posicion,nivel);    
    //initGameobjest(portal,puertas,coleccionables,&coleccionablesLuz,&coleccionablesFam);
    dibujarGameObjects();  
}