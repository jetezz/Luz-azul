#include "juego.h"
#include "input/input.h"
#include "niveles/niveles.h"
#include "sprites/sprites.h"
#include "hud/hud.h"
#include "dialogos/dialogos.h"
#include "enemigos/enemigos.h"
#include "sprites/comp/mygraphics.h"
#include "sprites/MenuSelector.h"
#include "sprites/comp/controls.h"





#include <stdio.h>
#include <stdlib.h>

#define     Punto_Inicial_De_Pantalla   cpctm_screenPtr(CPCT_VMEM_START, 4, 16)
#define     frecuenciaMaxIA     20
#define     frecienciaMaxMenu   10


TGameObject player;
TGameObject rocas[RocasMaximas];
TGameObject rocasEspejo[RocasMaximas];
TGameObject portal[2];
TGameObject puertas[10];
TGameObjectCol coleccionables[ColeccionablesMaximos];
u8 colList[ColeccionablesMaximosTotales];


u8 posicion;
u8 coleccionablesLuz;
u8 coleccionablesFam;
u8 coleccionablesAms;
u8 nivelActual;
u8 pasos;
u8 pasosContador;
u8 pasosT;
u8 pasosT2;
u8 frecuenciaIA;
u8 estado;
u8 estadoSeleccionado;



void game(){
    cpct_zx7b_decrunch_s(0xFFFF,mygraphics_end);
    cpct_drawSprite(MenuSelector_0, cpctm_screenPtr(CPCT_VMEM_START,26 ,116 ), 2, 8);
    initGame();
    estado=estado_Menu;
    estadoSeleccionado=estado_juego;
    nivelActual=nivel_01;           
    while(1){
        
        scanKey();
        cpct_waitVSYNC();
        if(estado==estado_juego){               
    //    cpct_akp_musicPlay();
        
    //          
        if(keyR()==si){            
            resetGameobjects(nivelActual);
        }
        modoDios();
        pasosTotales();            
        comprobarMovimiento();             
        moverPlayer();
        actualizarHud(coleccionablesLuz,coleccionablesFam,coleccionablesAms,pasos);
        if(comprobarPasos()==si){
            managerDialogo(nivelActual,pasos);
        }
        ia();    
        salir();
      
        animacionesManager();
   

    }else if(estado==estado_Menu){
        if(movimientoPlayer()==mover_Arriba || movimientoPlayer()==mover_Abajo){
            if(frecuenciaIA==0){
                if(estadoSeleccionado==estado_juego){
                    estadoSeleccionado=estado_controles;
                    cpct_drawSolidBox(cpctm_screenPtr(CPCT_VMEM_START,26 ,116 ),0x00,2,8);
                    cpct_drawSprite(MenuSelector_0, cpctm_screenPtr(CPCT_VMEM_START,22 ,128 ), 2, 8);

                }else if(estadoSeleccionado==estado_controles){
                    estadoSeleccionado=estado_juego;
                    cpct_drawSolidBox(cpctm_screenPtr(CPCT_VMEM_START,22 ,128 ),0x00,2,8);
                    cpct_drawSprite(MenuSelector_0, cpctm_screenPtr(CPCT_VMEM_START,26 ,116 ), 2, 8);
                }
                frecuenciaIA=frecienciaMaxMenu;
            }
            
        }    
        if(keyIntro()==si){
            estado=estadoSeleccionado;
            cpct_drawSolidBox(cpctm_screenPtr(CPCT_VMEM_START,0,0), 0, 40, 200);
            cpct_drawSolidBox(cpctm_screenPtr(CPCT_VMEM_START,40,0), 0, 40, 200);
            if(estado==estado_juego){
                initHud();
                crearNivel(nivel_01);
                dibujarGameObjects();
            }else{
                cpct_zx7b_decrunch_s(0xFFFF,controls_end);
            }
        }
        if (frecuenciaIA>0)
        frecuenciaIA--;         
    }else{
        if(keyEscape()==si){
            cpct_zx7b_decrunch_s(0xFFFF,mygraphics_end);
            cpct_drawSprite(MenuSelector_0, cpctm_screenPtr(CPCT_VMEM_START,26 ,116 ), 2, 8);
            initGame();            
            estado=estado_Menu;
            estadoSeleccionado=estado_juego;
            nivelActual=nivel_01;                        
        }
    }
    }
}
void initGame(){
    for(u8 i =0;i<ColeccionablesMaximosTotales;i++){
        colList[i]=coleccionable_activo;
    }
    posicion=posicion_Izquieda;
    coleccionablesLuz=0;
    coleccionablesFam=0;
    coleccionablesAms=0;
    nivelActual=nivel_01;
    pasos=0;
    pasosContador=0;
    pasosT=0;
    pasosT2=0;  
    frecuenciaIA=frecuenciaMaxIA;
    initGameobjest(rocas,rocasEspejo,portal,puertas,coleccionables,&coleccionablesLuz,&coleccionablesFam,&coleccionablesAms,colList,&posicion);
    initNiveles(&player,rocas,rocasEspejo,portal,puertas,coleccionables,&coleccionablesLuz,&coleccionablesFam,&coleccionablesAms,colList,&posicion);    
    initDialogos( &pasosT,  &pasosT2);
    initEnemigos();   
    initAnimaciones(); 
          
}
void moverPlayer(){
    u8 siguienteNivel;
     
        if(posicion==posicion_Izquieda){
            siguienteNivel=moverGameObject(&player,movimientoGuardado);
        }else{
            siguienteNivel=moverGameObject(&player,movimientoGuardado);
        }
    
    if(siguienteNivel!=seguir_En_Nivel){
        nivelActual= siguienteNivel;            
        resetGameobjects(nivelActual);
              
    }
    
}



