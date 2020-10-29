#include "enemigos.h"
#include "gameObject/gameObject.h"
#include "animaciones/animaciones.h"

#include <stdio.h>
#include <stdlib.h>


TGameObject enemigosIzquierda[enemigosMaximos];
TGameObject enemigosDerecha[enemigosMaximos];
u8 contadorEnemigosIz;
u8 contadorEnemigosDe;

 

 void initEnemigos(){
     for(u8 i=nivel_01;i<nivel_final;i++){
        creadorDeEnemigos[i]=sinEnemigos; 
     }
     creadorDeEnemigos[nivel_TRAP_01]=enemigosNvel_trap_01;
     creadorDeEnemigos[nivel_04]=enemigosNvel_04;


      for (u8 i=0;i<enemigosMaximos;i++){
         enemigosIzquierda[i].posx=0;
         enemigosDerecha[i].posx=0;
     }




     contadorEnemigosIz=0;
     contadorEnemigosDe=0;
 }
 void crearEnemigos(u8 nivel, u8 luz){
     resetEnemigos();
     creadorDeEnemigos[nivel](luz);
     dibujarEnemigos();

 }
 void dibujarEnemigos(){
     for(u8 i=0;i<enemigosMaximos ;i++){
         if(enemigosIzquierda[i].posx>0){            
            dibujarGameObject(&enemigosIzquierda[i],no);                        
         }
         if(enemigosDerecha[i].posx>0){             
            dibujarGameObject(&enemigosDerecha[i],no);            
         }
     }
 }

 void resetEnemigos(){     
     
     initEnemigos();  
     
 }

u8 activarIAS(u8 posx, u8 posy,u8 posicion,TGameObject* rocas,TGameObject* rocasEspejo, u8 frecuencias){
    u8 estado=no_pasa_nada;
    if(frecuencias==0){        
        for(u8 i=0;i<enemigosMaximos;i++){
            if(enemigosIzquierda[i].posx>0){
                if(enemigosIzquierda[i].sprite!=sprite_enemigo3){
                    if(posicion==posicion_Izquieda)
                        estado=iaEnemigo1(&enemigosIzquierda[i],posx,posy,rocas);
                        if(estado==player_muere){
                            return estado;
                        }
                }else{
                    if(posicion==posicion_Izquieda)
                        estado=iaEnemigo2(&enemigosIzquierda[i],posx,posy,rocas);
                        if(estado==player_muere){
                            return estado;
                        }
                }
                
            }
            if(enemigosDerecha[i].posx>0){
                if(enemigosDerecha[i].sprite!=sprite_enemigo3){
                    if(posicion==posicion_Derecha)
                        estado=iaEnemigo1(&enemigosDerecha[i],posx,posy,rocasEspejo);
                        if(estado==player_muere){
                            return estado;
                        }
                }else{
                    if(posicion==posicion_Derecha)
                        estado=iaEnemigo2(&enemigosDerecha[i],posx,posy,rocasEspejo);
                        if(estado==player_muere){
                            return estado;
                        }
                }
                
            }      
        }
    }
    return estado;
}

