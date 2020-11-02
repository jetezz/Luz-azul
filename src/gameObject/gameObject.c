#include "gameObject.h"
#include "enemigos/enemigos.h"
#include "sprites/Character_Principal.h"
#include "sprites/Character_Principal_2.h"
#include "sprites/Block_Move1_G.h"
#include "sprites/Block_Move1_B.h"
#include "sprites/Block_Move0_B.h"
#include "sprites/Block_Static1_G.h"
#include "sprites/Block_Static1_B.h"
#include "sprites/Block_Static2_G.h"
#include "sprites/Block_Static2_B.h"
#include "sprites/Block_Static8_G.h"
#include "sprites/Block_Static8_B.h"
#include "sprites/Block_Static9_G.h"
#include "sprites/Block_Static9_B.h"
#include "sprites/Block_Move2_G.h"
#include "sprites/Block_Move2_B.h"
#include "sprites/PortalWall.h"
#include "sprites/PortalDoor_G.h"
#include "sprites/PortalDoor_B.h"
#include "sprites/StairUp1_G.h"
#include "sprites/StairUp1_B.h"
#include "sprites/StairDown1_G.h"
#include "sprites/StairDown1_B.h"
#include "sprites/Wall_Dust_B.h"
#include "sprites/Wall_Solid1.h"
#include "sprites/Door_G.h"
#include "sprites/Door_B.h"
#include "sprites/Block_Hole.h"
#include "sprites/LuzAzul.h"
#include "sprites/Character_Brother.h"
#include "sprites/Character_Sister.h"
#include "sprites/Character_Mother.h"
#include "sprites/Character_Father.h"
#include "sprites/Enemy_01.h"
#include "sprites/Enemy_02.h"
#include "sprites/zul1_1.h"
#include "sprites/zul1_2.h"
#include "sprites/Amstrad.h"
#include "sprites/PrinceOfPersia_Tape.h"
#include "sprites/PrinceOfPersia_PJ_G.h"
#include "sprites/PrinceOfPersia_PJ_B.h"
#include "sprites/PrinceOfPersia_ENE_G.h"
#include "sprites/PrinceOfPersia_ENE_B.h"
#include "sprites/PrinceOfPersia_COVER.h"
#include "sprites/Block_Move0_G.h"
#include "sprites/Enemy_03.h"
#include "sprites/Hole_1.h"
#include "sprites/Hole_2.h"
#include "sprites/Hole_3.h"
#include "sprites/MenuSelector.h"
#include "sprites/muerte1.h"
#include "sprites/muerte2.h"
#include "sprites/muerte3.h"
#include "sprites/PrinceOfPersia_PJ.h"

#include "animaciones/animaciones.h"



#include "fisicas/fisicas.h"

#include <stdio.h>
#include <stdlib.h>





#define     retardoMovimiento           0x08

const u8* sprites[sprite_final];


