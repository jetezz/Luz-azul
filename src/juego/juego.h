
#include <cpctelera.h>
#include "gameObject/gameObject.h"
#include "constantes.h"

static u8 movimientoGuardado;

extern TGameObject player;
extern TGameObject rocas[RocasMaximas];
extern TGameObject rocasEspejo[RocasMaximas];
extern TGameObject portal[2];
extern u8 posicion;

void game();
void initGame();
void moverPlayer();
void createPlayer();
void createRocas();
void createRocasEspejo();
void createPortal();
void dibujarGameObjects();
void comprobarMovimiento();

void resetGameobjects();