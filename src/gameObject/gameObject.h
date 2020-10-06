
#include <cpctelera.h> 

typedef struct {
    u8 num;
    u8 posx,posy;    
    u8 sprite;
    u8 cronoMovimiento;    
} TGameObject;

static TGameObject* P_portal;


 
void initGameobjest(TGameObject* portales);



void dibujarGameObject(TGameObject* objeto);
void limpiarRastro(u8 posx, u8 posy);

void moverGameObject(TGameObject* objeto,u8 movimiento, TGameObject* rocas,TGameObject* rocasEspejo,u8* posicion);
u8 comprobarColisiones(u8 posx,u8 posy,TGameObject* rocas);
void moverElEspejo(u8 num,u8 movimiento,TGameObject* rocasEspejo,u8 posicion);
u8 comprobarPortales(TGameObject* objeto,u8* posx,u8* posy,u8 movimiento,u8* posicion);
void cambiarPosicion(u8* posicion);


//movimientos
void movimientoSimple(u8* posx, u8* posy,u8 movimiento);