void initGameobjest(TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* portales,TGameObject* puertas,TGameObjectCol* colec,u8* colLuz,u8* colFam,u8* colAms,u8* colList,u8* posicion){
    P_rocas=rocas;
    P_rocasEspejo=rocasEspejo;
    P_portal=portales;
    P_puertas=puertas;
    P_posicion=posicion;
    P_col=colec;
    P_luz=colLuz;
    P_fam=colFam;
    P_ams=colAms;
    P_colList=colList;     

    sprites[sprite_Player]=&Character_Principal_0[0];
    sprites[sprite_Player2]=&Character_Principal_2_0[0];
    sprites[sprite_Rock_G]=&Block_Move1_G_0[0];
    sprites[sprite_Rock_B]=&Block_Move1_B_0[0];
    sprites[sprite_Rock_nomove_B]=&Block_Move0_B_0[0];
    sprites[sprite_RockInmovil1_G]=&Block_Static1_G_0[0];
    sprites[sprite_RockInmovil1_B]=&Block_Static1_B_0[0];
    sprites[sprite_RockInmovil2_G]=&Block_Static2_G_0[0];
    sprites[sprite_RockInmovil2_B]=&Block_Static2_B_0[0];    
    sprites[sprite_RockInmovil8_G]=&Block_Static8_G_0[0];
    sprites[sprite_RockInmovil8_B]=&Block_Static8_B_0[0];
    sprites[sprite_RockInmovil9_G]=&Block_Static9_G_0[0];
    sprites[sprite_RockInmovil9_B]=&Block_Static9_B_0[0];
    sprites[sprite_RockLineal1_G]=&Block_Move2_G_0[0];
    sprites[sprite_RockLineal1_B]=&Block_Move2_B_0[0];
    sprites[sprite_PortalMuro]=&PortalWall_0[0];
    sprites[sprite_PuertaPortal_G]=&PortalDoor_G_0[0];
    sprites[sprite_Muro_Solid1]=&Wall_Solid1_0[0];
    sprites[sprite_Muro_Polvo1]=&Wall_Dust_B_0[0];
    sprites[sprite_PuertaPortal_B]=&PortalDoor_B_0[0];
    sprites[sprite_Puerta_G]=&Door_G_0[0];
    sprites[sprite_Puerta_B]=&Door_B_0[0];
    sprites[sprite_StairUp1_G]=&StairUp1_G_0[0];
    sprites[sprite_StairUp1_B]=&StairUp1_B_0[0];
    sprites[sprite_StairDown1_G]=&StairDown1_G_0[0];
    sprites[sprite_StairDown1_B]=&StairDown1_B_0[0];
    sprites[sprite_hole]=&Block_Hole_0[0];
    sprites[sprite_amstrad]=&Amstrad_0[0];
    sprites[sprite_PrinceofPersia1_G]=&PrinceOfPersia_PJ_G_0[0];
    sprites[sprite_PrinceofPersia1_B]=&PrinceOfPersia_PJ_B_0[0];
    sprites[sprite_PrinceofPersia2_G]=&PrinceOfPersia_ENE_G_0[0];
    sprites[sprite_PrinceofPersia2_B]=&PrinceOfPersia_ENE_B_0[0];
    sprites[sprite_PrinceofPersia3]=&PrinceOfPersia_COVER_0[0];
    sprites[sprite_enemigo1]=&Enemy_01_0[0];
    sprites[sprite_zul1_1]=&zul1_1_0[0];
    sprites[sprite_zul1_2]=&zul1_2_0[0];    
    sprites[sprite_Rock_nomove_G]=&Block_Move0_G_0[0];
    sprites[sprite_enemigo2]=&Enemy_02_0[0];
    sprites[sprite_enemigo3]=&Enemy_03_0[0];    
    sprites[sprite_hole1]=&Hole_1_0[0];    
    sprites[sprite_hole2]=&Hole_2_0[0];    
    sprites[sprite_hole3]=&Hole_3_0[0];    
    sprites[sprite_Muerte1]=&muerte1_0[0];    
    sprites[sprite_Muerte2]=&muerte2_0[0];    
    sprites[sprite_Muerte3]=&muerte3_0[0];    
    sprites[sprite_familia1]=&Character_Brother_0[0];    
    sprites[sprite_familia2]=&Character_Sister_0[0];    
    sprites[sprite_familia3]=&Character_Mother_0[0];    
    sprites[sprite_familia4]=&Character_Father_0[0];    
    sprites[sprite_amstradTape]=&PrinceOfPersia_Tape_0[0];    
    sprites[sprite_familia3]=&Character_Mother_0[0];    
    sprites[sprite_luz]=&LuzAzul_0[0];    
    sprites[sprite_familia3]=&Character_Mother_0[0];    
    sprites[sprite_familia3]=&Character_Mother_0[0];    
    sprites[sprite_familia3]=&Character_Mother_0[0];    
    sprites[sprite_familia3]=&Character_Mother_0[0];   
    sprites[sprite_PrinceofPersiaP]=&PrinceOfPersia_PJ_0[0];    

    
}

void dibujarGameObject(TGameObject* objeto ,u8 tran){
    u8* prueba=&Character_Principal_0[0];
    if(objeto->posx!=0){                                    
        if(objeto->sprite==menu_selector){
            cpct_drawSprite(MenuSelector_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy,tran), 2, 8);     
        }else{
             cpct_drawSprite(sprites[objeto->sprite], calcularPosicionEnPantalla(objeto->posx,objeto->posy,tran), anchoSprite, altoSprite); 
        }                                        
    }     
}
void dibujarGameObjectCol(TGameObjectCol* objeto){
    if(objeto->posx!=0){
      cpct_drawSprite(sprites[objeto->sprite], calcularPosicionEnPantalla(objeto->posx,objeto->posy,no), anchoSprite, altoSprite);  
    }
}
void dibujarGameObjectColSprite(u8 sprite,u8 posx, u8 posy){     
   cpct_drawSprite(sprites[sprite], cpctm_screenPtr(CPCT_VMEM_START, posx*4 + 1, posy*16), anchoSprite, altoSprite);
}


