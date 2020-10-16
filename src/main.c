

#include <cpctelera.h>
#include "juego/juego.h"
#include "sprites/Block_Hole.h"

const u8 game_palette[16] =     { 0x54  ,0x5C,0x5E ,0x5D ,0x5F       ,0x4f          ,0x44 ,0x55      ,0x57    ,0x47,0x5B       ,0x56 ,0x40, 0x4B       }
                                 //negro,red,yellow,MAUVE,PASTEL BLUE,PASTEL MAGENTA, BLUE,BRIGHTBLUE,SKY BLUE,CYAN,PASTEL CYAN,GREEN,WHITE,BRIGHT WHITE
;


void main(void) {
   cpct_disableFirmware();
   cpct_setVideoMode(0);
   cpct_setPalette(Block_HolePALETTE, 16);   
   game();

 
}
