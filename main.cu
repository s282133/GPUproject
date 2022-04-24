
#include <stdio.h>
#include <stdlib.h>
#include <cuda.h>
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


#define cudaCheckErrors(msg) \
    do { \
        cudaError_t __err = cudaGetLastError(); \
        if (__err != cudaSuccess) { \
            fprintf(stderr, "Fatal error: %s (%s at %s:%d)\n", \
                msg, cudaGetErrorString(__err), \
                __FILE__, __LINE__); \
            fprintf(stderr, "*** FAILED - ABORTING\n"); \
            exit(1); \
        } \
    } while (0)
__global__ void powerBigNumbersGPUShared(unsigned char *risultato,unsigned char *vettoriSupporto, unsigned int esponente,unsigned int base, int *debug) {

	//__shared__ unsigned char risultatoTot[4096];
	//__shared__ unsigned char vettoriSupporto[9][4096];
	int n =131070;
	int t= blockIdx.x*blockDim.x+threadIdx.x;
	int dato1;
    int dato2;
    int risultatoStep;
    int threadUtili;
    int threadUtili2;
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
    int debuggg;
    int t2;
    t2=t;
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
		threadUtili2=threadUtili;
		//debug
		if(t== 0){

			printf("thread utili = %d \n",threadUtili);
		}
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

				//printf("pasi utili = %d \n",passi);
			}
			//fine debug
			parteBassaBase = base;
			base = base >> 8;
			parteAltaBase = base;
			//debug
			if(t== 0){

						//printf("parte bassa base = %x \n",parteBassaBase);
						//printf("parte alta base = %x \n",parteAltaBase);
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
                         printf("threadutili = %d \n", threadUtili2);
			    		 //printf("dato1 = %d \n", dato1);
			    		// printf("dato2 = %d \n", dato2);
			    	 }
			    	/* if(dato1 != 7) {
			    		 printf("err, sono thread %d , dato1 = %d \n ",t,dato1);
			    	 }
			    	 if(dato2 != 7) {
			    	 	 printf("err, sono thread %d , dato2 = %d \n ",t,dato2);
			    	 } */
			    	 __syncthreads();
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
			    		 risultato[t*4] = risultatoStep;
			    		 //risultatoTot[t*4 ] = risultatoStep;
			    		 risultatoStep = risultatoStep >>8;
                         risultato[t*4 +1 ] = risultatoStep;

			    		 risultatoStep = risultatoStep >>8;

			    		 risultato[t*4 +2 ] = risultatoStep;

			    		 risultatoStep = risultatoStep >>8;

			    		 risultato[t*4 +3 ] = risultatoStep;


			    	 }
			    	 __syncthreads();
                 /* if(t ==0 ) {
                    for(k=0; k< 2048; k++) {

                    	if(k %4 == 0) {
                    		if(risultato[k] != 49) {
                    		    printf("err1, doveva essere 49 [%d] = %d \n ",k,risultato[k]) ;
                    		}

                    	} else {
                    		if(risultato[k] != 0) {
                    			printf("err1, doveva essere 0 [%d] = %d \n ",k,risultato[k]) ;
                    		}
                    	}
                    }
                  }
                  if(t ==2048 ) {
                	  for(k=2048; k< 4096; k++) {

                		  if(k %4 == 0) {
                			  if(risultato[k] != 49) {
                				  printf("err1, doveva essere 49 [%d] = %d \n ",k,risultato[k]) ;
                			  }

                		  } else {
                			  if(risultato[k] != 0) {
                				  printf("err1, doveva essere 0 [%d] = %d \n ",k,risultato[k]) ;
                			  }
                		  }
                	  }
                  } */
			     } // fine i=0

			if(i== 1) {
				if(t < threadUtili ) {
				__syncthreads();
				if(t == 0) {
					for(j=0; j< 30; j++) {
					//printf("risultato[%d] = %d \n",j,risultato[j]);
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
				    base = risultato[t*4 +4 +1 + sommo2] ;
				    base = base << 8;
				    base = base + risultato[t*4 +4 + sommo2] ;
				    riporto=0;
				    riporto16Pari=0;
				    riporto16Dispari=0;
				    overflow=0;
				    overflowDispari=0;
				    overflowPari=0;
				    		  if(t== 0) {

				    			 // printf("base = %d \n",base);
				    		  }

				  for(j=4*(t-sottraggo1); j< 4 + 4*(t-sottraggo1);j++) {

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
				    vettoriSupporto[(t %2)*n + 4 + 4*(t-sottraggo1)] =  (unsigned char) supporto  + (unsigned int) riporto16Pari ;

				    if( (unsigned int) vettoriSupporto[(t %2)*n + 4 + 4*(t-sottraggo1)]  + (unsigned int) overflowDispari > 255 ) {
				     overflowPari = overflowPari+ 1;
				    		      		               // printf("overflow viene aumentato 2 \n");
				    }
				    		      		  //risultato[2 + 2*i] = (unsigned char) ( (unsigned int) risultato[2 + 2*i] + (unsigned int) overflowDispari );
				    vettoriSupporto[(t %2)*n+ 4 + 4*(t-sottraggo1)] = (unsigned char) ( (unsigned int) vettoriSupporto[(t %2)*n+ 4 + 4*(t-sottraggo1)]  + (unsigned int) overflowDispari );

				    supporto= supporto >> 8;
				    		      		  //risultato[2 + 2*i +1] = (unsigned char) supporto  + (unsigned int) overflowPari ;
				    vettoriSupporto[(t %2)*n+ 4 + 4*(t-sottraggo1) +1] = (unsigned char) supporto  + (unsigned int) overflowPari ;

				    		      		 // }

				    __syncthreads();

				    		      		  // i thread pari sommano i due risultati per ora in risultato, riciclo overflow pari e overflow dispari
				    overflowPari = 0;
				    overflowDispari=0;
				    if(t % 2 == 0) {  // ATTENZIONE, sostsituire risultato con risultatoTOT

				     risultato[t*4] = vettoriSupporto[t*4];
				     /*if(t*4 +2== 2042) {
				    	 printf("scrivo su 2042 = %d \n",risultato[t*4]);
				     }
                      */
				     risultato[t*4 +1] = vettoriSupporto[t*4 +1];
				    if(vettoriSupporto[t*4 +2] + vettoriSupporto[n+ t*4] > 255) {
				     overflowPari = 1;
				    }
				    risultato[t*4 +2] = vettoriSupporto[t*4 +2] + vettoriSupporto[n+ t*4];
				   /* if(t == 510) {
				    	printf("vettoriSupporto[t*4 +2] = %d \n",vettoriSupporto[t*4 +2]);
				    	printf("vettoriSupporto[n+ t*4] = %d \n",vettoriSupporto[n+ t*4]);
				    } */
				    if(vettoriSupporto[t*4 +3] + vettoriSupporto[n+ t*4+1 ] + overflowPari > 255) {
				     overflowDispari = 1;
				    }
				    risultato[t*4 +3] = vettoriSupporto[t*4 +3] + vettoriSupporto[n + t*4 +1 ] +overflowPari;
				    if(vettoriSupporto[t*4 +4] + vettoriSupporto[n + t*4 +2 ] + overflowDispari  > 255) {
				     overflowPari = 1;
				    }
				    risultato[t*4 +4] = vettoriSupporto[t*4 +4] + vettoriSupporto[n+ t*4 +2]+ overflowDispari;
				    if(vettoriSupporto[t*4 +5] + vettoriSupporto[n + t*4+3 ] + overflowPari > 255) {
				     overflowDispari = 1;
				    }
				    risultato[t*4 +5] = vettoriSupporto[t*4 +5] + vettoriSupporto[n + t*4 +3 ] +overflowPari;
				    if(vettoriSupporto[t*4 +6] + vettoriSupporto[n + t*4 +4 ] + overflowDispari  > 255) {
				     overflowPari = 1;
				    }
				    risultato[t*4 +6] =  vettoriSupporto[n + t*4 +4]+ overflowDispari; // se ci sono problemi controllare qui
				    risultato[t*4 +7] =  vettoriSupporto[n + t*4 +5 ] +overflowPari;
				   }

				    __syncthreads();
				    // debug
				  /*  if(t == 0) { // i thread sono 2047
                    //printf("ciao asdmkfnm \n");
				     for(k=0; k < 2048; k++ ) {

				    	 if(k %8 == 0) {
				    		 if(risultato[k] != 97) {
				    			 printf("err doveva essere 97, risultato[%d]= %d \n ",k,risultato[k]);
				    		 }
				    	 }
				    	 if(k %8 == 1) {
				    		 if(risultato[k] != 9) {
				    		 	printf("err doveva essere 9,risultato[%d]= %d \n ",k,risultato[k]);
				    		 }

				    	  } else {
				    		  if(risultato[k] != 0 && k %8 != 0) {
				    		  	printf("err doveva essere 0, risultato[%d]= %d \n ",k,risultato[k]);
				    		  }
				    	  }
				      //printf(" hghj risultato[%d] = %x \n",k,risultato[k] );
				     // printf("ghv risultato[%d] = %d \n",k+1024,risultato[k+1024] );
				     }


				    }
				    __syncthreads();
				    if(t == 512) { // i thread sono 2047
				    	//printf("ciao asdmkfnm \n");
				    	for(k=2048; k < 2048; k++ ) {

				    		if(k %8 == 0) {
				    			if(risultato[k] != 97) {
				    				printf("err doveva essere 97, risultato[%d]= %d \n ",k,risultato[k]);
				    			}
				    		}
				    		if(k %8 == 1) {
				    			if(risultato[k] != 9) {
				    				printf("err doveva essere 9,risultato[%d]= %d \n ",k,risultato[k]);
				    			}

				    		} else {
				    			if(risultato[k] != 0 && k %8 != 0) {
				    				printf("err doveva essere 0, risultato[%d]= %d \n ",k,risultato[k]);
				    			}
				    		}
				    		//printf(" hghj risultato[%d] = %x \n",k,risultato[k] );
				    		// printf("ghv risultato[%d] = %d \n",k+1024,risultato[k+1024] );
				    	}


				    } */
				    // debug

				} // chiusura thread utili
			} // fine i=1, fino a qui va

		}
	   }

return;
}

