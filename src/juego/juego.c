#include "juego.h"
#include "input/input.h"
#include "player.h"
#include "court.h"
#include "tiles.h"

#define  TILESIZE_X     4 // mitad del tile
#define  TILESIZE_Y     8 //
#define  VIEWPORT_X     (1*TILESIZE_X)
#define  VIEWPORT_Y     (2*TILESIZE_Y)
#define  TILEMAP_VMEM   cpctm_screenPtr(CPCT_VMEM_START, VIEWPORT_X, VIEWPORT_Y)

void game(){
cpct_setPalette(PALETTE2, 16);
cpct_setBorder(HW_BLACK);        // Set border colour to black
    while(1){
        scanKey();
        if(keyFire()){
            //cpct_drawSolidBox((u8*)0xC235, cpct_px2byteM1(1, 1, 1, 1), 5,20);
            //cpct_drawSprite(array, (u8*)0xC235, 15, 30); 
            //cpct_etm_drawTileRow2x4(3,(u8*)0xC235,map);
            
            cpct_etm_setDrawTilemap4x8_ag(g_level0_4bit_W, g_level0_4bit_H, g_level0_4bit_W, array_00);
            cpct_etm_drawTilemap4x8_ag(TILEMAP_VMEM, g_level0_4bit);
        } 
             
    }
}