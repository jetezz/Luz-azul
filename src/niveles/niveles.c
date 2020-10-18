#include "niveles.h"
#include "mapa/mapa.h"
#include "constantes.h"

#include <stdio.h>
#include <stdlib.h>


void initNiveles(u8* collist){
    
    niveles[nivel_01]=crearNivel1;
    niveles[nivel_01_01]=crearNivel01_01;    
    niveles[nivel_02]=crearNivel2;
    niveles[nivel_TRAP_01]=crearNivelTRAP01;  
    niveles[nivel_03]=crearNievel3;
    niveles[nivel_04]=crearNievel4;
    niveles[nivel_04_01]=crearNievel4_01;
    niveles[nivel_05]=crearNievel5;
    niveles[nivel_06]=crearNievel6;
    niveles[nivel_07]=crearNievel7;


    

    P_colList2=collist;
    contadorRocas=0;
    contadorRocasEspejo=0;
    contadorPuertas=0;
    contadorColeccionables=0;
    
}

void crearNivel(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* coleccionables,u8* posicion,u8 nivel){
    limpiarPantalla();
    resetLevel(player,rocas,rocasEspejo,puertas,portales,coleccionables);    
    niveles[nivel](player,rocas,rocasEspejo,puertas,portales,coleccionables,posicion);
    
        
}
void resetLevel(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* coleccionables){
    player->posx=0;
    for(u8 i =0;i<RocasMaximas;i++){
       rocas[i].posx=0; 
    }
    for(u8 i =0;i<RocasMaximas;i++){
       rocasEspejo[i].posx=0; 
    }
    for(u8 i =0;i<PuertasMaximas;i++){
       puertas[i].posx=0; 
    }
    portales[0].posx=0;
    portales[1].posx=0;

     for(u8 i =0;i<ColeccionablesMaximos;i++){
       coleccionables[i].posx=0; 
    }

    contadorRocas=0;
    contadorRocasEspejo=0;
    contadorPuertas=0;
    contadorColeccionables=0;
}
void limpiarPantalla(){
    cpct_drawSolidBox(cpctm_screenPtr(CPCT_VMEM_START, 0, 0),0x00,36,144);
    cpct_drawSolidBox(cpctm_screenPtr(CPCT_VMEM_START, 36, 0),0x00,33,144);

}

void createMarco(u8 hay){
    if (hay==si){
      crearMapa(0);  
    }
    
}

void createPlayer(TGameObject* player,u8 posx, u8 posy,u8* posicion){
    if(posx<9){
        *posicion=posicion_Izquieda;
    }else{
        *posicion=posicion_Derecha;        
    }
    player->num=-1;
    player->posx=posx;
    player->posy=posy;   
    player->sprite=sprite_Player;
    player->movimiento=mover_1;
}
void createRoca(TGameObject* rocas,u8 posx, u8 posy,u8 mivimiento,u8 sprite, u8 simetria){
    rocas[contadorRocas].num=simetria;
    rocas[contadorRocas].posx=posx;
    rocas[contadorRocas].posy=posy;
    rocas[contadorRocas].sprite=sprite;
    rocas[contadorRocas].movimiento=mivimiento;
    contadorRocas++;    
}
void createRocaEspejo(TGameObject* rocasEspejo,u8 posx, u8 posy,u8 mivimiento,u8 sprite, u8 simetria){
    rocasEspejo[contadorRocasEspejo].num=simetria;
    rocasEspejo[contadorRocasEspejo].posx=posx;
    rocasEspejo[contadorRocasEspejo].posy=posy;
    rocasEspejo[contadorRocasEspejo].sprite=sprite;
    rocasEspejo[contadorRocasEspejo].movimiento=mivimiento;
    contadorRocasEspejo++;
}
void createPuerta(TGameObject* puertas,u8 posx,u8 posy,u8 sprite,u8 nivel){
    puertas[contadorPuertas].num=nivel;
    puertas[contadorPuertas].posx=posx;
    puertas[contadorPuertas].posy=posy;
    puertas[contadorPuertas].sprite=sprite;
    contadorPuertas++;
}
void createPortal(TGameObject* portal,TGameObject* roca,TGameObject* rocasEspejo,u8 hay){
    if(hay==si){
        portal[0].posx=7;
        portal[0].posy=4;
        portal[0].sprite=sprite_PuertaPortal_G;

        portal[1].posx=9;
        portal[1].posy=4;
        portal[1].sprite=sprite_PuertaPortal_B;
        createRoca(roca,8,4,sin_Movimiento,sprite_PortalMuro,1);
    }
    
}

