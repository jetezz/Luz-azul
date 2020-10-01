#include "gameObject.h"
#include "sprites/player.h"
#include "constantes.h"
#include "fisicas/fisicas.h"


//sprites 8x16 pixeles
#define     anchoSprite                 4
#define     altoSprite                  16

#define     retardoMovimiento           0xFF

void dibujarGameObject(TGameObject* objeto){
    if(objeto->sprite==sprite_Player){
        cpct_drawSprite(playerSprite_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);  
    }     
}
void limpiarRastro(u8 posx, u8 posy){
    cpct_drawSolidBox(calcularPosicionEnPantalla(posx,posy),0x00,4,16);
}
void moverGameObject(TGameObject* objeto,u8 movimiento){
    if(objeto->cronoMovimiento==0){    
        movimiento=calcularSiguientePosicion(movimiento,objeto->posx,objeto->posy);    
        if(movimiento!=mover_SinMovimiento){
            u8 posxLast=objeto->posx;
            u8 posyLast=objeto->posy;
            if(movimiento==mover_Izquierda){
                objeto->posx-=1;
            }else if(movimiento==mover_Arriba){
                objeto->posy-=1;
            }else if(movimiento==mover_Derecha){
                objeto->posx+=1;
            }else if(movimiento==mover_Abajo){
                objeto->posy+=1;
            }
            dibujarGameObject(objeto);
            limpiarRastro(posxLast,posyLast);
            objeto->cronoMovimiento=retardoMovimiento;
        }
    }else{
        objeto->cronoMovimiento-=1;
    }
}