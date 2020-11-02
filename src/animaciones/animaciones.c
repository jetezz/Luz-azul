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
    animaciones[animacion_hole]=animacionHole;
    animaciones[animacion_muerte]=animacionMuerte;

    
}
void animacionesManager(){
    TAnimaciones* anim;
    TGameObject aux;
    u8 hayAnimaciones=no;
    u8 salir=no;    
    for(u8 i=0;i<animacionesMaximasEnLista;i++){
        if(animacionesActivas[i].id != sin_animacion){
            anim=&animacionesActivas[i];            
            if(anim->contador==0){ 
                if(anim->retardo==0){
                    hayAnimaciones=si;                         
                    if(anim->spriteActual != anim->spriteLast){
                        anim->spriteActual=anim->spriteActual+1;                        
                    }else{
                        if(anim->repeticiones>1){ 
                            anim->repeticiones=anim->repeticiones-1;                       
                            anim->spriteActual=anim->spriteInit;                                              
                        }else{
                            if(anim->borrado==si)
                            limpiarRastro(anim->posx,anim->posy,si);                      
                            anim->id=sin_animacion;                                      
                            salir=si;                       
                        }                       
                    }
                            
                    if(salir == no){
                        if(anim->posx != anim->posxFinal){
                            limpiarRastro(anim->posx,anim->posy,si);  
                            if(anim->posx<anim->posxFinal){
                                anim->posx=anim->posx+porcentajeDesplazamiento(anim->spriteLast-anim->spriteInit,anim->posxFinal-anim->posx,anim->repeticiones);
                            }else{
                                anim->posx=anim->posx-porcentajeDesplazamiento(anim->spriteLast-anim->spriteInit,anim->posx-anim->posxFinal,anim->repeticiones);                           
                            }
                        }
                        if(anim->posy != anim->posyFinal){
                            limpiarRastro(anim->posx,anim->posy,si);  
                            if(anim->posy<anim->posyFinal){
                                    anim->posy=anim->posy+porcentajeDesplazamiento(anim->spriteLast-anim->spriteInit,anim->posyFinal-anim->posy,anim->repeticiones);
                            }else{
                                anim->posy=anim->posy-porcentajeDesplazamiento(anim->spriteLast-anim->spriteInit,anim->posy-anim->posyFinal,anim->repeticiones);
                            }                                     
                        }
                        anim->contador=anim->latencia;
                    }
                }else{
                    anim->retardo=anim->retardo-1;                    
                    anim->contador=1;                    
                }
            }
            if(salir==no)
                anim->contador=anim->contador-1;
        }
    } 
    if(hayAnimaciones==si){
      for(u8 i=0;i<animacionesMaximasEnLista;i++){
          if(animacionesActivas[i].id!=sin_animacion){
              if(animacionesActivas[i].retardo==0){
                aux.posx=animacionesActivas[i].posx;
                aux.posy=animacionesActivas[i].posy;
                aux.sprite=animacionesActivas[i].spriteActual;
              }
              if(aux.sprite>sprite_SinDefinir && aux.sprite<menu_selector)
             dibujarGameObject(&aux,si);
          }
      }
        
        
        

    }
}



void iniciarAnimacion(u8 anim,u8 sprite,u8 posx, u8 posy, u8 posxFinal, u8 posyFinal, u8 borrado,u8 retardo){      
    animaciones[anim](sprite,posx,posy,posxFinal,posyFinal,borrado,retardo);    
}

u8 porcentajeDesplazamiento(u8 numInteraciones,u8 casillas, u8 repeticiones){
    u8 pixeles=0;
    if(numInteraciones==0){
      numInteraciones++;  
    }       
    pixeles=(casillas)/(numInteraciones*repeticiones);
      
    return pixeles;
}

