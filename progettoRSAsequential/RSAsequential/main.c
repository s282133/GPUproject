#include <stdio.h>
#include <stdlib.h>
#include <math.h>




long double miaPotenza(int base, int esponente);
double mioResto(long double c,long double n);
int numeroPrimo(int valore);
int confrontoCofattori(int *fattoriPhi,int *fattoriE,int indiceFattoriPhi,int indiceFattoriE);
int calcoloFattori(int numero, int *fattori);

int calcoloMegaPotenza(unsigned char *risultato,unsigned int esponente,unsigned int base);
unsigned int calcoloMegaResto(unsigned char *dividendo,unsigned int divisore, int byteTotali );
int confrontMegaNumeri(unsigned char *potenza,unsigned char *dividendo,int byteTotaliPotenza, int byteTotaliDividendo );
int shiftConfigurabileMegaNumeri(unsigned char *numero, int direzione, int byteTotaliNumero);
int sottrazioneMegaNumeri(unsigned char *minuendo,unsigned char *sottraendo, int byteTotaliMinuendo, int byteTotaliSottraendo );
void stampaMegaNumeri(unsigned char *numero,int byteTotaliNumero); // serve per debug
void stampaMegaNumeriResti(unsigned char *numero,int byteTotaliNumero); // serve per debug
int main()
{
    int p, q;  // saranno i numeri primi di partenza, calcolati dal nostro algoritmo
    int phi; // dove phi(n) = (p-1)(q-1)
    int n; // n= p*q
    int e ; // e viene scelto arbitrariamente minore di n, diverso da 1 e coprime a phi. In mathematics, two integers a and b are coprime, relatively prime or mutually prime if the only positive integer that is a divisor of both of them is 1.
    int d; // d deve essere tale che ed mod phi(n) = 1;
    int messaggio = 12;
    long int calcoloD;
    char messaggio1[5];
    char messaggio2[5];
     double codifica;
    long double decodifica;
    int i = 0;
    int flag =0;
    int fattoreMassimo;
    int divisioneIntera;
    float divisioneFloat;

    int fattoriPhi[20];
    int indiceFattoriPhi= 0;

    int fattoriE[20];
    int indiceFattoriE= 0;

    // per calcolo fattore d
    int passaggio1;
    int passaggio2Intera;
    float passaggio2Float;

    // per calcolo fattore d
    int multiplidi8;

    // risultato c elevato a D, serve per decodifica
    unsigned char *cAllaD;
    unsigned char *mAllaE;
    int numeroByte;
    int numeroByte2;
    // prova sottrazzione
    unsigned char *minuendo;
    unsigned char *sottraendo;
    int minuendoDIM = 2;

    // prova resto
    int resto;
    float arrotondamento;

    // inizializzo i vettori

     for(i=0; i< 20; i++) {
        fattoriPhi[i] = 0;
        fattoriE[i] = 0;

     }


    //

    //float risult
    p= 5,
    q = 3;

    phi = (p-1)*(q-1); // 8
    //fattoreMassimo = phi;
    indiceFattoriPhi = calcoloFattori(phi,fattoriPhi);
    // calcolo fattori phi https://people.revoledu.com/kardi/tutorial/BasicMath/Prime/Algorithm-PrimeFactor.html
  /* while(fattoreMassimo != 1){
    for (i=2; i <= fattoreMassimo; i++) {
            printf("fattoreMassimo : %d \n", fattoreMassimo);

        if ( numeroPrimo(i) == 1 ) {
             printf(" i numero primo = %d \n", i);
            divisioneIntera = fattoreMassimo / i ;
            divisioneFloat =  (float) fattoreMassimo / i;
            if(divisioneFloat == divisioneIntera) {

                printf("  divisione intera = %d \n", divisioneIntera);

                fattoriPhi[indiceFattoriPhi] = i;
                indiceFattoriPhi++;

                fattoreMassimo = divisioneIntera;
                break;
            }
        }
    }
   } */
  // fine calcolo fattori phi
    for(i=0; i< indiceFattoriPhi; i++ ) {

        printf("fattore = %d \n", fattoriPhi[i] );
    }
    // fin qui tutto bene
    n = p*q; // 15
    while ( flag == 0) {

        e =  rand() % n +2 ;

        // calcolo fattori e
        indiceFattoriE= calcoloFattori(e,fattoriE);
      /*  fattoreMassimo = e;
        while(fattoreMassimo != 1){
    for (i=2; i <= fattoreMassimo; i++) {
            printf("fattoreMassimo : %d \n", fattoreMassimo);

        if ( numeroPrimo(i) == 1 ) {
             printf(" i numero primo = %d \n", i);
            divisioneIntera = fattoreMassimo / i ;
            divisioneFloat =  (float) fattoreMassimo / i;
            if(divisioneFloat == divisioneIntera) {

                printf("  divisione intera = %d \n", divisioneIntera);

                fattoriE[indiceFattoriE] = i;
                indiceFattoriE++;

                fattoreMassimo = divisioneIntera;
                break;
            }
        }
    }
   } */
  // fine calcolo fattori e
  // inizio confronto cofattori e e phi https://protonstalk.com/basic-math/coprime-numbers/
    flag= confrontoCofattori(fattoriPhi,fattoriE,indiceFattoriPhi,indiceFattoriE);
    }

    printf("ho trovato e = %d \n",e);
   // calcolo fattore d
    e= 2003;
    phi = 5040;
   passaggio1 = e % phi;
   printf("passaggio1 = %d \n",passaggio1);
   flag = 0;
   i =1;
   while (flag == 0 ) {



      passaggio2Intera = (phi*i +1)/ passaggio1;
      passaggio2Float = (float) (((float) (phi*i +1))/( (float) passaggio1));
      printf("passaggio2Intera = %d \n",passaggio2Intera);
      printf("passaggio2Float = %f \n",passaggio2Float);

      if(passaggio2Intera == passaggio2Float) {

        flag = 1;
      } else {

        i++;
      }


   }
  d= passaggio2Intera;
  printf("d = %d \n",d);
  printf("resto calcolatoa mano:  %d \n", 8386561 % 5040);



   // fine calcolo fattore d
   // debug
 multiplidi8 = 8;
   for (i=1; i< 20; i++) {

     multiplidi8 = 8*i;
     printf("8 * %d = %d \n", i, multiplidi8);

   }
   printf("65 mod 8 = %d \n",65 % 8);
   printf("13 mod 8 = %d \n",13 % 8);

   // d = 5
   printf("13*5 mod 8 = %d \n",65 % 8 );
   printf("13*13 mod 8 = %d \n",169 % 8 );

    printf("Hello world, controllo che valori calcolati siano corretti!\n");
    messaggio = 12;
    n= 35;
    e = 5;
    d = 29;
    codifica =  powl(12.0,5.0);
    printf("codifica = %f \n",codifica);
    codifica = (int) codifica % n;
    printf("codifica = %f \n",codifica);

    //decodifica = powl( (long double) codifica,29.0) ;
    //decodifica = fmod(decodifica,n);
    //printf("decodifica = %f \n", mioResto(decodifica,35.0));
     printf("sizeof long int : %d \n", sizeof( unsigned int));
     mAllaE= (unsigned char *) malloc(sizeof( unsigned char) *131070); // è il massimo numero di byte che la potenza puo usare, con numeri di 16 bit
     cAllaD = (unsigned char *) malloc(sizeof( unsigned char) *131070); // è il massimo numero di byte che la potenza puo usare, con numeri di 16 bit
     //numeroByte= powerBigNumbers(cAllaD,29,17);  // prima esponente e poi la base

     //stampBigNumbers(cAllaD,numeroByte);
     //resto= moduleBignumbers(cAllaD,35,numeroByte);
     //printf("resto = %d \n", resto);
     // manca mod n

     //printf("resto 250 diviso 7:  %d \n", 83521 % 35);
     n=51533;
     e = 30011;
     flag=0;
     //d=2;
     while(flag== 0) {

            calcoloD= e*d;
        if(calcoloD % 49728 ==1) {
            flag=1;
        }
        d++;

     }
     d--;
     printf("d = %d \n",d);

    // messaggio1
     // n= 5183;
     // e = 2003;
     // d = 4187;
    //  n= 51533;
     // e= 30011;
      //d = 12275;
     // n= 3337;
     // e= 3;
     // d= 2147;
     n= 28321;
    e= 5;
     d= 11189;
      messaggio1[0] = 'c';
      messaggio1[1] = 'i';
      messaggio1[2] = 'a';
      messaggio1[3] = 'o';
      printf("messaggio1 = %d \n", (unsigned int) messaggio1[0]);
      //arrotondamento = 65534/65535;
     // arrotondamento = arrotondamento * 65535;
      //printf("operazione %d \n", 9764823 % 517);
     for(i=0; i < 4; i++) {

      numeroByte= powerBigNumbers(mAllaE,e,(unsigned int) messaggio1[i]);
    // stampBigNumbers(mAllaE,numeroByte);
      resto=  moduleBignumbersV2(mAllaE,n, numeroByte );
     // printf("resto = %d \n ",resto);
      numeroByte= powerBigNumbers(cAllaD,d,resto);
      resto=  moduleBignumbersV2(cAllaD,n, numeroByte );
      messaggio2[i] = resto;
     }
     printf("mi ha scritto = %s \n ",messaggio2);
     printf(" %f \n", log2(4));
     messaggio2[4] = '\0';

     //log(double x);
     // printf("mi ha scritto = %s \n ",messaggio2);
     // numeroByte2= powerBigNumbers(mAllaE,e,(unsigned int) messaggio1); // prima esponente e poi la base
     // stampBigNumbers(mAllaE,numeroByte2);

      //resto= moduleBignumbers(mAllaE,5183,numeroByte2);
      //printf("resto calcolatoa mano:  %d \n", 9509900499 % 35);
      //printf("messaggio1 = %d \n", (unsigned int) messaggio1);
     // printf("resto : = %d \n",resto);
     // numeroByte= powerBigNumbers(cAllaD,4187,(unsigned int)resto);
      //stampBigNumbers(cAllaD,numeroByte);
      //resto= moduleBignumbers(cAllaD,5183,numeroByte);
      //printf("resto = %d \n", resto);
      //printf("resto calcolatoa mano:  %d \n", 2003 % 5040);
      //printf("messaggio1 = %d \n", (unsigned int) messaggio1);
      //printf("resto calcolatoa mano:  %d \n", 9509900499 % 35);
      //codifica =  pow((unsigned int) messaggio1,5.0)
      //numeroByte= powerBigNumbers(cAllaD,29,codifica);
      //stampBigNumbers(cAllaD,numeroByte);
      //resto= moduleBignumbers(cAllaD,35,numeroByte);

    // printf("ritorna 1 se è primo, zero se è non primo= %d \n",numeroPrimo(59221)) ;
    //----------------------- prova shift

   /* minuendo= ( char *) malloc(sizeof( char) * 2);
       //sottraendo = ( char *) malloc(sizeof( char) * minuendoDIM);

       printf("ciao 1");
       minuendo[0] = (unsigned char) 254 ; // FE
       minuendo[1] = 254 ; // FE
       //minuendo[2] =  ; // 1
      // sottraendo[0] =255; // FF
       //sottraendo[1] = 3 ; // 03
       printf("ciao 2");

      shiftConfigurabileMegaNumeri(minuendo,1,2);
       for(i=0; i < 3; i++) {


        printf("risultato[%d] = %x \n",i, minuendo[i]);
       }

      */

    // --------------------- fine prova shift
//------------------ prova sottrazione
  /*     minuendo= ( char *) malloc(sizeof( char) * 3);
       sottraendo = ( char *) malloc(sizeof( char) * 1);

       printf("ciao 1");
       //minuendo[0] = (unsigned char) 254 ; // FE
       //minuendo[1] = 3 ; // 03
       //minuendo[2] = 1 ; // 1
       //sottraendo[0] =255; // FF
       //sottraendo[1] = 3 ; // 03

        minuendo[0] = 0;
        minuendo[1] = 0 ;
        minuendo[2] = 1 ;
        sottraendo[0] =1; // FF

       printf("ciao 2");
       messaggio= sottrazioneMegaNumeri(minuendo,sottraendo,3,1);

       for(i=0; i < 3; i++) {


        printf("risultato[%d] = %x \n",i, minuendo[i]);
       }
       printf("byteRisultato= %d \n",messaggio);
  */
//------------------ fine prova sottrazione
// --------------  prova resto
/*
 minuendo= ( char *) malloc(sizeof( char) * 2);
 sottraendo = ( char *) malloc(sizeof( char) * 1);
 minuendo[0] = 47;
 minuendo[1] = 13;
 //sottraendo[0] = 15;
 resto= calcoloMegaResto(minuendo,15,2);
 printf("resto : %d \n", resto);
 */
// -------------- fine prova resto
//     sottrazioneMegaNumeri();
     //calcoloMegaResto(cAllaD,35,numeroByte);
    //printf("ho ricevuto : %lf \n", ((long double) pow(codifica,d)) % n);

    return 0;
}


