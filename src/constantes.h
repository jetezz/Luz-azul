#pragma once
#ifndef DECLARACIONCONSTANTES
#define DECLARACIONCONSTANTES

#include "tGameobject.h"
#include "tGameObjectCol.h"

#define     SinColision                     50
#define     ColisionNoRocas                 51
#define     RocasMaximas                    50 
#define     PuertasMaximas                  6
#define     ColeccionablesMaximos           3
#define     ColeccionablesMaximosTotales    20

#define     anchoSprite                 4
#define     altoSprite                  16



#define enemigosMaximos     5
#define animacinesMaximas   10
#define animacionesMaximasEnLista 5
#define frecuenciaMuertePlayer  30


static TGameObject* P_player;
static TGameObject* P_rocas;
static TGameObject* P_rocasEspejo;
static TGameObject* P_portal;
static TGameObject* P_puertas;
static TGameObjectCol* P_col;

static u8* P_posicion;
static u8* P_luz;
static u8* P_fam;
static u8* P_ams;
static u8* P_colList;

static u8* P_pasosTotales;
static u8* P_pasosTotales2;



extern enum{
    sprite_SinDefinir,
    sprite_Player2,
    sprite_Player,

    sprite_Muerte1,
    sprite_Muerte2,
    sprite_Muerte3,

    

    sprite_Rock_G,
    sprite_Rock_B,
    sprite_Rock_nomove_G,
    sprite_Rock_nomove_B,
    sprite_RockLineal1_G,
    sprite_RockLineal1_B,

    sprite_RockInmovil1_G,
    sprite_RockInmovil1_B,
    sprite_RockInmovil2_G,
    sprite_RockInmovil2_B,
    sprite_RockInmovil3_G,
    sprite_RockInmovil3_B,
    sprite_RockInmovil4_G,
    sprite_RockInmovil4_B,
    sprite_RockInmovil5_G,
    sprite_RockInmovil5_B,
    sprite_RockInmovil6_G,
    sprite_RockInmovil6_B,
    sprite_RockInmovil7_G,
    sprite_RockInmovil7_B,
    sprite_RockInmovil8_G,
    sprite_RockInmovil8_B,
    sprite_RockInmovil9_G,
    sprite_RockInmovil9_B,

    sprite_PortalMuro,
    sprite_PuertaPortal_G,
    sprite_PuertaPortal_B,
    sprite_Muro_Polvo1,
    sprite_Muro_Solid1,

    sprite_Puerta_G,
    sprite_Puerta_B,
    sprite_StairUp1_G,
    sprite_StairUp1_B,
    sprite_StairDown1_G,
    sprite_StairDown1_B,

    sprite_hole,
    sprite_hole1,
    sprite_hole2,
    sprite_hole3,
    sprite_luz,

    sprite_familia1,
    sprite_familia2,
    sprite_familia3,
    sprite_familia4,

    sprite_enemigo1,
    sprite_enemigo2,
    sprite_enemigo3,
    sprite_zul1_1,
    sprite_zul1_2,
    
    sprite_amstrad,
    sprite_amstradTape,
    sprite_PrinceofPersia1_G,
    sprite_PrinceofPersia1_B,
    sprite_PrinceofPersia2_G,
    sprite_PrinceofPersia2_B,
    sprite_PrinceofPersia3,
    menu_selector
       
    
}ETiposSprite;

extern enum{
    mover_SinMovimiento,
    mover_Izquierda,
    mover_Arriba,
    mover_Derecha,
    mover_Abajo
}ETipoMovimiento;

extern enum{
    no_Hay_Colision,
    hay_Colision
}ETipoColision;


extern enum{
    posicion_Izquieda,
    posicion_Derecha
}ETipoPosicion;

extern enum{
    mover_roca,
    no_mover_roca
}ETipoMoverRoca;

extern enum{
    sin_Movimiento,
    mover_1,
    mover_Linea    
}ETipoMovimiento;

extern enum{
    sin_repeticion,
    con_repeticion        
}ETipoFlag;

extern enum {
    si,
    no
}ETipoHayPortal;

extern enum {
    coleccionable_activo,
    coleccionable_NOACTIVO
}ETipoActivacionColeccionable;

extern enum {
    no_pasa_nada,
    player_muere
}ETipoAccionesEnemigo;

extern enum {
    estado_Menu,
    estado_juego,
    estado_controles
}ETipoEstados;

extern enum{
    seguir_En_Nivel,    
    nivel_01,
    nivel_01_01,
    nivel_TRAP_01,
    nivel_02,
    nivel_03,
    nivel_04,
    nivel_04_01,
    nivel_05,
    nivel_06,
    nivel_07,
    nivel_08,
    nivel_08_01,
    niveltrap_02,
    nivel_09,
    nivel_09_01,
    nivel_09_02,
    nivel_09_03,
    nivel_trap_03,
    nivel_10,
    nivel_10_01,
    nivel_10_02,
    nivel_10_03,
    nivel_10_04,
    nivel_10_05,
    nivel_11,
    nivel_12,



    nivel_final


     
}ETipoNivel;

extern enum{
    sin_animacion,
    animacion_andar,
    animacion_roca_1,
    animacion_hole,
    animacion_muerte    
}ETipoAnimaciones;


#endif // DECLARACIONCONSTANTES