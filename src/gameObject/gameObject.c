#include "gameObject.h"
#include "sprites/player.h"
#include "sprites/rock.h"
#include "sprites/rockInmovil.h"
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
        }else if(objeto->sprite==sprite_RockInmovil){
            cpct_drawSprite(rockInmovil_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
        }

    }     
}
void limpiarRastro(u8 posx, u8 posy){
    cpct_drawSolidBox(calcularPosicionEnPantalla(posx,posy),0x00,4,16);
}
void moverGameObject(TGameObject* objeto,u8 movimiento, TGameObject* rocasCol,TGameObject* rocasEspejo,u8 posicion){       
    if(objeto->cronoMovimiento==0 || objeto->sprite!=sprite_Player){    
        movimiento=calcularMaximosyMinimos(movimiento,objeto->posx,objeto->posy);            
        if(movimiento!=mover_SinMovimiento){                  
            u8 nextPosx=objeto->posx;
            u8 nextPosy=objeto->posy;
            u8 ObjetoColisionado=SinColision;

            if(objeto->sprite==sprite_Player|| objeto->sprite==sprite_Rock){
               movimientoSimple(&nextPosx,&nextPosy,movimiento); 
            }
            
            ObjetoColisionado=comprobarColisiones(nextPosx,nextPosy,rocasCol);               
                                                      
            if(ObjetoColisionado==SinColision){             
                limpiarRastro(objeto->posx,objeto->posy);
                objeto->posx=nextPosx;
                objeto->posy=nextPosy;
                dibujarGameObject(objeto);
                if(objeto->sprite!=sprite_Player)
                    moverElEspejo(objeto->num,movimiento,rocasCol,rocasEspejo,posicion);                 
            }else{ 
                if(objeto->sprite==sprite_Player)          
                moverGameObject(&rocasCol[ObjetoColisionado],movimiento,rocasCol,rocasEspejo,posicion);                      
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
void moverElEspejo(u8 num,u8 movimiento,TGameObject* rocas,TGameObject* rocasEspejo,u8 posicion){
   
    TGameObject* objetoEspejo;
    TGameObject* objetosColisionables;    
    u8 nextMovimiento=movimiento;   
      
    if(posicion==posicion_Izquieda){
        objetoEspejo=&rocasEspejo[num];
        objetosColisionables=rocasEspejo;        
    }else{
        objetoEspejo=&rocas[num];
        objetosColisionables=rocas;        
    }   
    
    if(movimiento==mover_Izquierda){
        nextMovimiento=mover_Derecha;
    }if(movimiento==mover_Derecha){
        nextMovimiento=mover_Izquierda;
    }   

    
    //nextMovimiento=calcularMaximosyMinimos(nextMovimiento,objetoEspejo->posx,objetoEspejo->posy);            
        if(nextMovimiento!=mover_SinMovimiento){                  
            u8 nextPosx=objetoEspejo->posx;
            u8 nextPosy=objetoEspejo->posy;
            u8 ObjetoColisionado=SinColision;
            
            movimientoSimple(&nextPosx,&nextPosy,nextMovimiento);           
            
            ObjetoColisionado=comprobarColisiones(nextPosx,nextPosy,objetosColisionables);               
                                                      
            if(ObjetoColisionado==SinColision){             
                limpiarRastro(objetoEspejo->posx,objetoEspejo->posy);
                objetoEspejo->posx=nextPosx;
                objetoEspejo->posy=nextPosy;
                dibujarGameObject(objetoEspejo);                             
            }           
        }

}
//movimientos
void movimientoSimple(u8* posx, u8* posy,u8 movimiento){
            if(movimiento==mover_Izquierda){
                *posx-=1;
            }else if(movimiento==mover_Arriba){
                *posy-=1;
            }else if(movimiento==mover_Derecha){
                *posx+=1;
            }else if(movimiento==mover_Abajo){
                *posy+=1;
            }          
}
