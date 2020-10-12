#define     SinColision                     50
#define     ColisionNoRocas                 51
#define     RocasMaximas                    40 
#define     PuertasMaximas                  3
#define     ColeccionablesMaximos           3
#define     ColeccionablesMaximosTotales    50






extern enum{
    sprite_SinDefinir,
    sprite_Player,
    sprite_Rock,
    sprite_RockInmovil,
    sprite_RockLineal,
    sprite_Portal,
    sprite_Puerta,
    sprite_hole,
    sprite_luz,
    sprite_familia
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

