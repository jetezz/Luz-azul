

#include <cpctelera.h>
#include "juego/juego.h"
#include "sprites/Block_Hole.h"

#include <stdio.h>
#include <stdlib.h>


void main(void) {
   cpct_disableFirmware();
   cpct_setVideoMode(0);
   cpct_setPalette(Block_HolePALETTE, 16);
   game(); 
}
