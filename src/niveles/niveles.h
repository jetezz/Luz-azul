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

static u8 movimientoRep;
static u8 simetriaRep;






void initNiveles(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* portales,TGameObject* puertas,TGameObjectCol* colec,u8* colLuz,u8* colFam,u8* colAms,u8* colList,u8* posicion);
void crearNivel(u8 nivel);
void resetLevel();
void limpiarPantalla();

void cambiarMov(u8 mov);
void createPlayer(u8 posx, u8 posy);
void createMarco(u8 hay);
void createRoca(u8 posx, u8 posy,u8 sprite, u8 simetria);
void createRocaEspejo(u8 posx, u8 posy,u8 sprite, u8 simetria);
void crearMuro(u8 posx, u8 posy,u8 posxFinal,u8 posyFinal,u8 sprite,u8 lado);
void createPuerta(u8 posx,u8 posy,u8 sprite,u8 nivel);
void createPortal(u8 hay);
void createHoleIzquierda(u8 posx, u8 posy,u8 sprite, u8 simetria);
void createHoleDerecha(u8 posx, u8 posy,u8 sprite, u8 simetria);
void createColeccionabeLuz(u8 posx, u8 posy,u8 id);
void createColeccionabeFamilia(u8 posx, u8 posy,u8 sprite,u8 id);
void createColeccionabeAmstr(u8 posx, u8 posy,u8 id);

#endif // DECLARACIONNIVELES




