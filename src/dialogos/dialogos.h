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


void initDialogos(u8* pasos, u8* pasos2,u8* muertes,u8* muertes2);
void managerDialogo(u8 nivel, u8 pasos);
void anadirDialogo(u8 id, u8 nivel,u8 pasos);



//dialogosxniveles
void dialogosNivel1();
void dialogosNivel01_01();

//dialogos
void dialogopasos();
void dialogosMuertes();
void dialogo0();
void dialogo1();