// funzione per verificare se un numero è primo! Per ora algoritmo di Miller- Rabin, ritorna 1 se è primo, zero se è non primo
int numeroPrimo(int N) {

    int numeriDaVerificare;
    int a;
    int b;
    int i;
    numeriDaVerificare = (N/4) +1;
    int t;
    int s=0;
    int Nmeno1;
    int divisioneIntera;
    float divisioneFloat;
    int flag= 1;
    int flagwitness = 0;

    printf("numeriDaverificare dato %d = %d \n",N,numeriDaVerificare);

    for(a=1; a<= numeriDaVerificare; a++) {  // prendo tutti gli a necessari
      flagwitness = 0;
     // calcolo N= 2^st
     Nmeno1 = N-1;
     while(flag == 1) {
     divisioneIntera = Nmeno1/2;
     divisioneFloat = (float) Nmeno1 /2;
     if(divisioneFloat == divisioneIntera) {
         s++;
         flag =1;
         Nmeno1= Nmeno1/2;
     } else {
        t= Nmeno1;
        flag =0;
     }
     }
     printf("t = %d \n",t);
     printf("s = %d \n",s);
    // fine calcolo N = 2^st
        b= ((int) pow(a,t)) % N;
        if( b == 1) { // l'algoritmo dice -1, ma come fa ad essere -1 se c e un a potenza?
            //return 1; non ritorna perche deve verificare tutti gli altri witness
            flagwitness = 1;
        }
        for(i=0; i<= s-1; i++) {

            b= ((int)pow(b,2)) % N;
            if(b == 1) { // l'algoritmo dice -1, ma come fa ad essere -1 se c e un a potenza?

               //return 1; non ritorna perche deve verificare tutti gli altri witness
               flagwitness = 1;
            }

        }

        if(flagwitness == 0) {

            return 0;
        }

    }
    return 1;  // tutti gli a non sono witness
 /*
 int i;
 int tabellaNumeriPrimi[6] ;

     tabellaNumeriPrimi[0] = 2;
     tabellaNumeriPrimi[1] = 3;
     tabellaNumeriPrimi[2] = 5;
     tabellaNumeriPrimi[3] = 7;
     tabellaNumeriPrimi[4] = 11;
     tabellaNumeriPrimi[5] = 13;

     for(i=0; i< 6; i++) {

        if(valore = tabellaNumeriPrimi[i]) {

            return 1;
        }

     }



 return 0;
 */
}
/*
confrontoCofattori controlla dato un elenco di due fattori di due numeri, se ci sono dei fattori in comune
ritorno:
1
0

*/
int confrontoCofattori(int *fattoriPhi,int *fattoriE,int indiceFattoriPhi,int indiceFattoriE){

   int i;
   int j;

   for(i=0; i< indiceFattoriPhi; i++) {
    for(j=0; j < indiceFattoriE; j ++) {

        if( fattoriPhi[i] == fattoriE[j]) {

            return 0;
        }

    }


   }

   return 1;


}