void createHoleIzquierda(TGameObject* rocas,u8 posx, u8 posy,u8 sprite, u8 simetria){
    rocas[contadorRocas].num=simetria;
    rocas[contadorRocas].posx=posx;
    rocas[contadorRocas].posy=posy;
    rocas[contadorRocas].sprite=sprite;
    rocas[contadorRocas].movimiento=sin_Movimiento;
    contadorRocas++;
}
void createHoleDerecha(TGameObject* rocasEspejo,u8 posx, u8 posy,u8 sprite, u8 simetria){
    rocasEspejo[contadorRocasEspejo].num=simetria;
    rocasEspejo[contadorRocasEspejo].posx=posx;
    rocasEspejo[contadorRocasEspejo].posy=posy;
    rocasEspejo[contadorRocasEspejo].sprite=sprite;
    rocasEspejo[contadorRocasEspejo].movimiento=sin_Movimiento;
    contadorRocasEspejo++;
}
void createColeccionabeLuz(TGameObjectCol* coleccionable,u8 posx, u8 posy,u8 id){
    if(P_colList2[id]==coleccionable_activo){
        coleccionable[contadorColeccionables].num=id;
        coleccionable[contadorColeccionables].posx=posx;
        coleccionable[contadorColeccionables].posy=posy;
        coleccionable[contadorColeccionables].sprite=sprite_luz;
    }
}
void createColeccionabeFamilia(TGameObjectCol* coleccionable,u8 posx, u8 posy,u8 sprite,u8 id){
    if(P_colList2[id]==coleccionable_activo){
        coleccionable[contadorColeccionables].num=id;
        coleccionable[contadorColeccionables].posx=posx;
        coleccionable[contadorColeccionables].posy=posy;
        coleccionable[contadorColeccionables].sprite=sprite;
    }
}
void createColeccionabeAmstr(TGameObjectCol* coleccionable,u8 posx, u8 posy,u8 id){
    if(P_colList2[id]==coleccionable_activo){
        coleccionable[contadorColeccionables].num=id;
        coleccionable[contadorColeccionables].posx=posx;
        coleccionable[contadorColeccionables].posy=posy;
        coleccionable[contadorColeccionables].sprite=sprite_amstradTape;
    }
}



