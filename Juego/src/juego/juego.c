#include "juego.h"
#include "input/input.h"
#include "niveles/niveles.h"
#include "sprites/sprites.h"
#include "hud/hud.h"
#include "dialogos/dialogos.h"
#include "enemigos/enemigos.h"
#include "sprites/comp/mygraphics.h"
#include "sprites/MenuSelector.h"
#include "animaciones/animaciones.h"
#include "cancion.h"


#define     Punto_Inicial_De_Pantalla   cpctm_screenPtr(CPCT_VMEM_START, 4, 16)
#define     frecuenciaMaxIA     8
#define     frecienciaMaxMenu   10
#define     PuntoEscribir   cpctm_screenPtr(CPCT_VMEM_START, 2, 106)
#define     frecuenciaMutemax      10



TGameObject player;
TGameObject rocas[RocasMaximas];
TGameObject rocasEspejo[RocasMaximas];
TGameObject portal[2];
TGameObject puertas[PuertasMaximas];
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
u8 muertesT;
u8 muertesT2;
u8 frecuenciaIA;
u8 estado;
u8 estadoSeleccionado;
u8 muerteJugador;
u8 frecuenciaMuerte;
u8 frecuenciaReinicio;
u8 mutemusica;
u8 frecuenciamute;




void game(){
    cpct_akp_musicInit(molusk);    // Initialize the music
    cpct_akp_SFXInit(molusk);

    cpct_zx7b_decrunch_s(0xFFFF,mygraphics_end);
    cpct_drawSprite(MenuSelector_0, cpctm_screenPtr(CPCT_VMEM_START,22 ,116 ), 2, 8);
    initGame();
    estado=estado_Menu;
    estadoSeleccionado=estado_juego;
    nivelActual=nivel_01;           
    while(1){
        
        scanKey();
        cpct_waitVSYNC();
        if(estado==estado_juego){  
        if(mutemusica==no){
          cpct_akp_musicPlay();  
        }             
        
        
    //          
       
        //modoDios();
        pasosTotales();            
        comprobarMovimiento();             
        moverPlayer();
        actualizarHud(coleccionablesLuz,coleccionablesFam,coleccionablesAms,pasos);
        if(comprobarPasos()==si){
            managerDialogo(nivelActual,pasos);
        }
        if(muerteJugador==no){
            ia();    
            salir();             
        }
        animacionesManager();
        resetearPorMuerte();
        resetNivel();
        if(keyM()==si && frecuenciaReinicio==0){
            dialogoMapas(nivelActual);
            frecuenciaReinicio=frecuenciaReinicioNIvel;
        }
        muteMusica();

    }else if(estado==estado_Menu){
        if(movimientoPlayer()==mover_Arriba || movimientoPlayer()==mover_Abajo){
            if(frecuenciaIA==0){
                if(estadoSeleccionado==estado_juego){
                    estadoSeleccionado=estado_controles;
                    cpct_drawSolidBox(cpctm_screenPtr(CPCT_VMEM_START,22 ,116 ),0x00,2,8);
                    cpct_drawSprite(MenuSelector_0, cpctm_screenPtr(CPCT_VMEM_START,20 ,128 ), 2, 8);

                }else if(estadoSeleccionado==estado_controles){
                    estadoSeleccionado=estado_juego;
                    cpct_drawSolidBox(cpctm_screenPtr(CPCT_VMEM_START,20 ,128 ),0x00,2,8);
                    cpct_drawSprite(MenuSelector_0, cpctm_screenPtr(CPCT_VMEM_START,22 ,116 ), 2, 8);
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
                //crearEnemigos(nivel_01,coleccionablesLuz);
                dialogo01_0();       

            }else{
                cpct_zx7b_decrunch_s(0xFFFF,mygraphics_end);
                cpct_drawSolidBox(cpctm_screenPtr(CPCT_VMEM_START, 25, 90),0x00,30,70);
                cpct_drawSolidBox(cpctm_screenPtr(CPCT_VMEM_START, 0, 90),0x00,30,70); 
                cpct_drawSolidBox(cpctm_screenPtr(CPCT_VMEM_START, 130, 90),0x00,30,70); 
                cpct_drawSolidBox(cpctm_screenPtr(CPCT_VMEM_START, 0, 150),0,50,50);
                cpct_drawSolidBox(cpctm_screenPtr(CPCT_VMEM_START, 50, 150),0,50,50);
                cpct_drawStringM0("-> <- Moverse                           S Pasos                                 M Mapa                                  R Reiniciar nivel                       Esc Reiniciar Juego                     Esp Quitar musica",PuntoEscribir);
                //cpct_zx7b_decrunch_s(0xFFFF,controls_end);

            }
        }
        if (frecuenciaIA>0)
        frecuenciaIA--;         
    }else{
        if(keyEscape()==si){
            cpct_zx7b_decrunch_s(0xFFFF,mygraphics_end);
            cpct_drawSprite(MenuSelector_0, cpctm_screenPtr(CPCT_VMEM_START,22 ,116 ), 2, 8);
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
    muertesT=0;
    muertesT2=0;  
    frecuenciaIA=frecuenciaMaxIA;
    muerteJugador=no;
    mutemusica=no;
    frecuenciamute=frecuenciaMutemax;
    frecuenciaMuerte=frecuenciaMuertePlayer;
    player.cronoMovimiento=0;
    frecuenciaReinicio=frecuenciaReinicioNIvel;
    initGameobjest(rocas,rocasEspejo,portal,puertas,coleccionables,&coleccionablesLuz,&coleccionablesFam,&coleccionablesAms,colList,&posicion);
    initNiveles(&player,rocas,rocasEspejo,portal,puertas,coleccionables,&coleccionablesLuz,&coleccionablesFam,&coleccionablesAms,colList,&posicion);    
    initDialogos( &pasosT,  &pasosT2,&muertesT,&muertesT2);
    initEnemigos();   
    initAnimaciones(); 
          
}
void moverPlayer(){
    u8 suma=0;
    u8 siguienteNivel=seguir_En_Nivel;
     if(player.posx!=0){
        if(posicion==posicion_Izquieda){
            siguienteNivel=moverGameObject(&player,movimientoGuardado);
        }else{
            siguienteNivel=moverGameObject(&player,movimientoGuardado);
        }
     }
    
    if(siguienteNivel!=seguir_En_Nivel){
        if(siguienteNivel==Muereplayer){
            muerteJugador=si;
            iniciarAnimacion(animacion_muerte,1,player.posx,player.posy,player.posx,player.posy,si,4);
        }
        else if(siguienteNivel!=nivel_21){
            nivelActual= siguienteNivel;            
            resetGameobjects(nivelActual); 
        }else{           
    
            nivelActual= siguienteNivel;            
            resetGameobjects(nivelActual);
            
             suma=(pasosContador+pasosT);
            if(suma>100){
                pasosT2++;
                pasosT=(suma-100);
            }else{
                pasosT=suma;
            }
            pasosContador=0;


            //cpct_drawSolidBox(cpctm_screenPtr(CPCT_VMEM_START, 25, 90),0x00,30,70);            

            cpct_drawStringM0("Gracias por jugar",PuntoEscribir);
            dialogopasos();
            dialogosMuertes();

            //player.posx=0;
        }                     
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
    if(movimientoPlayer()!=mover_SinMovimiento && muerteJugador==no){
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
    cpct_akp_stop ();    
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
    muerteJugador=no;
    frecuenciaMuerte=frecuenciaMuertePlayer;
    resetAnimaciones();    
    crearNivel(nivel);    
    crearEnemigos(nivelActual,coleccionablesLuz);        
    dibujarGameObjects();
    managerDialogo(nivelActual,0);
       
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
        if(frecuenciaReinicio==0){
            suma=(pasosContador+pasosT);
            if(suma>100){
                pasosT2++;
                pasosT=(suma-100);
            }else{
                pasosT=suma;
            }
            pasosContador=0;
            dialogopasos();
            dialogosMuertes();
            frecuenciaReinicio=frecuenciaReinicioNIvel;
        }
    }

    if (frecuenciaReinicio>0){
            frecuenciaReinicio--;
        }

}
void salir(){
      if(keyEscape()==si){
            cpct_akp_stop (); 
            cpct_zx7b_decrunch_s(0xFFFF,mygraphics_end);
            cpct_drawSprite(MenuSelector_0, cpctm_screenPtr(CPCT_VMEM_START,22 ,116 ), 2, 8);
            initGame();            
            estado=estado_Menu;
            estadoSeleccionado=estado_juego;
            nivelActual=nivel_01;             
        }
}
void ia(){
    
      if(activarIAS(player.posx,player.posy,posicion,rocas,rocasEspejo,frecuenciaIA)==player_muere && muerteJugador==no){
        muerteJugador=si;
        iniciarAnimacion(animacion_muerte,1,player.posx,player.posy,player.posx,player.posy,si,4);       
    }
      if(frecuenciaIA==0){
          frecuenciaIA=frecuenciaMaxIA;
      }
      frecuenciaIA--;
}
void resetearPorMuerte(){
    u8 suma=0;
    if(muerteJugador==si){
        if (frecuenciaMuerte==0){
            suma=muertesT+1;
        if(suma>100){
            muertesT2++;
            muertesT=0;
        }else{            
            muertesT++;
        }           
            resetGameobjects(nivelActual);

        }else{
            frecuenciaMuerte--;
        }
    }
}

void resetNivel(){
    u8 suma=0;
     if(keyR()==si && frecuenciaReinicio==0){ 
            suma=muertesT+1;
        if(suma>100){
            muertesT2++;
            muertesT=0;
        }else{            
            muertesT++;
        }           
            resetGameobjects(nivelActual);
            frecuenciaReinicio=frecuenciaReinicioNIvel;
        }
        if (frecuenciaReinicio>0){
            frecuenciaReinicio--;
        }

}

void muteMusica(){
     if(keySpace()==si && frecuenciamute==0){
         frecuenciamute=frecuenciaMutemax;
         if (mutemusica==si){
             mutemusica=no;
         }else{
             mutemusica=si;
             cpct_akp_stop ();   
         }
     }
     if (frecuenciamute>0)
     frecuenciamute--;
}