void animacionAndar(u8 sprite,u8 posx, u8 posy, u8 posxFinal, u8 posyFinal,u8 borrado,u8 retardo){
    u8 colocado=no;
    for(u8 i=0;i<animacionesMaximasEnLista && colocado==no ;i++){
        if(animacionesActivas[i].id==sin_animacion){
            animacionesActivas[i].id=animacion_andar;
            animacionesActivas[i].spriteInit=sprite_Player2;
            animacionesActivas[i].spriteActual=sprite_Player2;
            animacionesActivas[i].spriteLast=sprite_Player;
            animacionesActivas[i].latencia=2;
            animacionesActivas[i].contador=2;
            animacionesActivas[i].retardo=retardo;
            animacionesActivas[i].posx=posx*4;
            animacionesActivas[i].posy=posy*16;
            animacionesActivas[i].posxFinal=posxFinal*4;
            animacionesActivas[i].posyFinal=posyFinal*16;
            animacionesActivas[i].repeticiones=2;
            animacionesActivas[i].borrado=no;
            colocado=si;             
        }       
    }    
}
void animacionRoca1(u8 sprite,u8 posx, u8 posy, u8 posxFinal, u8 posyFinal,u8 borrado,u8 retardo){
    u8 colocado=no;
    for(u8 i=0;i<animacionesMaximasEnLista && colocado==no ;i++){
        if(animacionesActivas[i].id==sin_animacion){
           animacionesActivas[i].id=animacion_roca_1;
            animacionesActivas[i].spriteInit=sprite;
            animacionesActivas[i].spriteActual=sprite;
            animacionesActivas[i].spriteLast=sprite;
            animacionesActivas[i].latencia=3;
            animacionesActivas[i].contador=3;
            animacionesActivas[i].retardo=retardo;
            animacionesActivas[i].posx=posx*4;
            animacionesActivas[i].posy=posy*16;
            animacionesActivas[i].posxFinal=posxFinal*4;
            animacionesActivas[i].posyFinal=posyFinal*16;
            animacionesActivas[i].repeticiones=4;
            animacionesActivas[i].borrado=borrado;
            colocado=si;                     
        }       
    }    
}

void animacionHole(u8 sprite,u8 posx, u8 posy, u8 posxFinal, u8 posyFinal,u8 borrado,u8 retardo){
    u8 colocado=no;
    for(u8 i=0;i<animacionesMaximasEnLista && colocado==no ;i++){
        if(animacionesActivas[i].id==sin_animacion){
            animacionesActivas[i].id=animacion_hole;
            animacionesActivas[i].spriteInit=sprite_hole;
            animacionesActivas[i].spriteActual=sprite_hole;
            animacionesActivas[i].spriteLast=sprite_hole3;
            animacionesActivas[i].latencia=3;
            animacionesActivas[i].contador=3;
            animacionesActivas[i].retardo=6;
            animacionesActivas[i].posx=posx*4;
            animacionesActivas[i].posy=posy*16;
            animacionesActivas[i].posxFinal=posxFinal*4;
            animacionesActivas[i].posyFinal=posyFinal*16;
            animacionesActivas[i].repeticiones=1;
            animacionesActivas[i].borrado=si;
            colocado=si;           
        }       
    }    
}

void animacionMuerte(u8 sprite,u8 posx, u8 posy, u8 posxFinal, u8 posyFinal,u8 borrado,u8 retardo){
    u8 colocado=no;    
    for(u8 i=0;i<animacionesMaximasEnLista && colocado==no ;i++){
        if(animacionesActivas[i].id==sin_animacion){            
            animacionesActivas[i].id=animacion_muerte;
            animacionesActivas[i].spriteInit=sprite_Muerte1;
            animacionesActivas[i].spriteActual=sprite_Muerte1;
            animacionesActivas[i].spriteLast=sprite_Muerte3;
            animacionesActivas[i].latencia=4;
            animacionesActivas[i].contador=4;
            animacionesActivas[i].retardo=3;
            animacionesActivas[i].posx=posx*4;
            animacionesActivas[i].posy=posy*16;
            animacionesActivas[i].posxFinal=posxFinal*4;
            animacionesActivas[i].posyFinal=posyFinal*16;
            animacionesActivas[i].repeticiones=1;
            animacionesActivas[i].borrado=si;
            colocado=si;           
        }       
    }    
}



