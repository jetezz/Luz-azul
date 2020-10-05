#include "juego.h"
#include "input/input.h"
#include "niveles/niveles.h"
#include "constantes.h"
#include "sprites/player.h"
#include "sprites/sprites.h"

#define     Punto_Inicial_De_Pantalla   cpctm_screenPtr(CPCT_VMEM_START, 4, 16)






TGameObject player;
TGameObject rocas[RocasMaximas];




void game(){
    initGame();       
    while(1){ 
        scanKey();
        comprobarMovimiento();      
        moverGameObject(&player,movimientoGuardado,rocas);              
    }
}
void initGame(){
    crearNivel();
    createPlayer();
    createRocas();
    dibujarGameObjects();    
}
void createPlayer(){
    player.posx=1;
    player.posy=1;   
    player.sprite=sprite_Player;
}
void createRocas(){
    rocas[0].posx=5;
    rocas[0].posy=5;
    rocas[0].sprite=sprite_Rock;

    rocas[1].posx=6;
    rocas[1].posy=6;
    rocas[1].sprite=sprite_Rock;

    rocas[2].posx=7;
    rocas[2].posy=7;
    rocas[2].sprite=sprite_Rock;
}
void dibujarGameObjects(){
    dibujarGameObject(&player);
    for (u8 i =0; i<RocasMaximas;i++){        
        dibujarGameObject(&rocas[i]);
        
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
    player.posx=0;
    player.posy=0;   
    player.sprite=sprite_Player;

    for (u8 i=0;i<RocasMaximas;i++){
        rocas[i].posx=0;
        rocas[i].posy=0;
        rocas[i].sprite=sprite_SinDefinir;
    }
}