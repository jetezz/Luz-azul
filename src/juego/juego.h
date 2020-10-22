
#include <cpctelera.h>
#include "gameObject/gameObject.h"
#include "constantes.h"

static u8 movimientoGuardado;

extern TGameObject player;
extern TGameObject rocas[RocasMaximas];
extern TGameObject rocasEspejo[RocasMaximas];
extern TGameObject portal[2];
extern TGameObject puertas[10];
extern TGameObjectCol coleccionables[ColeccionablesMaximos];





extern u8 posicion;
extern u8 coleccionablesLuz;
extern u8 coleccionablesFam;
extern u8 coleccionablesAms;
extern u8 nivelActual;
extern u8 pasos;
extern u8 frecuenciaIA;
extern u8 estado;
extern u8 estadoSeleccionado;



void game();
void initGame();
void moverPlayer();
void dibujarGameObjects();
void comprobarMovimiento();
u8 comprobarPasos();

void resetGameobjects(u8 nivel);