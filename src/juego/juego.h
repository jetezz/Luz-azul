
#include <cpctelera.h>
#include "gameObject/gameObject.h"

static u8 movimientoGuardado;

extern TGameObject player;
extern TGameObject rocas[5];

void game();
void initGame();
void createPlayer();
void comprobarMovimiento();