void crearNivel1(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* col,u8* posicion){
   //player  portal puertas y marco
    createPlayer(player,3,4,posicion);
    createMarco(si);
    createPortal(portales,rocas,rocasEspejo,si);
    createPuerta(puertas,3,7,sprite_Puerta_G,nivel_07);
    createPuerta(puertas,13,7,sprite_Puerta_B,nivel_01_01);

    //rocas móviles (separando id por espacios)
    createRoca(rocas,2,4,mover_1,sprite_Rock_G,2);
    createRocaEspejo(rocasEspejo,14,4,sin_Movimiento,sprite_Rock_nomove_B,2);

    //collecionables
    createColeccionabeLuz(col,15,4,0);

    //decoracion izquierda
    createRoca(rocas,1,2,sin_Movimiento,sprite_RockInmovil3_G,1);
    createRoca(rocas,2,2,sin_Movimiento,sprite_RockInmovil4_G,1);
    createRoca(rocas,1,3,sin_Movimiento,sprite_RockInmovil1_G,1);
    createRoca(rocas,6,3,sin_Movimiento,sprite_RockInmovil1_G,1);
    createRoca(rocas,1,5,sin_Movimiento,sprite_RockInmovil1_G,1);
    createRoca(rocas,6,5,sin_Movimiento,sprite_RockInmovil1_G,1);
    createRoca(rocas,7,1,sin_Movimiento,sprite_RockInmovil2_G,1);
    createRoca(rocas,7,7,sin_Movimiento,sprite_RockInmovil2_G,1);
    createRoca(rocas,1,4,sin_Movimiento,sprite_amstrad,1);
    createRoca(rocas,1,1,sin_Movimiento,sprite_PrinceofPersia2_G,1);
    createRoca(rocas,2,1,sin_Movimiento,sprite_PrinceofPersia1_G,1);


    //decoracionDerecha
    createRocaEspejo(rocasEspejo,14,2,sin_Movimiento,sprite_RockInmovil3_B,1);
    createRocaEspejo(rocasEspejo,15,2,sin_Movimiento,sprite_RockInmovil4_B,1);
    createRocaEspejo(rocasEspejo,15,3,sin_Movimiento,sprite_RockInmovil1_B,1);
    createRocaEspejo(rocasEspejo,10,3,sin_Movimiento,sprite_RockInmovil1_B,1);
    createRocaEspejo(rocasEspejo,15,5,sin_Movimiento,sprite_RockInmovil1_B,1);
    createRocaEspejo(rocasEspejo,10,5,sin_Movimiento,sprite_RockInmovil1_B,1);
    createRocaEspejo(rocasEspejo,9,1,sin_Movimiento,sprite_RockInmovil2_B,1);
    createRocaEspejo(rocasEspejo,9,7,sin_Movimiento,sprite_RockInmovil2_B,1);
    createRocaEspejo(rocasEspejo,14,1,sin_Movimiento,sprite_PrinceofPersia1_B,1);
    createRocaEspejo(rocasEspejo,15,1,sin_Movimiento,sprite_PrinceofPersia2_B,1);
}
void crearNivel01_01(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* col,u8* posicion){
    //player  portal puertas y marco
    createPlayer(player,2,3,posicion);
    createMarco(no);
    createPortal(portales,rocas,rocasEspejo,no);
    createPuerta(puertas,3,1,sprite_Puerta_B,nivel_01);
    createPuerta(puertas,3,5,sprite_Puerta_B,nivel_03);

    //collecionables
    createColeccionabeAmstr(col,5,3,3);

    //decoracion izquierda
    createRoca(rocas,4,3,sin_Movimiento,sprite_enemigo1,1);
    createRoca(rocas,1,1,sin_Movimiento, sprite_Muro_Polvo1,1);
    createRoca(rocas,1,2,sin_Movimiento, sprite_Muro_Polvo1,1);
    createRoca(rocas,1,3,sin_Movimiento, sprite_Muro_Polvo1,1);
    createRoca(rocas,1,4,sin_Movimiento, sprite_Muro_Polvo1,1);
    createRoca(rocas,1,5,sin_Movimiento, sprite_Muro_Polvo1,1);
    createRoca(rocas,7,1,sin_Movimiento, sprite_Muro_Polvo1,1);
    createRoca(rocas,7,2,sin_Movimiento, sprite_Muro_Polvo1,1);
    createRoca(rocas,7,3,sin_Movimiento, sprite_Muro_Polvo1,1);
    createRoca(rocas,7,4,sin_Movimiento, sprite_Muro_Polvo1,1);
    createRoca(rocas,7,5,sin_Movimiento, sprite_Muro_Polvo1,1);
    createRoca(rocas,2,1,sin_Movimiento, sprite_Muro_Polvo1,1);
    createRoca(rocas,4,1,sin_Movimiento, sprite_Muro_Polvo1,1);
    createRoca(rocas,5,1,sin_Movimiento, sprite_Muro_Polvo1,1);
    createRoca(rocas,6,1,sin_Movimiento, sprite_Muro_Polvo1,1);
    createRoca(rocas,2,5,sin_Movimiento, sprite_Muro_Polvo1,1);
    createRoca(rocas,4,5,sin_Movimiento, sprite_Muro_Polvo1,1);
    createRoca(rocas,5,5,sin_Movimiento, sprite_Muro_Polvo1,1);
    createRoca(rocas,6,5,sin_Movimiento, sprite_Muro_Polvo1,1);


    
}
void crearNivel2(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* col,u8* posicion){
   //player  portal puertas y marco
    createPlayer(player,3,4,posicion);
    createMarco(si);
    createPortal(portales,rocas,rocasEspejo,si);
    createPuerta(puertas,3,2,sprite_Puerta_G,nivel_01);
    createPuerta(puertas,3,6,sprite_Puerta_G,nivel_03);
    createPuerta(puertas,1,4,sprite_Puerta_G,nivel_04);
    createPuerta(puertas,13,2,sprite_Puerta_B,nivel_TRAP_01);
    createPuerta(puertas,13,6,sprite_Puerta_B,nivel_TRAP_01);
    createPuerta(puertas,15,4,sprite_Puerta_B,nivel_TRAP_01);

    //rocas móviles (separando id por espacios)
    createRoca(rocas,5,4,mover_1,sprite_Rock_G,1);
    createRocaEspejo(rocasEspejo,11,4,sin_Movimiento,sprite_Rock_nomove_B,1);

    //collecionables
    createColeccionabeLuz(col,13,4,1);

    //decoracion izquierda
    createRoca(rocas,1,1,sin_Movimiento, sprite_Muro_Solid1,1);
    createRoca(rocas,2,1,sin_Movimiento, sprite_Muro_Solid1,1);
    createRoca(rocas,3,1,sin_Movimiento, sprite_Muro_Solid1,1);
    createRoca(rocas,4,1,sin_Movimiento, sprite_Muro_Solid1,1);
    createRoca(rocas,5,1,sin_Movimiento, sprite_Muro_Solid1,1);
    createRoca(rocas,6,1,sin_Movimiento, sprite_Muro_Solid1,1);
    createRoca(rocas,7,1,sin_Movimiento, sprite_Muro_Solid1,1);
    createRoca(rocas,1,7,sin_Movimiento, sprite_Muro_Solid1,1);
    createRoca(rocas,2,7,sin_Movimiento, sprite_Muro_Solid1,1);
    createRoca(rocas,3,7,sin_Movimiento, sprite_Muro_Solid1,1);
    createRoca(rocas,4,7,sin_Movimiento, sprite_Muro_Solid1,1);
    createRoca(rocas,5,7,sin_Movimiento, sprite_Muro_Solid1,1);
    createRoca(rocas,6,7,sin_Movimiento, sprite_Muro_Solid1,1);
    createRoca(rocas,7,7,sin_Movimiento, sprite_Muro_Solid1,1);
    createRoca(rocas,5,3,sin_Movimiento,sprite_RockInmovil1_G,1);
    createRoca(rocas,5,5,sin_Movimiento,sprite_RockInmovil1_G,1);
    createRoca(rocas,1,3,sin_Movimiento,sprite_RockInmovil2_G,1);
    createRoca(rocas,1,5,sin_Movimiento,sprite_RockInmovil2_G,1);
    createRoca(rocas,7,3,sin_Movimiento,sprite_RockInmovil5_G,1);
    createRoca(rocas,7,5,sin_Movimiento,sprite_RockInmovil5_G,1);



    //decoracionDerecha
    createRocaEspejo(rocasEspejo,9,1,sin_Movimiento,sprite_Muro_Solid1,1);
    createRocaEspejo(rocasEspejo,10,1,sin_Movimiento,sprite_Muro_Solid1,1);
    createRocaEspejo(rocasEspejo,11,1,sin_Movimiento,sprite_Muro_Solid1,1);
    createRocaEspejo(rocasEspejo,12,1,sin_Movimiento,sprite_Muro_Solid1,1);
    createRocaEspejo(rocasEspejo,13,1,sin_Movimiento,sprite_Muro_Solid1,1);
    createRocaEspejo(rocasEspejo,14,1,sin_Movimiento,sprite_Muro_Solid1,1);
    createRocaEspejo(rocasEspejo,15,1,sin_Movimiento,sprite_Muro_Solid1,1);
    createRocaEspejo(rocasEspejo,9,7,sin_Movimiento,sprite_Muro_Solid1,1);
    createRocaEspejo(rocasEspejo,10,7,sin_Movimiento,sprite_Muro_Solid1,1);
    createRocaEspejo(rocasEspejo,11,7,sin_Movimiento,sprite_Muro_Solid1,1);
    createRocaEspejo(rocasEspejo,12,7,sin_Movimiento,sprite_Muro_Solid1,1);
    createRocaEspejo(rocasEspejo,13,7,sin_Movimiento,sprite_Muro_Solid1,1);
    createRocaEspejo(rocasEspejo,14,7,sin_Movimiento,sprite_Muro_Solid1,1);
    createRocaEspejo(rocasEspejo,15,7,sin_Movimiento,sprite_Muro_Solid1,1);
    createHoleDerecha(rocasEspejo,10,3,sprite_hole,1);
    createHoleDerecha(rocasEspejo,11,3,sprite_hole,1);
    createHoleDerecha(rocasEspejo,10,5,sprite_hole,1);
    createHoleDerecha(rocasEspejo,11,5,sprite_hole,1);
    createRocaEspejo(rocasEspejo,15,3,sin_Movimiento,sprite_RockInmovil2_B,1);
    createRocaEspejo(rocasEspejo,15,5,sin_Movimiento,sprite_RockInmovil2_B,1);
    createRocaEspejo(rocasEspejo,9,3,sin_Movimiento,sprite_RockInmovil5_B,1);
    createRocaEspejo(rocasEspejo,9,5,sin_Movimiento,sprite_RockInmovil5_B,1);



}

