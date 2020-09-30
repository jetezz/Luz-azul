#include "juego.h"
#include "input/input.h"
#include "niveles/niveles.h"
#include "constantes.h"
#include "sprites/player.h"
#define  Punto_Inicial_De_Pantalla   cpctm_screenPtr(CPCT_VMEM_START, 5, 5)


TGameObject player;
TGameObject rocas[5];




void game(){
    //initGame();
    //dibujarGameObject(&player);
    cpct_drawSprite(playerSprite, Punto_Inicial_De_Pantalla, 4, 16); 

    while(1){            
                    
    }
}
void initGame(){
    crearNivel();
    createPlayer();
}
void createPlayer(){
    player.posx=1;
    player.posy=1;
    player.tipo=tipo_RocaNormal;
    player.sprite=sprite_Player;
}