void limpiarRastro(u8 posx, u8 posy,u8 tran){
    cpct_drawSolidBox(calcularPosicionEnPantalla(posx,posy,tran),0x00,4,16);
}
u8 moverGameObject(TGameObject* objeto,u8 movimiento){
    TGameObject* rocasCol;
    TGameObject* rocasNOCol;

    if(*P_posicion==posicion_Izquieda){
        rocasCol=P_rocas;
        rocasNOCol=P_rocasEspejo;
    }else{
        rocasCol=P_rocasEspejo;
        rocasNOCol=P_rocas;
    }
    if(objeto->sprite==sprite_Player){
        return moverTipoPlayer(objeto,movimiento,rocasCol,rocasNOCol,P_posicion);
    }else{
        return moverTipoRoca(objeto,movimiento,rocasCol,rocasNOCol,P_posicion);
    }   
}

void moverElEspejo(TGameObject* rocas,u8 num,u8 movimiento,u8 numMovimientos){
   TGameObject* objetoEspejo;
    u8 nextMovimiento=movimiento;
    u8 nextPosx;
    u8 nextPosy;
    u8 posicionObjeto=SinColision;
    u8 posicion=*P_posicion;
    u8 posxinit;
    u8 posyinit;

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

    for(u8 i=0;i<RocasMaximas;i++){
        if(rocas[i].num==num){
            objetoEspejo=&rocas[i];              
    
            nextPosx=objetoEspejo->posx;
            nextPosy=objetoEspejo->posy;
            posxinit=objetoEspejo->posx;
            posyinit=objetoEspejo->posy;
            if(objetoEspejo->posx!=0){
                posicionObjeto=SinColision;
                for(u8 i=0;i<numMovimientos;i++){
                    if(posicionObjeto==SinColision){
                        nextMovimiento=calcularMaximosyMinimos(nextMovimiento,objetoEspejo->posx,objetoEspejo->posy,posicion);            
                        if(nextMovimiento!=mover_SinMovimiento){
                            posicionObjeto=colisionesSiguientePosicion(objetoEspejo,objetoEspejo->posx,objetoEspejo->posy,nextMovimiento,rocas,posicion);                                          
                            if(posicionObjeto==SinColision){
                                mover1casilla(&nextPosx,&nextPosy,nextMovimiento);                                                                                 
                                 //moverYdibujar(objeto,nextPosx,nextPosy);                               
                                objetoEspejo->posx=nextPosx;
                                objetoEspejo->posy=nextPosy;                             
                            }else{
                                if(posicionObjeto!=SinColision && posicionObjeto != ColisionNoRocas){
                                    taparHole(objetoEspejo,&rocas[posicionObjeto]);                                

                                }
                            }
                        }           
                    }
                }
                iniciarAnimacion(animacion_roca_1,objetoEspejo->sprite,posxinit,posyinit,nextPosx,nextPosy,no,0);
            }
        }   
    }
}

void cambiarPosicion(u8* posicion){    
    if(*posicion==posicion_Izquieda){
        *posicion=posicion_Derecha;        
    }else{
        *posicion=posicion_Izquieda;       
    }  
}


void moverYdibujar(TGameObject* objeto,u8 posx,u8 posy){
    limpiarRastro(objeto->posx,objeto->posy,no);    
    objeto->posx=posx;
    objeto->posy=posy;
    dibujarGameObject(objeto,no);
}
void taparHole(TGameObject* roca,TGameObject* hole){
    if(hole->sprite==sprite_hole){
        iniciarAnimacion(animacion_hole,1,hole->posx,hole->posy,hole->posx,hole->posy,no,0);
        iniciarAnimacion(animacion_roca_1,roca->sprite,roca->posx,roca->posy,roca->posx,roca->posy,si,6);

        //limpiarRastro(roca->posx,roca->posy,no);
        //limpiarRastro(hole->posx,hole->posy,no);
        roca->posx=0;
        roca->posy=0;
        hole->posx=0;
        hole->posy=0;
    }
}



//////////
//Tipos//
/////////

