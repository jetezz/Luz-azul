#include "gameObject.h"
#include "sprites/player.h"
#include "sprites/rock.h"
#include "sprites/rockInmovil.h"
#include "sprites/portal.h"
#include "constantes.h"
#include "fisicas/fisicas.h"

#include <stdio.h>
#include <stdlib.h>


//sprites 8x16 pixeles
#define     anchoSprite                 4
#define     altoSprite                  16

#define     retardoMovimiento           0xFF


void initGameobjest(TGameObject* portales){
    P_portal=portales;
   
}

void dibujarGameObject(TGameObject* objeto){
    if(objeto->posx!=0){
        if(objeto->sprite==sprite_Player){
            cpct_drawSprite(playerSprite_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);  
        }else if(objeto->sprite==sprite_Rock){
            cpct_drawSprite(rock_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
        }else if(objeto->sprite==sprite_RockInmovil){
            cpct_drawSprite(rockInmovil_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
        }else if(objeto->sprite==sprite_Portal){
             cpct_drawSprite(portalSprite_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
        }

    }     
}
void limpiarRastro(u8 posx, u8 posy){
    cpct_drawSolidBox(calcularPosicionEnPantalla(posx,posy),0x00,4,16);
}
void moverGameObject(TGameObject* objeto,u8 movimiento, TGameObject* rocasCol,TGameObject* rocasEspejo,u8* posicion){       
    if(objeto->cronoMovimiento==0 || objeto->sprite!=sprite_Player){    
        movimiento=calcularMaximosyMinimos(movimiento,objeto->posx,objeto->posy,*posicion);            
        if(movimiento!=mover_SinMovimiento){                  
            u8 nextPosx=objeto->posx;
            u8 nextPosy=objeto->posy;
            u8 ObjetoColisionado=SinColision;
            u8 colisionPortales=no_Hay_Colision;
            u8 moverRoca=mover_roca;
            


            if(objeto->sprite==sprite_Player|| objeto->sprite==sprite_Rock){
               movimientoSimple(&nextPosx,&nextPosy,movimiento); 
            }
            
            colisionPortales=comprobarPortales(objeto,&nextPosx,&nextPosy,movimiento,posicion);            
            ObjetoColisionado=comprobarColisiones(nextPosx,nextPosy,rocasCol);
            if(objeto->sprite!=sprite_Player && colisionPortales==hay_Colision){
               ObjetoColisionado=0; 
            }
            if(objeto->sprite==sprite_Player && colisionPortales==hay_Colision){
                ObjetoColisionado=comprobarColisiones(nextPosx,nextPosy,rocasEspejo);
                if(ObjetoColisionado!=SinColision){
                    moverRoca=no_mover_roca;
                }else{
                    cambiarPosicion(posicion);
                }
            }
                          
                                                      
            if(ObjetoColisionado==SinColision){             
                limpiarRastro(objeto->posx,objeto->posy);
                objeto->posx=nextPosx;
                objeto->posy=nextPosy;
                dibujarGameObject(objeto);
                if(objeto->sprite!=sprite_Player){
                    moverElEspejo(objeto->num,movimiento,rocasEspejo,*posicion);
                }                               
            }else{ 
                if(objeto->sprite==sprite_Player && moverRoca==mover_roca)          
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
void moverElEspejo(u8 num,u8 movimiento,TGameObject* rocasEspejo,u8 posicion){
   
    TGameObject* objetoEspejo=&rocasEspejo[num];       
    u8 nextMovimiento=movimiento;
      
    
    if(movimiento==mover_Izquierda){
        nextMovimiento=mover_Derecha;
    }if(movimiento==mover_Derecha){
        nextMovimiento=mover_Izquierda;
    }   

    if(posicion==posicion_Izquieda){
        posicion=posicion_Derecha;
    }else{
        posicion=posicion_Izquieda;
    }
    
    nextMovimiento=calcularMaximosyMinimos(nextMovimiento,objetoEspejo->posx,objetoEspejo->posy,posicion);            
        if(nextMovimiento!=mover_SinMovimiento){                  
            u8 nextPosx=objetoEspejo->posx;
            u8 nextPosy=objetoEspejo->posy;
            u8 ObjetoColisionado=SinColision;
            u8 colisionPortales=no_Hay_Colision; 
            
            movimientoSimple(&nextPosx,&nextPosy,nextMovimiento);           
            comprobarPortales(objetoEspejo,&nextPosx,&nextPosy,movimiento,posicion);
            ObjetoColisionado=comprobarColisiones(nextPosx,nextPosy,rocasEspejo);               
            colisionPortales=comprobarPortales(objetoEspejo,&nextPosx,&nextPosy,movimiento,posicion);                                         
            if(ObjetoColisionado==SinColision && colisionPortales==no_Hay_Colision){             
                limpiarRastro(objetoEspejo->posx,objetoEspejo->posy);
                objetoEspejo->posx=nextPosx;
                objetoEspejo->posy=nextPosy;
                dibujarGameObject(objetoEspejo);                             
            }           
        }

}
u8 comprobarPortales(TGameObject* objeto,u8* posx,u8* posy,u8 movimiento,u8* posicion){    
    if(*posx==P_portal[0].posx ){
        if(*posy==P_portal[0].posy ){
            if(objeto->sprite==sprite_Player){                
                *posx=P_portal[1].posx;
                *posy=P_portal[1].posy;
                movimientoSimple(posx,posy,movimiento);                
            }
            return hay_Colision;               
        }
    }        
    if(*posx==P_portal[1].posx){
        if(*posy==P_portal[1].posy){
            if(objeto->sprite==sprite_Player){
                *posx=P_portal[0].posx;
                *posy=P_portal[0].posy;
                movimientoSimple(posx,posy,movimiento);                
            }
            return hay_Colision;                   
        }
    }
    return no_Hay_Colision;        
}


void cambiarPosicion(u8* posicion){    
    if(*posicion==posicion_Izquieda){
        *posicion=posicion_Derecha;        
    }else{
        *posicion=posicion_Izquieda;       
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
