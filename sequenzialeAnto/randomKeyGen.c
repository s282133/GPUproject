#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

#define DEBUG2

typedef struct {
    int p;
    int q;
} publicKeyType;

typedef struct {
    unsigned long int n;
    int e;
    int skip[5000];
} n_keyType;

typedef struct {
    unsigned long int n;
    int e;
    unsigned long int d;
} fullyDecryptedType;

/*
**
**  La funzione RAND e' usata per generare numeri primi presi da un database che contiene i primi su 16 bit.
**  Vengono generate publickeysNum coppie di primi ('p' e 'q').
**  Ciascuna chiave pubblica viene generata come la moltiplicazione dei numeri prima citati in precedenza ('n' = 'p' * 'q').
**  
**  TASK LATO CPU
**
**  per ciascuna coppia di 'n' (i.e., k1 e k2), la CPU trova il greater common divider (GCD) tra k1 e k2. 
**  if( GCD(k1,k2) > 1) { 
**      k1 e k2 hanno un numero primo generatore in comune, 
**      quindi rappresentano una chiave vulnerabile sulla rete.
**      }
**
**  La forza della GPU sta nel calcolare il GCD delle varie combinazioni di chiavi (i.e., delle coppie).
*/

int GCD(unsigned long int ka, unsigned long int kb);
unsigned long int max(unsigned long int ka, unsigned long int kb);
unsigned long int min(unsigned long int ka, unsigned long int kb);
unsigned long int find_d(unsigned long int z, int e);


