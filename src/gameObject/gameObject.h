
#include <cpctelera.h> 

typedef struct {
    u8 posx,posy;    
    u8 sprite;
    u8 cronoMovimiento;    
} TGameObject;


void dibujarGameObject(TGameObject* objeto);
void limpiarRastro(u8 posx, u8 posy);

void moverGameObject(TGameObject* objeto,u8 movimiento);
