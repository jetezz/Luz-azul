#include "gameObject.h"
#include "sprites/player.h"
#include "sprites/rock.h"
#include "constantes.h"
#include "fisicas/fisicas.h"

#include <stdio.h>
#include <stdlib.h>


//sprites 8x16 pixeles
#define     anchoSprite                 4
#define     altoSprite                  16

#define     retardoMovimiento           0xFF

void dibujarGameObject(TGameObject* objeto){
    if(objeto->posx!=0){
        if(objeto->sprite==sprite_Player){
            cpct_drawSprite(playerSprite_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);  
        }else if(objeto->sprite==sprite_Rock){
            cpct_drawSprite(rock_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
        }

    }     
}
void limpiarRastro(u8 posx, u8 posy){
    cpct_drawSolidBox(calcularPosicionEnPantalla(posx,posy),0x00,4,16);
}
void moverGameObject(TGameObject* objeto,u8 movimiento,TGameObject* rocas){    
    if(objeto->cronoMovimiento==0){    
        movimiento=calcularSiguientePosicion(movimiento,objeto->posx,objeto->posy);            
        if(movimiento!=mover_SinMovimiento){
            u8 posxLast=objeto->posx;
            u8 posyLast=objeto->posy;
            u8 ObjetoColisionado=SinColision;
            if(movimiento==mover_Izquierda){
                objeto->posx-=1;
            }else if(movimiento==mover_Arriba){
                objeto->posy-=1;
            }else if(movimiento==mover_Derecha){
                objeto->posx+=1;
            }else if(movimiento==mover_Abajo){
                objeto->posy+=1;
            }
            ObjetoColisionado=comprobarColisiones(objeto,rocas);  
            //if(objeto->posx==rocas[0].posx){
            //    ObjetoColisionado=1;
            //}        
            if(ObjetoColisionado==SinColision){
                dibujarGameObject(objeto);
                limpiarRastro(posxLast,posyLast);  
            }else{                              
                objeto->posx=posxLast;
                objeto->posy=posyLast;
            }            
            objeto->cronoMovimiento=retardoMovimiento;
        }
    }else{
        objeto->cronoMovimiento-=1;
    }
}
u8 comprobarColisiones(TGameObject* objeto,TGameObject* rocas){
    u8 colision=SinColision;
   
    for(u8 i=0;i<RocasMaximas;i++){
        if(rocas[i].posx!=0){
            if(comprobarColisiones1vs1(objeto->posx,objeto->posy,rocas[i].posx,rocas[i].posy)==hay_Colision){           
                colision=i;
            }
        }
    }
    return colision;
}
