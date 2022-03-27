
#include <stdio.h>
#include <stdlib.h>


// question, could i pass the shered memory from main? it make sense, where is better to copy N in shared memory?
__constant__ float M_constant[8];

__global__ void memoriaShared(float *M,float *P,float  *N, int Mask_Width,int vector_Width)
{
	extern __shared__ float n_shared[2048];
    int i;


  int tid= blockIdx.x*blockDim.x+threadIdx.x;
  float Pvalue =0;
  int N_start_point = tid - (Mask_Width/2);

  for(i=0; i< 2048; i++ ) {
  		n_shared[i]= N[i];
  	}

  for(int j=0; j< Mask_Width; j++) {

	  if(N_start_point + j >= 0 && N_start_point+j < vector_Width) {

		  if(tid == 1) {

			  printf("aumenti Pvalue con %f, posizione %d \n", n_shared[N_start_point+j],N_start_point+j);
		  }

		  Pvalue += n_shared[N_start_point+j]*M_constant[j];
	  }

  }
  P[tid]= Pvalue;
}

__global__ void powerBigNumbersGPUShared(unsigned char *risultato,unsigned int esponente,unsigned int base ) {

	__shared__ unsigned char risultatoTot[4096];
	__shared__ unsigned char vettoriSupporto[9][4096];
	int passi;
	double risultatoLog;
	int risultatoLogInt;
	int i;
	int j;
	int threadUtili;
	int potenze2;
	int contapotenze;
	int dato1;
	int dato2;
	int risultatoStep;
    unsigned char parteBassaBase;
    unsigned char parteAltaBase;
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
	// un thread lavora inizialmente su 4 byte, ci sono 1024 thread per block quindi
	// ci servono 4* 1024 per singolo vettore
	// ma noi
	int t = (blockIdx.x*blockDim.x)+threadIdx.x;

	// prima di tutto ogni thread scrive la base dove è giusto scriverla, altrimenti scrive 0
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
	/*	if(t== 0){

			printf("pasi utili = %d \n",passi);
		} */
		//fine debug
		parteBassaBase = base;
		base = base >> 8;
		parteAltaBase = base;
		//debug
		if(t== 0){

					printf("parte bassa base = %x \n",parteBassaBase);
					printf("parte alta base = %x \n",parteAltaBase);
	     }
		//fine debug
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
		//debug
		/*if(t== 0){

			for(i=0;i< 30; i++) {

				printf("risultato[%d] = %d \n",i,risultato[i] );
			}
		} */
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

    	 if(dato2 == 0) {

    		 risultatoStep= dato1;
    		 risultato[t*4] = risultatoStep;
    		 risultatoTot[t*4] = risultatoStep;
    		 risultatoStep = risultatoStep >>8;
    		 risultato[t*4 +1 ] = risultatoStep;
    		 risultatoTot[t*4 +1] = risultatoStep;
    		 risultatoStep = risultatoStep >>8;
    		 risultato[t*4 +2 ] = risultatoStep;
    		 risultatoTot[t*4 +2] = risultatoStep;
    		 risultatoStep = risultatoStep >>8;
    		 risultato[t*4 +3 ] = risultatoStep;
    		 risultatoTot[t*4 +3] = risultatoStep;

    	 } else {

    		 risultatoStep= dato1*dato2;
    		 risultato[t*4] = risultatoStep;
    		 risultatoTot[t*4 ] = risultatoStep;
    		 risultatoStep = risultatoStep >>8;
    		 risultato[t*4 +1 ] = risultatoStep;
    		 risultatoTot[t*4 +1] = risultatoStep;
    		 risultatoStep = risultatoStep >>8;
    		 risultato[t*4 +2 ] = risultatoStep;
    		 risultatoTot[t*4 +2] = risultatoStep;
    		 risultatoStep = risultatoStep >>8;
    		 risultato[t*4 +3 ] = risultatoStep;
    		 risultatoTot[t*4 +3] = risultatoStep;
    	 }

     }
     __syncthreads();
     		//debug
     		if(t== 0){

     			for(i=0;i< 30; i++) {

     				printf("risultato[%d] = %x \n",i,risultato[i] );
     			}
     		}
     				//fine debug
     		/*
     if(i == 1){

    	//  if(t % 2 == 0) {
    	 if(t % 2 == 0) {
    		 sommo2=0;
    		 sottraggo1=0;

    	 } else { // servono a far si che i thread dispari puntino al posto giusto

    		 sommo2=2;
    		 sottraggo1=1;
    	 }
    		  // devo reimpostare base
    		  base = risultatoTot[t*8 +4 +1 + sommo2] ;
              base = base << 8;
              base = base + risultatoTot[t*8 +4 + sommo2] ;
    		  riporto=0;
    		  riporto16Pari=0;
    		  riporto16Dispari=0;
    		  overflow=0;
    		  overflowDispari=0;
    		  overflowPari=0;
    		  for(j=8*(t-sottraggo1); j< 4 + 8*(t-sottraggo1);j++) {

    			  supporto = ((unsigned int) risultatoTot[j]) * base;
    			  supportoParteBassa= supporto;
    			  riportoParteBassa = riporto;

    			  if(j % 2 == 0) {

    			     if( ((unsigned int) supportoParteBassa +  (unsigned int) riportoParteBassa) > 255 ) {
    			         overflowPari=overflowPari +1;
    			      }
    			                          //risultatoInt[j]= (unsigned char) ( (unsigned int) supportoParteBassa + (unsigned int) riportoParteBassa );
    			        //risultato[j]= (unsigned char) ( (unsigned int) supportoParteBassa + (unsigned int) riportoParteBassa );
    			        vettoriSupporto[t %2][j] = (unsigned char) ( (unsigned int) supportoParteBassa + (unsigned int) riportoParteBassa );
    			     //if( ((unsigned int) risultato[j] +  (unsigned int) riporto16Pari) > 255 ) {
    			      if( ((unsigned int) vettoriSupporto[t %2][j] +  (unsigned int) riporto16Pari) > 255 ) {
    			         overflowPari=overflowPari +1;
    			      }
    			     // risultato[j]= (unsigned char) ( (unsigned int) risultato[j] + (unsigned int) riporto16Pari );
    			      vettoriSupporto[t %2][j] = (unsigned char) ( (unsigned int) vettoriSupporto[t %2][j] + (unsigned int) riporto16Pari );

    			     if( ((unsigned int) vettoriSupporto[t %2][j] +  (unsigned int) overflowDispari) > 255 ) {
    			          overflowPari=overflowPari +1;
    			      }
    			     // risultato[j]= (unsigned char) ( (unsigned int) risultato[j] + (unsigned int) overflowDispari );
    			      vettoriSupporto[t %2][j] = (unsigned char) ( (unsigned int) vettoriSupporto[t %2][j] + (unsigned int) overflowDispari );
    			      overflowDispari=0;
    			                 // risultato[j]= (char) ( (unsigned int) supporto + (unsigned int) riporto + (unsigned int) riporto16Pari);
    			   } else {

    			     if( ((unsigned int) supportoParteBassa +  (unsigned int) riportoParteBassa) > 255 ) {
    			      overflowDispari=overflowDispari +1;
    			     }
    			     // risultato[j]= (unsigned char) ( (unsigned int) supportoParteBassa + (unsigned int) riportoParteBassa );
    			     vettoriSupporto[t %2][j] = (unsigned char) ( (unsigned int) supportoParteBassa + (unsigned int) riportoParteBassa );

    			     if( ((unsigned int) vettoriSupporto[t %2][j] +  (unsigned int) riporto16Dispari) > 255 ) {
    			      overflowDispari=overflowDispari +1;
    			     }
    			    // risultato[j]= (unsigned char) ( (unsigned int) risultato[j] + (unsigned int) riporto16Dispari );
    			     vettoriSupporto[t %2][j] = (unsigned char) ( (unsigned int) vettoriSupporto[t %2][j] + (unsigned int) riporto16Dispari );
    			     if( ((unsigned int) vettoriSupporto[t %2][j] +  (unsigned int) overflowPari) > 255 ) {
    			      overflowDispari=overflowDispari +1;
    			     }
    			     //risultato[j]= (unsigned char) ( (unsigned int) risultato[j] + (unsigned int) overflowPari );
    			     vettoriSupporto[t %2][j] = (unsigned char) ( (unsigned int) vettoriSupporto[t %2][j] + (unsigned int) overflowPari );
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
    		  }
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
    		  vettoriSupporto[t%2][4 + 8*(t-sottraggo1)] =  (unsigned char) supporto  + (unsigned int) riporto16Pari ;

    		  if( (unsigned int) vettoriSupporto[t %2][4 + 8*(t-sottraggo1)]  + (unsigned int) overflowDispari > 255 ) {
    		      overflowPari = overflowPari+ 1;
    		               // printf("overflow viene aumentato 2 \n");
    		  }
    		  //risultato[2 + 2*i] = (unsigned char) ( (unsigned int) risultato[2 + 2*i] + (unsigned int) overflowDispari );
    		  vettoriSupporto[t%2][4 + 8*(t-sottraggo1)] = (unsigned char) ( (unsigned int) vettoriSupporto[t %2][4 + 8*(t-sottraggo1)]  + (unsigned int) overflowDispari );

    		  supporto= supporto >> 8;
    		  //risultato[2 + 2*i +1] = (unsigned char) supporto  + (unsigned int) overflowPari ;
    		  vettoriSupporto[t%2][4 + 8*(t-sottraggo1) +1] = (unsigned char) supporto  + (unsigned int) overflowPari ;

    		 // }

    		  __syncthreads();

    		  // i thread pari sommano i due risultati per ora in risultato, riciclo overflow pari e overflow dispari
    		  overflowPari = 0;
    		  overflowDispari=0;
    		  if(t % 2 == 0) {  // ATTENZIONE, sostsituire risultato con risultatoTOT

    			  risultato[t*8] = vettoriSupporto[0][t*8];
    			  risultato[t*8 +1] = vettoriSupporto[0][t*8 +1];
    			  if(vettoriSupporto[0][t*8 +2] + vettoriSupporto[1][t*8] > 255) {
    				  overflowPari = 1;
    			  }
    			  risultato[t*8 +2] = vettoriSupporto[0][t*8 +2] + vettoriSupporto[1][t*8];
    			  if(vettoriSupporto[0][t*8 +3] + vettoriSupporto[1][t*8+1 ] + overflowPari > 255) {
    			      overflowDispari = 1;
    			  }
    			  risultato[t*8 +3] = vettoriSupporto[0][t*8 +3] + vettoriSupporto[1][t*8 +1 ] +overflowPari;
    			  if(vettoriSupporto[0][t*8 +4] + vettoriSupporto[1][t*8 +2 ] + overflowDispari  > 255) {
    			      	overflowPari = 1;
    			  }
    			  risultato[t*8 +4] = vettoriSupporto[0][t*8 +4] + vettoriSupporto[1][t*8 +2]+ overflowDispari;
    			  if(vettoriSupporto[0][t*8 +5] + vettoriSupporto[1][t*8+3 ] + overflowPari > 255) {
    			        overflowDispari = 1;
    			  }
    			  risultato[t*8 +5] = vettoriSupporto[0][t*8 +5] + vettoriSupporto[1][t*8 +3 ] +overflowPari;
    			  if(vettoriSupporto[0][t*8 +6] + vettoriSupporto[1][t*8 +4 ] + overflowDispari  > 255) {
    			      	overflowPari = 1;
    			  }
    			  risultato[t*8 +6] = vettoriSupporto[0][t*8 +6] + vettoriSupporto[1][t*8 +4]+ overflowDispari;
    			  if(vettoriSupporto[0][t*8 +7] + vettoriSupporto[1][t*8+5 ] + overflowPari > 255) {
    			      	overflowDispari = 1;
    			  }
    			  risultato[t*8 +5] = vettoriSupporto[0][t*8 +7] + vettoriSupporto[1][t*8 +5 ] +overflowPari;
    		  }
    		  __syncthreads();
    		  if(t== 0) {

    			  for(j=0; j < 7; j++ ) {

    				  printf("risultato[%d] = %d \n",j,risultato[j] );
    				  printf("risultato[%d] = %d \n",j+1024,risultato[j+1024] );
    			  }


    		  }

    	  }
    	 //vettoriSupporto[0][4096]
     */
    /* if(i == 2){


     }
     if(i == 3){


     }

   */
	}


	}
}

