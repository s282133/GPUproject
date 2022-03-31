typedef struct {
    unsigned long int N;        // p * q = N, but p and q are two UNKNOWN primes
}   RSA_keyType;

typedef struct {
    unsigned long int N;        // you can ONLY access this field in PUBLIC KEYS !
    unsigned long int p;        // you cannot access this field in PUBLIC KEYS !
    unsigned long int q;        // you cannot access this field  In PUBLIC KEYS !
} RSA_decrypted_KeyType;


int main(void){

    RSA_keyType* publicKeys;
    RSA_decrypted_KeyType* decryptedN_publicKeys;

    // initialize the vector of structs with NumPublicKeys elements


}


int kernel(unsigned long int* n_keys, int NumPublicKeys, ){

    int tid, i, j;
    unsigned long int a, b, r;

    tid = blockIdx.x * blockDim.x + threadIdx.x;

    i = tid / NumPublicKeys;

    j = tid % NumPublicKeys;

    if(j > i){
        // GCD between n_keys[i] and n_keys[j]
        a = n_keys[i];
        b = n_keys[j];

        while(b > 0){
            r = a % b;
            a = b;
            b = r;
        }   // if GCD is 1, then n_keys[i] and n_keys[j] are coprime

        if(a > 1) // a and b share a common factor
            // i don't know how to handle this case
        

    }

}