int main(){

srand(time(NULL));

int res, randPrime1, randPrime2, i, c, j, i_e, num, rowCounter = 0, publickeysNum, kk;
int ii, jj, counterFullyDecrypted = 0;
int primes[6542], occurrences[6542];
int randIndex1, randIndex2, decryptCounter = 0;
int commonDivider, decryptedP1, decryptedP2, decryptedQ1, decryptedQ2;
float rand1, rand2;
publicKeyType* publicKeys;
publicKeyType* decryptedPQ;
n_keyType* n_keys;
n_keyType exStruct;
fullyDecryptedType* fullyDecryptedKeys;
fullyDecryptedType exFullyDecryptedStruct;
unsigned long int k1, k2, K, k, z;
publicKeyType exampleStruct;
FILE* fptr;

fptr = fopen("primeNumbers.txt", "r");      // sono 6542 numeri primi nel database

while(fscanf(fptr, "%d", &primes[rowCounter]) == 1){
    rowCounter ++;
}

for(i = 0; i < rowCounter; i++){
    // printf("%d\n", primes[i]);
    occurrences[i] = 0;
}

publickeysNum = 100;

printf("Quante chiavi pubbliche vuoi generare? Default = 100.\n");
scanf("%d", &publickeysNum);

publicKeys = (publicKeyType*) malloc( publickeysNum * sizeof(exampleStruct) );

decryptedPQ = (publicKeyType*) malloc( publickeysNum * sizeof(exampleStruct) );     // sovradimensionato

n_keys = (n_keyType*) malloc( publickeysNum * sizeof(exStruct));

for(i = 0; i< publickeysNum; i++){             
    rand1 = ((float) rand()) / RAND_MAX;
    rand2 = ((float) rand()) / RAND_MAX;
    // printf("rand1: %f rand2: %f\n", ((float) rand()) / RAND_MAX, ((float) rand()) / RAND_MAX);
    randIndex1 = rand1 * rowCounter;
    randIndex2 = rand2 * rowCounter;
    // printf("randInt1: %d randInt2: %d\n", randIndex1, randIndex2);
    randPrime1 = primes[randIndex1];
    randPrime2 = primes[randIndex2];
    // printf("[%d] random prime from db 1: %d, random prime from db 2: %d\n", i, randPrime1, randPrime2);
 
    for(j = 0; j < rowCounter; j++){
        if(randPrime1 == primes[j])
            occurrences[j] ++;
        if(randPrime2 == primes[j])
            occurrences[j] ++;
    } 

    publicKeys[i].p = randPrime1;
    publicKeys[i].q = randPrime2;
    
    n_keys[i].n = randPrime1 * randPrime2;

    z = (publicKeys[i].p -1) * (publicKeys[i].q -1);                // sarebbe phi

    for(jj = 2; jj < z; jj++)
       if(GCD(z,jj) == 1){ 
            n_keys[i].e = jj;
            break;
        }

     for(c = 0; c < 300; c++)
         n_keys[i].skip[c] = -1;
}

#ifdef DEBUG
for(i = 0; i < rowCounter; i++)         
    if(occurrences[i] >=2)
        printf("occurrences[%d] = %d\n", i, occurrences[i]); 
#endif

// LATO CPU, CALCOLO GCD PER VEDERE SE CI SONO CHIAVI VULNERABILI

// per tutte le combinazioni di coppie di chiavi pubbliche (i.e., coppie di coppie), 
// vedo se hanno un primo in comune, tramite la versione iterativa di Euclide.
// 

for(i = 0; i < publickeysNum-1; i++)
    for(j = 0; j < publickeysNum-1; j++){
        k1 = n_keys[i].n;
        if(i != j){
            k2 = n_keys[j].n;
            K = max(k1,k2);
            k = min(k1,k2);
            commonDivider = GCD(K,k);

            if(commonDivider > 1 && n_keys[i].skip[j] == -1) {
                
                n_keys[j].skip[i] = 1;
                
                // printf("GCD between %lu and %lu: %lu\n", k1, k2, commonDivider);
                decryptedP1 = commonDivider;
                decryptedP2 = commonDivider;
                decryptedQ1 = k1/commonDivider;
                decryptedQ2 = k2/commonDivider;

                decryptedPQ[decryptCounter].p = decryptedP1;
                decryptedPQ[decryptCounter].q = decryptedQ1;

                decryptCounter++;

                decryptedPQ[decryptCounter].p = decryptedP2;
                decryptedPQ[decryptCounter].q = decryptedQ2;
                
                decryptCounter++;
            
            }
        }
    }

    // if(decryptCounter >= publickeysNum) decryptCounter = publickeysNum -2;

#ifdef DEBUG

    for(i = 0; i < publickeysNum; i++)
        printf("CHIAVE PUBBLICA %d: (n,e) = (%lu,%lu)\n", i+1, n_keys[i].n, n_keys[i].e);

    for(i = 0; i < decryptCounter; i++){
        printf("DECRYPTED   p: %d, q: %d\n", decryptedPQ[i].p, decryptedPQ[i].q);
    }

#endif

    printf("ciao1\n");

    printf("decryptCounter = %d\n", decryptCounter);

   fullyDecryptedKeys = (fullyDecryptedType*) malloc(decryptCounter * sizeof(exFullyDecryptedStruct) );
    
    if(fullyDecryptedKeys==NULL)                     
    {
        printf("Error! memory not allocated.");
        exit(0);
    }

#ifdef DEBUG2
printf("ANCORA NON RISOLTO PROBLEMA DELLA MALLOC...\n");
#endif

    // printf("%p\n", fullyDecryptedKeys);

    printf("ciao2\n");

    // mi sa che il problema e' quando genero molte chiavi perche' ho piu' collisioni che chiavi

    for(i = 0; i < publickeysNum; i++)
        for(j = 0; j < decryptCounter && j < publickeysNum; j++)
            if(n_keys[i].n == decryptedPQ[j].p * decryptedPQ[j].q){
                printf("round %d\n", counterFullyDecrypted);
                fullyDecryptedKeys[counterFullyDecrypted].n = n_keys[i].n;
                fullyDecryptedKeys[counterFullyDecrypted].e = n_keys[i].e;
                z = (decryptedPQ[j].p -1) * (decryptedPQ[j].q -1);
                printf("z: %lu, e: %d\n", z, n_keys[i].e);
                fullyDecryptedKeys[counterFullyDecrypted].d = find_d(z, n_keys[i].e);
                counterFullyDecrypted++;
            }

#ifdef DEBUG
    for(i = 0; i < decryptCounter; i++)
        printf("CHIAVE PUBBLICA CON COLLISIONE: (n,e)=(%lu,%d), SUA CHIAVE PRIVATA: (n,d)=(%lu,%lu)\n", fullyDecryptedKeys[i].n, fullyDecryptedKeys[i].e, fullyDecryptedKeys[i].n, fullyDecryptedKeys[i].d);
#endif


}




int GCD(unsigned long int kmax, unsigned long int kmin){
    
    unsigned long int r, m, n;

    m = kmax;
    n = kmin;

    while(n > 0){
        r = m % n;
        m = n;
        n = r; 
        // printf("%lu mod %lu = %lu\n", m, n, r);
    }

    if(m > 1) return (int) m;

    return 1;               // non dovrebbe servire...
}

unsigned long int max(unsigned long int ka, unsigned long int kb){
    return ka >= kb ? ka : kb;
}

unsigned long int min(unsigned long int ka, unsigned long int kb){
    return ka <= kb ? ka : kb;
}

unsigned long int find_d(unsigned long int z, int e){

    unsigned long int d = 2;

    while(e * d % z != 1){
        d ++;
    }

    return d;
}