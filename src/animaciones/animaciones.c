#include "animaciones.h"
#include "gameObject/gameObject.h"

#include <stdio.h>
#include <stdlib.h>

TAnimaciones animacionesActivas [animacionesMaximasEnLista];
u8 posicionLista;

void initAnimaciones(){    
    for (u8 i=0;i<animacinesMaximas;i++){
        animacionesActivas[i].id=sin_animacion;
    }
    animaciones[animacion_andar]=animacionAndar;
    animaciones[animacion_roca_1]=animacionRoca1;

    
}
void animacionesManager(){
    TAnimaciones* anim;
    TGameObject aux;
    u8 hayAnimaciones=no;
    u8 salir=no;    
    for(u8 i=0;i<animacionesMaximasEnLista;i++){
        if(animacionesActivas[i].id != sin_animacion){
            anim=&animacionesActivas[i];
            hayAnimaciones=si;
            if(anim->contador==0){
                if(anim->repeticiones!=1){
                    anim->repeticiones=anim->repeticiones-1; 
                }else{
                    if(anim->spriteActual != anim->spriteLast){
                        anim->spriteActual=anim->spriteActual+1;                        
                    }else{                      
                        anim->id=sin_animacion;                                      
                        salir=si;                       
                    }
                }             
                if(salir == no){
                    if(anim->posx != anim->posxFinal){
                        limpiarRastro(anim->posx,anim->posy,si);  
                        if(anim->posx<anim->posxFinal){
                            anim->posx=anim->posx+porcentajeDesplazamiento(anim->spriteLast-anim->spriteActual,anim->posxFinal-anim->posx,anim->repeticiones);
                        }else{
                            anim->posx=anim->posx-porcentajeDesplazamiento(anim->spriteLast-anim->spriteActual,anim->posx-anim->posxFinal,anim->repeticiones);                           
                        }
                    }
                    if(anim->posy != anim->posyFinal){
                        limpiarRastro(anim->posx,anim->posy,si);  
                        if(anim->posy<anim->posyFinal){
                                anim->posy=anim->posy+porcentajeDesplazamiento(anim->spriteLast-anim->spriteActual,anim->posyFinal-anim->posy,anim->repeticiones);
                        }else{
                            anim->posy=anim->posy-porcentajeDesplazamiento(anim->spriteLast-anim->spriteActual,anim->posy-anim->posyFinal,anim->repeticiones);
                        }                                     
                    }
                    anim->contador=anim->latencia;
                }
            }
            if(salir==no)
                anim->contador=anim->contador-1;
        }
    } 
    if(hayAnimaciones==si){
      for(u8 i=0;i<animacionesMaximasEnLista;i++){
          if(animacionesActivas[i].id!=sin_animacion){
             aux.posx=animacionesActivas[i].posx;
             aux.posy=animacionesActivas[i].posy;
             aux.sprite=animacionesActivas[i].spriteActual;
             dibujarGameObject(&aux,si);
          }
      }
        
        
        

    }
}



void iniciarAnimacion(u8 anim,u8 sprite,u8 posx, u8 posy, u8 posxFinal, u8 posyFinal){      
    animaciones[anim](sprite,posx,posy,posxFinal,posyFinal);    
}

u8 porcentajeDesplazamiento(u8 numInteraciones,u8 casillas, u8 repeticiones){
    u8 pixeles=0;    
    numInteraciones++;
    
    pixeles=(casillas)/(numInteraciones*repeticiones);
      
    return pixeles;
}

void animacionAndar(u8 sprite,u8 posx, u8 posy, u8 posxFinal, u8 posyFinal){
    u8 colocado=no;
    for(u8 i=0;i<animacionesMaximasEnLista && colocado==no ;i++){
        if(animacionesActivas[i].id==sin_animacion){
            animacionesActivas[i].id=animacion_andar;
            animacionesActivas[i].spriteInit=sprite_Player;
            animacionesActivas[i].spriteActual=sprite_Player;
            animacionesActivas[i].spriteLast=sprite_Player;
            animacionesActivas[i].latencia=2;
            animacionesActivas[i].contador=2;
            animacionesActivas[i].posx=posx*4;
            animacionesActivas[i].posy=posy*16;
            animacionesActivas[i].posxFinal=posxFinal*4;
            animacionesActivas[i].posyFinal=posyFinal*16;
            animacionesActivas[i].repeticiones=4;

            colocado=si;           
        }       
    }    
}
void animacionRoca1(u8 sprite,u8 posx, u8 posy, u8 posxFinal, u8 posyFinal){
    u8 colocado=no;
    for(u8 i=0;i<animacionesMaximasEnLista && colocado==no ;i++){
        if(animacionesActivas[i].id==sin_animacion){
            animacionesActivas[i].id=animacion_roca_1;
            animacionesActivas[i].spriteInit=sprite;
            animacionesActivas[i].spriteActual=sprite;
            animacionesActivas[i].spriteLast=sprite;
            animacionesActivas[i].latencia=2;
            animacionesActivas[i].contador=2;
            animacionesActivas[i].posx=posx*4;
            animacionesActivas[i].posy=posy*16;
            animacionesActivas[i].posxFinal=posxFinal*4;
            animacionesActivas[i].posyFinal=posyFinal*16;
            animacionesActivas[i].repeticiones=4;
            colocado=si;           
        }       
    }    
}




