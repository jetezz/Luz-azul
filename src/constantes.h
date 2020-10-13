#define     SinColision                     50
#define     ColisionNoRocas                 51
#define     RocasMaximas                    40 
#define     PuertasMaximas                  3
#define     ColeccionablesMaximos           3
#define     ColeccionablesMaximosTotales    50






extern enum{
    sprite_SinDefinir,
    sprite_Player,
    sprite_Rock_G,
    sprite_Rock_B,    
    sprite_RockInmovil1_G,
    sprite_RockInmovil1_B,
    sprite_RockInmovil2_G,
    sprite_RockInmovil2_B,
    sprite_RockInmovil3_G,
    sprite_RockInmovil3_B,
    sprite_RockInmovil4_G,
    sprite_RockInmovil4_B,
    sprite_RockLineal1_G,
    sprite_RockLineal1_B,
    sprite_PortalMuro,
    sprite_PuertaPortal_G,
    sprite_PuertaPortal_B,
    sprite_Puerta_G,
    sprite_Puerta_B,
    sprite_hole,
    sprite_luz,
    sprite_familia1,
    sprite_familia2,
    sprite_familia3,
    sprite_familia4,
    sprite_amstrad,
    sprite_amstradTape,
    sprite_PrinceofPersia1_G,
    sprite_PrinceofPersia1_B,
    sprite_PrinceofPersia2_G,
    sprite_PrinceofPersia2_B,
    sprite_PrinceofPersia3 
       
    
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

extern enum{
    seguir_En_Nivel,
    nivel_1,
    nivel_2    
}ETipoNivel;

