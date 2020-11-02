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



//dialogos
void dialogopasos();
void dialogosMuertes();
void dialogoMapas(u8 nivel);

void dialogovacio();
//nivel 01

void dialogo01_0();
void dialogo01_2();

//nivel 01_01
void dialogo01__01_0();

//nivel02
void dialogo02_0();

//nivel trap1
void dialogotrap1_0();

//nivel03
void dialogo03_0();

//nivel04
void dialogo04_0();
void dialogo04_1();

//nivel 05
void dialogo05_0();

//nivel 06
void dialogo06_0();

//nivel 07 
void dialogo07_0();

//nivel 08
void dialogo08_0();

//nivel 08_01
void dialogo08_01_0();

//nivel 09
void dialogo09_0();

//nivel 10
void dialogo10_0();

//nivel 11
void dialogo11_0();

//nivel 12
void dialogo12_0();

//nivel 13
void dialogo13_0();

//nivel 14
void dialogo14_0();

//nivel 15
void dialogo15_0();






















