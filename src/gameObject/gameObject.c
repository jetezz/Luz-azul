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
    if(objeto->cronoMovimiento==0 || objeto->sprite!=sprite_Player){    
        movimiento=calcularMaximosyMinimos(movimiento,objeto->posx,objeto->posy);            
        if(movimiento!=mover_SinMovimiento){                  
            u8 nextPosx=objeto->posx;
            u8 nextPosy=objeto->posy;

            u8 ObjetoColisionado=SinColision;
            if(movimiento==mover_Izquierda){
                nextPosx-=1;
            }else if(movimiento==mover_Arriba){
                nextPosy-=1;
            }else if(movimiento==mover_Derecha){
                nextPosx+=1;
            }else if(movimiento==mover_Abajo){
                nextPosy+=1;
            }          
            ObjetoColisionado=comprobarColisiones(nextPosx,nextPosy,rocas);               
                                                      
            if(ObjetoColisionado==SinColision){             
                limpiarRastro(objeto->posx,objeto->posy);
                objeto->posx=nextPosx;
                objeto->posy=nextPosy;
                dibujarGameObject(objeto);                 
            }else{ 
                if(objeto->sprite==sprite_Player)          
                moverGameObject(&rocas[ObjetoColisionado],movimiento,rocas);                      
            }            
            objeto->cronoMovimiento=retardoMovimiento;
        }
    }else{
        objeto->cronoMovimiento-=1;
    }
}
u8 comprobarColisiones(u8 posx,u8 posy,TGameObject* rocas){
    u8 colision=SinColision;
   
    for(u8 i=0;i<RocasMaximas;i++){
        if(rocas[i].posx!=0){
            if(comprobarColisiones1vs1(posx,posy,rocas[i].posx,rocas[i].posy)==hay_Colision){           
                colision=i;
            }
        }
    }
    return colision;
}