void dibujarGameObjects(){
    dibujarGameObject(&player,no);
    for (u8 i =0; i<RocasMaximas;i++){        
        dibujarGameObject(&rocas[i],no);        
    }
    for (u8 i =0; i<RocasMaximas;i++){        
        dibujarGameObject(&rocasEspejo[i],no);
        
    } 
    for(u8 i=0;i<2;i++){
        dibujarGameObject(&portal[i],no);
    }
    for(u8 i=0;i<PuertasMaximas;i++){
        dibujarGameObject(&puertas[i],no);
    }
    for(u8 i=0;i<ColeccionablesMaximos;i++){
        dibujarGameObjectCol(&coleccionables[i]);
    }  
}

void comprobarMovimiento(){
    if(player.cronoMovimiento==0){
        movimientoGuardado=mover_SinMovimiento;
    }
    if(movimientoPlayer()!=mover_SinMovimiento){
        movimientoGuardado=movimientoPlayer();
    }
}
u8 comprobarPasos(){
    if(player.pasos!=pasos){               
        pasos=player.pasos;
        pasosContador++;
        return si;
    }
    return no;
}

void resetGameobjects(u8 nivel){
    u8 suma=0;    
    posicion=posicion_Izquieda;
    
    suma=(pasosContador+pasosT);
    if(suma>100){
        pasosT2++;
        pasosT=(suma-100);
    }else{
        pasosT=suma;
    }
      
    player.pasos=0;
    pasos=0;
    pasosContador=0;
    frecuenciaIA=frecuenciaMaxIA;    
    crearNivel(nivel);    
    crearEnemigos(nivelActual);        
    dibujarGameObjects();
       
}

void modoDios(){
    if(keyD()==si){            
            for(u8 i=0;i<RocasMaximas;i++){
                rocas[i].posx=0;
                rocasEspejo[i].posx=0;
            }
        }         
}
void pasosTotales(){
    u8 suma=0;
    if(keyP()==si){

        suma=(pasosContador+pasosT);
        if(suma>100){
            pasosT2++;
            pasosT=(suma-100);
        }else{
            pasosT=suma;
        }
        pasosContador=0;
        dialogopasos();
    }
}
void salir(){
      if(keyEscape()==si){
            cpct_zx7b_decrunch_s(0xFFFF,mygraphics_end);
            cpct_drawSprite(MenuSelector_0, cpctm_screenPtr(CPCT_VMEM_START,26 ,116 ), 2, 8);
            initGame();            
            estado=estado_Menu;
            estadoSeleccionado=estado_juego;
            nivelActual=nivel_01;             
        }
}
void ia(){
    frecuenciaIA--;
      if(activarIAS(player.posx,player.posy,posicion,rocas,rocasEspejo,frecuenciaIA)==player_muere){
        resetGameobjects(nivelActual);
    }
      if(frecuenciaIA==0){
          frecuenciaIA=frecuenciaMaxIA;
      }
}
