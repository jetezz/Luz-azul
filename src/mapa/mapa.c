#include "mapa.h"
#include "court.h"
#include "tiles.h"

#define  Punto_Inicial_De_Pantalla   cpctm_screenPtr(CPCT_VMEM_START, 0, 0)

void crearMapa(u8 id){

    cpct_etm_setDrawTilemap4x8_ag(map_W, map_H, map_W, tiles_00);
    cpct_etm_drawTilemap4x8_ag(Punto_Inicial_De_Pantalla, map);

}