__global__ void provacuda(void){


	int tid= blockIdx.x*blockDim.x+threadIdx.x;

	if(tid == 0 ) {

		printf("ciao2 \n");

	}
	printf("ciao \n");
}

__global__ void helloFromGPU(void) {

	printf("hello from GPU \n");
}

int main(void)
{
 // const int n = 2048;
  const int Mask_Width= 8;

 // float *M_device;
 // float *M_host;
 // float *N_device;
 // float *N_host;
 // float *P_device;
 // float *P_host;

  int i;

  unsigned int esponente; // numero massimo su 16 bit, deve essere almeno 2
  unsigned int base;  // numero massimo su 16 bit
  int n =131070;
  unsigned char *dev_vect;
  unsigned char *vect;

  vect = (unsigned char*) malloc(n*sizeof(unsigned char));
  cudaMalloc((void**)&dev_vect,n*sizeof(unsigned char));
  cudaMemcpy(dev_vect,vect,n*sizeof(unsigned char),cudaMemcpyHostToDevice);
  provacuda<<<1,10>>>();
  powerBigNumbersGPUShared<<<32,1024>>>(dev_vect, 4096,7);
  cudaDeviceReset();
  return 0;
   //provacuda<<<1,1>>>();
  //powerBigNumbersGPUShared<<<32,1024>>>(dev_vect, 15,7);
   // powerBigNumbersGPUShared<<<1,1024>>>(dev_vect, 15,7);

  //cudaMalloc((void**)&var,sizeof(int));
  /*N_host  = (float*) malloc(n*sizeof(float));
  P_host  = (float*) malloc(n*sizeof(float));

  for(i=0; i< n; i++) {
	  P_host[i] = 0;
	  if(i % 2 == 0) {

		  N_host[i] = 0;
	  }else {
		  N_host[i] = 1;
	  }
  }
*/
  /* cudaMalloc((void**)&P_device,n*sizeof(float));
  cudaMemcpy(P_device,P_host,n*sizeof(float),cudaMemcpyHostToDevice);
  cudaMalloc((void**)&N_device,n*sizeof(float));
    cudaMemcpy(N_device,N_host,n*sizeof(float),cudaMemcpyHostToDevice);

  M_host  = (float*) malloc(Mask_Width*sizeof(float));
  */
  /*for(i=0; i< Mask_Width; i++) {

  		  M_host[i] = i;
  		  printf("M [%d] = %f \n",i,M_host[i]);

    } */
  //cudaMemcpyToSymbol(M_constant,M_host,Mask_Width*sizeof(float));

  //cudaMalloc((void**)&M_device,Mask_Width*sizeof(float));
  //cudaMemcpy(M_device,M_host,Mask_Width*sizeof(float),cudaMemcpyHostToDevice);


  //cudaMalloc((void**)&giapassati,384*sizeof(int));
  //vect2 = (double*) malloc(n*sizeof(double));
  //giapassatihost = (int*) malloc(384*sizeof(int));
  //for(i=0; i< 384 ; i++) {

    //	  		giapassatihost[i] = 0;

    //	  	}
/*  cudaMemcpy(dev_var_main,var,sizeof(int),cudaMemcpyHostToDevice);
  cudaMemcpy(giapassati,giapassatihost,384*sizeof(int),cudaMemcpyHostToDevice);
   cudaMalloc((void**)&dev_vect2,n*sizeof(double));
   cudaMemcpy(dev_vect2,vect2,n*sizeof(double),cudaMemcpyHostToDevice); */
  // cudaMalloc(&d_d, n * sizeof(double));
   // run version with static shared memory
   //cudaMemcpy(d_d, a, n*sizeof(double), cudaMemcpyHostToDevice);


  // memoriaShared<<<2,1024,n*sizeof(float)>>>(M_device,P_device,N_device,Mask_Width,n);
  /* cudaMemcpy(P_host, P_device, n*sizeof(float), cudaMemcpyDeviceToHost);
   for (int i = 0; i < n; i++) {
	   if(P_host[0] != 12 && i == 0) {

		   printf("errore 2 ! \n" );
		   printf("d[%d] = %f \n",i,P_host[0]);
	   }
	   if(P_host[1] != 10 && i == 1) {

	   		   printf("errore 2 ! \n" );
	   		   printf("d[%d] = %f \n",i,P_host[1]);
	   	   }
	   if(P_host[2] != 15 && i == 2) {

	   		   printf("errore 2 ! \n" );
	   		   printf("d[%d] = %f \n",i,P_host[2]);
	   	   }
	   if(P_host[3] != 12 && i == 3) {

	   	   		   printf("errore 2 ! \n" );
	   	   		   printf("d[%d] = %f \n",i,P_host[3]);
	   	   	   }
	   if(P_host[4] != 16 && i == 4) {

	   	   		   printf("errore 2 ! \n" );
	   	   		   printf("d[%d] = %f \n",i,P_host[4]);
	   	   	   }
	   if(P_host[5] != 12 && i == 5) {

	  	   	   		   printf("errore 2 ! \n" );
	  	   	   		   printf("d[%d] = %f \n",i,P_host[5]);
	  	   	   	   }
	   if(P_host[6] != 16 && i == 6) {

	   	  	   	   		   printf("errore 2 ! \n" );
	   	  	   	   		   printf("d[%d] = %f \n",i,P_host[6]);
	   	  	   	   	   }
	  // printf("d[%i] = %f \n",i,vect2[i]);

   } */
  // run dynamic shared memory version
 // cudaMemcpy(d_d, a, n*sizeof(int), cudaMemcpyHostToDevice);
 // dynamicReverse<<<1,n,n*sizeof(int)>>>(d_d, n);
 // cudaMemcpy(d, d_d, n * sizeof(int), cudaMemcpyDeviceToHost);
 // for (int i = 0; i < n; i++)
  //  if (d[i] != r[i]) printf("Error: d[%d]!=r[%d] (%d, %d)n", i, i, d[i], r[i]);


}