void crearNivelTRAP01(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* col,u8* posicion){
    //player  portal puertas y marco
createPlayer(player,4,4,posicion);
createMarco(no);
createPortal(portales,rocas,rocasEspejo,no);
createPuerta(puertas,4,2,sprite_Puerta_B,nivel_02);
createPuerta(puertas,4,6,sprite_Puerta_B,nivel_02);

//collecionables


//decoracion izquierda
createRoca(rocas,1,1,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,2,1,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,4,1,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,3,1,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,5,1,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,6,1,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,7,1,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,1,7,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,2,7,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,3,7,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,4,7,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,5,7,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,6,7,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,7,7,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,1,2,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,1,3,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,1,4,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,1,5,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,1,6,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,7,2,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,7,3,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,7,4,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,7,5,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,7,6,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,7,7,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,3,3,sin_Movimiento,sprite_RockInmovil1_B,1);
createRoca(rocas,3,5,sin_Movimiento,sprite_RockInmovil1_B,1);
createRoca(rocas,5,3,sin_Movimiento,sprite_RockInmovil1_B,1);
createRoca(rocas,5,5,sin_Movimiento,sprite_RockInmovil1_B,1);



}
void crearNievel3(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* col,u8* posicion){
    //player  portal puertas y marco
createPlayer(player,3,3,posicion);
createMarco(si);
createPortal(portales,rocas,rocasEspejo,si);
createPuerta(puertas,3,1,sprite_Puerta_G,nivel_02);
createPuerta(puertas,13,1,sprite_Puerta_B,nivel_01_01);
//createPuerta(puertas,5,7,sprite_StairDown1_G,nivel_17);
//createPuerta(puertas,7,7,sprite_StairUp1_G,nivel_11);
createPuerta(puertas,11,7,sprite_StairDown1_B,nivel_TRAP_01);
createPuerta(puertas,9,7,sprite_StairUp1_B,nivel_TRAP_01);


//rocas móviles (separando id por espacios)
createRoca(rocas,5,4,mover_1,sprite_Rock_G,2);
createRoca(rocas,1,6,mover_1,sprite_Rock_G,3);
createRocaEspejo(rocasEspejo,11,4,mover_Linea,sprite_RockLineal1_G,2);


//collecionables
createColeccionabeFamilia(col,15,5,sprite_familia1,5);

//decoracion izquierda
createRoca(rocas,4,2,sin_Movimiento,sprite_RockInmovil1_G,1);
createRoca(rocas,4,6,sin_Movimiento,sprite_RockInmovil1_G,1);
createRoca(rocas,6,2,sin_Movimiento,sprite_RockInmovil2_G,1);
createRoca(rocas,6,6,sin_Movimiento,sprite_RockInmovil2_G,1);
createRoca(rocas,2,5,sin_Movimiento,sprite_RockInmovil6_G,1);
createRoca(rocas,2,4,sin_Movimiento,sprite_RockInmovil7_G,1);
createRoca(rocas,4,7,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,5,6,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,7,6,sin_Movimiento, sprite_Muro_Solid1,1);


//decoracionDerecha
createRocaEspejo(rocasEspejo,12,2,sin_Movimiento,sprite_RockInmovil1_B,1);
createRocaEspejo(rocasEspejo,12,6,sin_Movimiento,sprite_RockInmovil1_B,1);
createRocaEspejo(rocasEspejo,10,2,sin_Movimiento,sprite_RockInmovil2_B,1);
createRocaEspejo(rocasEspejo,10,6,sin_Movimiento,sprite_RockInmovil2_B,1);
createRocaEspejo(rocasEspejo,14,5,sin_Movimiento,sprite_RockInmovil6_B,1);
createRocaEspejo(rocasEspejo,14,4,sin_Movimiento,sprite_RockInmovil7_B,1);
createRocaEspejo(rocasEspejo,12,7,sin_Movimiento, sprite_Muro_Solid1,1);
createRocaEspejo(rocasEspejo,9,6,sin_Movimiento, sprite_Muro_Solid1,1);
createRocaEspejo(rocasEspejo,11,6,sin_Movimiento, sprite_Muro_Solid1,1);
createHoleDerecha(rocasEspejo,15,3,sprite_hole,1);
createHoleDerecha(rocasEspejo,15,6,sprite_hole,1);



    }


