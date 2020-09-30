

#include <cpctelera.h>
#include "juego/juego.h"

const u8 game_palette[16] =     { 0x54  , 0x5D ,0x4E  ,0x44, 0x46,    0x42, 0x5C,0x47, 0x45  ,0x58   , 0x4D         , 0x43        , 0x4F  , 0x40  , 0x4C, 0x4B }
                                 //negro,mauve,naranja,azul,cyan ,Sea Green, red,rosa,purpura,magenta,Bright Magenta,Pastel Yellow,Pmagenta,blanco,RojoB,Blancob
;


void main(void) {
   cpct_disableFirmware();
   cpct_setVideoMode(0);
   //cpct_setPalette(game_palette, 16);   
   game();

 
}
