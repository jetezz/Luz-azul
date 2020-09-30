
#include <cpctelera.h> 

typedef struct {
    u8 posx,posy;
    u8 tipo;
    u8 sprite;
} TGameObject;


void dibujarGameObject(TGameObject* objeto);