__global__ void powerBigNumbersGPUStep2(unsigned char *risultato,unsigned char *vettoriSupporto, unsigned int esponente,unsigned int base, int *debug) {

	    int n =131070;
		int t= blockIdx.x*blockDim.x+threadIdx.x;
		int t2;
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

	    threadUtili=2048;
		//vettoriSupporto[0] = 0;
		if(t < threadUtili ) {


			//debug[0]=0;
			//__syncthreads();
			//debug[0]= debug[0] +1;


			__syncthreads();


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


			base=0;

			//printf("ciao = sono 2047 e sto accedendo a = %d \n",risultato[8176]);
			// debuggg= t*4;
			//base=t2 ;
			t2= (t - (t%4))*4 +8 +1 + (t % 4)*2;
			//base=base+8 +1 + sommo2;
			//printf("t2 = %d \n",t2);
			//printf("ovvero = %d \n",risultato[(t - (t%4))*4 + 8 + 1 + (t % 4)*2]);

			//printf("risultato = %d \n",risultato[t*8 +8 +1 + sommo2]);// devo reimpostare base
			t2=(t-sottraggo1)*4 +8 +1 + sommo2;
			// base= risultato[(t - (t%4))*4 + 8 + 1 + (t % 4)*2] ;
			base = risultato[(t-sottraggo1)*4 +8 +1 + sommo2] ;
			//printf("base = %d \n",base);
			base = base << 8;
			t2=(t-sottraggo1)*4 +8 + sommo2;
			//  base= base + risultato[(t - (t%4))*4 + 8 + (t % 4)*2];
			base = base + risultato[(t-sottraggo1)*4 +8 + sommo2] ;
			// printf("base = %d \n",base);
			/*if(t== 512) {

				printf("base 512= %d \n", base);
			} */
			if(base == 2401) {
				//printf("base corretta, T = %d \n", t);
			} else {
				//printf("base errata, T = %d \n", t);
			}
			riporto=0;
			riporto16Pari=0;
			riporto16Dispari=0;
			overflow=0;
			overflowDispari=0;
			overflowPari=0;
			//debug


			//	if(t== 2047) {
			//vettoriSupporto[(t %4)*n + k + 4*(t-sottraggo1) +1];
			//  printf("base = %d \n",base);
			//}
			//debug

			for(j=4*(t-sottraggo1); j< 8 + 4*(t-sottraggo1);j++) {

				supporto = ((unsigned int) risultato[j]) * base;
				supportoParteBassa= supporto;
				riportoParteBassa = riporto;

				if(j % 2 == 0) {

					if( ((unsigned int) supportoParteBassa +  (unsigned int) riportoParteBassa) > 255 ) {
						overflowPari=overflowPari +1;
					}
					//risultatoInt[j]= (unsigned char) ( (unsigned int) supportoParteBassa + (unsigned int) riportoParteBassa );
					//risultato[j]= (unsigned char) ( (unsigned int) supportoParteBassa + (unsigned int) riportoParteBassa );
					vettoriSupporto[(t %4)*n + j ] = (unsigned char) ( (unsigned int) supportoParteBassa + (unsigned int) riportoParteBassa );
					//if( ((unsigned int) risultato[j] +  (unsigned int) riporto16Pari) > 255 ) {
					if( ((unsigned int) vettoriSupporto[(t %4)*n + j ] +  (unsigned int) riporto16Pari) > 255 ) {
						overflowPari=overflowPari +1;
					}
					// risultato[j]= (unsigned char) ( (unsigned int) risultato[j] + (unsigned int) riporto16Pari );
					vettoriSupporto[(t %4)*n + j ] = (unsigned char) ( (unsigned int) vettoriSupporto[(t %4)*n + j ] + (unsigned int) riporto16Pari );

					if( ((unsigned int) vettoriSupporto[(t %4)*n + j ] +  (unsigned int) overflowDispari) > 255 ) {
						overflowPari=overflowPari +1;
					}
					// risultato[j]= (unsigned char) ( (unsigned int) risultato[j] + (unsigned int) overflowDispari );
					vettoriSupporto[(t %4)*n + j ] = (unsigned char) ( (unsigned int) vettoriSupporto[(t %4)*n + j ] + (unsigned int) overflowDispari );
					overflowDispari=0;
					// risultato[j]= (char) ( (unsigned int) supporto + (unsigned int) riporto + (unsigned int) riporto16Pari);
				} else {

					if( ((unsigned int) supportoParteBassa +  (unsigned int) riportoParteBassa) > 255 ) {
						overflowDispari=overflowDispari +1;
					}
					// risultato[j]= (unsigned char) ( (unsigned int) supportoParteBassa + (unsigned int) riportoParteBassa );
					vettoriSupporto[(t %4)*n + j ] = (unsigned char) ( (unsigned int) supportoParteBassa + (unsigned int) riportoParteBassa );

					if( ((unsigned int) vettoriSupporto[(t %4)*n + j ] +  (unsigned int) riporto16Dispari) > 255 ) {
						overflowDispari=overflowDispari +1;
					}
					// risultato[j]= (unsigned char) ( (unsigned int) risultato[j] + (unsigned int) riporto16Dispari );
					vettoriSupporto[(t %4)*n + j] = (unsigned char) ( (unsigned int) vettoriSupporto[(t %4)*n + j] + (unsigned int) riporto16Dispari );
					if( ((unsigned int) vettoriSupporto[(t %4)*n + j ] +  (unsigned int) overflowPari) > 255 ) {
						overflowDispari=overflowDispari +1;
					}
					//risultato[j]= (unsigned char) ( (unsigned int) risultato[j] + (unsigned int) overflowPari );
					vettoriSupporto[(t %4)*n + j ] = (unsigned char) ( (unsigned int) vettoriSupporto[(t %4)*n + j ] + (unsigned int) overflowPari );
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
			vettoriSupporto[(t %4)*n + 8 + 4*(t-sottraggo1)] =  (unsigned char) supporto  + (unsigned int) riporto16Pari ;

			if( (unsigned int) vettoriSupporto[(t %4)*n + 8 + 4*(t-sottraggo1)]  + (unsigned int) overflowDispari > 255 ) {
				overflowPari = overflowPari+ 1;
				// printf("overflow viene aumentato 2 \n");
			}
			//risultato[2 + 2*i] = (unsigned char) ( (unsigned int) risultato[2 + 2*i] + (unsigned int) overflowDispari );
			vettoriSupporto[(t %4)*n+ 8+ 4*(t-sottraggo1)] = (unsigned char) ( (unsigned int) vettoriSupporto[(t %4)*n+ 8 + 4*(t-sottraggo1)]  + (unsigned int) overflowDispari );

			supporto= supporto >> 8;
			//risultato[2 + 2*i +1] = (unsigned char) supporto  + (unsigned int) overflowPari ;
			vettoriSupporto[(t %4)*n+ 8 + 4*(t-sottraggo1) +1] = (unsigned char) supporto  + (unsigned int) overflowPari ;

			// }

			if(t == 512) {

				//printf(" 512, vettoriSupporto[2048]= %d \n", vettoriSupporto[512*4]);
				//printf(" 512, vettoriSupporto[2049]= %d \n", vettoriSupporto[512*4 +1 ]);
				//printf(" 512, vettoriSupporto[2050]= %d \n", vettoriSupporto[512*4 +2 ]);
			}
			__syncthreads();

			// i thread pari sommano i due risultati per ora in risultato, riciclo overflow pari e overflow dispari
			overflowPari = 0;
			overflowDispari=0;
			if(t % 4 == 0 || t %4 ==2) { // ATTENZIONE, sostsituire risultato con risultatoTOT

				//offsetT1= t*2;
				//offsetT2= offsetT1 +2;
				for(k=0; k< 12; k++) {

					if(k== 0 || k== 1) {
						//vettoriSupporto[(t %4)*n + k] = vettoriSupporto[(t %4)*n + k];
					}
					if( k> 1 && k < 10) {

						vettoriSupporto[(t %4)*n + k + 4*(t-sottraggo1) +1]= vettoriSupporto[(t %4)*n + k + 4*(t-sottraggo1) +1] + vettoriSupporto[((t+1) %4)*n + k -2 + 4*(t-sottraggo1) +1] +  overflowPari ;
						if(vettoriSupporto[(t %4)*n + k + 4*(t-sottraggo1) +1] + vettoriSupporto[((t+1) %4)*n + k -2 + 4*(t-sottraggo1) +1] + overflowPari > 255) {
							overflowPari = 1;
						} else {
							overflowPari = 0;
						}

					}
					if( k== 10 || k== 11) {
						vettoriSupporto[(t %4)*n + k + 4*(t-sottraggo1) +1]=  vettoriSupporto[((t+1) %4)*n + k -2 + 4*(t-sottraggo1) +1] +  overflowPari ;
						if( vettoriSupporto[((t+1) %4)*n + k -2 + 4*(t-sottraggo1) +1] + overflowPari > 255) {
							overflowPari = 1;
						} else {
							overflowPari = 0;
						}

					}

				}  // fine somme turno 1
				__syncthreads();
				if(t == 512) {
					//printf(" 512, vettoriSupporto[2048] dopo somme= %d \n", vettoriSupporto[512*4]);
					//printf(" 512, vettoriSupporto[2049] dopo somme= %d \n", vettoriSupporto[512*4 +1 ]);
					//printf(" 512, vettoriSupporto[2050] dopo somme= %d \n", vettoriSupporto[512*4 +2 ]);
				}
				overflowPari = 0;
				if(t % 4 == 0 ) {

					for(k=0; k< 16; k++) {

						if(k== 0 || k== 1 || k== 2 || k== 3) {
							//vettoriSupporto[(t %4)*n + k] = vettoriSupporto[(t %4)*n + k];
							risultato[t*4 + k] = vettoriSupporto[(t %4)*n + k];
							// printf(" vettoriSupporto[%d] = %x \n",k,vettoriSupporto[(t %4)*n + k] );
						}
						if( k> 3 && k < 12) {

							risultato[t*4 + k] = vettoriSupporto[(t %4)*n + k + 4*(t-sottraggo1) +1] + vettoriSupporto[((t+2) %4)*n + k -4 + 4*(t-sottraggo1) +1] +  overflowPari ;
							//vettoriSupporto[(t %4)*n + k + 4*(t-sottraggo1) +1]= vettoriSupporto[(t %4)*n + k + 4*(t-sottraggo1) +1] + vettoriSupporto[((t+1) %4)*n + k -2 + 4*(t-sottraggo1) +1] +  overflowPari ;
							if(vettoriSupporto[(t %4)*n + k + 4*(t-sottraggo1) +1] + vettoriSupporto[((t+2) %4)*n + k -4 + 4*(t-sottraggo1) +1] + overflowPari > 255) {
								overflowPari = 1;
							} else {
								overflowPari = 0;
							}

						}
						if( k >= 12) {
							risultato[t*4 + k] = vettoriSupporto[((t+2) %4)*n + k -4 + 4*(t-sottraggo1) +1] +  overflowPari ;
							vettoriSupporto[(t %4)*n + k + 4*(t-sottraggo1) +1]=  vettoriSupporto[((t+2) %4)*n + k -4 + 4*(t-sottraggo1) +1] +  overflowPari ;
							if( vettoriSupporto[((t+2) %4)*n + k -4 + 4*(t-sottraggo1) +1] + overflowPari > 255) {
								overflowPari = 1;
							} else {
								overflowPari = 0;
							}

						}


					}  // fine somme turno 2

					if(t== 512) {

						//printf(" 512, risultato[2048]= %d \n", risultato[2048]);
					}

				}
			}
			__syncthreads();

			//
		} // chiusura threadutili2


	return;
}

__global__ void powerBigNumbersGPUStep3(unsigned char *risultato,unsigned char *vettoriSupporto, unsigned int esponente,unsigned int base, int *debug) {

	int n =131070;
	int t= blockIdx.x*blockDim.x+threadIdx.x;
	int t2;
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

	threadUtili=2048;

	sommo2=t%8*2;
	sottraggo1=t%8;

	base = risultato[(t-sottraggo1)*4 +16 +1 + sommo2] ;
	base = base << 8;
	base = base + risultato[(t-sottraggo1)*4 +16 + sommo2] ;
	riporto=0;
	riporto16Pari=0;
	riporto16Dispari=0;
	overflow=0;
	overflowDispari=0;
	overflowPari=0;
	/*if(t== 544) {
		printf("base = %x \n",base);
	} // fino a qui va */
	/*if(t== 545) {
			printf("base = %x \n",base);
	} // fino a qui va */
	for(j=4*(t-sottraggo1); j< 16 + 4*(t-sottraggo1);j++) {

		/*if(t== 544) {
				printf("j = %d \n",j);
	    } // fino a qui va */

		supporto = ((unsigned int) risultato[j]) * base;
		/*if(t==0) {
			printf("supporto= %d \n",supporto);
		} */
		supportoParteBassa= supporto;
		riportoParteBassa = riporto;

		if(j % 2 == 0) {

			if( ((unsigned int) supportoParteBassa +  (unsigned int) riportoParteBassa) > 255 ) {
				overflowPari=overflowPari +1;
			}
			//risultatoInt[j]= (unsigned char) ( (unsigned int) supportoParteBassa + (unsigned int) riportoParteBassa );
			//risultato[j]= (unsigned char) ( (unsigned int) supportoParteBassa + (unsigned int) riportoParteBassa );
			vettoriSupporto[(t %8)*n + j ] = (unsigned char) ( (unsigned int) supportoParteBassa + (unsigned int) riportoParteBassa );
			//if( ((unsigned int) risultato[j] +  (unsigned int) riporto16Pari) > 255 ) {
			if( ((unsigned int) vettoriSupporto[(t %8)*n + j ] +  (unsigned int) riporto16Pari) > 255 ) {
				overflowPari=overflowPari +1;
			}
			// risultato[j]= (unsigned char) ( (unsigned int) risultato[j] + (unsigned int) riporto16Pari );
			vettoriSupporto[(t %8)*n + j ] = (unsigned char) ( (unsigned int) vettoriSupporto[(t %8)*n + j ] + (unsigned int) riporto16Pari );

			if( ((unsigned int) vettoriSupporto[(t %8)*n + j ] +  (unsigned int) overflowDispari) > 255 ) {
				overflowPari=overflowPari +1;
			}
			// risultato[j]= (unsigned char) ( (unsigned int) risultato[j] + (unsigned int) overflowDispari );
			vettoriSupporto[(t %8)*n + j ] = (unsigned char) ( (unsigned int) vettoriSupporto[(t %8)*n + j ] + (unsigned int) overflowDispari );
			overflowDispari=0;
			// risultato[j]= (char) ( (unsigned int) supporto + (unsigned int) riporto + (unsigned int) riporto16Pari);
		} else {

			if( ((unsigned int) supportoParteBassa +  (unsigned int) riportoParteBassa) > 255 ) {
				overflowDispari=overflowDispari +1;
			}
			// risultato[j]= (unsigned char) ( (unsigned int) supportoParteBassa + (unsigned int) riportoParteBassa );
			vettoriSupporto[(t %8)*n + j ] = (unsigned char) ( (unsigned int) supportoParteBassa + (unsigned int) riportoParteBassa );

			if( ((unsigned int) vettoriSupporto[(t %8)*n + j ] +  (unsigned int) riporto16Dispari) > 255 ) {
				overflowDispari=overflowDispari +1;
			}
			// risultato[j]= (unsigned char) ( (unsigned int) risultato[j] + (unsigned int) riporto16Dispari );
			vettoriSupporto[(t %8)*n + j] = (unsigned char) ( (unsigned int) vettoriSupporto[(t %8)*n + j] + (unsigned int) riporto16Dispari );
			if( ((unsigned int) vettoriSupporto[(t %8)*n + j ] +  (unsigned int) overflowPari) > 255 ) {
				overflowDispari=overflowDispari +1;
			}
			//risultato[j]= (unsigned char) ( (unsigned int) risultato[j] + (unsigned int) overflowPari );
			vettoriSupporto[(t %8)*n + j ] = (unsigned char) ( (unsigned int) vettoriSupporto[(t %8)*n + j ] + (unsigned int) overflowPari );
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
	vettoriSupporto[(t %8)*n + 16 + 4*(t-sottraggo1)] =  (unsigned char) supporto  + (unsigned int) riporto16Pari ;

	if( (unsigned int) vettoriSupporto[(t %8)*n + 16 + 4*(t-sottraggo1)]  + (unsigned int) overflowDispari > 255 ) {
		overflowPari = overflowPari+ 1;
		// printf("overflow viene aumentato 2 \n");
	}
	//risultato[2 + 2*i] = (unsigned char) ( (unsigned int) risultato[2 + 2*i] + (unsigned int) overflowDispari );
	vettoriSupporto[(t %8)*n+ 16+ 4*(t-sottraggo1)] = (unsigned char) ( (unsigned int) vettoriSupporto[(t %8)*n+ 16 + 4*(t-sottraggo1)]  + (unsigned int) overflowDispari );

	supporto= supporto >> 8;
	//risultato[2 + 2*i +1] = (unsigned char) supporto  + (unsigned int) overflowPari ;
	/* if(t==0) {

	    	printf("vettoriSupporto[18] prima delle somme= %x \n",vettoriSupporto[18]);
	    } */
	vettoriSupporto[(t %8)*n+ 16 + 4*(t-sottraggo1) +1] = (unsigned char) supporto  + (unsigned int) overflowPari ;

	// }

	/*if(t==512) {
				printf("vettoriSupporto[0] 512= %x \n",vettoriSupporto[2048]);
				printf("vettoriSupporto[1] 512= %x \n",vettoriSupporto[2049]);
				printf("vettoriSupporto[2] 512= %x \n",vettoriSupporto[2050]);
				printf("vettoriSupporto[3] 512= %x \n",vettoriSupporto[2051]);
				printf("vettoriSupporto[4] 512= %x \n",vettoriSupporto[2052]);
				printf("vettoriSupporto[5] 512= %x \n",vettoriSupporto[2053]);
				//printf("vettoriSupporto[18] prima delle somme= %x \n",vettoriSupporto[18]);
			}
	if(t==513) {
					printf("vettoriSupporto[0 +n] 512= %x \n",vettoriSupporto[2048 + (t %8)*n]);
					printf("vettoriSupporto[1 +n] 512= %x \n",vettoriSupporto[2049 + (t %8)*n]);
					printf("vettoriSupporto[2 +n] 512= %x \n",vettoriSupporto[2050 + (t %8)*n]);
					printf("vettoriSupporto[3 +n] 512= %x \n",vettoriSupporto[2051 + (t %8)*n]);
					printf("vettoriSupporto[4 +n] 512= %x \n",vettoriSupporto[2052 + (t %8)*n]);
					printf("vettoriSupporto[5 +n] 512= %x \n",vettoriSupporto[2053 + (t %8)*n]);
					//printf("vettoriSupporto[18] prima delle somme= %x \n",vettoriSupporto[18]);
				} */

	/*if(t==544) {
					printf("vettoriSupporto[0] 544= %x \n",vettoriSupporto[2176]);
					printf("vettoriSupporto[1] 544= %x \n",vettoriSupporto[2177]);
					printf("vettoriSupporto[2] 544= %x \n",vettoriSupporto[2178]);
					printf("vettoriSupporto[3] 544= %x \n",vettoriSupporto[2179]);
					printf("vettoriSupporto[4] 544= %x \n",vettoriSupporto[2180]);
					printf("vettoriSupporto[5] 544= %x \n",vettoriSupporto[2181]);
					printf("vettoriSupporto[6] 544= %x \n",vettoriSupporto[2182]);
					printf("vettoriSupporto[7] 544= %x \n",vettoriSupporto[2183]);
					printf("vettoriSupporto[8] 544= %x \n",vettoriSupporto[2184]);
					printf("vettoriSupporto[9] 544= %x \n",vettoriSupporto[2184]);
					//printf("vettoriSupporto[18] prima delle somme= %x \n",vettoriSupporto[18]);
				}
		if(t==545) {
						printf("vettoriSupporto[0 +n] 545= %x \n",vettoriSupporto[2176 + (t %8)*n]);
						printf("vettoriSupporto[1 +n] 545= %x \n",vettoriSupporto[2177 + (t %8)*n]);
						printf("vettoriSupporto[2 +n] 545= %x \n",vettoriSupporto[2178 + (t %8)*n]);
						printf("vettoriSupporto[3 +n] 545= %x \n",vettoriSupporto[2179 + (t %8)*n]);
						printf("vettoriSupporto[4 +n] 545= %x \n",vettoriSupporto[2180 + (t %8)*n]);
						printf("vettoriSupporto[5 +n] 545= %x \n",vettoriSupporto[2181 + (t %8)*n]);
						//printf("vettoriSupporto[18] prima delle somme= %x \n",vettoriSupporto[18]);
					} */


	/*if(t==0) {
			printf("vettoriSupporto[0] = %x \n",vettoriSupporto[0]);
			printf("vettoriSupporto[1] = %x \n",vettoriSupporto[1]);
			printf("vettoriSupporto[2] = %x \n",vettoriSupporto[2]);
			printf("vettoriSupporto[3] = %x \n",vettoriSupporto[3]);
			printf("vettoriSupporto[4] = %x \n",vettoriSupporto[4]);
			printf("vettoriSupporto[4] = %x \n",vettoriSupporto[5]);
			printf("vettoriSupporto[18] prima delle somme= %x \n",vettoriSupporto[18]);
		}
		if(t==1) {
				printf("vettoriSupporto[0] 2= %x \n",vettoriSupporto[(t %8)*n + 0]);
				printf("vettoriSupporto[1] 2= %x \n",vettoriSupporto[(t %8)*n + 1]);
				printf("vettoriSupporto[2] 2= %x \n",vettoriSupporto[(t %8)*n + 2]);
				printf("vettoriSupporto[3] 2= %x \n",vettoriSupporto[ (t %8)*n + 3]);
				printf("vettoriSupporto[4] 2= %x \n",vettoriSupporto[(t %8)*n + 4]);
				printf("vettoriSupporto[5] 2= %x \n",vettoriSupporto[(t %8)*n + 5]);
			}
		if(t==2) {
					printf("vettoriSupporto[0] 3= %x \n",vettoriSupporto[(t %8)*n + 0]);
					printf("vettoriSupporto[1] 3= %x \n",vettoriSupporto[(t %8)*n + 1]);
					printf("vettoriSupporto[2] 3= %x \n",vettoriSupporto[(t %8)*n + 2]);
					printf("vettoriSupporto[3] 3= %x \n",vettoriSupporto[ (t %8)*n + 3]);
					printf("vettoriSupporto[4] 3= %x \n",vettoriSupporto[(t %8)*n + 4]);
					printf("vettoriSupporto[5] 3= %x \n",vettoriSupporto[(t %8)*n + 5]);
				} */
	__syncthreads();
	// i thread pari sommano i due risultati per ora in risultato, riciclo overflow pari e overflow dispari
	overflowPari = 0;
	overflowDispari=0;
	if(t % 8 == 0 || t %8  ==2 || t % 8 == 4 || t % 8 == 6) { // ATTENZIONE, sostsituire risultato con risultatoTOT

		//offsetT1= t*2;
		//offsetT2= offsetT1 +2;
		for(k=0; k< 20; k++) {

			if(k== 0 || k== 1) {
				//vettoriSupporto[(t %4)*n + k] = vettoriSupporto[(t %4)*n + k];
			}
			if( k> 1 && k < 18) {

				/*if(k== 2 && t==512) {

					printf("sto per sommare: vettoriSupporto[(t %8)*n + k + 4*(t-sottraggo1) +1]= %x \n",vettoriSupporto[(t %8)*n + k + 4*(t-sottraggo1) ]);
					printf("sto per sommare: vettoriSupporto[((t+1) %8)*n + k -2 + 4*(t-sottraggo1) +1]= %x \n",vettoriSupporto[((t+1) %8)*n + k -2 + 4*(t-sottraggo1) ]);
				} */

				//vettoriSupporto[(t %8)*n + k + 4*(t-sottraggo1) ]= vettoriSupporto[(t %8)*n + k + 4*(t-sottraggo1) ] + vettoriSupporto[((t+1) %8)*n + k -2 + 4*(t-sottraggo1) ] +  overflowPari ;
				if(vettoriSupporto[(t %8)*n + k + 4*(t-sottraggo1) ] + vettoriSupporto[((t+1) %8)*n + k -2 + 4*(t-sottraggo1) ] + overflowPari > 255) {
					//overflowPari = 1;
					overflowDispari=1;
				} else {
					//overflowPari = 0;
					overflowDispari=0;
				}
				vettoriSupporto[(t %8)*n + k + 4*(t-sottraggo1) ]= vettoriSupporto[(t %8)*n + k + 4*(t-sottraggo1) ] + vettoriSupporto[((t+1) %8)*n + k -2 + 4*(t-sottraggo1) ] +  overflowPari ;
                if(overflowDispari == 1) {
                	overflowPari = 1;
                } else {
                	overflowPari = 0;
                }
			}
			if( k== 18 || k== 19) {

				if( vettoriSupporto[((t+1) %8)*n + k -2 + 4*(t-sottraggo1) ] + overflowPari > 255) {
									//overflowPari = 1;
									overflowDispari=1;
								} else {
									//overflowPari = 0;
									overflowDispari=0;
								}
				vettoriSupporto[(t %8)*n + k + 4*(t-sottraggo1) ]=  vettoriSupporto[((t+1) %8)*n + k -2 + 4*(t-sottraggo1) ] +  overflowPari ;
								if(overflowDispari == 1) {
									overflowPari = 1;
								} else {
									overflowPari = 0;
								}

				/*vettoriSupporto[(t %8)*n + k + 4*(t-sottraggo1) ]=  vettoriSupporto[((t+1) %8)*n + k -2 + 4*(t-sottraggo1) ] +  overflowPari ;
				if( vettoriSupporto[((t+1) %8)*n + k -2 + 4*(t-sottraggo1) ] + overflowPari > 255) {
					overflowPari = 1;
				} else {
					overflowPari = 0;
				} */

			}

		}
	}// fine somme turno 1
	__syncthreads();
	/*if( t== 0) {

		printf("vettoriSupporto[0] = %x \n",vettoriSupporto[0]);
		printf("vettoriSupporto[1] = %x \n",vettoriSupporto[1]);
		printf("vettoriSupporto[2] = %x \n",vettoriSupporto[2]);
		printf("vettoriSupporto[3] = %x \n",vettoriSupporto[3]);
		printf("vettoriSupporto[4] = %x \n",vettoriSupporto[4]);
		printf("vettoriSupporto[4] = %x \n",vettoriSupporto[5]);
		printf("vettoriSupporto[17] = %x \n",vettoriSupporto[17]);
		printf("vettoriSupporto[18] turno 2= %x \n",vettoriSupporto[18]);
	} */
	/*if(t==512) {
					printf("vettoriSupporto[0] turno 1 512= %x \n",vettoriSupporto[2048]);
					printf("vettoriSupporto[1] turno 1 512= %x \n",vettoriSupporto[2049]);
					printf("vettoriSupporto[2] turno 1 512= %x \n",vettoriSupporto[2050]);
					printf("vettoriSupporto[3] turno 1 512= %x \n",vettoriSupporto[2051]);
					printf("vettoriSupporto[4] turno 1 512= %x \n",vettoriSupporto[2052]);
					printf("vettoriSupporto[5] turno 1 512= %x \n",vettoriSupporto[2053]);
					//printf("vettoriSupporto[18] prima delle somme= %x \n",vettoriSupporto[18]);
				} */
	overflowPari = 0;
	overflowDispari=0;
	if(t % 8 == 0 || t %8  ==4 ) { // ATTENZIONE, sostsituire risultato con risultatoTOT

		//offsetT1= t*2;
		//offsetT2= offsetT1 +2;
		for(k=0; k< 24; k++) {

			if(k <  4) {
				//risultato[t*4 + k] = vettoriSupporto[(t %8)*n + k];
			}
			if( k>= 4 && k < 20) {

				if(vettoriSupporto[(t %8)*n + k + 4*(t-sottraggo1) +1] + vettoriSupporto[((t+2) %8)*n + k -4 + 4*(t-sottraggo1) +1] + overflowPari > 255)  {
					//overflowPari = 1;
					overflowDispari=1;
				} else {
					//overflowPari = 0;
					overflowDispari=0;
				}
				vettoriSupporto[(t %8)*n + k + 4*(t-sottraggo1) +1]= vettoriSupporto[(t %8)*n + k + 4*(t-sottraggo1) +1] + vettoriSupporto[((t+2) %8)*n + k -4 + 4*(t-sottraggo1) +1] +  overflowPari ;
				if(overflowDispari == 1) {
					overflowPari = 1;
				} else {
					overflowPari = 0;
				}

				/*vettoriSupporto[(t %8)*n + k + 4*(t-sottraggo1) +1]= vettoriSupporto[(t %8)*n + k + 4*(t-sottraggo1) +1] + vettoriSupporto[((t+2) %8)*n + k -4 + 4*(t-sottraggo1) +1] +  overflowPari ;
				if(vettoriSupporto[(t %8)*n + k + 4*(t-sottraggo1) +1] + vettoriSupporto[((t+2) %8)*n + k -4 + 4*(t-sottraggo1) +1] + overflowPari > 255) {
					overflowPari = 1;
				} else {
					overflowPari = 0;
				} */

			}
			if( k >= 20) {

				if( vettoriSupporto[((t+2) %8)*n + k -4 + 4*(t-sottraggo1) +1] + overflowPari > 255) {
					//overflowPari = 1;
					overflowDispari=1;
				} else {
					//overflowPari = 0;
					overflowDispari=0;
				}
				vettoriSupporto[(t %8)*n + k + 4*(t-sottraggo1) +1]=  vettoriSupporto[((t+2) %8)*n + k -4 + 4*(t-sottraggo1) +1] +  overflowPari ;
				if(overflowDispari == 1) {
					overflowPari = 1;
				} else {
					overflowPari = 0;
				}

				/*vettoriSupporto[(t %8)*n + k + 4*(t-sottraggo1) +1]=  vettoriSupporto[((t+2) %8)*n + k -4 + 4*(t-sottraggo1) +1] +  overflowPari ;
				if( vettoriSupporto[((t+2) %8)*n + k -4 + 4*(t-sottraggo1) +1] + overflowPari > 255) {
					overflowPari = 1;
				} else {
					overflowPari = 0;
				} */

			}

		}
	} // fine turno somma 2
	__syncthreads();
	/*if( t== 0) {

			printf("vettoriSupporto[0] turno 2= %x \n",vettoriSupporto[0]);
			printf("vettoriSupporto[1] turno 2= %x \n",vettoriSupporto[1]);
			printf("vettoriSupporto[2] turno 2= %x \n",vettoriSupporto[2]);
			printf("vettoriSupporto[3] turno 2= %x \n",vettoriSupporto[3]);
			printf("vettoriSupporto[4] turno 2= %x \n",vettoriSupporto[4]);
			printf("vettoriSupporto[4] turno 2= %x \n",vettoriSupporto[5]);
			printf("vettoriSupporto[17] turno 2= %x \n",vettoriSupporto[17]);
			printf("vettoriSupporto[18] turno 2= %x \n",vettoriSupporto[18]);
		} */
	overflowPari = 0;
	overflowDispari=0;
	if(t % 8 == 0) {

		//offsetT1= t*2;
		//offsetT2= offsetT1 +2;
		for(k=0; k< 32; k++) {

			if(k <  8) {
				//vettoriSupporto[(t %4)*n + k] = vettoriSupporto[(t %4)*n + k];
				/*if(t== 544){
									printf("vettoreSupporto[%d] = %x \n",t*4 + k,vettoriSupporto[(t %4)*n + k]);
								} */
				risultato[t*4 + k] = vettoriSupporto[(t %8)*n + k];
				if(risultato[t*4 + k] != vettoriSupporto[(t %8)*n + k]) {
					printf("errore!");
				}
				/*if(t== 512){
					printf("risultato[%d] = %x \n",t*4 + k,risultato[t*4 + k]);
				} */
			}
			if( k>= 8 && k < 24) {

				/*if(t== 0 && k== 8) {

					printf("vettoriSupporto offeset 0 = %d \n",vettoriSupporto[(t %8)*n + k + 4*(t-sottraggo1) +1]);
					printf("vettoriSupporto offset 4= %d \n",vettoriSupporto[((t+4) %8)*n + k -4 + 4*(t-sottraggo1) +1]);
				}
				if(t== 0 && k== 17) {

					printf("vettoriSupporto offeset 0 17= %d \n",vettoriSupporto[(t %8)*n + k + 4*(t-sottraggo1) +1]);
					printf("vettoriSupporto offset 4 17= %d \n",vettoriSupporto[((t+4) %8)*n + k -4 + 4*(t-sottraggo1) +1]);
				} */

				if(vettoriSupporto[(t %8)*n + k + 4*(t-sottraggo1) ] + vettoriSupporto[((t+4) %8)*n + k -4 + 4*(t-sottraggo1) ] + overflowPari > 255) {
								//overflowPari = 1;
								overflowDispari=1;
							} else {
								//overflowPari = 0;
								overflowDispari=0;
							}
				risultato[t*4 + k] = vettoriSupporto[(t %8)*n + k + 4*(t-sottraggo1) ] + vettoriSupporto[((t+4) %8)*n + k -4 + 4*(t-sottraggo1) ] +  overflowPari ;
							if(overflowDispari == 1) {
								overflowPari = 1;
							} else {
								overflowPari = 0;
							}

				/*risultato[t*4 + k] = vettoriSupporto[(t %8)*n + k + 4*(t-sottraggo1) ] + vettoriSupporto[((t+4) %8)*n + k -4 + 4*(t-sottraggo1) ] +  overflowPari ;
				if(vettoriSupporto[(t %8)*n + k + 4*(t-sottraggo1) ] + vettoriSupporto[((t+4) %8)*n + k -4 + 4*(t-sottraggo1) ] + overflowPari > 255) {
					overflowPari = 1;
				} else {
					overflowPari = 0;
				} */

			}
			if( k >= 24) {


				if(vettoriSupporto[((t+4) %8)*n + k -4 + 4*(t-sottraggo1) +1] + overflowPari > 255) {
					//overflowPari = 1;
					overflowDispari=1;
				} else {
					//overflowPari = 0;
					overflowDispari=0;
				}
				risultato[t*4 + k] = vettoriSupporto[((t+4) %8)*n + k -4 + 4*(t-sottraggo1) +1] +  overflowPari ;
				if(overflowDispari == 1) {
					overflowPari = 1;
				} else {
					overflowPari = 0;
				}

				/*risultato[t*4 + k] = vettoriSupporto[((t+4) %8)*n + k -4 + 4*(t-sottraggo1) +1] +  overflowPari ;
				if( vettoriSupporto[((t+4) %8)*n + k -4 + 4*(t-sottraggo1) +1] + overflowPari > 255) {
					overflowPari = 1;
				} else {
					overflowPari = 0;
				} */

			}

		}
	} // fine turno somma 3

	/*if(t==512) {
						printf("vettoriSupporto[0] turno 3 512= %x \n",vettoriSupporto[2048]);
						printf("vettoriSupporto[1] turno 3 512= %x \n",vettoriSupporto[2049]);
						printf("vettoriSupporto[2] turno 3 512= %x \n",vettoriSupporto[2050]);
						printf("vettoriSupporto[3] turno 3 512= %x \n",vettoriSupporto[2051]);
						printf("vettoriSupporto[4] turno 3 512= %x \n",vettoriSupporto[2052]);
						printf("vettoriSupporto[5] turno 3 512= %x \n",vettoriSupporto[2053]);
						printf("risultato[2048] turno 3 512= %x \n",risultato[2048]);
						printf("risultato[2049] turno 3 512= %x \n",risultato[2049]);
						printf("risultato[2050] turno 3 512= %x \n",risultato[2050]);
						//printf("vettoriSupporto[18] prima delle somme= %x \n",vettoriSupporto[18]);
	} */
	/*if( t== 0) {

				printf("vettoriSupporto[0] turno 3= %x \n",vettoriSupporto[0]);
				printf("vettoriSupporto[1] turno 3= %x \n",vettoriSupporto[1]);
				printf("vettoriSupporto[2] turno 3= %x \n",vettoriSupporto[2]);
				printf("vettoriSupporto[3] turno 3= %x \n",vettoriSupporto[3]);
				printf("vettoriSupporto[4] turno 3= %x \n",vettoriSupporto[4]);
				printf("vettoriSupporto[4] turno 3= %x \n",vettoriSupporto[5]);
				printf("vettoriSupporto[8] turno 3= %x \n",vettoriSupporto[8]);
				printf("vettoriSupporto[17] turno 3= %x \n",vettoriSupporto[17]);
				printf("vettoriSupporto[21] turno 3= %x \n",vettoriSupporto[21]);
				printf("risultato[0] turno 3= %x \n",risultato[0]);
				printf("risultato[1] turno 3= %x \n",risultato[1]);
				printf("risultato[2] turno 3= %x \n",risultato[2]);
				printf("risultato[3] turno 3= %x \n",risultato[3]);
				printf("risultato[4] turno 3= %x \n",risultato[4]);
				printf("risultato[8] turno 3= %x \n",risultato[8]);
				printf("risultato[17] turno 3= %x \n",risultato[17]);
				printf("risultato[21] turno 3= %x \n",risultato[21]);

			} */


}
__global__ void provacuda(void){


	int tid= blockIdx.x*blockDim.x+threadIdx.x;

	if(tid == 0 ) {

		printf("ciao2 \n");

	}
	printf("ciao \n");
}
__global__ void powerBigNumbersGPULevel3(unsigned char *risultato,unsigned char *vettoriSupporto, unsigned int esponente,unsigned int base, int *debug) {

	int t= blockIdx.x*blockDim.x+threadIdx.x;
	int supporto;
	int n =131070;
	int i;
	int j;
	int k;
	unsigned int riporto;
	unsigned int riporto16Pari;
	unsigned int riporto16Dispari;
	unsigned int overflow;
	unsigned int overflowDispari;
	unsigned int overflowPari;
	unsigned char supportoParteBassa;
	unsigned char riportoParteBassa;


	for(i=0;i< 16; i++) {

		base= risultato[t*64 + 32 +1 +i*2];
		base = base << 8;
		base= base + risultato[t*64 + 32 + i*2];

		if(i==0 && t==0){
			printf("base = %x \n",base);
		}

	 if(i==0){


		riporto=0;
		riporto16Pari=0;
		riporto16Dispari=0;
		overflow=0;
		overflowDispari=0;
		overflowPari=0;
	 for(j=0;j<32; j++) {
		 supporto = ((unsigned int) risultato[j + t*64]) * base;

		 if(t==0){
			 printf("supporto[%d] = %x \n",j,supporto);
		 }
		 supportoParteBassa= supporto;
		 riportoParteBassa = riporto;
		 if(j % 2 == 0) {

			 if( ((unsigned int) supportoParteBassa +  (unsigned int) riportoParteBassa) > 255 ) {
				 overflowPari=overflowPari +1;
			 }
			 //risultatoInt[j]= (unsigned char) ( (unsigned int) supportoParteBassa + (unsigned int) riportoParteBassa );
			 //risultato[j]= (unsigned char) ( (unsigned int) supportoParteBassa + (unsigned int) riportoParteBassa );
			 vettoriSupporto[n+ j + t*64 ] = (unsigned char) ( (unsigned int) supportoParteBassa + (unsigned int) riportoParteBassa );
			 //if( ((unsigned int) risultato[j] +  (unsigned int) riporto16Pari) > 255 ) {
			 if( ((unsigned int) vettoriSupporto[n+ j + t*64  ] +  (unsigned int) riporto16Pari) > 255 ) {
				 overflowPari=overflowPari +1;
			 }
			 vettoriSupporto[n+ j + t*64  ] = (unsigned char) ( (unsigned int) vettoriSupporto[n+ j + t*64  ] + (unsigned int) riporto16Pari );

			 if( ((unsigned int) vettoriSupporto[j + t*64 ] +  (unsigned int) overflowDispari) > 255 ) {
				 overflowPari=overflowPari +1;
			 }
			 vettoriSupporto[n+ j + t*64  ] = (unsigned char) ( (unsigned int) vettoriSupporto[n+ j + t*64  ] + (unsigned int) overflowDispari );
			 overflowDispari=0;
		 } else {

			 if( ((unsigned int) supportoParteBassa +  (unsigned int) riportoParteBassa) > 255 ) {
				 overflowDispari=overflowDispari +1;
			 }
			 vettoriSupporto[n+ j + t*64 ] = (unsigned char) ( (unsigned int) supportoParteBassa + (unsigned int) riportoParteBassa );

			 if( ((unsigned int) vettoriSupporto[n+ j + t*64  ] +  (unsigned int) riporto16Dispari) > 255 ) {
				 overflowDispari=overflowDispari +1;
			 }
			 vettoriSupporto[n+ j + t*64 ] = (unsigned char) ( (unsigned int) vettoriSupporto[n+ j + t*64 ] + (unsigned int) riporto16Dispari );
			 if( ((unsigned int) vettoriSupporto[j + t*64  ] +  (unsigned int) overflowPari) > 255 ) {
				 overflowDispari=overflowDispari +1;
			 }
			 vettoriSupporto[ n+j + t*64  ] = (unsigned char) ( (unsigned int) vettoriSupporto[ n+ j + t*64  ] + (unsigned int) overflowPari );
			 overflowPari=0;

		 }
		 supporto= supporto >> 8;
		 riporto = supporto;
		 if(j % 2 == 0) {
			 riporto16Pari = riporto >> 8;
		 } else {
			 riporto16Dispari = riporto >> 8;

		 }

	 }

	 overflowPari=0;
	 riporto16Dispari=0;
	 	if( ((unsigned char) supporto  + (unsigned int) riporto16Pari) > 255 ) {
	 		overflowPari=1;
	 	}
	 	vettoriSupporto[n+ 32 + t*64] =  (unsigned char) supporto  + (unsigned int) riporto16Pari ;
	 	if( (unsigned int) vettoriSupporto[n+ 32 + t*64]  + (unsigned int) overflowDispari > 255 ) {
	 		overflowPari = overflowPari+ 1;
	 	}
	 	vettoriSupporto[n+ 32 + t*64] = (unsigned char) ( (unsigned int) vettoriSupporto[n+ 32 + t*64]  + (unsigned int) overflowDispari );
	 	supporto= supporto >> 8;
	 	vettoriSupporto[n+ 32 + t*64 +1] = (unsigned char) supporto  + (unsigned int) overflowPari ;
       if(t==0){
	 	for(k=0;k<34;k++){
	 		printf("vettoriSupporto[%d]= %x \n",k,vettoriSupporto[n+ k]);
	 	}
       }
	} else {

		riporto=0;
		riporto16Pari=0;
		riporto16Dispari=0;
		overflow=0;
		overflowDispari=0;
		overflowPari=0;
		for(j=0;j<32; j++) {
			supporto = ((unsigned int) risultato[j]) * base;
			supportoParteBassa= supporto;
			riportoParteBassa = riporto;

			if(j % 2 == 0) {

				if( ((unsigned int) supportoParteBassa +  (unsigned int) riportoParteBassa) > 255 ) {
					overflowPari=overflowPari +1;
				}
				//risultatoInt[j]= (unsigned char) ( (unsigned int) supportoParteBassa + (unsigned int) riportoParteBassa );
				//risultato[j]= (unsigned char) ( (unsigned int) supportoParteBassa + (unsigned int) riportoParteBassa );
				vettoriSupporto[ j + t*64 ] = (unsigned char) ( (unsigned int) supportoParteBassa + (unsigned int) riportoParteBassa );
				//if( ((unsigned int) risultato[j] +  (unsigned int) riporto16Pari) > 255 ) {
				if( ((unsigned int) vettoriSupporto[j + t*64  ] +  (unsigned int) riporto16Pari) > 255 ) {
					overflowPari=overflowPari +1;
				}
				vettoriSupporto[j + t*64  ] = (unsigned char) ( (unsigned int) vettoriSupporto[j + t*64  ] + (unsigned int) riporto16Pari );

				if( ((unsigned int) vettoriSupporto[j + t*64 ] +  (unsigned int) overflowDispari) > 255 ) {
					overflowPari=overflowPari +1;
				}
				vettoriSupporto[j + t*64  ] = (unsigned char) ( (unsigned int) vettoriSupporto[j + t*64  ] + (unsigned int) overflowDispari );
				overflowDispari=0;
			} else {

				if( ((unsigned int) supportoParteBassa +  (unsigned int) riportoParteBassa) > 255 ) {
					overflowDispari=overflowDispari +1;
				}
				vettoriSupporto[j + t*64 ] = (unsigned char) ( (unsigned int) supportoParteBassa + (unsigned int) riportoParteBassa );

				if( ((unsigned int) vettoriSupporto[j + t*64  ] +  (unsigned int) riporto16Dispari) > 255 ) {
					overflowDispari=overflowDispari +1;
				}
				vettoriSupporto[j + t*64 ] = (unsigned char) ( (unsigned int) vettoriSupporto[j + t*64 ] + (unsigned int) riporto16Dispari );
				if( ((unsigned int) vettoriSupporto[j + t*64  ] +  (unsigned int) overflowPari) > 255 ) {
					overflowDispari=overflowDispari +1;
				}
				vettoriSupporto[j + t*64  ] = (unsigned char) ( (unsigned int) vettoriSupporto[j + t*64  ] + (unsigned int) overflowPari );
				overflowPari=0;

			}
			supporto= supporto >> 8;
			riporto = supporto;
			if(j % 2 == 0) {
				riporto16Pari = riporto >> 8;
			} else {
				riporto16Dispari = riporto >> 8;

			}

		}

		overflowPari=0;
		riporto16Dispari=0;
		if( ((unsigned char) supporto  + (unsigned int) riporto16Pari) > 255 ) {
			overflowPari=1;
		}
		vettoriSupporto[32 + t*64] =  (unsigned char) supporto  + (unsigned int) riporto16Pari ;
		if( (unsigned int) vettoriSupporto[32 + t*64]  + (unsigned int) overflowDispari > 255 ) {
			overflowPari = overflowPari+ 1;
		}
		vettoriSupporto[32 + t*64] = (unsigned char) ( (unsigned int) vettoriSupporto[32 + t*64]  + (unsigned int) overflowDispari );
		supporto= supporto >> 8;
		vettoriSupporto[32 + t*64 +1] = (unsigned char) supporto  + (unsigned int) overflowPari ;

		// qui devo sommare
		overflowPari=0;
		riporto16Dispari=0;
		for(j=0;j< 32+2*i +2; j++) {

			if(j < 2*i){

			}
			if(j>=2*i && j< 32+2*i ){

				if((vettoriSupporto[n+ j + t*64 ] + vettoriSupporto[ j + t*64 -2*i ] + overflowPari) > 255) {
					overflowDispari=1;
				} else {
					overflowDispari=0;
				}
				vettoriSupporto[n+ j + t*64 ]= vettoriSupporto[n+ j + t*64 ] + vettoriSupporto[ j + t*64 -2*i ] + overflowPari;
				if(overflowDispari == 1) {
				 overflowPari = 1;
				} else {
				 overflowPari = 0;
				}



			}
			if(j> 32+2*i  ){

				if(( vettoriSupporto[ j + t*64 -2*i ] + overflowPari) > 255) {
					overflowDispari=1;
				} else {
					overflowDispari=0;
				}
				vettoriSupporto[n+ j + t*64 ]= vettoriSupporto[ j + t*64 -2*i ] + overflowPari;
				if(overflowDispari == 1) {
					overflowPari = 1;
				} else {
					overflowPari = 0;
				}

			}

		}

	}// chiusura i==0


	}

	for(i=0;i<64;i++) {
		risultato[t*64 + i]= vettoriSupporto[n + t*64 +i];

	}
	//base= risultato(t + 32)



}
//int powerBigNumbersGPU(unsigned char *risultato,unsigned int esponente,unsigned int base);
int main(void)
{
	cudaEvent_t event;
	cudaDeviceReset();
   // unsigned int esponente; // numero massimo su 16 bit, deve essere almeno 2
    // unsigned int base;  // numero massimo su 16 bit
     int n =131070;
     unsigned char *dev_vect;
     unsigned char *vect;
     unsigned char *dev_variabili;
     unsigned char *variabili;
     int i;
     int *dev_debug;
     int *debug;

     cudaEventCreateWithFlags(&event,cudaEventDisableTiming);
     debug = (int*) malloc(sizeof(int));
         cudaMalloc((void**)&dev_debug,sizeof(int));
         cudaMemcpy(dev_debug,debug,sizeof(int),cudaMemcpyHostToDevice);

     variabili = (unsigned char*) malloc(n*9*sizeof(unsigned char));  // in realta variabili è una matrice srotolata

     cudaMalloc((void**)&dev_variabili,9*n*sizeof(unsigned char));
     cudaMemcpy(dev_variabili,variabili,9*n*sizeof(unsigned char),cudaMemcpyHostToDevice);

     vect = (unsigned char*) malloc(n*sizeof(unsigned char));
     cudaMalloc((void**)&dev_vect,n*sizeof(unsigned char));
     cudaMemcpy(dev_vect,vect,n*sizeof(unsigned char),cudaMemcpyHostToDevice);

	// il numero massimo di moltiplicazioni è 65535, ogni thread gestisce 2 moltiplicazioni
	// quindi il numero di thread necessari è 32
     provacuda<<<1,10>>>();
	//memoriaGlobale<<<64,1024>>>(dev_vect, n,numeroBlocchi);
	powerBigNumbersGPUShared<<<64,512>>>(dev_vect,dev_variabili, 4096,7,dev_debug);
	cudaCheckErrors("cudaMemcpy 1 fail");
	/*cudaMemcpy(vect, dev_vect, n*sizeof(unsigned char), cudaMemcpyDeviceToHost);
	for(i=0;i<4096;i++) {
		if(i %8 == 0) {
			if(vect[i] != 97) {
				printf("errMain doveva essere 97 step1, risultato[%d]= %d \n ",i,vect[i]);
			}
		}
		if(i %8 == 1) {
			if(vect[i] != 9) {
				printf("errMain doveva essere 9 step1,risultato[%d]= %d \n ",i,vect[i]);
			}

		} else {
			if(vect[i] != 0 && i %8 != 0) {
				printf("errMain doveva essere 0 step1, risultato[%d]= %d \n ",i,vect[i]);
			}
		}
	}
	cudaMemcpy(dev_vect,vect,n*sizeof(unsigned char),cudaMemcpyHostToDevice); */
	powerBigNumbersGPUStep2<<<64,512>>>(dev_vect,dev_variabili, 4096,7,dev_debug);
	cudaCheckErrors("cudaMemcpy 1 fail");
	/*cudaMemcpy(vect, dev_vect, n*sizeof(unsigned char), cudaMemcpyDeviceToHost);
	for(i=0;i<4096;i++) {
		switch (i%16) {
				case 0 :
					if(vect[i] != 193) {
						printf("errMain, doveva essere 193 step2, risultato[%d]= %d \n",i,vect[i]);

					}
					break;
				case 1:
					if(vect[i] != 246) {
						printf("errMain, doveva essere 246 step2, risultato[%d]= %d \n",i,vect[i]);

					}
					break;
				case 2:

					if(vect[i] != 87) {
						printf("errMain, doveva essere 87 step2, risultato[%d]= %d \n",i,vect[i]);

					}
					break;
				default:
					if(vect[i] != 0) {
						printf("errMain, doveva essere 0 step2, risultato[%d]= %d \n",i,vect[i]);
					}
			    break;

				}
	}
	cudaMemcpy(dev_vect,vect,n*sizeof(unsigned char),cudaMemcpyHostToDevice); */
	powerBigNumbersGPUStep3<<<64,512>>>(dev_vect,dev_variabili, 4096,7,dev_debug);
	cudaCheckErrors("cudaMemcpy 1 fail");
	cudaEventRecord(event);
	while(cudaEventQuery(event) != cudaSuccess)
	{
		//dostuff
	}
	//cudaDeviceSynchronize();
	cudaMemcpy(vect, dev_vect, n*sizeof(unsigned char), cudaMemcpyDeviceToHost);
	for(i=0;i<4096;i++) {
			switch (i%32) {
					case 0 :
						if(vect[i] != 129) {
							printf("errMain, doveva essere 129 step3, risultato[%d]= %d \n",i,vect[i]);

						}
						break;
					case 1:
						if(vect[i] != 125) {
							printf("errMain, doveva essere 125 step3, risultato[%d]= %d \n",i,vect[i]);

						}
						break;
					case 2:

						if(vect[i] != 5) {
							printf("errMain, doveva essere 5 step3, risultato[%d]= %d \n",i,vect[i]);

						}
						break;
					case 3:

						if(vect[i] != 165) {
							printf("errMain, doveva essere 165 step3, risultato[%d]= %d \n",i,vect[i]);

						}
						break;
					case 4:

						if(vect[i] != 57) {
							printf("errMain, doveva essere 57 step3, risultato[%d]= %d \n",i,vect[i]);

						}
						break;
					case 5:

						if(vect[i] != 30) {
							printf("errMain, doveva essere 30 step3, risultato[%d]= %d \n",i,vect[i]);

						}
						break;
					default:
						if(vect[i] != 0) {
							printf("errMain, doveva essere 0 step3, risultato[%d]= %d \n",i,vect[i]);
						}
				    break;

					}
		}
	printf(" risultato[0]= %x \n",vect[0]);
	printf(" risultato[1]= %x \n",vect[1]);
	printf(" risultato[2]= %x \n",vect[2]);
	printf(" risultato[3]= %x \n",vect[3]);
	printf(" risultato[4]= %x \n",vect[4]);
	printf(" risultato[5]= %x \n",vect[5]);
	printf(" risultato[5]= %x \n",vect[6]);
	cudaMemcpy(dev_vect,vect,n*sizeof(unsigned char),cudaMemcpyHostToDevice);
	powerBigNumbersGPULevel3<<<1,64>>>(dev_vect,dev_variabili, 4096,7,dev_debug);
	cudaCheckErrors("cudaMemcpy 1 fail");
	cudaMemcpy(vect, dev_vect, n*sizeof(unsigned char), cudaMemcpyDeviceToHost);
	printf(" risultato[0] level3= %x \n",vect[0]);
	printf(" risultato[1]  level3= %x \n",vect[1]);
	printf(" risultato[2]  level3= %x \n",vect[2]);
	printf(" risultato[3]  level3= %x \n",vect[3]);
	printf(" risultato[4]  level3= %x \n",vect[4]);
	printf(" risultato[5]  level3= %x \n",vect[5]);
	printf(" risultato[6] level3= %x \n",vect[6]);
	printf(" risultato[7]  level3= %x \n",vect[7]);
	printf(" risultato[8]  level3= %x \n",vect[8]);
	printf(" risultato[9] level3= %x \n",vect[9]);
	printf(" risultato[10] level3= %x \n",vect[10]);
	printf(" risultato[11] level3= %x \n",vect[11]);
	printf(" risultato[12] level3= %x \n",vect[12]);
	for(i=0;i<4096;i++) {
				switch (i%64) {
						case 0 :
							if(vect[i] != 1) {
								printf("errMain, doveva essere 1 step3, risultato[%d]= %d \n",i,vect[i]);

							}
							break;
						case 1:
							if(vect[i] != 59) {
								printf("errMain, doveva essere 59 step3, risultato[%d]= %d \n",i,vect[i]);

							}
							break;
						case 2:

							if(vect[i] != 145) {
								printf("errMain, doveva essere 145 step3, risultato[%d]= %d \n",i,vect[i]);

							}
							break;
						case 3:

							if(vect[i] != 110) {
								printf("errMain, doveva essere 110 step3, risultato[%d]= %d \n",i,vect[i]);

							}
							break;
						case 4:

							if(vect[i] != 88) {
								printf("errMain, doveva essere 88 step3, risultato[%d]= %d \n",i,vect[i]);

							}
							break;
						case 5:

							if(vect[i] != 51) {
								printf("errMain, doveva essere 51 step3, risultato[%d]= %d \n",i,vect[i]);

							}
							break;
						case 6:

							if(vect[i] != 60) {
								printf("errMain, doveva essere 60 step3, risultato[%d]= %d \n",i,vect[i]);

							}
							break;
						case 7:

							if(vect[i] != 48) {
								printf("errMain, doveva essere 48 step3, risultato[%d]= %d \n",i,vect[i]);

							}
							break;
						case 8:

							if(vect[i] != 168) {
								printf("errMain, doveva essere 168 step3, risultato[%d]= %d \n",i,vect[i]);

							}
							break;
						case 9:

							if(vect[i] != 143) {
								printf("errMain, doveva essere 143 step3, risultato[%d]= %d \n",i,vect[i]);

							}
							break;
						case 10:

							if(vect[i] != 145) {
								printf("errMain, doveva essere 145 step3, risultato[%d]= %d \n",i,vect[i]);

							}
							break;
						case 11:

							if(vect[i] != 3) {
								printf("errMain, doveva essere 145 step3, risultato[%d]= %d \n",i,vect[i]);

							}
							break;
						default:
							if(vect[i] != 0) {
								printf("errMain, doveva essere 0 step3, risultato[%d]= %d \n",i,vect[i]);
							}
					    break;

						}
			}
	/*for(i=0; i< 4096; i++) {


		if(i%16 == 0) {
			if(vect[i] != 193) {
				printf("errMain doveva essere 193, risultato[%d]= %d \n ",i,vect[i]);
			}

		}
		if(i%16 == 1) {
			if(vect[i] != 246) {
				printf("errMain doveva essere 246, risultato[%d]= %d \n ",i,vect[i]);
			}

	    }
		if(i%16 == 2) {
			if(vect[i] != 87) {
				printf("errMain doveva essere 87, risultato[%d]= %d \n ",i,vect[i]);
			}

	    }
		if(i%16 != 0 && i%16 != 1 && i%16 != 2  ) {
			if(vect[i] != 0) {
				printf("errMain doveva essere 0, risultato[%d]= %d \n ",i,vect[i]);
			}

		}

		   // test i=1
		if(i %8 == 0) {
			if(vect[i] != 97) {
				printf("errMain doveva essere 97, risultato[%d]= %d \n ",i,vect[i]);
			}
		}
		if(i %8 == 1) {
			if(vect[i] != 9) {
				printf("errMain doveva essere 9,risultato[%d]= %d \n ",i,vect[i]);
			}

		} else {
			if(vect[i] != 0 && i %8 != 0) {
				printf("errMain doveva essere 0, risultato[%d]= %d \n ",i,vect[i]);
			}
		}


		switch (i%16) {
		case 0 :
			if(vect[i] != 193) {
				printf("errMain, doveva essere 193, risultato[%d]= %d \n",i,vect[i]);

			}
			break;
		case 1:
			if(vect[i] != 246) {
				printf("errMain, doveva essere 246, risultato[%d]= %d \n",i,vect[i]);

			}
			break;
		case 2:

			if(vect[i] != 87) {
				printf("errMain, doveva essere 87, risultato[%d]= %d \n",i,vect[i]);

			}
			break;
		default:
			if(vect[i] != 0) {
				printf("errMain, doveva essere 0, risultato[%d]= %d \n",i,vect[i]);
			}
	    break;

		}



	}
     */
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






