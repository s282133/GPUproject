
#include <stdio.h>
#include <stdlib.h>
//#include <math.h>
/*
__global__ void memoriaGlobale(double *d, int n, int numeroBlocchi)
{
 // __shared__ int s[n];
	int i;

  int t = (blockIdx.x*blockDim.x)+threadIdx.x;
  //printf("t : %d \n",t);
  //int tr = n-t-1;
  //d[t] = t ;
   // printf("t : %d \n", t);
   d[t*16] = t*16 ;
   d[t*16+1] = t*16+1 ;
   d[t*16+2] = t*16+2 ;
   d[t*16+3] = t*16+3 ;
   d[t*16+4] = t*16+4 ;
   d[t*16+5] = t*16+5 ;
   d[t*16+6] = t*16+6 ;
   d[t*16+7] = t*16+7 ;
   d[t*16+8] = t*16+8 ;
   d[t*16+9] = t*16+9 ;
   d[t*16+10] = t*16+10 ;
   d[t*16+11] = t*16+11 ;
   d[t*16+12] = t*16+12 ;
   d[t*16+13] = t*16+13 ;
   d[t*16+14] = t*16+14 ;
   d[t*16+15] = t*16+15 ;
   //printf("d : %f \n", d[t*16+15]);
   printf("error \n");
   for(i=0; i< 16; i++ ) {

	   if(d[t*16+i] != t*16+i) {
		   printf("error \n");
	   }
   }
  // __syncthreads();
  // d[t] = s[tr];
}

__global__ void memoriaShared(double *d, int *giapassati)
{
  //extern __shared__ int s[];
	const int dimMEM = 6144; // perche 6144 è la dimewnsione massima
	const int blocchiDa16 = 100; // 6144/16; // da 16 perche ogni thread lavora su 16 dati
	__shared__ double s[dimMEM];
	//int permessi[blocchiDa16];
	int tArrotondato;
	int i;
	int var=1;
	int contagiapassati=0;
	int controllo=0;


  int t = (blockIdx.x*blockDim.x)+threadIdx.x;
 // if(t < blocchiDa16) {

	//  printf("t generati minori di 100 : %d \n",t);
  //}
  //printf("\n");
  //printf("\n");


   if(t == 97 ) {

  	   printf("ciao sono 97 prima \n ");
     }


   tArrotondato= t % (blocchiDa16);

   if(t == 97 ) {

     	   printf("ciao sono 97 dopo \n tArrotondato = %d \n", tArrotondato);
        }
   //__syncthreads();
  while(t >= blocchiDa16*var) {
	  if(t == 97 ) {

	  	   printf("ciao sono 97 in while \n ");
	     }
  }
   if(t == 97 ) {

	   printf("ciao sono 97 dopo dopo \n ");
   }

  giapassati[tArrotondato] = giapassati[tArrotondato] +1;
  printf("t che è riuscito a passare : %d, contagiapassati : %d \n",tArrotondato, giapassati[tArrotondato]);
   //permessi[tArrotondato] =1;


  s[tArrotondato*16] = t*16;
  s[tArrotondato*16 +1] = t*16 + 1;
  s[tArrotondato*16 +2] = t*16 + 2;
  s[tArrotondato*16 +3] = t*16 + 3;
  s[tArrotondato*16 +4] = t*16 + 4;
  s[tArrotondato*16 +5] = t*16 + 5;
  s[tArrotondato*16 +6] = t*16 + 6;
  s[tArrotondato*16 +7] = t*16 + 7;
  s[tArrotondato*16 +8] = t*16 + 8;
  s[tArrotondato*16 +9] = t*16 + 9;
  s[tArrotondato*16 +10] = t*16 + 10;
  s[tArrotondato*16 +11] = t*16 + 11;
  s[tArrotondato*16 +12] = t*16 + 12;
  s[tArrotondato*16 +13] = t*16 + 13;
  s[tArrotondato*16 +14] = t*16 + 14;
  s[tArrotondato*16 +15] = t*16 + 15;
   // __syncthreads();


  d[t*16] = s[tArrotondato*16];
  d[t*16+1] = s[tArrotondato*16+1];
  d[t*16+2] = s[tArrotondato*16+2];
  d[t*16+3] = s[tArrotondato*16+3];
  d[t*16+4] = s[tArrotondato*16+4];
  d[t*16+5] = s[tArrotondato*16+5];
  d[t*16+6] = s[tArrotondato*16+6];
  d[t*16+7] = s[tArrotondato*16+7];
  d[t*16+8] = s[tArrotondato*16+8];
  d[t*16+9] = s[tArrotondato*16+9];
  d[t*16+10] = s[tArrotondato*16+10];
  d[t*16+11] = s[tArrotondato*16+11];
  d[t*16+12] = s[tArrotondato*16+12];
  d[t*16+13] = s[tArrotondato*16+13];
  d[t*16+14] = s[tArrotondato*16+14];
  d[t*16+15] = s[tArrotondato*16+15];


 // permessi[tArrotondato] =0;
   if(t  == blocchiDa16*var -1) {
       controllo=0;



       while(controllo == 0) {
    	   controllo=1;
    	   for(i=0;i< blocchiDa16; i++) {

    		   if(giapassati[i] ==  0) {
    			   controllo = 0;
    			 //  printf("giapassati[%d] è ancora a zero \n",i);
    		   }
    	   }

       }

	   //var= var+1;
	   printf("sono T  = %d , var = %d, dovrei incrementare var \n",t,var);
   }
}

*/