u8 iaEnemigo1(TGameObject* objeto,u8 posx, u8 posy,TGameObject* rocas){
    u8 estado=no_pasa_nada;
    u8 posmayor=0;
    u8 posmenor=0;
    u8 posxAtaque=0;
    u8 posyAtaque=0;
    
    
   
    if(objeto->posx != posx){
        if(objeto->posy != posy){            
             return no_pasa_nada;
        }
    }
    
         
        if(objeto->posx==posx){
            if(objeto->sprite==sprite_enemigo1){
                return no_pasa_nada;
            }             
            if(objeto->posy>posy){
                posmayor=objeto->posy;
                posmenor=posy;
            }else{
                posmayor=posy;
                posmenor=objeto->posy;
            }
            for(u8 i=0;i<RocasMaximas;i++){
                if(rocas[i].posx==posx){               
                    if(rocas[i].posy>posmenor && rocas[i].posy<posmayor){                                                             
                        return no_pasa_nada;
                    }
                }
            }
        }
    
        if(objeto->posy==posy){
            if(objeto->sprite==sprite_enemigo2){
                return no_pasa_nada;
            }        
            if(objeto->posx>posx){
                posmayor=objeto->posx;
                posmenor=posx;
            }else{
                posmayor=posx;
                posmenor=objeto->posx;
            }
            for(u8 i=0;i<RocasMaximas;i++){
                if(rocas[i].posy==posy){               
                    if(rocas[i].posx>posmenor && rocas[i].posx<posmayor){                                 
                    return no_pasa_nada;
                    }
                }
            }
        }
        posxAtaque=objeto->posx;
        posyAtaque=objeto->posy;
        if(objeto->posx>posx ){
            posxAtaque=objeto->posx-1;
        }else if(objeto->posx<posx){
             posxAtaque=objeto->posx+1;
        } 
        if(objeto->posy>posy){
            posyAtaque=objeto->posy-1;
        }else if(objeto->posy<posy){
             posyAtaque=objeto->posy+1;
        }

    iniciarAnimacion(animacion_roca_1,menu_selector,posxAtaque,posyAtaque,posx,posy,si,0);
    iniciarAnimacion(animacion_muerte,1,posx,posy,posx,posy,si,4);

    return player_muere;

}
u8 iaEnemigo2(TGameObject* objeto,u8 posx, u8 posy,TGameObject* rocas){
    u8 estado=no_pasa_nada;
    int distanciax=0;
    int distanciay=0;
    u8 nextPosx=0;
    u8 nextPosy=0;
    u8 nextMovimiento=mover_SinMovimiento;


    distanciax=posx-objeto->posx;
    distanciay=posy-objeto->posy;
    
    if(abs(distanciax)>abs(distanciay)){
        if(distanciax<0){
            nextMovimiento=mover_Izquierda;
        }else{
            nextMovimiento=mover_Derecha;
        }
    }else{
        if(distanciay<0){
            nextMovimiento=mover_Arriba;
        }else{
            nextMovimiento=mover_Abajo;
        }
    }
    
    
    nextPosx=objeto->posx;
    nextPosy=objeto->posy;
    mover1casilla(&nextPosx,&nextPosy,nextMovimiento);
    for (u8 i=0;i<RocasMaximas;i++){
        if(rocas[i].posx==nextPosx && rocas[i].posy==nextPosy){
            return no_pasa_nada;
        }
    }
    moverYdibujar(objeto,nextPosx,nextPosy);
    if(nextPosx==posx && nextPosy==posy){
        return player_muere;
    }
    return no_pasa_nada;
        
    

    
}


void crearEnemigoIzquierda(u8 posx,u8 posy, u8 sprite){
    enemigosIzquierda[contadorEnemigosIz].posx=posx;
    enemigosIzquierda[contadorEnemigosIz].posy=posy;
    enemigosIzquierda[contadorEnemigosIz].sprite=sprite;
    contadorEnemigosIz++;
}
void crearEnemigoDerecha(u8 posx,u8 posy, u8 sprite){
    enemigosDerecha[contadorEnemigosDe].posx=posx;
    enemigosDerecha[contadorEnemigosDe].posy=posy;
    enemigosDerecha[contadorEnemigosDe].sprite=sprite;
    contadorEnemigosDe++;
    
}
void sinEnemigos(u8 numLuz){

}


 void enemigosNivel01(u8 numLuz){
     crearEnemigoDerecha(14,3,sprite_enemigo1);
 }
void enemigosNvel_trap_01(u8 numLuz){
    crearEnemigoIzquierda(2,2,sprite_enemigo2);
    crearEnemigoIzquierda(2,6,sprite_enemigo2);
    crearEnemigoIzquierda(6,2,sprite_enemigo2);
    crearEnemigoIzquierda(6,6,sprite_enemigo2);
}
void enemigosNvel_04(u8 numLuz){
    if(numLuz<1){
        crearEnemigoDerecha(12,3,sprite_enemigo2);
        crearEnemigoDerecha(12,5,sprite_enemigo2);
    }
}
void enemigosNvel_04_01(u8 numLuz){
    crearEnemigoIzquierda(4,4,sprite_enemigo1);
}

