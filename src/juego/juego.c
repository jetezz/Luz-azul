#include "juego.h"
#include "input/input.h"
#include "niveles/niveles.h"
#include "sprites/player.h"
#include "sprites/sprites.h"


#include <stdio.h>
#include <stdlib.h>

#define     Punto_Inicial_De_Pantalla   cpctm_screenPtr(CPCT_VMEM_START, 4, 16)






TGameObject player;
TGameObject rocas[RocasMaximas];
TGameObject rocasEspejo[RocasMaximas];
TGameObject portal[2];
TGameObject puertas[10];


u8 posicion;





void game(){
    initGame();       
    while(1){ 
        scanKey();
        comprobarMovimiento();      
        moverPlayer();       
    }
}
void initGame(){
    posicion=posicion_Izquieda;
    initNiveles();
    crearNivel(&player,rocas,rocasEspejo,puertas,portal,&posicion,nivel_1);    
    initGameobjest(portal,puertas);
    dibujarGameObjects();    
}
void moverPlayer(){
    u8 nivel=seguir_En_Nivel;
    if(posicion==posicion_Izquieda){
        nivel=moverGameObject(&player,movimientoGuardado,rocas,rocasEspejo,&posicion);
    }else{
        nivel=moverGameObject(&player,movimientoGuardado,rocasEspejo,rocas,&posicion);
    }

    if(nivel!=seguir_En_Nivel){       
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
    for(u8 i=0;i<2;i++){
        dibujarGameObject(&puertas[i]);
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
    crearNivel(&player,rocas,rocasEspejo,puertas,portal,&posicion,nivel);    
    initGameobjest(portal,puertas);
    dibujarGameObjects();  
}