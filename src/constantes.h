#define     SinColision                 50
#define     RocasMaximas                5  

extern enum{
    tipo_Player,
    tipo_RocaNormal
}ETiposGameObject;

extern enum{
    sprite_SinDefinir,
    sprite_Player,
    sprite_Rock
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