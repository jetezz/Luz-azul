#pragma once
#ifndef DECLARACIONNIVELES
#define DECLARACIONNIVELES

#include <cpctelera.h>
#include "tGameobject.h"
#include "tGameObjectCol.h"
#include "constantes.h"




static u8 contadorRocas;
static u8 contadorRocasEspejo;
static u8 contadorPuertas;
static u8 contadorColeccionables;

static u8* P_colList2;






void initNiveles(u8* collist);
void crearNivel(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* coleccionables,u8* posicion,u8 nivel);
void resetLevel(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* coleccionables);
void limpiarPantalla();

void createPlayer(TGameObject* player,u8 posx, u8 posy,u8* posicion);
void createMarco(u8 hay);
void createRoca(TGameObject* rocas,u8 posx, u8 posy,u8 mivimiento,u8 sprite, u8 simetria);
void createRocaEspejo(TGameObject* rocasEspejo,u8 posx, u8 posy,u8 mivimiento,u8 sprite, u8 simetria);
void createPuerta(TGameObject* puertas,u8 posx,u8 posy,u8 sprite,u8 nivel);
void createPortal(TGameObject* portal,TGameObject* roca,TGameObject* rocaespejo,u8 hay);
void createHoleIzquierda(TGameObject* rocas,u8 posx, u8 posy,u8 sprite, u8 simetria);
void createHoleDerecha(TGameObject* rocasEspejo,u8 posx, u8 posy,u8 sprite, u8 simetria);
void createColeccionabeLuz(TGameObjectCol* coleccionable,u8 posx, u8 posy,u8 id);
void createColeccionabeFamilia(TGameObjectCol* coleccionable,u8 posx, u8 posy,u8 sprite,u8 id);
void createColeccionabeAmstr(TGameObjectCol* coleccionable,u8 posx, u8 posy,u8 id);

#endif // DECLARACIONNIVELES




