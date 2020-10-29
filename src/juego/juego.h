
#include <cpctelera.h>
#include "gameObject/gameObject.h"
#include "constantes.h"

static u8 movimientoGuardado;

extern TGameObject player;
extern TGameObject rocas[RocasMaximas];
extern TGameObject rocasEspejo[RocasMaximas];
extern TGameObject portal[2];
extern TGameObject puertas[PuertasMaximas];
extern TGameObjectCol coleccionables[ColeccionablesMaximos];





extern u8 posicion;
extern u8 coleccionablesLuz;
extern u8 coleccionablesFam;
extern u8 coleccionablesAms;
extern u8 nivelActual;
extern u8 pasos;
extern u8 pasosContador;
extern u8 pasosT;
extern u8 pasosT2;
extern u8 frecuenciaIA;
extern u8 estado;
extern u8 estadoSeleccionado;
extern u8 muerteJugador;
extern u8 frecuenciaMuerte;



void game();
void initGame();
void moverPlayer();
void dibujarGameObjects();
void comprobarMovimiento();
u8 comprobarPasos();

void resetGameobjects(u8 nivel);

void modoDios();
void pasosTotales();
void salir();
void ia();
void resetearPorMuerte();