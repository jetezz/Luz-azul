#include "niveles.h"
#include "mapa/mapa.h"
#include "constantes.h"

#include <stdio.h>
#include <stdlib.h>

void initNiveles(u8* collist){
    
    niveles[nivel_01]=crearNivel1;
    niveles[nivel_01_01]=crearNivel2;    
    niveles[nivel_02]=crearNivel3;
    niveles[nivel_TRAP_01]=crearNivelTRAP01;    


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
void createRoca(TGameObject* rocas,TGameObject* rocasEspejo,u8 posx, u8 posy,u8 mivimiento,u8 sprite, u8 simetria,u8 simetrico){
    rocas[contadorRocas].num=simetria;
    rocas[contadorRocas].posx=posx;
    rocas[contadorRocas].posy=posy;
    rocas[contadorRocas].sprite=sprite;
    rocas[contadorRocas].movimiento=mivimiento;
    contadorRocas++;
    if(simetrico==si){
        rocasEspejo[contadorRocas].num=simetria;
        rocasEspejo[contadorRocas].posx=16-posx;
        rocasEspejo[contadorRocas].posy=posy;
        rocasEspejo[contadorRocas].sprite=sprite;
        rocasEspejo[contadorRocas].movimiento=mivimiento;
    }    
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
        createRoca(roca,rocasEspejo,8,4,sin_Movimiento,sprite_PortalMuro,1,no);
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
    createPuerta(puertas,3,7,sprite_Puerta_G,nivel_02);
    createPuerta(puertas,13,7,sprite_Puerta_B,nivel_01_01);

    //rocas móviles (separando id por espacios)
    createRoca(rocas,rocasEspejo,2,4,mover_1,sprite_Rock_G,2,no);
    createRocaEspejo(rocasEspejo,13,4,sin_Movimiento,sprite_Rock_nomove_B,2);

    //collecionables
    createColeccionabeLuz(col,15,4,0);

    //decoracion izquierda
    createRoca(rocas,rocasEspejo,1,2,sin_Movimiento,sprite_RockInmovil3_G,1,no);
    createRoca(rocas,rocasEspejo,2,2,sin_Movimiento,sprite_RockInmovil4_G,1,no);
    createRoca(rocas,rocasEspejo,1,3,sin_Movimiento,sprite_RockInmovil1_G,1,no);
    createRoca(rocas,rocasEspejo,6,3,sin_Movimiento,sprite_RockInmovil1_G,1,no);
    createRoca(rocas,rocasEspejo,1,5,sin_Movimiento,sprite_RockInmovil1_G,1,no);
    createRoca(rocas,rocasEspejo,6,5,sin_Movimiento,sprite_RockInmovil1_G,1,no);
    createRoca(rocas,rocasEspejo,7,1,sin_Movimiento,sprite_RockInmovil2_G,1,no);
    createRoca(rocas,rocasEspejo,7,7,sin_Movimiento,sprite_RockInmovil2_G,1,no);
    createRoca(rocas,rocasEspejo,1,4,sin_Movimiento,sprite_amstrad,1,no);
    createRoca(rocas,rocasEspejo,1,1,sin_Movimiento,sprite_PrinceofPersia2_G,1,no);
    createRoca(rocas,rocasEspejo,2,1,sin_Movimiento,sprite_PrinceofPersia1_G,1,no);


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
void crearNivel2(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* col,u8* posicion){
    //player  portal puertas y marco
    createPlayer(player,6,4,posicion);
    createMarco(no);
    createPortal(portales,rocas,rocasEspejo,no);
    createPuerta(puertas,6,2,sprite_Puerta_B,nivel_01);
    //createPuerta(puertas,6,6,sprite_Puerta_B,nivel_03);

    //collecionables
    createColeccionabeAmstr(col,10,3,0);

    //decoracion izquierda
    createRoca(rocas,rocasEspejo,8,4,sin_Movimiento,sprite_enemigo1,1,no);
    createRoca(rocas,rocasEspejo,4,2,sin_Movimiento, sprite_Muro_Polvo1,1,no);
    createRoca(rocas,rocasEspejo,5,2,sin_Movimiento, sprite_Muro_Polvo1,1,no);
    createRoca(rocas,rocasEspejo,7,2,sin_Movimiento, sprite_Muro_Polvo1,1,no);
    createRoca(rocas,rocasEspejo,8,2,sin_Movimiento, sprite_Muro_Polvo1,1,no);
    createRoca(rocas,rocasEspejo,9,2,sin_Movimiento, sprite_Muro_Polvo1,1,no);
    createRoca(rocas,rocasEspejo,10,2,sin_Movimiento, sprite_Muro_Polvo1,1,no);
    createRoca(rocas,rocasEspejo,11,2,sin_Movimiento, sprite_Muro_Polvo1,1,no);
    createRoca(rocas,rocasEspejo,12,2,sin_Movimiento, sprite_Muro_Polvo1,1,no);
    createRoca(rocas,rocasEspejo,3,3,sin_Movimiento, sprite_Muro_Polvo1,1,no);
    createRoca(rocas,rocasEspejo,3,4,sin_Movimiento, sprite_Muro_Polvo1,1,no);
    createRoca(rocas,rocasEspejo,3,5,sin_Movimiento, sprite_Muro_Polvo1,1,no);
    createRoca(rocas,rocasEspejo,12,3,sin_Movimiento, sprite_Muro_Polvo1,1,no);
    createRoca(rocas,rocasEspejo,12,4,sin_Movimiento, sprite_Muro_Polvo1,1,no);
    createRoca(rocas,rocasEspejo,12,5,sin_Movimiento, sprite_Muro_Polvo1,1,no);
    createRoca(rocas,rocasEspejo,4,6,sin_Movimiento, sprite_Muro_Polvo1,1,no);
    createRoca(rocas,rocasEspejo,5,6,sin_Movimiento, sprite_Muro_Polvo1,1,no);
    createRoca(rocas,rocasEspejo,7,6,sin_Movimiento, sprite_Muro_Polvo1,1,no);
    createRoca(rocas,rocasEspejo,8,6,sin_Movimiento, sprite_Muro_Polvo1,1,no);
    createRoca(rocas,rocasEspejo,9,6,sin_Movimiento, sprite_Muro_Polvo1,1,no);
    createRoca(rocas,rocasEspejo,10,6,sin_Movimiento, sprite_Muro_Polvo1,1,no);
    createRoca(rocas,rocasEspejo,11,6,sin_Movimiento, sprite_Muro_Polvo1,1,no);
    createRoca(rocas,rocasEspejo,12,6,sin_Movimiento, sprite_Muro_Polvo1,1,no);

    
}
void crearNivel3(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* col,u8* posicion){
   //player  portal puertas y marco
    createPlayer(player,3,4,posicion);
    createMarco(si);
    createPortal(portales,rocas,rocasEspejo,si);
    createPuerta(puertas,3,2,sprite_Puerta_G,nivel_01);
    //createPuerta(puertas,3,6,sprite_Puerta_G,nivel_03);
    //createPuerta(puertas,1,4,sprite_Puerta_G,nivel_04);
    createPuerta(puertas,13,2,sprite_Puerta_B,nivel_TRAP_01);
    createPuerta(puertas,13,6,sprite_Puerta_B,nivel_TRAP_01);
    createPuerta(puertas,15,4,sprite_Puerta_B,nivel_TRAP_01);

    //rocas móviles (separando id por espacios)
    createRoca(rocas,rocasEspejo,5,4,mover_1,sprite_Rock_G,2,no);
    createRocaEspejo(rocasEspejo,11,4,mover_1, sprite_Rock_B,2);

    //collecionables
    createColeccionabeLuz(col,13,4,0);

    //decoracion izquierda
    createRoca(rocas,rocasEspejo,1,1,sin_Movimiento, sprite_Muro_Solid1,1,no);
    createRoca(rocas,rocasEspejo,2,1,sin_Movimiento, sprite_Muro_Solid1,1,no);
    createRoca(rocas,rocasEspejo,3,1,sin_Movimiento, sprite_Muro_Solid1,1,no);
    createRoca(rocas,rocasEspejo,4,1,sin_Movimiento, sprite_Muro_Solid1,1,no);
    createRoca(rocas,rocasEspejo,5,1,sin_Movimiento, sprite_Muro_Solid1,1,no);
    createRoca(rocas,rocasEspejo,6,1,sin_Movimiento, sprite_Muro_Solid1,1,no);
    createRoca(rocas,rocasEspejo,7,1,sin_Movimiento, sprite_Muro_Solid1,1,no);
    createRoca(rocas,rocasEspejo,1,7,sin_Movimiento, sprite_Muro_Solid1,1,no);
    createRoca(rocas,rocasEspejo,2,7,sin_Movimiento, sprite_Muro_Solid1,1,no);
    createRoca(rocas,rocasEspejo,3,7,sin_Movimiento, sprite_Muro_Solid1,1,no);
    createRoca(rocas,rocasEspejo,4,7,sin_Movimiento, sprite_Muro_Solid1,1,no);
    createRoca(rocas,rocasEspejo,5,7,sin_Movimiento, sprite_Muro_Solid1,1,no);
    createRoca(rocas,rocasEspejo,6,7,sin_Movimiento, sprite_Muro_Solid1,1,no);
    createRoca(rocas,rocasEspejo,7,7,sin_Movimiento, sprite_Muro_Solid1,1,no);
    createRoca(rocas,rocasEspejo,5,3,sin_Movimiento,sprite_RockInmovil1_G,1,no);
    createRoca(rocas,rocasEspejo,5,5,sin_Movimiento,sprite_RockInmovil1_G,1,no);
    createRoca(rocas,rocasEspejo,1,3,sin_Movimiento,sprite_RockInmovil2_G,1,no);
    createRoca(rocas,rocasEspejo,1,5,sin_Movimiento,sprite_RockInmovil2_G,1,no);
    createRoca(rocas,rocasEspejo,7,3,sin_Movimiento,sprite_RockInmovil5_G,1,no);
    createRoca(rocas,rocasEspejo,7,5,sin_Movimiento,sprite_RockInmovil5_G,1,no);



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
    createRoca(rocas,rocasEspejo,1,3,sin_Movimiento,sprite_RockInmovil2_B,1,no);
    createRoca(rocas,rocasEspejo,1,5,sin_Movimiento,sprite_RockInmovil2_B,1,no);
    createRoca(rocas,rocasEspejo,7,3,sin_Movimiento,sprite_RockInmovil5_B,1,no);
    createRoca(rocas,rocasEspejo,7,5,sin_Movimiento,sprite_RockInmovil5_B,1,no);


}

void crearNivelTRAP01(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* col,u8* posicion){
    //player  portal puertas y marco
    createPlayer(player,6,4,posicion);
    createMarco(no);
    createPortal(portales,rocas,rocasEspejo,no);
    createPuerta(puertas,8,1,sprite_Puerta_B,nivel_02);
    createPuerta(puertas,8,7,sprite_Puerta_B,nivel_02);

    //collecionables


    //decoracion izquierda
    createRoca(rocas,rocasEspejo,6,2,sin_Movimiento,sprite_enemigo1,1,no);
    createRoca(rocas,rocasEspejo,6,5,sin_Movimiento,sprite_enemigo1,1,no);
    createRoca(rocas,rocasEspejo,10,2,sin_Movimiento,sprite_enemigo1,1,no);
    createRoca(rocas,rocasEspejo,10,5,sin_Movimiento,sprite_enemigo1,1,no);
    createRoca(rocas,rocasEspejo,5,1,sin_Movimiento, sprite_Muro_Polvo1,1,no);
    createRoca(rocas,rocasEspejo,6,1,sin_Movimiento, sprite_Muro_Polvo1,1,no);
    createRoca(rocas,rocasEspejo,7,1,sin_Movimiento, sprite_Muro_Polvo1,1,no);
    createRoca(rocas,rocasEspejo,9,1,sin_Movimiento, sprite_Muro_Polvo1,1,no);
    createRoca(rocas,rocasEspejo,10,1,sin_Movimiento, sprite_Muro_Polvo1,1,no);
    createRoca(rocas,rocasEspejo,11,1,sin_Movimiento, sprite_Muro_Polvo1,1,no);
    createRoca(rocas,rocasEspejo,5,2,sin_Movimiento, sprite_Muro_Polvo1,1,no);
    createRoca(rocas,rocasEspejo,5,3,sin_Movimiento, sprite_Muro_Polvo1,1,no);
    createRoca(rocas,rocasEspejo,5,4,sin_Movimiento, sprite_Muro_Polvo1,1,no);
    createRoca(rocas,rocasEspejo,5,5,sin_Movimiento, sprite_Muro_Polvo1,1,no);
    createRoca(rocas,rocasEspejo,5,6,sin_Movimiento, sprite_Muro_Polvo1,1,no);
    createRoca(rocas,rocasEspejo,11,2,sin_Movimiento, sprite_Muro_Polvo1,1,no);
    createRoca(rocas,rocasEspejo,11,3,sin_Movimiento, sprite_Muro_Polvo1,1,no);
    createRoca(rocas,rocasEspejo,11,4,sin_Movimiento, sprite_Muro_Polvo1,1,no);
    createRoca(rocas,rocasEspejo,11,5,sin_Movimiento, sprite_Muro_Polvo1,1,no);
    createRoca(rocas,rocasEspejo,11,6,sin_Movimiento, sprite_Muro_Polvo1,1,no);
    createRoca(rocas,rocasEspejo,5,7,sin_Movimiento, sprite_Muro_Polvo1,1,no);
    createRoca(rocas,rocasEspejo,6,7,sin_Movimiento, sprite_Muro_Polvo1,1,no);
    createRoca(rocas,rocasEspejo,7,7,sin_Movimiento, sprite_Muro_Polvo1,1,no);
    createRoca(rocas,rocasEspejo,9,7,sin_Movimiento, sprite_Muro_Polvo1,1,no);
    createRoca(rocas,rocasEspejo,10,7,sin_Movimiento, sprite_Muro_Polvo1,1,no);
    createRoca(rocas,rocasEspejo,11,7,sin_Movimiento, sprite_Muro_Polvo1,1,no);
    createRoca(rocas,rocasEspejo,7,3,sin_Movimiento,sprite_RockInmovil1_B,1,no);
    createRoca(rocas,rocasEspejo,7,5,sin_Movimiento,sprite_RockInmovil1_B,1,no);
    createRoca(rocas,rocasEspejo,9,3,sin_Movimiento,sprite_RockInmovil1_B,1,no);
    createRoca(rocas,rocasEspejo,9,5,sin_Movimiento,sprite_RockInmovil1_B,1,no);

}