void crearNievel4(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* col,u8* posicion){
    //player  portal puertas y marco
createPlayer(player,14,4,posicion);
createMarco(si);
createPortal(portales,rocas,rocasEspejo,si);
createPuerta(puertas,15,4,sprite_Puerta_G,nivel_02);
createPuerta(puertas,3,1,sprite_Puerta_G,nivel_05);
createPuerta(puertas,1,4,sprite_Puerta_G,nivel_04_01);
//createPuerta(puertas,3,7,sprite_Puerta_G,nivel_06);
//createPuerta(puertas,11,3,sprite_StairUp1_G,nivel_08);
//createPuerta(puertas,11,5, sprite_StairDown1_G,nivel_15);

//rocas móviles (separando id por espacios)
createRoca(rocas,3,4,mover_1,sprite_Rock_G,2);
createRocaEspejo(rocasEspejo,13,4,mover_1,sprite_Rock_G,2);
createRoca(rocas,3,3,mover_1,sprite_Rock_G,3);
createRocaEspejo(rocasEspejo,13,3,sin_Movimiento,sprite_Rock_nomove_B,3);
createRoca(rocas,3,5,mover_1,sprite_Rock_G,4);
createRocaEspejo(rocasEspejo,13,5,mover_Linea,sprite_RockLineal1_G,4);

//collecionables

//decoracion izquierda
createRoca(rocas,1,2,sin_Movimiento,sprite_RockInmovil8_G,1);
createRoca(rocas,1,3,sin_Movimiento,sprite_RockInmovil9_G,1);
createRoca(rocas,6,2,sin_Movimiento,sprite_RockInmovil8_G,1);
createRoca(rocas,6,3,sin_Movimiento,sprite_RockInmovil9_G,1);
createRoca(rocas,1,5,sin_Movimiento,sprite_RockInmovil8_G,1);
createRoca(rocas,1,6,sin_Movimiento,sprite_RockInmovil9_G,1);
createRoca(rocas,6,5,sin_Movimiento,sprite_RockInmovil8_G,1);
createRoca(rocas,6,6,sin_Movimiento,sprite_RockInmovil9_G,1);
createRoca(rocas,4,2,sin_Movimiento,sprite_RockInmovil1_G,1);
createRoca(rocas,4,6,sin_Movimiento,sprite_RockInmovil1_G,1);
createRoca(rocas,2,3,sin_Movimiento,sprite_RockInmovil2_G,1);
createRoca(rocas,2,5,sin_Movimiento,sprite_RockInmovil2_G,1);
createRoca(rocas,2,2,sin_Movimiento,sprite_RockInmovil5_G,1);
createRoca(rocas,2,6,sin_Movimiento,sprite_RockInmovil5_G,1);
createHoleIzquierda(rocas,4,1,sprite_hole,4);
createHoleIzquierda(rocas,4,7,sprite_hole,4);




//decoracionDerecha
createRocaEspejo(rocasEspejo,12,4,sin_Movimiento,sprite_RockInmovil1_B,1);
createHoleDerecha(rocasEspejo,10,3,sprite_hole,4);
createHoleDerecha(rocasEspejo,10,5,sprite_hole,4);
createHoleDerecha(rocasEspejo,11,2,sprite_hole,4);
createHoleDerecha(rocasEspejo,11,4,sprite_hole,4);
createHoleDerecha(rocasEspejo,11,6,sprite_hole,4);
}

