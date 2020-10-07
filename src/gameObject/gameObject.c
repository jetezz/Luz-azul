#include "gameObject.h"
#include "sprites/player.h"
#include "sprites/rock.h"
#include "sprites/rockInmovil.h"
#include "sprites/rockLineal.h"
#include "sprites/portal.h"
#include "sprites/puerta.h"
#include "constantes.h"
#include "fisicas/fisicas.h"

#include <stdio.h>
#include <stdlib.h>


//sprites 8x16 pixeles
#define     anchoSprite                 4
#define     altoSprite                  16

#define     retardoMovimiento           0xFF


void initGameobjest(TGameObject* portales,TGameObject* puertas){
    P_portal=portales;
    P_puertas=puertas;
}

void dibujarGameObject(TGameObject* objeto){
    if(objeto->posx!=0){
        if(objeto->sprite==sprite_Player){
            cpct_drawSprite(playerSprite_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);  
        }else if(objeto->sprite==sprite_Rock){
            cpct_drawSprite(rock_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
        }else if(objeto->sprite==sprite_RockInmovil){
            cpct_drawSprite(rockInmovil_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
        }else if(objeto->sprite==sprite_RockLineal){
            cpct_drawSprite(rockLineal_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
        }else if(objeto->sprite==sprite_Portal){
             cpct_drawSprite(portalSprite_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
        }else if(objeto->sprite==sprite_Puerta){
             cpct_drawSprite(puertalSprite_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
        }

    }     
}
void limpiarRastro(u8 posx, u8 posy){
    cpct_drawSolidBox(calcularPosicionEnPantalla(posx,posy),0x00,4,16);
}
u8 moverGameObject(TGameObject* objeto,u8 movimiento, TGameObject* rocasCol,TGameObject* rocasEspejo,u8* posicion){       
    if(objeto->cronoMovimiento==0 || objeto->sprite!=sprite_Player){    
        movimiento=calcularMaximosyMinimos(movimiento,objeto->posx,objeto->posy,*posicion);            
        if(movimiento!=mover_SinMovimiento){                  
            u8 nextPosx=objeto->posx;
            u8 nextPosy=objeto->posy;
            u8 ObjetoColisionado=SinColision;
            u8 colisionPortales=no_Hay_Colision;
            u8 moverRoca=mover_roca;
            u8 colisionPuerta=seguir_En_Nivel;
            u8 numMovimientos=0;
            


            if(objeto->movimiento==mover_1){
                movimientoSimple(&nextPosx,&nextPosy,movimiento,*posicion);
                numMovimientos=1;                 
            }else if(objeto->movimiento==mover_Linea){
                numMovimientos=movimientoLineal(objeto,&nextPosx,&nextPosy,movimiento,rocasCol,*posicion);
            }
            
            colisionPuerta=comprobarPuertas(nextPosx,nextPosy);
            if(colisionPuerta!=seguir_En_Nivel && objeto->sprite==sprite_Player){
                return colisionPuerta;
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
                          
                                                      
            if(ObjetoColisionado==SinColision && colisionPuerta==no_Hay_Colision){             
                limpiarRastro(objeto->posx,objeto->posy);
                objeto->posx=nextPosx;
                objeto->posy=nextPosy;
                dibujarGameObject(objeto);
                if(objeto->sprite!=sprite_Player){
                    moverElEspejo(objeto->num,movimiento,rocasEspejo,*posicion,numMovimientos);                    
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
    return seguir_En_Nivel;
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
void moverElEspejo(u8 num,u8 movimiento,TGameObject* rocasEspejo,u8 posicion,u8 numMovimientos){
   
    TGameObject* objetoEspejo=&rocasEspejo[num];       
    u8 nextMovimiento=movimiento;

    if(objetoEspejo->posx!=0){
      
    
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
        for(u8 i=0;i<numMovimientos;i++){
            nextMovimiento=calcularMaximosyMinimos(nextMovimiento,objetoEspejo->posx,objetoEspejo->posy,posicion);            
            if(nextMovimiento!=mover_SinMovimiento){                  
                u8 nextPosx=objetoEspejo->posx;
                u8 nextPosy=objetoEspejo->posy;
                u8 ObjetoColisionado=SinColision;
                u8 colisionPortales=no_Hay_Colision;
                u8 colisionPuerta=seguir_En_Nivel; 
                
                mover1casilla(&nextPosx,&nextPosy,nextMovimiento);           
                comprobarPortales(objetoEspejo,&nextPosx,&nextPosy,movimiento,posicion);
                ObjetoColisionado=comprobarColisiones(nextPosx,nextPosy,rocasEspejo);               
                colisionPortales=comprobarPortales(objetoEspejo,&nextPosx,&nextPosy,movimiento,posicion);
                colisionPuerta=comprobarPuertas(nextPosx,nextPosy);                                         
                if(ObjetoColisionado==SinColision && colisionPortales==no_Hay_Colision && colisionPuerta==seguir_En_Nivel){                                           
                    limpiarRastro(objetoEspejo->posx,objetoEspejo->posy);
                    objetoEspejo->posx=nextPosx;
                    objetoEspejo->posy=nextPosy;
                    dibujarGameObject(objetoEspejo);                             
                }           
            }
        }
    }

}
u8 comprobarPortales(TGameObject* objeto,u8* posx,u8* posy,u8 movimiento,u8* posicion){    
    if(*posx==P_portal[0].posx ){
        if(*posy==P_portal[0].posy ){
            if(objeto->sprite==sprite_Player){                
                *posx=P_portal[1].posx;
                *posy=P_portal[1].posy;
                mover1casilla(posx,posy,movimiento);                
            }
            return hay_Colision;               
        }
    }        
    if(*posx==P_portal[1].posx){
        if(*posy==P_portal[1].posy){
            if(objeto->sprite==sprite_Player){
                *posx=P_portal[0].posx;
                *posy=P_portal[0].posy;
                mover1casilla(posx,posy,movimiento);                
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

u8 comprobarPuertas(u8 posx, u8 posy){
    for(u8 i=0;i<3;i++){
        if(posx==P_puertas[i].posx && posy==P_puertas[i].posy){
            return P_puertas[i].num;
        }
    }
    return seguir_En_Nivel;
}



//movimientos

void mover1casilla(u8* posx, u8* posy,u8 movimiento){
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

void movimientoSimple(u8* posx, u8* posy,u8 movimiento,u8 posicion){
      mover1casilla(posx,posy,movimiento);       
}
u8 movimientoLineal(TGameObject* objeto,u8* posx, u8* posy,u8 movimiento,TGameObject* objetosCol,u8 posicion){    
    u8 colisionObjetos=SinColision;
    u8 colisionPuerta=no_Hay_Colision;
    u8 colisionPortales=no_Hay_Colision;    
    u8 nextPosx=*posx;
    u8 nextPosy=*posy;
    u8 contador=0;
    
   while (colisionObjetos==SinColision && movimiento!=mover_SinMovimiento && colisionPuerta==no_Hay_Colision && colisionPortales==no_Hay_Colision)
    {     
        movimiento=calcularMaximosyMinimos(movimiento,nextPosx,nextPosy,posicion);       
        mover1casilla(&nextPosx,&nextPosy,movimiento);
        colisionPuerta=comprobarPuertas(nextPosx,nextPosy);
        colisionObjetos=comprobarColisiones(nextPosx,nextPosy,objetosCol);
        colisionPortales=comprobarPortales(objeto,&nextPosx,&nextPosy,movimiento,posicion);           
        if(colisionObjetos==SinColision && colisionPuerta==no_Hay_Colision && colisionPortales==no_Hay_Colision){                       
            *posx=nextPosx;
            *posy=nextPosy;
            contador++;
        }else{
            nextPosx=*posx;
            nextPosy=*posy;
        }                 
    }
    return contador;
    
    
          
}

//////////////////////////////
//////////////////////////////
//////////////////////////////
//////////////////////////////
//////////////////////////////
//////////////////////////////