int calcoloFattori(int numero, int *fattori) {  // in pratica calcolo fattori calcola tutti i fattori di un numero e li mette in un vettore sovradimensionato: 4 scomposto in 2,2 . 8 spomosto in 2,2,2 . / scomposto in 7.

 int i;
 int fattoreMassimo;
 int divisioneIntera;
 float divisioneFloat;
 int indiceFattoriPhi=0;

  fattoreMassimo= numero;
while(fattoreMassimo != 1){
    for (i=2; i <= fattoreMassimo; i++) {
            printf("fattoreMassimo : %d \n", fattoreMassimo);

        if ( numeroPrimo(i) == 1 ) {
             printf(" i numero primo = %d \n", i);
            divisioneIntera = fattoreMassimo / i ;
            divisioneFloat =  (float) fattoreMassimo / i;
            if(divisioneFloat == divisioneIntera) {

                printf("  divisione intera = %d \n", divisioneIntera);

                fattori[indiceFattoriPhi] = i;
                indiceFattoriPhi++;

                fattoreMassimo = divisioneIntera;
                break;
            }
        }
    }
   }

    return indiceFattoriPhi;
}


long double miaPotenza(int base, int esponente){

   int i;
   long double baseLong;
   long double esponenteLong;
   long double ritorno=1;

   baseLong = (long double) base;
   esponenteLong = (long double) esponente;

   for(i=0; i <esponente; i++) {

     ritorno = ritorno * baseLong;

   }
   return ritorno;
}