void crearNievel4_01(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* col,u8* posicion){
    //player  portal puertas y marco
createPlayer(player,6,4,posicion);
createMarco(no);
createPortal(portales,rocas,rocasEspejo,no);
createPuerta(puertas,7,4,sprite_Puerta_B,nivel_04);
createPuerta(puertas,1,4,sprite_Puerta_B,nivel_TRAP_01);

//rocas móviles (separando id por espacios)
createRoca(rocas,5,4,mover_1,sprite_Rock_B,1);


//collecionables
createColeccionabeAmstr(col,3,4,4);


//decoracion izquierda
createRoca(rocas,1,1,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,2,1,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,3,1,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,4,1,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,5,1,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,6,1,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,7,1,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,8,1,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,1,7,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,2,7,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,3,7,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,4,7,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,5,7,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,6,7,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,7,7,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,8,7,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,1,2,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,1,3,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,1,4,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,1,5,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,1,6,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,8,2,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,8,3,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,8,4,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,8,5,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,8,6,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,2,3,sin_Movimiento,sprite_RockInmovil1_B,1);
createRoca(rocas,2,5,sin_Movimiento,sprite_RockInmovil1_B,1);
createRoca(rocas,7,3,sin_Movimiento,sprite_RockInmovil1_B,1);
createRoca(rocas,7,5,sin_Movimiento,sprite_RockInmovil1_B,1);
createRoca(rocas,2,2,sin_Movimiento,sprite_RockInmovil2_B,1);
createRoca(rocas,2,6,sin_Movimiento,sprite_RockInmovil2_B,1);
createHoleIzquierda(rocas,2,4,sprite_hole,4);

}
void crearNievel5(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* col,u8* posicion){
//    //player  portal puertas y marco
createPlayer(player,3,5,posicion);
createMarco(no);
createPortal(portales,rocas,rocasEspejo,si);
createPuerta(puertas,3,6,sprite_Puerta_G,nivel_04);
//createPuerta(puertas,13,6,sprite_Puerta_B,nivel_07);
//
////rocas móviles (separando id por espacios)
createRoca(rocas,5,5,mover_1,sprite_Rock_G,2);
createRocaEspejo(rocasEspejo,11,5,mover_1, sprite_Rock_B,2);
createRoca(rocas,4,3,mover_Linea,sprite_RockLineal1_G,3);
createRocaEspejo(rocasEspejo,12,3,mover_1, sprite_Rock_B,3);
//
//
////collecionables
createColeccionabeLuz(col,12,2,2);

//decoracion izquierda
createRoca(rocas,2,1,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,2,2,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,2,3,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,2,4,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,2,5,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,2,6,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,2,7,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,3,1,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,4,1,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,5,1,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,5,2,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,6,2,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,7,2,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,3,7,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,4,7,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,5,7,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,5,6,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,6,6,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,7,6,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,8,2,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,8,3,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,8,5,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,8,6,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,7,3,sin_Movimiento,sprite_RockInmovil1_G,1);
createRoca(rocas,7,5,sin_Movimiento,sprite_RockInmovil1_G,1);
//
//
//decoracionDerecha
createRocaEspejo(rocasEspejo,14,1,sin_Movimiento, sprite_Muro_Solid1,1);
createRocaEspejo(rocasEspejo,14,2,sin_Movimiento, sprite_Muro_Solid1,1);
createRocaEspejo(rocasEspejo,14,3,sin_Movimiento, sprite_Muro_Solid1,1);
createRocaEspejo(rocasEspejo,14,4,sin_Movimiento, sprite_Muro_Solid1,1);
createRocaEspejo(rocasEspejo,14,5,sin_Movimiento, sprite_Muro_Solid1,1);
createRocaEspejo(rocasEspejo,14,6,sin_Movimiento, sprite_Muro_Solid1,1);
createRocaEspejo(rocasEspejo,14,7,sin_Movimiento, sprite_Muro_Solid1,1);
createRocaEspejo(rocasEspejo,11,1,sin_Movimiento, sprite_Muro_Solid1,1);
createRocaEspejo(rocasEspejo,12,1,sin_Movimiento, sprite_Muro_Solid1,1);
createRocaEspejo(rocasEspejo,13,1,sin_Movimiento, sprite_Muro_Solid1,1);
createRocaEspejo(rocasEspejo,11,2,sin_Movimiento, sprite_Muro_Solid1,1);
createRocaEspejo(rocasEspejo,10,2,sin_Movimiento, sprite_Muro_Solid1,1);
createRocaEspejo(rocasEspejo,9,2,sin_Movimiento, sprite_Muro_Solid1,1);
createRocaEspejo(rocasEspejo,11,7,sin_Movimiento, sprite_Muro_Solid1,1);
createRocaEspejo(rocasEspejo,12,7,sin_Movimiento, sprite_Muro_Solid1,1);
createRocaEspejo(rocasEspejo,13,7,sin_Movimiento, sprite_Muro_Solid1,1);
createRocaEspejo(rocasEspejo,11,6,sin_Movimiento, sprite_Muro_Solid1,1);
createRocaEspejo(rocasEspejo,10,6,sin_Movimiento, sprite_Muro_Solid1,1);
createRocaEspejo(rocasEspejo,9,6,sin_Movimiento, sprite_Muro_Solid1,1);
createHoleDerecha(rocasEspejo,10,4,sprite_hole,1);
createRocaEspejo(rocasEspejo,9,3,sin_Movimiento,sprite_RockInmovil1_B,1);
createRocaEspejo(rocasEspejo,9,5,sin_Movimiento,sprite_RockInmovil1_B,1);

}