u8 moverTipoPlayer(TGameObject* objeto,u8 movimiento, TGameObject* rocasCol,TGameObject* rocasEspejo,u8* posicion){
    if(objeto->cronoMovimiento==0 || objeto->sprite!=sprite_Player){           
        movimiento=calcularMaximosyMinimos(movimiento,objeto->posx,objeto->posy,*posicion);            
        if(movimiento!=mover_SinMovimiento){                  
            u8 nextPosx=objeto->posx;
            u8 nextPosy=objeto->posy;
            u8 ObjetoColisionado=SinColision;
            u8 colisionPortales=no_Hay_Colision;
            u8 moverRoca=mover_roca;
            u8 colisionPuerta=seguir_En_Nivel;
            u8 colisionEnemigo=no_Hay_Colision;
            u8 numMovimientos=1;
            
            mover1casilla(&nextPosx,&nextPosy,movimiento);            
            
            colisionPuerta=comprobarPuertas(nextPosx,nextPosy);
            if(colisionPuerta!=seguir_En_Nivel){
                return colisionPuerta;
            }
            comprobarColeccionables(nextPosx,nextPosy,sprite_Player);            
            colisionPortales=comprobarPortales(objeto,&nextPosx,&nextPosy,movimiento,posicion);            
            ObjetoColisionado=comprobarRocas(nextPosx,nextPosy,rocasCol);            
            if(colisionPortales==hay_Colision){
                ObjetoColisionado=comprobarRocas(nextPosx,nextPosy,rocasEspejo);
                if(ObjetoColisionado!=SinColision){
                    moverRoca=no_mover_roca;
                }else{
                    cambiarPosicion(posicion);                                   
                }
            } 
            colisionEnemigo=comprobarEnemigos(nextPosx,nextPosy,*posicion);
            if(colisionEnemigo!=no_Hay_Colision){
                return Muereplayer;
            }
            if(ObjetoColisionado==SinColision && colisionPuerta==no_Hay_Colision ){
                if(colisionPortales==hay_Colision){
                    moverYdibujar(objeto,nextPosx,nextPosy);
                }else{
                    iniciarAnimacion(animacion_andar,objeto->sprite,objeto->posx,objeto->posy,nextPosx,nextPosy,no,0);
                    objeto->posx=nextPosx;
                    objeto->posy=nextPosy;  
                }               
               
                if(objeto->pasos<99)
                    objeto->pasos++;                           
                //cpct_akp_SFXPlay(1,15,80,0,0,AY_CHANNEL_A);
                //cpct_akp_SFXPlay(1,15,50,0,0,AY_CHANNEL_A);                                                 

            }else{ 
                if(moverRoca==mover_roca)          
                moverGameObject(&rocasCol[ObjetoColisionado],movimiento);                                    
            }            
            objeto->cronoMovimiento=retardoMovimiento;
        }
    }else{
        objeto->cronoMovimiento-=1;
    }
    return seguir_En_Nivel;
}
u8 moverTipoRoca(TGameObject* objeto,u8 movimiento, TGameObject* rocasCol,TGameObject* rocasEspejo,u8* posicion){
      
        movimiento=calcularMaximosyMinimos(movimiento,objeto->posx,objeto->posy,*posicion);
                  
        if(movimiento!=mover_SinMovimiento && objeto->movimiento != sin_Movimiento){                  
            u8 nextPosx=objeto->posx;
            u8 nextPosy=objeto->posy;
            u8 numMovimientos=0;
            u8 posicionObjeto=SinColision;
            
            
            if(objeto->movimiento==mover_1){
                mover1casilla(&nextPosx,&nextPosy,movimiento);
                numMovimientos=1;                 
            }else if(objeto->movimiento==mover_Linea){
                numMovimientos=movimientoLineal(objeto,&nextPosx,&nextPosy,movimiento,rocasCol,*posicion);
            }                                
            posicionObjeto=colisionesSiguientePosicion(objeto,objeto->posx,objeto->posy,movimiento,rocasCol,*posicion);                                      
            if(posicionObjeto==SinColision){                                           
                //moverYdibujar(objeto,nextPosx,nextPosy);                
                iniciarAnimacion(animacion_roca_1,objeto->sprite,objeto->posx,objeto->posy,nextPosx,nextPosy,no,0);
                objeto->posx=nextPosx;
                objeto->posy=nextPosy;  

                moverElEspejo(rocasEspejo,objeto->num,movimiento,numMovimientos);
                if(objeto->movimiento==mover_1){
                   posicionObjeto=colisionesSiguientePosicion(objeto,nextPosx,nextPosy,mover_SinMovimiento,rocasCol,*posicion);
                    if(posicionObjeto!=SinColision && posicionObjeto != ColisionNoRocas){
                        taparHole(objeto,&rocasCol[posicionObjeto]);
                    }         
                }else if(objeto->movimiento==mover_Linea){
                    posicionObjeto=colisionesSiguientePosicion(objeto,nextPosx,nextPosy,movimiento,rocasCol,*posicion);
                    if(posicionObjeto!=SinColision && posicionObjeto != ColisionNoRocas){
                        taparHole(objeto,&rocasCol[posicionObjeto]);
                    }     
                }                                     
            }else{
                if(posicionObjeto!=ColisionNoRocas){
                 taparHole(objeto,&rocasCol[posicionObjeto]);
                }
                
            }                              
        }        
   
    return seguir_En_Nivel;
}


