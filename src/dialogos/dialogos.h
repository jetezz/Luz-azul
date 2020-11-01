#include <cpctelera.h>
#define numDialogosTotales      100


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



//dialogos
void dialogopasos();
void dialogosMuertes();
void dialogoMapas(u8 nivel);

void dialogovacio();
void dialogo01_0();
void dialogo01_3();
void dialogo01_6();
void dialogo01_9();
void dialogo01_15();
void dialogo01_20();