void crearNievel6(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* col,u8* posicion){
    //player  portal puertas y marco
createPlayer(player,4,2,posicion);
createMarco(no);
createPortal(portales,rocas,rocasEspejo,si);
createPuerta(puertas,3,2,sprite_Puerta_G,nivel_04);
//createPuerta(puertas,13,2,sprite_Puerta_B,nivel_07);

//rocas móviles (separando id por espacios)
createRoca(rocas,5,4,mover_Linea,sprite_RockLineal1_G,2);
createRoca(rocas,6,4,mover_Linea,sprite_RockLineal1_G,3);
createRocaEspejo(rocasEspejo,10,4,sin_Movimiento,sprite_Rock_nomove_B,3);
createRocaEspejo(rocasEspejo,11,4,sin_Movimiento,sprite_Rock_nomove_B,2);

//collecionables


//decoracion izquierda
createRoca(rocas,2,1,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,2,2,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,2,3,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,2,4,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,2,5,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,2,6,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,2,7,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,3,1,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,4,1,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,5,1,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,5,2,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,6,2,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,7,2,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,3,7,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,4,7,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,5,7,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,5,6,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,6,6,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,7,6,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,8,2,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,8,3,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,8,5,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,8,6,sin_Movimiento, sprite_Muro_Solid1,1);
createRoca(rocas,3,3,sin_Movimiento,sprite_RockInmovil5_G,1);



//decoracionDerecha
createRocaEspejo(rocasEspejo,14,1,sin_Movimiento, sprite_Muro_Solid1,1);
createRocaEspejo(rocasEspejo,14,2,sin_Movimiento, sprite_Muro_Solid1,1);
createRocaEspejo(rocasEspejo,14,3,sin_Movimiento, sprite_Muro_Solid1,1);
createRocaEspejo(rocasEspejo,14,4,sin_Movimiento, sprite_Muro_Solid1,1);
createRocaEspejo(rocasEspejo,14,5,sin_Movimiento, sprite_Muro_Solid1,1);
createRocaEspejo(rocasEspejo,14,6,sin_Movimiento, sprite_Muro_Solid1,1);
createRocaEspejo(rocasEspejo,14,7,sin_Movimiento, sprite_Muro_Solid1,1);
createRocaEspejo(rocasEspejo,11,1,sin_Movimiento, sprite_Muro_Solid1,1);
createRocaEspejo(rocasEspejo,12,1,sin_Movimiento, sprite_Muro_Solid1,1);
createRocaEspejo(rocasEspejo,13,1,sin_Movimiento, sprite_Muro_Solid1,1);
createRocaEspejo(rocasEspejo,11,2,sin_Movimiento, sprite_Muro_Solid1,1);
createRocaEspejo(rocasEspejo,10,2,sin_Movimiento, sprite_Muro_Solid1,1);
createRocaEspejo(rocasEspejo,9,2,sin_Movimiento, sprite_Muro_Solid1,1);
createRocaEspejo(rocasEspejo,11,7,sin_Movimiento, sprite_Muro_Solid1,1);
createRocaEspejo(rocasEspejo,12,7,sin_Movimiento, sprite_Muro_Solid1,1);
createRocaEspejo(rocasEspejo,13,7,sin_Movimiento, sprite_Muro_Solid1,1);
createRocaEspejo(rocasEspejo,11,6,sin_Movimiento, sprite_Muro_Solid1,1);
createRocaEspejo(rocasEspejo,10,6,sin_Movimiento, sprite_Muro_Solid1,1);
createRocaEspejo(rocasEspejo,9,6,sin_Movimiento, sprite_Muro_Solid1,1);
createHoleDerecha(rocasEspejo,11,3,sprite_hole,1);
createHoleDerecha(rocasEspejo,12,3,sprite_hole,1);
createRocaEspejo(rocasEspejo,13,3,sin_Movimiento,sprite_RockInmovil5_B,1);

}
void crearNievel7(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* col,u8* posicion){
    //player  portal puertas y marco
createPlayer(player,7,4,posicion);
createMarco(no);
createPortal(portales,rocas,rocasEspejo,no);
createPuerta(puertas,8,2,sprite_Puerta_B,nivel_05);
createPuerta(puertas,8,6,sprite_Puerta_B,nivel_06);

//rocas móviles (separando id por espacios)
createRoca(rocas,6,4,mover_1,sprite_Rock_B,1);
createRoca(rocas,6,2,mover_Linea,sprite_RockLineal1_B,1);
createRoca(rocas,6,6,mover_Linea,sprite_RockLineal1_B,1);
createRoca(rocas,5,4,mover_Linea,sprite_RockLineal1_B,1);
createRoca(rocas,4,4,mover_Linea,sprite_RockLineal1_B,1);
createRoca(rocas,4,3,mover_Linea,sprite_RockLineal1_B,1);
createRoca(rocas,4,5,mover_Linea,sprite_RockLineal1_B,1);


//collecionables
createColeccionabeLuz(col,2,4,6);


//decoracion izquierda
createRoca(rocas,1,1,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,2,1,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,3,1,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,4,1,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,5,1,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,6,1,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,7,1,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,8,1,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,1,7,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,2,7,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,3,7,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,4,7,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,5,7,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,6,7,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,7,7,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,8,8,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,1,2,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,1,3,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,1,5,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,1,6,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,8,2,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,8,3,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,8,4,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,8,5,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,8,6,sin_Movimiento, sprite_Muro_Polvo1,1);
createRoca(rocas,2,2,sin_Movimiento,sprite_RockInmovil2_B,1);
createRoca(rocas,2,6,sin_Movimiento,sprite_RockInmovil2_B,1);

}




