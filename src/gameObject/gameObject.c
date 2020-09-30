#include "gameObject.h"
#include "sprites/player.h"
#include "constantes.h"

#define  Punto_Inicial_De_Pantalla   cpctm_screenPtr(CPCT_VMEM_START, 0, 0)

void dibujarGameObject(TGameObject* objeto){
    if(objeto->sprite=sprite_Player){
        cpct_drawSprite(playerSprite, Punto_Inicial_De_Pantalla, 8, 8);   
    }
     
}