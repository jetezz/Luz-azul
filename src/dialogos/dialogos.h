#include <cpctelera.h>
#define numDialogosTotales      63


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
void dialogo01_1();
void dialogo01_2();

//nivel 01_01
void dialogo01__01_0();
void dialogo01__01_1();
void dialogo01__01_2();
//nivel02
void dialogo02_0();
void dialogo02_1();
void dialogo02_2();

//nivel trap1
void dialogotrap1_0();
void dialogotrap1_1();
//nivel03
void dialogo03_0();
void dialogo03_1();
void dialogo03_2();
//nivel04
void dialogo04_0();
void dialogo04_1();
//nivel 05
void dialogo05_0();

//nivel 06
void dialogo06_0();

//nivel 07 
void dialogo07_0();
void dialogo07_1();
void dialogo07_2();
//nivel 08
void dialogo08_0();
void dialogo08_2();

//nivel 08_01
void dialogo08_01_0();
void dialogo08_01_1();
void dialogo08_01_2();
//nivel 09
void dialogo09_0();
void dialogo09_1();
void dialogo09_2();
void dialogo09_3();

//nivel 10
void dialogo10_0();
void dialogo10_1();
void dialogo10_2();
void dialogo10_3();

//nivel 11
void dialogo11_0();
void dialogo11_1();

//nivel 12
void dialogo12_0();
void dialogo12_1();
//nivel 13
void dialogo13_0();
void dialogo13_1();
void dialogo13_2();
void dialogo13_3();
//nivel 14
void dialogo14_0();
void dialogo14_1();
//nivel 15
void dialogo15_0();
void dialogo15_1();


//nivel 16
void dialogo16_0();
void dialogo16_1();

//nivel 17
void dialogo17_0();

//nivel 18
void dialogo18_0();

//nivel 19
void dialogo19_0();
void dialogo19_1();

//nivel 20
void dialogo20_0();
void dialogo20_1();
void dialogo20_2();
void dialogo20_3();
void dialogo20_4();





//nivel 10_5

void dialogo10_05_0();