__global__ void powerBigNumbersGPUShared(unsigned char *risultato,int *vettoriSupporto, unsigned int esponente,unsigned int base) {

	//__shared__ unsigned char risultatoTot[4096];
	//__shared__ unsigned char vettoriSupporto[9][4096];
	int n =131070;
	int t= blockIdx.x*blockDim.x+threadIdx.x;
	int dato1;
    int dato2;
    int risultatoStep;
    int threadUtili;
    int potenze2;
    int contapotenze;
    unsigned char parteBassaBase;
    unsigned char parteAltaBase;
    int i;
    int j;
    int k;
    int passi;
    int sommo2;
    int sottraggo1;
    unsigned int supporto;
    unsigned int riporto;
    unsigned int riporto16Pari;
    unsigned int riporto16Dispari;
    unsigned int overflow;
    unsigned int overflowPari;
    unsigned int overflowDispari;
    unsigned char supportoParteBassa;
    unsigned char riportoParteBassa;
   // risultato[0]=0;
    //risultato[1]=0;

   // dato1= risultato[0];
   // dato2 = risultato[1];
   // moltiplicazione= dato1*dato2;

	/*if(t == 0) {

		printf("ciaojsdnk \n");
		printf("moltiplicazione = %d \n",moltiplicazione);
	} */

   // printf("variabili 00 = %d \n",variabili[0]);
   // printf("variabili 00 = %d \n",variabili[1]);
	threadUtili = esponente /2;
		if(esponente % 2 == 1) {
			threadUtili++;
		}
		//debug
		/*if(t== 0){

			printf("thread utili = %d \n",threadUtili);
		} */
		//fine debug

		// la funzionew log non va
		potenze2=2;
		contapotenze=1;
		i=0;
		while(i== 0) {

			if(esponente < potenze2) {
				i=1;
			} else {
				potenze2=potenze2*2;
				contapotenze++;
			}
		}


		//risultatoLog = log2(esponente);
		//risultatoLogInt = log2(esponente);
		/*if(risultatoLog > risultatoLogInt) {

			risultatoLogInt = risultatoLogInt +1;
		} */
		passi=contapotenze ;
		//debug
			if(t== 0){

				printf("pasi utili = %d \n",passi);
			}
			//fine debug
			parteBassaBase = base;
			base = base >> 8;
			parteAltaBase = base;
			//debug
			if(t== 0){

						printf("parte bassa base = %x \n",parteBassaBase);
						printf("parte alta base = %x \n",parteAltaBase);
		     }

			// inizializzazione vettore con tutte le basi

					if(t < threadUtili - 1) {
					risultato[t*4] = parteBassaBase;
					risultato[t*4 +1] = parteAltaBase;
					risultato[t*4 +2] = parteBassaBase;
					risultato[t*4 +3] = parteAltaBase;
					} else {

						risultato[t*4] = 0;
					    risultato[t*4 +1] = 0;
						risultato[t*4 +2] = 0;
					    risultato[t*4 +3] = 0;
					}

					if(t == threadUtili - 1) {

						if(esponente % 2 == 1) { // se l'esponente è dispari un thread ha solo mezzo dato
							risultato[t*4] = parteBassaBase;
							risultato[t*4 +1] = parteAltaBase;
							risultato[t*4 +2] = 0;
							risultato[t*4 +3] = 0;

						} else { // se l'esponente è pari è tutto ok

							risultato[t*4] = parteBassaBase;
							risultato[t*4 +1] = parteAltaBase;
							risultato[t*4 +2] = parteBassaBase;
							risultato[t*4 +3] = parteAltaBase;

						}
					}
			       __syncthreads();
			//fine debug

	   if(t < threadUtili ) {


		for(i=0; i < passi; i++) {

			if(i== 0){

			    	 dato1= risultato[t*4 +1];
			    	 dato1 = dato1 << 8;
			    	 dato1= dato1 + risultato[t*4];
			    	 dato2= risultato[t*4 +3];
			    	 dato2 = dato2 << 8;
			    	 dato2= dato2 + risultato[t*4 +2];
			    	 //dato1 = dato1*dato2; a quanto pare se non riuso dato1 non funziona, e non so il perche
			    	 if(t== 0){

			    		 printf("dato1 = %d \n", dato1);
			    		 printf("dato2 = %d \n", dato2);
			    	 }
			    	 if(dato2 == 0) {

			    		 risultatoStep= dato1;
			    		 risultato[t*4] = risultatoStep;
			    		 //risultatoTot[t*4] = risultatoStep;
			    		 risultatoStep = risultatoStep >>8;
			    		 risultato[t*4 +1 ] = risultatoStep;
			    		 //risultatoTot[t*4 +1] = risultatoStep;
			    		 risultatoStep = risultatoStep >>8;
			    		 risultato[t*4 +2 ] = risultatoStep;
			    		// risultatoTot[t*4 +2] = risultatoStep;
			    		 risultatoStep = risultatoStep >>8;
			    		 risultato[t*4 +3 ] = risultatoStep;
			    		 //risultatoTot[t*4 +3] = risultatoStep;

			    	 } else {

			            	// dato1 = ((unsigned int)dato1)+((unsigned int)dato2);
			             risultatoStep= dato1 *dato2;

			            	 //printf("dato2 = %d \n", dato1);
			    		 risultato[t*4] = risultatoStep;
			    		 //risultatoTot[t*4 ] = risultatoStep;
			    		 risultatoStep = risultatoStep >>8;
			    		 risultato[t*4 +1 ] = risultatoStep;
			    		 //risultatoTot[t*4 +1] = risultatoStep;
			    		 risultatoStep = risultatoStep >>8;
			    		 risultato[t*4 +2 ] = risultatoStep;
			    		 //risultatoTot[t*4 +2] = risultatoStep;
			    		 risultatoStep = risultatoStep >>8;
			    		 risultato[t*4 +3 ] = risultatoStep;
			    		 //risultatoTot[t*4 +3] = risultatoStep;

			    	 }



			     } // fine i=0
			if(i== 1) {
				__syncthreads();
				if(t == 0) {
					for(j=0; j< 30; j++) {
					printf("risultato[%d] = %d \n",j,risultato[j]);
					}
				}

				 if(t % 2 == 0) {
				    sommo2=0;
				    sottraggo1=0;

				 } else { // servono a far si che i thread dispari puntino al posto giusto
					 sommo2=2;
				     sottraggo1=1;
				 }
				    // devo reimpostare base
				    base = risultato[t*8 +4 +1 + sommo2] ;
				    base = base << 8;
				    base = base + risultato[t*8 +4 + sommo2] ;
				    riporto=0;
				    riporto16Pari=0;
				    riporto16Dispari=0;
				    overflow=0;
				    overflowDispari=0;
				    overflowPari=0;
				    		  if(t== 0) {

				    			  printf("base = %d \n",base);
				    		  }

				  for(j=8*(t-sottraggo1); j< 4 + 8*(t-sottraggo1);j++) {

				    supporto = ((unsigned int) risultato[j]) * base;
				    supportoParteBassa= supporto;
				    riportoParteBassa = riporto;

				    if(j % 2 == 0) {

				      if( ((unsigned int) supportoParteBassa +  (unsigned int) riportoParteBassa) > 255 ) {
				    	overflowPari=overflowPari +1;
				      }
				       //risultatoInt[j]= (unsigned char) ( (unsigned int) supportoParteBassa + (unsigned int) riportoParteBassa );
				    		      			        //risultato[j]= (unsigned char) ( (unsigned int) supportoParteBassa + (unsigned int) riportoParteBassa );
				      vettoriSupporto[(t %2)*n + j] = (unsigned char) ( (unsigned int) supportoParteBassa + (unsigned int) riportoParteBassa );
				    		      			     //if( ((unsigned int) risultato[j] +  (unsigned int) riporto16Pari) > 255 ) {
				      if( ((unsigned int) vettoriSupporto[(t %2)*n + j] +  (unsigned int) riporto16Pari) > 255 ) {
				    	overflowPari=overflowPari +1;
				      }
				    		      			     // risultato[j]= (unsigned char) ( (unsigned int) risultato[j] + (unsigned int) riporto16Pari );
				      vettoriSupporto[(t %2)*n + j] = (unsigned char) ( (unsigned int) vettoriSupporto[(t %2)*n + j] + (unsigned int) riporto16Pari );

				      if( ((unsigned int) vettoriSupporto[(t %2)*n + j] +  (unsigned int) overflowDispari) > 255 ) {
				        overflowPari=overflowPari +1;
				      }
				    		      			     // risultato[j]= (unsigned char) ( (unsigned int) risultato[j] + (unsigned int) overflowDispari );
				      vettoriSupporto[(t %2)*n + j] = (unsigned char) ( (unsigned int) vettoriSupporto[(t %2)*n + j] + (unsigned int) overflowDispari );
				      overflowDispari=0;
				    		      			                 // risultato[j]= (char) ( (unsigned int) supporto + (unsigned int) riporto + (unsigned int) riporto16Pari);
				      } else {

				      if( ((unsigned int) supportoParteBassa +  (unsigned int) riportoParteBassa) > 255 ) {
				       overflowDispari=overflowDispari +1;
				      }
				    		      			     // risultato[j]= (unsigned char) ( (unsigned int) supportoParteBassa + (unsigned int) riportoParteBassa );
				      vettoriSupporto[(t %2)*n + j] = (unsigned char) ( (unsigned int) supportoParteBassa + (unsigned int) riportoParteBassa );

				      if( ((unsigned int) vettoriSupporto[(t %2)*n + j] +  (unsigned int) riporto16Dispari) > 255 ) {
				       overflowDispari=overflowDispari +1;
				      }
				    		      			    // risultato[j]= (unsigned char) ( (unsigned int) risultato[j] + (unsigned int) riporto16Dispari );
				      vettoriSupporto[(t %2)*n + j] = (unsigned char) ( (unsigned int) vettoriSupporto[(t %2)*n + j] + (unsigned int) riporto16Dispari );
				      if( ((unsigned int) vettoriSupporto[(t %2)*n + j] +  (unsigned int) overflowPari) > 255 ) {
				       overflowDispari=overflowDispari +1;
				      }
				    		      			     //risultato[j]= (unsigned char) ( (unsigned int) risultato[j] + (unsigned int) overflowPari );
				      vettoriSupporto[(t %2)*n + j] = (unsigned char) ( (unsigned int) vettoriSupporto[(t %2)*n + j] + (unsigned int) overflowPari );
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
				    } // chiusura for
				    overflowPari=0;
				    riporto16Dispari=0;
				    		      		  // printf("riporto16Pari = %x \n",riporto16Pari);
				    		      		  //printf("supporto = %x \n",supporto);
				    		      		  //printf("overflowDispari = %x \n",overflowDispari);
				    if( ((unsigned char) supporto  + (unsigned int) riporto16Pari) > 255 ) {
				     overflowPari=1;
				    		      		               //   printf("overflow viene aumentato 1 \n");
				    }
				    		      		  // 8*(t-sottraggo1) serve a fare in modo che ad esempio il thread 2 punti a partire da 8 celle in piu, in modo da saltare thread 0 e 1
				    vettoriSupporto[(t %2)*n + 4 + 8*(t-sottraggo1)] =  (unsigned char) supporto  + (unsigned int) riporto16Pari ;

				    if( (unsigned int) vettoriSupporto[(t %2)*n + 4 + 8*(t-sottraggo1)]  + (unsigned int) overflowDispari > 255 ) {
				     overflowPari = overflowPari+ 1;
				    		      		               // printf("overflow viene aumentato 2 \n");
				    }
				    		      		  //risultato[2 + 2*i] = (unsigned char) ( (unsigned int) risultato[2 + 2*i] + (unsigned int) overflowDispari );
				    vettoriSupporto[(t %2)*n+ 4 + 8*(t-sottraggo1)] = (unsigned char) ( (unsigned int) vettoriSupporto[(t %2)*n+ 4 + 8*(t-sottraggo1)]  + (unsigned int) overflowDispari );

				    supporto= supporto >> 8;
				    		      		  //risultato[2 + 2*i +1] = (unsigned char) supporto  + (unsigned int) overflowPari ;
				    vettoriSupporto[(t %2)*n+ 4 + 8*(t-sottraggo1) +1] = (unsigned char) supporto  + (unsigned int) overflowPari ;

				    		      		 // }

				    __syncthreads();

				    		      		  // i thread pari sommano i due risultati per ora in risultato, riciclo overflow pari e overflow dispari
				    overflowPari = 0;
				    overflowDispari=0;
				    if(t % 2 == 0) {  // ATTENZIONE, sostsituire risultato con risultatoTOT

				     risultato[t*8] = vettoriSupporto[t*8];
				     risultato[t*8 +1] = vettoriSupporto[t*8 +1];
				    if(vettoriSupporto[t*8 +2] + vettoriSupporto[n+ t*8] > 255) {
				     overflowPari = 1;
				    }
				    risultato[t*8 +2] = vettoriSupporto[t*8 +2] + vettoriSupporto[n+ t*8];
				    if(vettoriSupporto[t*8 +3] + vettoriSupporto[n+ t*8+1 ] + overflowPari > 255) {
				     overflowDispari = 1;
				    }
				    risultato[t*8 +3] = vettoriSupporto[t*8 +3] + vettoriSupporto[n + t*8 +1 ] +overflowPari;
				    if(vettoriSupporto[t*8 +4] + vettoriSupporto[n + t*8 +2 ] + overflowDispari  > 255) {
				     overflowPari = 1;
				    }
				    risultato[t*8 +4] = vettoriSupporto[t*8 +4] + vettoriSupporto[n+ t*8 +2]+ overflowDispari;
				    if(vettoriSupporto[t*8 +5] + vettoriSupporto[n + t*8+3 ] + overflowPari > 255) {
				     overflowDispari = 1;
				    }
				    risultato[t*8 +5] = vettoriSupporto[t*8 +5] + vettoriSupporto[n + t*8 +3 ] +overflowPari;
				    if(vettoriSupporto[t*8 +6] + vettoriSupporto[n + t*8 +4 ] + overflowDispari  > 255) {
				     overflowPari = 1;
				    }
				    risultato[t*8 +6] =  vettoriSupporto[n + t*8 +4]+ overflowDispari; // se ci sono problemi controllare qui
				    risultato[t*8 +7] =  vettoriSupporto[n + t*8 +5 ] +overflowPari;
				   }
				    __syncthreads();
				    if(t== 0) {

				     for(k=0; k < 7; k++ ) {

				      printf(" hghj risultato[%d] = %x \n",k,risultato[k] );
				      printf("ghv risultato[%d] = %x \n",k+1024,risultato[k+1024] );
				     }


				    }



			} // fine i=1, fino a qui va

			if(i==2) {

				__syncthreads();
				if(t == 0) {
				 for(j=0; j< 30; j++) {
				  printf("risultato[%d] = %d \n",j,risultato[j]);
				  }
				}

			    if(t % 4 == 0) {
				 sommo2=0;
				 sottraggo1=0;
                }
			    if(t % 4 == 1) {
			     sommo2=2;
			     sottraggo1=1;
			    }
			    if(t % 4 == 2) {
			     sommo2=4;
			     sottraggo1=2;
			    }
			    if(t % 4 == 3) {
			     sommo2=6;
			     sottraggo1=3;
			    }

								    // devo reimpostare base
				 base = risultato[t*8 +4 +1 + sommo2] ;
			     base = base << 8;
				 base = base + risultato[t*8 +4 + sommo2] ;
				 riporto=0;
				 riporto16Pari=0;
				 riporto16Dispari=0;
				 overflow=0;
				 overflowDispari=0;
				 overflowPari=0;
				if(t== 0) {

				  printf("base = %d \n",base);
				}

				for(j=16*(t-sottraggo1); j< 8 + 16*(t-sottraggo1);j++) {

					supporto = ((unsigned int) risultato[j]) * base;
					supportoParteBassa= supporto;
					riportoParteBassa = riporto;

					if(j % 2 == 0) {

						if( ((unsigned int) supportoParteBassa +  (unsigned int) riportoParteBassa) > 255 ) {
							overflowPari=overflowPari +1;
						}
						//risultatoInt[j]= (unsigned char) ( (unsigned int) supportoParteBassa + (unsigned int) riportoParteBassa );
						//risultato[j]= (unsigned char) ( (unsigned int) supportoParteBassa + (unsigned int) riportoParteBassa );
						vettoriSupporto[(t %4)*n + j] = (unsigned char) ( (unsigned int) supportoParteBassa + (unsigned int) riportoParteBassa );
						//if( ((unsigned int) risultato[j] +  (unsigned int) riporto16Pari) > 255 ) {
						if( ((unsigned int) vettoriSupporto[(t %4)*n + j] +  (unsigned int) riporto16Pari) > 255 ) {
							overflowPari=overflowPari +1;
						}
						// risultato[j]= (unsigned char) ( (unsigned int) risultato[j] + (unsigned int) riporto16Pari );
						vettoriSupporto[(t %4)*n + j] = (unsigned char) ( (unsigned int) vettoriSupporto[(t %4)*n + j] + (unsigned int) riporto16Pari );

						if( ((unsigned int) vettoriSupporto[(t %4)*n + j] +  (unsigned int) overflowDispari) > 255 ) {
							overflowPari=overflowPari +1;
						}
						// risultato[j]= (unsigned char) ( (unsigned int) risultato[j] + (unsigned int) overflowDispari );
						vettoriSupporto[(t %4)*n + j] = (unsigned char) ( (unsigned int) vettoriSupporto[(t %4)*n + j] + (unsigned int) overflowDispari );
						overflowDispari=0;
						// risultato[j]= (char) ( (unsigned int) supporto + (unsigned int) riporto + (unsigned int) riporto16Pari);
					} else {

						if( ((unsigned int) supportoParteBassa +  (unsigned int) riportoParteBassa) > 255 ) {
							overflowDispari=overflowDispari +1;
						}
						// risultato[j]= (unsigned char) ( (unsigned int) supportoParteBassa + (unsigned int) riportoParteBassa );
						vettoriSupporto[(t %4)*n + j] = (unsigned char) ( (unsigned int) supportoParteBassa + (unsigned int) riportoParteBassa );

						if( ((unsigned int) vettoriSupporto[(t %4)*n + j] +  (unsigned int) riporto16Dispari) > 255 ) {
							overflowDispari=overflowDispari +1;
						}
						// risultato[j]= (unsigned char) ( (unsigned int) risultato[j] + (unsigned int) riporto16Dispari );
						vettoriSupporto[(t %4)*n + j] = (unsigned char) ( (unsigned int) vettoriSupporto[(t %4)*n + j] + (unsigned int) riporto16Dispari );
						if( ((unsigned int) vettoriSupporto[(t %4)*n + j] +  (unsigned int) overflowPari) > 255 ) {
							overflowDispari=overflowDispari +1;
						}
						//risultato[j]= (unsigned char) ( (unsigned int) risultato[j] + (unsigned int) overflowPari );
						vettoriSupporto[(t %4)*n + j] = (unsigned char) ( (unsigned int) vettoriSupporto[(t %4)*n + j] + (unsigned int) overflowPari );
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
				} // chiusura for
				overflowPari=0;
				riporto16Dispari=0;
				// printf("riporto16Pari = %x \n",riporto16Pari);
				//printf("supporto = %x \n",supporto);
				//printf("overflowDispari = %x \n",overflowDispari);
				if( ((unsigned char) supporto  + (unsigned int) riporto16Pari) > 255 ) {
					overflowPari=1;
					//   printf("overflow viene aumentato 1 \n");
				}
				//risultato[2 + 2*i] = (unsigned char) supporto  + (unsigned int) riporto16Pari ;
				vettoriSupporto[(t %4)*n + 8 + 16*(t-sottraggo1)] =  (unsigned char) supporto  + (unsigned int) riporto16Pari ;

				if( (unsigned int) vettoriSupporto[(t %4)*n + 8 + 16*(t-sottraggo1)]  + (unsigned int) overflowDispari > 255 ) {
					overflowPari = overflowPari+ 1;
					// printf("overflow viene aumentato 2 \n");
				}
				//risultato[2 + 2*i] = (unsigned char) ( (unsigned int) risultato[2 + 2*i] + (unsigned int) overflowDispari );
				vettoriSupporto[(t %4)*n+ 8+ 16*(t-sottraggo1)] = (unsigned char) ( (unsigned int) vettoriSupporto[(t %4)*n+ 8 + 16*(t-sottraggo1)]  + (unsigned int) overflowDispari );

				supporto= supporto >> 8;
				//risultato[2 + 2*i +1] = (unsigned char) supporto  + (unsigned int) overflowPari ;
				vettoriSupporto[(t %4)*n+ 8 + 16*(t-sottraggo1) +1] = (unsigned char) supporto  + (unsigned int) overflowPari ;

				// }

				__syncthreads();

				// i thread pari sommano i due risultati per ora in risultato, riciclo overflow pari e overflow dispari
				overflowPari = 0;
				overflowDispari=0;
				if(t % 4 == 0 || t %4 ==2) { // ATTENZIONE, sostsituire risultato con risultatoTOT

					offsetT1= t*2;
					offsetT2= offsetT1 +2;
					for(k=0; k< 16; k++) {

						risultato[(t-sottraggo1)*16]= vettoriSupporto[t*8];
					}
					risultato[t*8] = vettoriSupporto[t*8];
					risultato[t*8 +1] = vettoriSupporto[t*8 +1];
					if(vettoriSupporto[t*8 +2] + vettoriSupporto[n+ t*8] > 255) {
						overflowPari = 1;
					}
					risultato[t*8 +2] = vettoriSupporto[t*8 +2] + vettoriSupporto[n+ t*8];
					if(vettoriSupporto[t*8 +3] + vettoriSupporto[n+ t*8+1 ] + overflowPari > 255) {
						overflowDispari = 1;
					}
					risultato[t*8 +3] = vettoriSupporto[t*8 +3] + vettoriSupporto[n + t*8 +1 ] +overflowPari;
					if(vettoriSupporto[t*8 +4] + vettoriSupporto[n + t*8 +2 ] + overflowDispari  > 255) {
						overflowPari = 1;
					}
					risultato[t*8 +4] = vettoriSupporto[t*8 +4] + vettoriSupporto[n+ t*8 +2]+ overflowDispari;
					if(vettoriSupporto[t*8 +5] + vettoriSupporto[n + t*8+3 ] + overflowPari > 255) {
						overflowDispari = 1;
					}
					risultato[t*8 +5] = vettoriSupporto[t*8 +5] + vettoriSupporto[n + t*8 +3 ] +overflowPari;
					if(vettoriSupporto[t*8 +6] + vettoriSupporto[n + t*8 +4 ] + overflowDispari  > 255) {
						overflowPari = 1;
					}
					risultato[t*8 +6] = vettoriSupporto[t*8 +6] + vettoriSupporto[n + t*8 +4]+ overflowDispari;
					if(vettoriSupporto[t*8 +7] + vettoriSupporto[n + t*8+5 ] + overflowPari > 255) {
						overflowDispari = 1;
					}
					risultato[t*8 +5] = vettoriSupporto[t*8 +7] + vettoriSupporto[n + t*8 +5 ] +overflowPari;
				}
				__syncthreads();
				if(t== 0) {

					for(k=0; k < 7; k++ ) {

						printf(" hghj risultato[%d] = %x \n",k,risultato[k] );
						printf("ghv risultato[%d] = %x \n",k+1024,risultato[k+1024] );
					}


				}



			} // fine I=2

		}
	   }

return;
}
__global__ void provacuda(void){


	int tid= blockIdx.x*blockDim.x+threadIdx.x;

	if(tid == 0 ) {

		printf("ciao2 \n");

	}
	printf("ciao \n");
}

//int powerBigNumbersGPU(unsigned char *risultato,unsigned int esponente,unsigned int base);
int main(void)
{

   // unsigned int esponente; // numero massimo su 16 bit, deve essere almeno 2
    // unsigned int base;  // numero massimo su 16 bit
     int n =131070;
     unsigned char *dev_vect;
     unsigned char *vect;
     int *dev_variabili;
     int *variabili;
     int i;

     variabili = (int*) malloc(n*9*sizeof(int *));  // in realta variabili è una matrice srotolata

     cudaMalloc((void**)&dev_variabili,9*n*sizeof(int));
     cudaMemcpy(dev_variabili,variabili,9*n*sizeof(int),cudaMemcpyHostToDevice);

     vect = (unsigned char*) malloc(n*sizeof(unsigned char));
     cudaMalloc((void**)&dev_vect,n*sizeof(unsigned char));
     cudaMemcpy(dev_vect,vect,n*sizeof(unsigned char),cudaMemcpyHostToDevice);

	// il numero massimo di moltiplicazioni è 65535, ogni thread gestisce 2 moltiplicazioni
	// quindi il numero di thread necessari è 32
     provacuda<<<1,10>>>();
	//memoriaGlobale<<<64,1024>>>(dev_vect, n,numeroBlocchi);
	powerBigNumbersGPUShared<<<32,1024>>>(dev_vect,dev_variabili, 4096,7);


	cudaDeviceReset();
		  return 0;
	// 7^15 = 45160B7A437
	/*
  const int n = 1048576;
  int numeroBlocchi = 10;
  int *giapassati ;
  int *giapassatihost;
  int i;
  //double  a[n], r[n], d[n];


  double *vect;
  double *dev_vect;

  double *vect2;
  double *dev_vect2;

  vect = (double*) malloc(n*sizeof(double));
  cudaMalloc((void**)&dev_vect,n*sizeof(double));
  cudaMemcpy(dev_vect,vect,n*sizeof(double),cudaMemcpyHostToDevice);
 // cudaMalloc(&d_d, n * sizeof(double));
  // run version with static shared memory
  //cudaMemcpy(d_d, a, n*sizeof(double), cudaMemcpyHostToDevice);


  memoriaGlobale<<<64,1024>>>(dev_vect, n,numeroBlocchi);
  cudaMemcpy(vect, dev_vect, n*sizeof(double), cudaMemcpyDeviceToHost);
  for (int i = 0; i < n; i++) {
	  if(vect[i] != i) {

		  printf("errore 1 ! \n" );
		  printf("d[%i] = %f \n",i,vect[i]);
	  }
	  if(i== 0) {
	      printf("d[%i] = %f \n",i,vect[i]);
	  	  }
	  if(i== 1048575) {
    printf("d[%i] = %f \n",i,vect[i]);
	  }
  }



  cudaMalloc((void**)&giapassati,384*sizeof(int));
  vect2 = (double*) malloc(n*sizeof(double));
  giapassatihost = (int*) malloc(384*sizeof(int));
  for(i=0; i< 384 ; i++) {

    	  		giapassatihost[i] = 0;

    	  	}
  cudaMemcpy(giapassati,giapassatihost,384*sizeof(int),cudaMemcpyHostToDevice);
   cudaMalloc((void**)&dev_vect2,n*sizeof(double));
   cudaMemcpy(dev_vect2,vect2,n*sizeof(double),cudaMemcpyHostToDevice);
  // cudaMalloc(&d_d, n * sizeof(double));
   // run version with static shared memory
   //cudaMemcpy(d_d, a, n*sizeof(double), cudaMemcpyHostToDevice);

   for(i=0; i< 384 ; i++) {

  	  		//giapassati[i] = 0;

  	  	}

   memoriaShared<<<1,385>>>(dev_vect2, giapassati);
   cudaMemcpy(vect2, dev_vect2, n*sizeof(double), cudaMemcpyDeviceToHost);
   for (int i = 0; i < n; i++) {
	   if(vect2[i] != i) {

		   printf("errore 2 ! \n" );
		   printf("d[%i] = %f \n",i,vect2[i]);
	   }
	  // printf("d[%i] = %f \n",i,vect2[i]);
 	  if(i== 1048575) {
     printf("d[%i] = %f \n",i,vect2[i]);
 	  }
   }
  // run dynamic shared memory version
 // cudaMemcpy(d_d, a, n*sizeof(int), cudaMemcpyHostToDevice);
 // dynamicReverse<<<1,n,n*sizeof(int)>>>(d_d, n);
 // cudaMemcpy(d, d_d, n * sizeof(int), cudaMemcpyDeviceToHost);
 // for (int i = 0; i < n; i++)
  //  if (d[i] != r[i]) printf("Error: d[%d]!=r[%d] (%d, %d)n", i, i, d[i], r[i]);
  */

}





