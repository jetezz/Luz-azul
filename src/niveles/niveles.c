#include "niveles.h"
#include "mapa/mapa.h"
#include "constantes.h"

#include <stdio.h>
#include <stdlib.h>

void initNiveles(u8* collist){
    
    array[0]=crearNivel1;
    array[nivel_1]=crearNivel2;    
    array[nivel_2]=crearNivel3;    

    P_colList2=collist;
    contadorRocas=0;
    contadorRocasEspejo=0;
    contadorPuertas=0;
    contadorColeccionables=0;
    
}

void crearNivel(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* coleccionables,u8* posicion,u8 nivel){
    resetLevel(player,rocas,rocasEspejo,puertas,portales,coleccionables);     
    crearMapa(0);
    array[nivel](player,rocas,rocasEspejo,puertas,portales,coleccionables,posicion);
    
        
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
void createPortal(TGameObject* portal,u8 hay){
    if(hay==si){
        portal[0].posx=7;
        portal[0].posy=4;
        portal[0].sprite=sprite_Portal;

        portal[1].posx=9;
        portal[1].posy=4;
        portal[1].sprite=sprite_Portal;
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
void createColeccionabeFamilia(TGameObjectCol* coleccionable,u8 posx, u8 posy,u8 id){
    if(P_colList2[id]==coleccionable_activo){
        coleccionable[contadorColeccionables].num=id;
        coleccionable[contadorColeccionables].posx=posx;
        coleccionable[contadorColeccionables].posy=posy;
        coleccionable[contadorColeccionables].sprite=sprite_familia;
    }
}


void crearNivel1(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* col,u8* posicion){
   
}
void crearNivel2(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* col,u8* posicion){
    createPlayer(player,9,1,posicion);
    createRoca(rocas,rocasEspejo,2,2,mover_Linea,sprite_RockLineal,1,si);
    createRocaEspejo(rocasEspejo,10,2,mover_1,sprite_Rock,1);
    createPuerta(puertas,2,7,sprite_Puerta,nivel_2);
    createPortal(portales,si);
    createHoleIzquierda(rocas,2,3,sprite_hole,0);
    createColeccionabeFamilia(col,1,1,1);
    
}
void crearNivel3(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* col,u8* posicion){
    createPlayer(player,1,1,posicion);
    createRoca(rocas,rocasEspejo,2,2,sin_Movimiento,sprite_RockInmovil,1,si);
    //createRocaEspejo(rocasEspejo,10,2,mover_1,sprite_Rock,1);
    createPuerta(puertas,2,7,sprite_Puerta,nivel_1);
    createPortal(portales,si);
    createHoleIzquierda(rocas,2,3,sprite_hole,0);
}