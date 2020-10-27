#include "animaciones.h"
#include "gameObject/gameObject.h"

TAnimaciones animacionesActivas [animacionesMaximasEnLista];
u8 posicionLista;

void initAnimaciones(){
    posicionLista=0;
    for (u8 i=0;i<animacinesMaximas;i++){
        animacionesActivas[i].id=sin_animacion;
    }
    animaciones[animacion_andar]=animacionAndar;

    
}
void animacionesManager(){
    TAnimaciones* anim;
    TGameObject aux;
    u8 hayAnimaciones=no;
    u8 salir=no;
    ajustarArray();
    for(u8 i=0;i<animacionesMaximasEnLista;i++){
        if(animacionesActivas[i].id != sin_animacion){
            anim=&animacionesActivas[i];
            hayAnimaciones=si;
            if(anim->contador==0){
               if(anim->spriteActual != anim->spriteLast){
                    anim->spriteActual=anim->spriteActual+1;                   
               }else{                    
                    limpiarRastro(anim->posx,anim->posy);   
                    anim->id=sin_animacion;                                      
                    salir=si;
               }
                if(salir == no){
                    if(anim->posx != anim->posxFinal){
                        if(anim->posx<anim->posxFinal){
                                anim->posx=anim->posx+1;
                        }else{
                            anim->posx=anim->posx-1;
                        }                                     
                    }
                    if(anim->posy != anim->posyFinal){
                        if(anim->posy<anim->posyFinal){
                                anim->posy=anim->posy+1;
                        }else{
                            anim->posy=anim->posy-1;
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
             dibujarGameObject(&aux);
          }
      }
        
        
        

    }
}

void ajustarArray(){   
    u8 recorriendo=no;

    for (u8 i=0;i<animacionesMaximasEnLista;i++){
        if(animacionesActivas[i].id==sin_animacion){
            if(animacionesActivas[i+1].id!=sin_animacion){
                animacionesActivas[i].id=animacionesActivas[i+1].id;
                animacionesActivas[i].spriteInit=animacionesActivas[i+1].spriteInit;
                animacionesActivas[i].spriteLast=animacionesActivas[i+1].spriteLast;
                animacionesActivas[i].spriteActual=animacionesActivas[i+1].spriteActual;
                animacionesActivas[i].latencia=animacionesActivas[i+1].latencia;
                animacionesActivas[i].contador=animacionesActivas[i+1].contador;
                animacionesActivas[i].posx=animacionesActivas[i+1].posx;
                animacionesActivas[i].posy=animacionesActivas[i+1].posy;
                animacionesActivas[i].posxFinal=animacionesActivas[i+1].posxFinal;
                animacionesActivas[i].posyFinal=animacionesActivas[i+1].posyFinal;
                recorriendo=si;                
                animacionesActivas[i+1].id=sin_animacion;               
            }
        }
    }
    if(recorriendo==si){
        posicionLista--;
    }
}

void iniciarAnimacion(u8 anim,u8 posx, u8 posy, u8 posxFinal, u8 posyFinal){  
    animaciones[anim](posx,posy,posxFinal,posyFinal);
}



void animacionAndar(u8 posx, u8 posy, u8 posxFinal, u8 posyFinal){
    animacionesActivas[posicionLista].id=1;
    animacionesActivas[posicionLista].spriteInit=sprite_Player;
    animacionesActivas[posicionLista].spriteLast=sprite_Rock_nomove_G;
    animacionesActivas[posicionLista].latencia=10;
    animacionesActivas[posicionLista].contador=10;
    animacionesActivas[posicionLista].posx=posx;
    animacionesActivas[posicionLista].posy=posy;
    animacionesActivas[posicionLista].posxFinal=posxFinal;
    animacionesActivas[posicionLista].posyFinal=posyFinal;
    posicionLista++;
}