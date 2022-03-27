#include "bigNumbers.h"

/* for debug purpose */
void stampBigNumbersReminder(unsigned char *numero,int byteTotaliNumero){

 int i;
     printf("RESTO = : ");
     for(i=0; i<byteTotaliNumero; i++ ) {


        printf("%x \n",numero[i]);
     }

}

/* for debug purpose */
void stampBigNumbers(unsigned char *numero,int byteTotaliNumero){


     int i;
     printf("stampaMegaNumeri : ");
     for(i=0; i<byteTotaliNumero; i++ ) {


        printf("%x \n",numero[i]);
     }


}
/*
This function shifts the number numero of 1 position on right or on left.
1 = shift on left (this input is direzione)
0 = shift on right
byteTotaliNumero is the lenght of numero
The result shift is in numero, it return the new lenght of numero
*/
int shiftConfBigNumbers(unsigned char *numero, int direzione, int byteTotaliNumero) {

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
/*
this function subtract sottraendo from minuendo. byteTotaliMinuendo is the lenght of minuendo, byteTotaliSottraendo is the lenght of sottraendo
the result is in minuendo.
It returns the new lenght of minuendo

*/
int subtractionBigNumbers(unsigned char *minuendo,unsigned char *sottraendo, int byteTotaliMinuendo, int byteTotaliSottraendo ){


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

/*
This function compoares 2 numbers, potenza and dividendo. byteTotaliPotenza is the lenght of potenza and  byteTotaliDividendo is the lenght of dividendo
Return:
0= numeri uguali
1= potenza maggiore di dividendo;
2 = potenza minore di dividendo;
*/
int comparisonBigNumbers(unsigned char *potenza,unsigned char *dividendo,int byteTotaliPotenza, int byteTotaliDividendo ){

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
/*
This function calculate the modulus between dividendo and divisore, bytetotaly is the lenght of dividendo in byte
The modulo is returned.
divisore is max on 16 bits, otherwise it doesn't work, the modulo is also on 16 bits max
*/
unsigned int  moduleBignumbers(unsigned char *dividendo,unsigned int divisore, int byteTotali ) {


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

   potenza = (unsigned char *) malloc(sizeof( unsigned char) *131070); // è il massimo numero di byte che la potenza puo usare, con numeri di 16 bit
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
    byteTotaliPotenza=  powerBigNumbers(potenza,esponente,divisore);
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
               byteTotaliPotenza=  powerBigNumbers(potenza,esponente,divisore);
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
         //printf("potenza[0] = %d \n",potenza[0]);
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
         //printf("ciao free di potenza \n");
         stampBigNumbers(potenza,byteTotaliPotenza);
         //printf("byte totali potenza : %d \n",byteTotaliPotenza);
         //free(potenza);
        // printf("ciao prima di potenza \n");
         byteTotaliPotenza=  powerBigNumbers(potenza,esponente,divisore);
        // printf("ciao dopo  potenza \n");

    }



}

/*
this function calculate the power with the base base and the esponent esponente. Base and esponente are allowed from 0 to 16 bits
The return is the lenght of risultato in bytes, Risultato keep the result.
*/
int powerBigNumbers(unsigned char *risultato,unsigned int esponente,unsigned int base) {

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


    return 0;
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

   //printf("bit esponente = %d \n",bitEsponente);
   //printf("bit base  = %d \n",bitBase);

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
    //printf("byte da usare = %d \n",bitTotali);

    //risultatoInt= (unsigned char *) malloc(sizeof( unsigned char) * (bitTotali));

    for(i=0; i< bitTotali; i++) {
       // risultatoInt[i]=0;
        risultato[i]=0;
       // printf("risultato[%d] = %d \n",i, risultato[i]);
    }



    if(bitBase <= 8) {
    // risultatoInt[0] = (unsigned int) base;
    risultato[0] = (unsigned int) base;
    //printf("risultato con base: %d \n", (unsigned int) (risultato[0]));
    supporto=0;
        for(i=0; i< esponente-1; i++) {

         if(i==0 ) {

            //supporto= (unsigned int ) ((unsigned int) risultatoInt[0]) * base;
            supporto= (unsigned int ) ((unsigned int) risultato[0]) * base;
          //  printf("supporto = %d \n",supporto);
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
            /* if((unsigned int) supporto +  (unsigned int) riporto > 255 ) {

                    overflow=1;
            } */
            supporto= supporto + riporto;
            //risultatoInt[i]= (unsigned char) supporto;
            risultato[i]= (unsigned char) supporto;
            supporto= supporto >> 8;
            supporto= supporto + overflow;
            // risultatoInt[i+1] = (unsigned char) supporto;
            risultato[i+1] = (unsigned char) supporto;

         }

          /*  for(j=0; j <= i; j++ ) {

                supporto= ((int) risultato[j]) * base; // supporto puo essere massimo di 16 bit
                printf("supporto = %d \n",supporto);
                risultato[j]= (char) supporto;
                supporto= supporto >> 8;
                riporto = supporto;
               // risultato[j+1]= supporto;
            }
             */
        }

        // debug
           // for(k=0; k <bitTotali; k++) {

                //printf("debug %x \n", (unsigned int) (risultatoInt[k]));
              //  printf("debug %x \n", (unsigned int) (risultato[k]));

          //  }

            // fine debug

    } else {

        //risultatoInt[0] = (unsigned int) base;
        risultato[0] = (unsigned int) base;
        //base = base >> 8;
        //risultatoInt[1] = (unsigned int) base >> 8;
        risultato[1] = (unsigned int) base >> 8;

      //  printf("risultato con base: %d \n", (unsigned int) (risultato[0]));
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
                /*supportoParteBassa= supporto;
                if( ((unsigned int) supportoParteBassa +  (unsigned int) riporto) > 255 ) {

                    overflow=1;
                    printf("ciao overflow\n");
                } */
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
            /* if((unsigned int) supporto +  (unsigned int) riporto > 255 ) {

                    overflow=1;
            } */
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
          //  for(k=0; k <bitTotali; k++) {

           //     printf(" %x \n", (unsigned int) (risultato[k]));

         //   }

            // fine debug
         }

          /*  for(j=0; j <= i; j++ ) {

                supporto= ((int) risultato[j]) * base; // supporto puo essere massimo di 16 bit
                printf("supporto = %d \n",supporto);
                risultato[j]= (char) supporto;
                supporto= supporto >> 8;
                riporto = supporto;
               // risultato[j+1]= supporto;
            }
             */
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
/*


*/
unsigned int  moduleBignumbersV2(unsigned char *dividendo,unsigned int divisore, int byteTotali ) {

    // controllo su quanti bit è il divisore
    //unsigned int
    int i;
    unsigned int dividendoMini;
    unsigned int restoMini;
    if(divisore > 255) {


       if(byteTotali % 2 == 1) {

           restoMini = dividendo[byteTotali-1];

        for(i=byteTotali-2; i>=0; i= i-2 ) {

            dividendoMini = restoMini;
            dividendoMini = dividendoMini << 8;
            dividendoMini = dividendoMini+ dividendo[i];
            dividendoMini = dividendoMini << 8;
            //printf(" %x \n", dividendoMini);
            dividendoMini = dividendoMini + dividendo[i-1];

            restoMini = dividendoMini % divisore;

        }

       } else {

        restoMini =0;
        for(i=byteTotali-1; i>=0; i= i-2 ) {

            dividendoMini = restoMini;
            dividendoMini = dividendoMini << 8;
            dividendoMini = dividendoMini+ dividendo[i];
            dividendoMini = dividendoMini << 8;
            //printf(" %x \n", dividendoMini);
            dividendoMini = dividendoMini + dividendo[i-1];

            restoMini = dividendoMini % divisore;

        }


       }



    } else {




    }


    return restoMini;

}
