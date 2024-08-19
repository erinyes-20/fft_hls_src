############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
## Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
############################################################
open_project 32pt_fft
set_top FFT
add_files 32_fft/32fft.h
add_files 32_fft/32fftvalues.h
add_files 32_fft/fft_staged.cpp
add_files -tb 32_fft/fft_tb.cpp -cflags "-Wno-unknown-pragmas"
add_files -tb 32_fft/inp_cpp.txt -cflags "-Wno-unknown-pragmas"
add_files -tb 32_fft/out_cpp.txt -cflags "-Wno-unknown-pragmas"
open_solution "basic_opt" -flow_target vivado
set_part {xc7z020-clg484-3}
create_clock -period 10 -name default
source "./32pt_fft/basic_opt/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
