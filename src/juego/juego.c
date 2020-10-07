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
    crearNivel();
    createPlayer();
    createRocas();
    createRocasEspejo();
    createPortal();
    createPuerta();
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
        resetGameobjects();
    }
}
void createPlayer(){
    player.num=-1;
    player.posx=1;
    player.posy=1;   
    player.sprite=sprite_Player;
}
void createRocas(){
    rocas[0].num=0;
    rocas[0].posx=5;
    rocas[0].posy=5;
    rocas[0].sprite=sprite_Rock;

    rocas[1].num=1;
    rocas[1].posx=6;
    rocas[1].posy=6;
    rocas[1].sprite=sprite_Rock;

    rocas[2].num=2;
    rocas[2].posx=7;
    rocas[2].posy=7;
    rocas[2].sprite=sprite_Rock;
    

    
}
void createRocasEspejo(){
    rocasEspejo[0].num=0;
    rocasEspejo[0].posx=12;
    rocasEspejo[0].posy=5;
    rocasEspejo[0].sprite=sprite_Rock;

    rocasEspejo[1].num=1;
    rocasEspejo[1].posx=11;
    rocasEspejo[1].posy=6;
    rocasEspejo[1].sprite=sprite_Rock;

    rocasEspejo[2].num=2;
    rocasEspejo[2].posx=10;
    rocasEspejo[2].posy=7;
    rocasEspejo[2].sprite=sprite_RockInmovil;

    rocasEspejo[3].num=3;
    rocasEspejo[3].posx=14;
    rocasEspejo[3].posy=5;
    rocasEspejo[3].sprite=sprite_RockInmovil;
}
void createPortal(){
    portal[0].posx=7;
    portal[0].posy=5;
    portal[0].sprite=sprite_Portal;

    portal[1].posx=10;
    portal[1].posy=5;
    portal[1].sprite=sprite_Portal;
}
void createPuerta(){
    puertas[0].num=nivel_2;
    puertas[0].posx=1;
    puertas[0].posy=9;
    puertas[0].sprite=sprite_Puerta;
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

void resetGameobjects(){
    posicion=posicion_Izquieda;
    crearNivel();
    createPlayer();
    createRocas();
    createRocasEspejo();
    createPortal();
    createPuerta();
    initGameobjest(portal,puertas);
    dibujarGameObjects();  
}