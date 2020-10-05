
#include <cpctelera.h>
#include "gameObject/gameObject.h"

static u8 movimientoGuardado;

extern TGameObject player;
extern TGameObject rocas[5];
extern u8 posicion;

void game();
void initGame();
void createPlayer();
void createRocas();
void createRocasEspejo();
void dibujarGameObjects();
void comprobarMovimiento();

void resetGameobjects();