///////////////
//movimientos//
///////////////

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

u8 movimientoLineal(TGameObject* objeto,u8* posx, u8* posy,u8 movimiento,TGameObject* objetosCol,u8 posicion){    
    u8 contador=0; 
    u8 finalizar=no; 
    u8 colision=SinColision; 
    
    
    while (colision==SinColision && movimiento!=mover_SinMovimiento)
    {       
   
            colision=colisionesSiguientePosicion(objeto,*posx,*posy,movimiento,objetosCol,posicion);
            if(colision==SinColision){
                movimiento=calcularMaximosyMinimos(movimiento,*posx,*posy,posicion);       
                mover1casilla(posx,posy,movimiento);
                contador++;
            }   
                        
    }
   
    
    return contador;             
}


//////////////
//colisiones//
//////////////

u8 colisionesSiguientePosicion(TGameObject* objeto,u8 posx,u8 posy,u8 movimiento, TGameObject* rocasCol,u8 posicion){
    u8 nextPosx=posx;
    u8 nextPosy=posy;
    u8 ObjetoColisionado=SinColision;
    u8 colisionPortales=no_Hay_Colision;    
    u8 colisionPuerta=seguir_En_Nivel;
    u8 colisionColeccionable=no_Hay_Colision;
    u8 colisionEnemigos=no_Hay_Colision;

     
   
    mover1casilla(&nextPosx,&nextPosy,movimiento);
    ObjetoColisionado=comprobarRocas(nextPosx,nextPosy,rocasCol);
    if(ObjetoColisionado!=SinColision){
        return ObjetoColisionado;
    }
    colisionPuerta=comprobarPuertas(nextPosx,nextPosy);                      
    colisionPortales=comprobarPortales(objeto,&nextPosx,&nextPosy,movimiento,&posicion);                 
    colisionColeccionable=comprobarColeccionables(nextPosx,nextPosy,sprite_Rock_B);    
    colisionEnemigos=comprobarEnemigos(nextPosx,nextPosy,posicion);
    

    if(ObjetoColisionado==SinColision && colisionPuerta==no_Hay_Colision && colisionPortales==no_Hay_Colision && colisionColeccionable==no_Hay_Colision && colisionEnemigos==no_Hay_Colision){        
        return SinColision;
    }
    return ColisionNoRocas;
}

u8 comprobarRocas(u8 posx,u8 posy,TGameObject* rocas){
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
u8 comprobarPuertas(u8 posx, u8 posy){
    for(u8 i=0;i<PuertasMaximas;i++){
        if(posx==P_puertas[i].posx && posy==P_puertas[i].posy){
            return P_puertas[i].num;
        }
    }
    return seguir_En_Nivel;
}
u8 comprobarColeccionables(u8 posx, u8 posy ,u8 sprite){
     for(u8 i=0;i<ColeccionablesMaximos;i++){
        if(posx==P_col[i].posx && posy==P_col[i].posy){
            if(sprite==sprite_Player){
                P_colList[P_col[i].num]=coleccionable_NOACTIVO;
                if(P_col[i].sprite==sprite_luz){
                    *P_luz=*P_luz+1;                                                             
                }else if(P_col[i].sprite==sprite_amstradTape){                
                    *P_ams=*P_ams+1;
                }else{
                    *P_fam=*P_fam+1;
                }
                P_col[i].posx=0;
            }
            return hay_Colision; 
        }
    }
    return no_Hay_Colision;
    
}
u8 comprobarEnemigos(u8 posx,u8 posy ,u8 posicion){
   
    
    
    
    
    if(posicion==posicion_Izquieda){
         for(u8 i=0;i<enemigosMaximos;i++){
            if(enemigosIzquierda[i].posx==posx && enemigosIzquierda[i].posy==posy){
                return hay_Colision;
            }
        }
    }else{
       
        for(u8 i=0;i<enemigosMaximos;i++){
            if(enemigosDerecha[i].posx==posx && enemigosDerecha[i].posy==posy){
                return hay_Colision;
            }
        }
    }
    return no_Hay_Colision;
}
