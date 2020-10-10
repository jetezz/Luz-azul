#define     SinColision                 50
#define     ColisionNoRocas             51
#define     RocasMaximas                40 
#define     PuertasMaximas              3



extern enum{
    sprite_SinDefinir,
    sprite_Player,
    sprite_Rock,
    sprite_RockInmovil,
    sprite_RockLineal,
    sprite_Portal,
    sprite_Puerta,
    sprite_hole
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

extern enum{
    seguir_En_Nivel,
    nivel_1,
    nivel_2    
}ETipoNivel;

