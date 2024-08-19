
#include <math.h>
#include <complex>
#include <ap_fixed.h>

#include "32fft.h"
#include "32fftvalues.h"

using namespace std;
#define N 32

//typedef float data_t;
typedef ap_fixed<16,8> data_t;
typedef complex<data_t> data_comp;

#define LOGN log2(N)

const float pi = 2*acos(0);
//const int rev_32[]={
//
//0,16,8,24,4,20,12,28,2,18,10,26,6,22,14,30,1,17,9,25,5,21,13,29,3,19,11,27,7,23,15,31,
//
//};

void FFT(data_comp data_IN[N], data_comp data_OUT[N]){

    // BIT REVERSAL LOOKUP
    FFT_label_bit_reversal:for (int n=0;n<N;n++){
        data_OUT[n] = data_IN[rev_32[n]];
    }   


    // NON RECURSIVE FORM
    int fft_len = 1;
    FFT_label1:for (int iter_num =1; iter_num < LOGN+1; iter_num++){

        fft_len *= 2;
        int offset  = fft_len/2;
        data_comp w = data_comp(cos(2*pi/fft_len),-sin(2*pi/fft_len)) ;

        FFT_label2:for (int block_num=0; block_num < N/fft_len; block_num++){
        
            FFT_label3:for (int j=0;j<fft_len/2;j++){
                data_comp wk = data_comp(cos(2*pi*j/fft_len),-sin(2*pi*j/fft_len));
                data_comp temp = data_OUT[block_num*fft_len + j];
                data_OUT[block_num*fft_len + j]              = temp + wk*data_OUT[block_num*fft_len + j+offset];
                data_OUT[block_num*fft_len +j + offset]      = temp - wk*data_OUT[block_num*fft_len + j+offset];
            }
        }
        
    }
}

