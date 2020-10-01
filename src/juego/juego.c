#include "juego.h"
#include "input/input.h"
#include "niveles/niveles.h"
#include "constantes.h"
#include "sprites/player.h"
#include "sprites/sprites.h"
#define  Punto_Inicial_De_Pantalla   cpctm_screenPtr(CPCT_VMEM_START, 4, 16)





TGameObject player;
TGameObject rocas[5];




void game(){
    initGame();
    dibujarGameObject(&player);    
    while(1){ 
        scanKey();
        comprobarMovimiento();      
        moverGameObject(&player,movimientoGuardado);              
    }
}
void initGame(){
    crearNivel();
    createPlayer();
}
void createPlayer(){
    player.posx=1;
    player.posy=1;   
    player.sprite=sprite_Player;
}

void comprobarMovimiento(){
    if(player.cronoMovimiento==0){
        movimientoGuardado=mover_SinMovimiento;
    }
    if(movimientoPlayer()!=mover_SinMovimiento){
        movimientoGuardado=movimientoPlayer();
    }
}