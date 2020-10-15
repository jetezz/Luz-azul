#include <cpctelera.h>
#define numDialogosTotales      50


typedef struct {
    u8 id;
    u8 nivel;   
    u8 pasos;          
} TDialogo;

static void (*dialogos[numDialogosTotales]) ();
extern u8 contadorDialogos;
extern TDialogo dialogosTotales[numDialogosTotales];


void initDialogos();
void managerDialogo(u8 nivel, u8 pasos);
void anadirDialogo(u8 id, u8 nivel,u8 pasos);



//dialogosxniveles
void dialogosNivel0();
//dialogos
void dialogo0();
void dialogo1();