double mioResto(long double c,long double n){

int flag=0;
long double var;
   var = c;

    while(n< var){

        n=n*10;
    }
    n= n/10;
   while(flag == 0) {

     if(var -n >= 0) {

        var= var -n;
     } else {

       return (double) var;
     }

   }



}


/*
questa funzione ha il compito di calcolare elevazioni ad esponenti il cui risultato occupa molti bit
input legali:
base massimo su 16 bit
esponente massimo su 16 bit
output: il risultato è un vettore di char che rappresenta un numero su N byte, la dimensione massima è 16*16/8 byte, ovvero 32 byte
ritorno: il numero di byte usati
*/
/*
int calcoloMegaPotenza(unsigned char *risultato,unsigned int esponente,unsigned int base) {

   int flag;
   int i;
   int j;
   int k;
   int decremento;
   unsigned int baseTemp;
   unsigned int esponenteTemp;
   unsigned int bitBase;
   unsigned int bitEsponente;
   unsigned int bitTotali;
   unsigned int supporto;
   unsigned int riporto;
   unsigned int riporto16Pari;
   unsigned int riporto16Dispari;
   unsigned int overflow;
   unsigned int overflowPari;
   unsigned int overflowDispari;
   unsigned char supportoParteBassa;
   unsigned char riportoParteBassa;

  // unsigned char *risultatoInt;

   if(esponente == 0 || base == 0) {


    return;
   }

   bitBase=0;
   baseTemp= base;
   while(baseTemp >0) {

    baseTemp= baseTemp >> 1;


    bitBase++;

   }

   bitEsponente=0;
   esponenteTemp= esponente;
   while(esponenteTemp >0) {

    esponenteTemp= esponenteTemp >> 1;


    bitEsponente++;

   }

   printf("bit esponente = %d \n",bitEsponente);
   printf("bit base  = %d \n",bitBase);

    if(esponente == 1) {

        if(bitBase <= 8) {

          // risultatoInt= (unsigned char *) malloc(sizeof( unsigned char) *1);

           risultato[0] = base;
          // risultatoInt[0] = base;
          // *risultato= risultatoInt;
          // printf("risultato[0] = %x \n",risultato[0] );
           return 1;
        } else {

           //risultatoInt= (unsigned char *) malloc(sizeof( unsigned char) *2);

           risultato[0] = base;
          // risultatoInt[0] = base;
          // printf("risultato[0] = %x \n",risultato[0] );
           base= base >> 8;
           risultato[1] = base;
           //risultatoInt[1] = base;
           //*risultato= risultatoInt;
           //printf("risultato[1] = %x \n",risultato[1] );
           return 2;
        }

    }

   // fino a qui tutto giusto
    bitTotali= bitBase* esponente ;
    if((bitTotali % 8) > 0 ) {

        bitTotali = bitTotali/8 +1;

    } else {

       bitTotali = bitTotali/8 ;

    }
    printf("byte da usare = %d \n",bitTotali);

    //risultatoInt= (unsigned char *) malloc(sizeof( unsigned char) * (bitTotali));

    for(i=0; i< bitTotali; i++) {
       // risultatoInt[i]=0;
        risultato[i]=0;
        printf("risultato[%d] = %d \n",i, risultato[i]);
    }



    if(bitBase <= 8) {
    // risultatoInt[0] = (unsigned int) base;
    risultato[0] = (unsigned int) base;
    printf("risultato con base: %d \n", (unsigned int) (risultato[0]));
    supporto=0;
        for(i=0; i< esponente-1; i++) {

         if(i==0 ) {

            //supporto= (unsigned int ) ((unsigned int) risultatoInt[0]) * base;
            supporto= (unsigned int ) ((unsigned int) risultato[0]) * base;
            printf("supporto = %d \n",supporto);
            //risultatoInt[0]= (unsigned char) supporto;
            risultato[0]= (unsigned char) supporto;
            supporto= supporto >> 8;
            //risultatoInt[1]= (unsigned char) supporto;
            risultato[1]= (unsigned char) supporto;
            //printf(" %d \n", (unsigned int) (risultato[0]));
            //printf(" %d \n", (unsigned int) (risultato[1]));
         } else {
         riporto=0;
         overflow=0;
         for(j=0; j < i; j++ ) {

                // supporto= ((unsigned int) risultatoInt[j]) * base; // supporto puo essere massimo di 16 bit
                supporto= ((unsigned int) risultato[j]) * base; // supporto puo essere massimo di 16 bit
               // printf("supporto = %d \n",supporto);
                supportoParteBassa= supporto;
                if( ((unsigned int) supportoParteBassa +  (unsigned int) riporto) > 255 ) {

                    overflow=1;
                   // printf("ciao overflow\n");
                }
                risultato[j]= (unsigned char) ( (unsigned int) supporto + (unsigned int) riporto);
                //risultatoInt[j]= (unsigned char) ( (unsigned int) supporto + (unsigned int) riporto);
                supporto= supporto >> 8;

                supporto = supporto + overflow;
                overflow=0;
                riporto = supporto;
               // printf("riporto = %d \n",riporto);
               // risultato[j+1]= supporto;
            }

            overflow=0;
            // supporto= ((unsigned int) risultatoInt[i]) * base;
            supporto= ((unsigned int) risultato[i]) * base;
            //printf("supporto = %d \n",supporto);

            supporto= supporto + riporto;
            //risultatoInt[i]= (unsigned char) supporto;
            risultato[i]= (unsigned char) supporto;
            supporto= supporto >> 8;
            supporto= supporto + overflow;
            // risultatoInt[i+1] = (unsigned char) supporto;
            risultato[i+1] = (unsigned char) supporto;

         }


        }

        // debug
            for(k=0; k <bitTotali; k++) {

                //printf("debug %x \n", (unsigned int) (risultatoInt[k]));
                printf("debug %x \n", (unsigned int) (risultato[k]));

            }

            // fine debug

    } else {

        //risultatoInt[0] = (unsigned int) base;
        risultato[0] = (unsigned int) base;
        //base = base >> 8;
        //risultatoInt[1] = (unsigned int) base >> 8;
        risultato[1] = (unsigned int) base >> 8;

        printf("risultato con base: %d \n", (unsigned int) (risultato[0]));
        supporto=0;

        for(i=0; i< esponente-1; i++) {

         if(i==0 ) {

            //supporto= (unsigned int ) ((unsigned int) risultatoInt[0]) * base;supporto= (unsigned int ) ((unsigned int) risultatoInt[0]) * base;
            supporto= (unsigned int ) ((unsigned int) risultato[0]) * base;
           // printf("supporto = %d \n",supporto);
            //riporto = (unsigned int ) ((unsigned int) risultatoInt[1]) * base;
            riporto = (unsigned int ) ((unsigned int) risultato[1]) * base;
            riporto = riporto << 8;
            supporto = riporto + supporto;
            //risultatoInt[0]= (unsigned char) supporto;
            risultato[0]= (unsigned char) supporto;
            supporto= supporto >> 8;
            //risultatoInt[1]= (unsigned char) supporto;
            risultato[1]= (unsigned char) supporto;
            supporto= supporto >> 8;
            //risultatoInt[2]= (unsigned char) supporto;
            risultato[2]= (unsigned char) supporto;
            supporto= supporto >> 8;
            // risultatoInt[3]= (unsigned char) supporto;
            risultato[3]= (unsigned char) supporto;

            //printf(" %d \n", (unsigned int) (risultato[0]));
            //printf(" %d \n", (unsigned int) (risultato[1]));
         } else {

            // printf("sono nel branch giusto \n");
         riporto=0;
         riporto16Pari=0;
         riporto16Dispari=0;
         overflow=0;
         overflowDispari=0;
         overflowPari=0;
         for(j=0; j < 2 + 2*i; j++ ) {


                //printf("base = %x \n",base);
                //printf("risultato[0] = %x \n",risultato[0]);
               // supporto= ((int) risultatoInt[j]) * base; // supporto puo essere massimo di 24 bit
                supporto= ((int) risultato[j]) * base; // supporto puo essere massimo di 24 bit
               // printf("supporto = %x \n",supporto);

                supportoParteBassa= supporto;
                riportoParteBassa= riporto;

                if(j % 2 == 0) {
                        if( ((unsigned int) supportoParteBassa +  (unsigned int) riportoParteBassa) > 255 ) {
                            overflowPari=overflowPari +1;
                        }
                        //risultatoInt[j]= (unsigned char) ( (unsigned int) supportoParteBassa + (unsigned int) riportoParteBassa );
                          risultato[j]= (unsigned char) ( (unsigned int) supportoParteBassa + (unsigned int) riportoParteBassa );
                        if( ((unsigned int) risultato[j] +  (unsigned int) riporto16Pari) > 255 ) {
                            overflowPari=overflowPari +1;
                        }
                        risultato[j]= (unsigned char) ( (unsigned int) risultato[j] + (unsigned int) riporto16Pari );
                        if( ((unsigned int) risultato[j] +  (unsigned int) overflowDispari) > 255 ) {
                            overflowPari=overflowPari +1;
                        }
                        risultato[j]= (unsigned char) ( (unsigned int) risultato[j] + (unsigned int) overflowDispari );
                        overflowDispari=0;
               // risultato[j]= (char) ( (unsigned int) supporto + (unsigned int) riporto + (unsigned int) riporto16Pari);
                } else {

                        if( ((unsigned int) supportoParteBassa +  (unsigned int) riportoParteBassa) > 255 ) {
                            overflowDispari=overflowDispari +1;
                        }
                        risultato[j]= (unsigned char) ( (unsigned int) supportoParteBassa + (unsigned int) riportoParteBassa );

                        if( ((unsigned int) risultato[j] +  (unsigned int) riporto16Dispari) > 255 ) {
                            overflowDispari=overflowDispari +1;
                        }
                        risultato[j]= (unsigned char) ( (unsigned int) risultato[j] + (unsigned int) riporto16Dispari );
                        if( ((unsigned int) risultato[j] +  (unsigned int) overflowPari) > 255 ) {
                            overflowDispari=overflowDispari +1;
                        }
                        risultato[j]= (unsigned char) ( (unsigned int) risultato[j] + (unsigned int) overflowPari );
                        overflowPari=0;

                //risultato[j]= (char) ( (unsigned int) supporto + (unsigned int) riporto + (unsigned int) riporto16PDispari);
                }
                supporto= supporto >> 8;

               // supporto = supporto + overflow;
               // overflow=0;
                riporto = supporto;
                if(j % 2 == 0) {
                riporto16Pari = riporto >> 8;
                } else {
                riporto16Dispari = riporto >> 8;

                }


               // printf("riporto = %d \n",riporto);
               // risultato[j+1]= supporto;
            }

           // overflow=0;
            //supporto= ((int) risultato[i]) * base;
            //printf("supporto = %d \n",supporto);

            //supporto= supporto + riporto;
            //risultato[i]= (char) supporto;
            //supporto= supporto >> 8;
            //supporto= supporto + overflow;
        if( (2 + 2*i) % 2 == 0) {
           // printf("indice pari \n");

            overflowPari=0;
            riporto16Dispari=0;
           // printf("riporto16Pari = %x \n",riporto16Pari);
            //printf("supporto = %x \n",supporto);
            //printf("overflowDispari = %x \n",overflowDispari);
            if( ((unsigned char) supporto  + (unsigned int) riporto16Pari) > 255 ) {
                overflowPari=1;
             //   printf("overflow viene aumentato 1 \n");
            }
            risultato[2 + 2*i] = (unsigned char) supporto  + (unsigned int) riporto16Pari ;

            if( (unsigned int) risultato[2 + 2*i]  + (unsigned int) overflowDispari > 255 ) {
             overflowPari = overflowPari+ 1;
             // printf("overflow viene aumentato 2 \n");
            }
            risultato[2 + 2*i] = (unsigned char) ( (unsigned int) risultato[2 + 2*i] + (unsigned int) overflowDispari );

            supporto= supporto >> 8;
            risultato[2 + 2*i +1] = (unsigned char) supporto  + (unsigned int) overflowPari ;
            }
            // debug
            for(k=0; k <bitTotali; k++) {

                printf(" %x \n", (unsigned int) (risultato[k]));

            }

            // fine debug
         }


        }




    }




  //*risultato= risultatoInt;
  // riaggiusto il numero di byte
  decremento=0;
  for(i=bitTotali-1; i >=0 ; i-- ) {

    if(risultato[i] == 0) {

        decremento++;
    } else {

     break;

    }

  }
  return bitTotali- decremento;
}
*/
/*
divisore massimo su 16 bit, quindi il resto è massimo su 16 bit
l unsigned int che torna è il resto

*/
/*
unsigned int  calcoloMegaResto(unsigned char *dividendo,unsigned int divisore, int byteTotali ) {


   unsigned int byteMaggiore;
   unsigned int salvaDivisore;
   unsigned char *potenza;
   int bitByteMaggiore;
   int bitDivisore;
   int i;
   int esponente;
   int byteTotaliPotenza;
   int confronto;
   unsigned int resto;

   int ritorno;

   potenza = (unsigned char *) malloc(sizeof( unsigned char) *256); // è il massimo numero di byte che la potenza puo usare, con numeri di 16 bit
   salvaDivisore= divisore;
   byteMaggiore= dividendo[byteTotali-1];
   bitByteMaggiore=0;
   resto= divisore +1;

   for(i=0; i< 8; i++) {

    if (byteMaggiore >0 ) {

     bitByteMaggiore=bitByteMaggiore+1;

    } else {

     break;
    }

    byteMaggiore= byteMaggiore >> 1;

   }

    bitByteMaggiore= bitByteMaggiore + (byteTotali-1)*8; // misura numero da dividere
    bitDivisore=0;

    for(i=0; i< 16; i++) {

    if ( salvaDivisore >0 ) {

     bitDivisore=bitDivisore+1;
    } else {

     break;
    }

    salvaDivisore = salvaDivisore >> 1;

   }

    if(bitByteMaggiore <bitDivisore ) {

        if(byteTotali== 2) {

            ritorno= dividendo[1];
            ritorno= ritorno << 8;
            ritorno= dividendo[0];
            return ritorno;
        }
            if(byteTotali== 1) {

             ritorno= dividendo[0];
             return ritorno;
        }
    }
    esponente= bitByteMaggiore/bitDivisore;
    byteTotaliPotenza= calcoloMegaPotenza(potenza,esponente,divisore);
    stampBigNumbers(potenza,byteTotaliPotenza);
    //printf("potenza[0] = %d \n", potenza[0]);
    //printf("potenza[1] = %d \n", potenza[1]);
     //confronto= confrontMegaNumeri(potenza,dividendo,byteTotaliPotenza,byteTotali);


    while(resto > divisore ){

        confronto= comparisonBigNumbers(potenza,dividendo,byteTotaliPotenza,byteTotali);
        while(confronto == 1) {

               if(esponente == 1) {

                 if(byteTotaliPotenza== 2) {

                    ritorno= potenza[1];
                    ritorno= ritorno << 8;
                    ritorno= potenza[0];
                    return ritorno;
                 }
                 if(byteTotaliPotenza== 1) {

                    ritorno= potenza[0];
                    return ritorno;
                 }
               } else {

               esponente --;
              // free(potenza);
               byteTotaliPotenza= calcoloMegaPotenza(potenza,esponente,divisore);
               stampBigNumbers(potenza,byteTotaliPotenza);
               confronto= comparisonBigNumbers(potenza,dividendo,byteTotaliPotenza,byteTotali);
               }
          //  sottrazioneMegaNumeri(unsigned char *minuendo,unsigned char *sottraendo, int byteTotaliMinuendo, int byteTotaliSottraendo )

        }

         if(confronto == 0) {

            return 0;
         }
         while (confronto == 2) {

             byteTotaliPotenza=shiftConfBigNumbers(potenza,1,byteTotaliPotenza);
             stampBigNumbers(potenza,byteTotaliPotenza);
             confronto= comparisonBigNumbers(potenza,dividendo,byteTotaliPotenza,byteTotali);

         }
         // siamo usciti e siamo maggiori, quindi è meglio tornare minori
         byteTotaliPotenza=shiftConfBigNumbers(potenza,0,byteTotaliPotenza);
         stampBigNumbers(potenza,byteTotaliPotenza);
         stampBigNumbers(dividendo,byteTotali);
         byteTotali= subtractionBigNumbers(dividendo,potenza,byteTotali,byteTotaliPotenza );
         printf("potenza[0] = %d \n",potenza[0]);
         stampBigNumbersReminder(dividendo,byteTotali);
         if(byteTotali <= 2) {

            if(byteTotali == 2) {


                resto = dividendo[1];
                resto = resto << 8;
                resto = resto + dividendo[0];
                if(resto <  divisore) {
                    return resto;
                }
            }
            if(byteTotali == 1) {

                resto = dividendo[0];
                if(resto <  divisore) {
                    return resto;
                }
            }
            if(byteTotali == 0) {  // non so se questo può succedere

                return 0;
            }

         }

         //esponente --;
         printf("ciao free di potenza \n");
         stampBigNumbers(potenza,byteTotaliPotenza);
         printf("byte totali potenza : %d \n",byteTotaliPotenza);
         //free(potenza);
         printf("ciao prima di potenza \n");
         byteTotaliPotenza= calcoloMegaPotenza(potenza,esponente,divisore);
         printf("ciao dopo  potenza \n");

    }



}
/*
/* ritorno:
0= numeri uguali
1= potenza maggiore di dividendo;
2 = potenza minore di dividendo;
*/
/*
int confrontoMegaNumeri(unsigned char *potenza,unsigned char *dividendo,int byteTotaliPotenza, int byteTotaliDividendo ){

 int i;
 unsigned int byteMaggiorePotenza;
 unsigned int byteMaggioreDividendo;
 int bitByteMaggiorePotenza;
 int bitByteMaggioreDividendo;


  if(byteTotaliPotenza > byteTotaliDividendo ) {

    return 1;

  } else {

   if(byteTotaliPotenza < byteTotaliDividendo ) {

        return 2;
  }
  }

  //byteMaggiorePotenza= potenza[byteTotaliPotenza-1];
  //byteMaggioreDividendo = dividendo[byteTotaliDividendo-1];


   for(i=byteTotaliPotenza-1; i>=0; i--) {

     byteMaggiorePotenza= potenza[i];
     byteMaggioreDividendo = dividendo[i];

     if( byteMaggiorePotenza > byteMaggioreDividendo) {

      return 1;

   } else {
     if(byteMaggiorePotenza <  byteMaggioreDividendo) {


        return 2;
     }


   }



   }

   return 0;

}
*/
/*
se il sottraendo è maggiore del minuendo deve stampare errore
Il risultato è nel minuendo, inoltre la dimensione del minuendo puo diminuire, quindi viene ricalcolata e ritornata

*/
/*
int sottrazioneMegaNumeri(unsigned char *minuendo,unsigned char *sottraendo, int byteTotaliMinuendo, int byteTotaliSottraendo ){


  int i;
  int k;
  int byteVuoti;
  unsigned int byteMinuendo;
  unsigned int bitAggiuntivoMinuendo;
  unsigned int byteSottraendo;
  int riporto;

  if(byteTotaliMinuendo < byteTotaliSottraendo ) {

    printf("errore, sottraendo maggiore del minuendo \n");

    return 0;
  }
  // tecnicamente i byte del sottraendo da qui in poi sono minori o uguali al minuendo
  riporto=0;
  bitAggiuntivoMinuendo = 256;
  for(i=0;i< byteTotaliSottraendo ; i++) {

    byteMinuendo= minuendo[i];
    byteSottraendo= sottraendo[i];

    byteMinuendo= byteMinuendo - riporto;

    if( byteMinuendo < byteSottraendo) {

        byteMinuendo = byteMinuendo + bitAggiuntivoMinuendo;
        riporto =1;
    } else {

        riporto =0;
    }
     minuendo[i]= byteMinuendo - byteSottraendo;


  }

  if(riporto == 1) {

        for(k=i;k <byteTotaliMinuendo; k++ ) {

            if(minuendo[k] != 0) {

                minuendo[k] = minuendo[k] -1;
                break;
            }
            minuendo[k] = 255;
        }



  }

// per mantenere l'informazione della lunghezza riconto il numero di byte non a zero


  byteVuoti=0;
 for(k=byteTotaliMinuendo-1;k >=0 ; k-- ) {

        if(minuendo[k] == 0) {

            byteVuoti++;
        } else {

         break;
        }

 }

 byteTotaliMinuendo= byteTotaliMinuendo- byteVuoti;
   //realloc(minuendo,byteTotaliMinuendo);
  return byteTotaliMinuendo;
}
*/
/*
input:
direzione:
1 = shift a sinistra
0 = shift a destra, // attenzione, se numero dispari si perde ultimo bit!!
numero : byte da shiftare
byteTotaliNumero: lunghezza in byte del numero
output: numero shiftato
il ritorno è la nuova dimensione in byte del numero
*/
/*
int shiftConfigurabileMegaNumeri(unsigned char *numero, int direzione, int byteTotaliNumero) {

   int i;
   int ritorno;

    ritorno= byteTotaliNumero;
  if(direzione == 1) {

        if(((unsigned int) numero[byteTotaliNumero-1]) > 128) {

           // realloc(numero,byteTotaliNumero+1);
            ritorno= byteTotaliNumero+1;
            numero[byteTotaliNumero]= 1;
            printf("numero = %d \n",numero[byteTotaliNumero] );
            numero[byteTotaliNumero-1] = numero[byteTotaliNumero-1] << 1;
            printf("numero = %d \n",numero[byteTotaliNumero-1] );
        } else {

           numero[byteTotaliNumero-1] = numero[byteTotaliNumero-1] << 1;

        }

    for(i=byteTotaliNumero-2; i>= 0; i-- ) {

        if(((unsigned int) numero[i]) >= 128) {
            //byteTotaliNumero= byteTotaliNumero+1;
            //realloc(numero,byteTotaliNumero+1);
            numero[i+1]= numero[i+1]+ 1;
            numero[i] = numero[i] << 1;
        } else {

            numero[i] = numero[i] << 1;
        }


    }

  }
  if(direzione == 0) { // attenzione, se numero dispari siperde ultimo bit!!


    for(i=0; i< byteTotaliNumero; i++ ) {

       if(i > 0) {
        if(((unsigned int) numero[i]) % 2 == 1) {
            //byteTotaliNumero= byteTotaliNumero+1;
            //realloc(numero,byteTotaliNumero+1);
            numero[i-1]= numero[i-1]+ 128;
            numero[i] = numero[i] >> 1;
        } else {

            numero[i] = numero[i] >> 1;
        }

    } else { // se si volesse salvare il bit perso bisognerebbe modificare qui

       numero[i] = numero[i] >> 1;
    }


    }

     if(numero[byteTotaliNumero-1] == 0) {
        ritorno = byteTotaliNumero-1; // ma attenzione, cosi abbiamo un byte in piu allocato che è inutile, non dovrebbe essere un problema
     } else {
      ritorno =byteTotaliNumero;
     }

  }
  if(direzione != 0 && direzione != 1) {


    printf("shift non valido \n");
  }


  return ritorno;
}
*/
/*void stampaMegaNumeri(unsigned char *numero,int byteTotaliNumero){


     int i;
     printf("stampaMegaNumeri : ");
     for(i=0; i<byteTotaliNumero; i++ ) {


        printf("%x \n",numero[i]);
     }


}
*/

/*
void stampaMegaNumeriResti(unsigned char *numero,int byteTotaliNumero){

 int i;
     printf("RESTO = : ");
     for(i=0; i<byteTotaliNumero; i++ ) {


        printf("%x \n",numero[i]);
     }

}
*/
