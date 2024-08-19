#include <math.h>
#include <complex>
#include <ap_fixed.h>
#include <string.h>

#include "32fft.h"
#include "32fftvalues.h"

using namespace std;
#define N 32

//typedef float data_t;
typedef ap_fixed<16,8> data_t;
typedef complex<data_t> data_comp;

const float pi = 2*acos(0);
// rev_32 taken from 32fftvalues

void FFT_stage(data_comp data_IN[N], data_comp data_OUT[N], int fft_len, int offset, const data_comp w_array[]){

    FFT_loop1:for (int block_num=0; block_num < N/fft_len; block_num++){
#pragma HLS UNROLL
        FFT_loop2:for (int j=0; j<fft_len/2; j++){
#pragma HLS UNROLL

            data_comp wk = w_array[j];
            data_comp temp1 = data_IN[block_num*fft_len + j];
            data_comp temp2 = data_IN[block_num*fft_len + j+offset];
            data_OUT[block_num*fft_len + j]              = temp1 + wk*temp2;
            data_OUT[block_num*fft_len +j + offset]      = temp1 - wk*temp2;
        }
    }

}

void FFT(data_comp data_IN[N], data_comp data_OUT[N]){
#pragma HLS AGGREGATE compact=auto variable=data_OUT
#pragma HLS AGGREGATE compact=auto variable=data_INa


//#pragma HLS INTERFACE s_axilite port=return bundle=control
//#pragma HLS INTERFACE m_axi port=data_IN offset=slave bundle=data_IN
//#pragma HLS INTERFACE m_axi port=data_OUT offset=slave bundle=data_OUT
//#pragma HLS INTERFACE s_axilite port=data_IN bundle=control
//#pragma HLS INTERFACE s_axilite port=data_OUT bundle=control


	static data_comp s1[N], s2[N], s3[N], s4[N], after_rev[N];
	static data_comp xin[N], xout[N];

//	memcpy(xin, (const data_comp*)data_IN, N * sizeof(data_comp));
	Input_loop: for (int i=0; i<N; i++){
		xin[i] = data_IN[i];
	}

    FFT_label_bit_reversal:for (int n=0;n<N;n++){
        after_rev[n] = xin[rev_32[n]];
    }

    STG1: FFT_stage(after_rev, s1, 2, 1, W1);
    STG2: FFT_stage(s1, s2, 4, 2, W2);
    STG3: FFT_stage(s2, s3, 8, 4, W3);
    STG4: FFT_stage(s3, s4, 16, 8, W4);
    STG5: FFT_stage(s4, xout, 32, 16, W5);

//  memcpy(data_OUT, (const data_comp*)xout, N * sizeof(data_comp));
    Output_loop: for (int i=0; i<N; i++){
    		data_OUT[i] = xout[i];
    }
}




