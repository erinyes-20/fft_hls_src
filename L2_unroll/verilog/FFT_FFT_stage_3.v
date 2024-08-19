// ==============================================================
// Generated by Vitis HLS v2023.2
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// ==============================================================

`timescale 1 ns / 1 ps 

module FFT_FFT_stage_3 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        s3_M_real_address0,
        s3_M_real_ce0,
        s3_M_real_q0,
        s3_M_real_address1,
        s3_M_real_ce1,
        s3_M_real_q1,
        s3_M_imag_address0,
        s3_M_imag_ce0,
        s3_M_imag_q0,
        s3_M_imag_address1,
        s3_M_imag_ce1,
        s3_M_imag_q1,
        s4_M_real_address0,
        s4_M_real_ce0,
        s4_M_real_we0,
        s4_M_real_d0,
        s4_M_real_address1,
        s4_M_real_ce1,
        s4_M_real_we1,
        s4_M_real_d1,
        s4_M_imag_address0,
        s4_M_imag_ce0,
        s4_M_imag_we0,
        s4_M_imag_d0,
        s4_M_imag_address1,
        s4_M_imag_ce1,
        s4_M_imag_we1,
        s4_M_imag_d1
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [4:0] s3_M_real_address0;
output   s3_M_real_ce0;
input  [15:0] s3_M_real_q0;
output  [4:0] s3_M_real_address1;
output   s3_M_real_ce1;
input  [15:0] s3_M_real_q1;
output  [4:0] s3_M_imag_address0;
output   s3_M_imag_ce0;
input  [15:0] s3_M_imag_q0;
output  [4:0] s3_M_imag_address1;
output   s3_M_imag_ce1;
input  [15:0] s3_M_imag_q1;
output  [4:0] s4_M_real_address0;
output   s4_M_real_ce0;
output   s4_M_real_we0;
output  [15:0] s4_M_real_d0;
output  [4:0] s4_M_real_address1;
output   s4_M_real_ce1;
output   s4_M_real_we1;
output  [15:0] s4_M_real_d1;
output  [4:0] s4_M_imag_address0;
output   s4_M_imag_ce0;
output   s4_M_imag_we0;
output  [15:0] s4_M_imag_d0;
output  [4:0] s4_M_imag_address1;
output   s4_M_imag_ce1;
output   s4_M_imag_we1;
output  [15:0] s4_M_imag_d1;

reg ap_idle;
reg s3_M_real_ce0;
reg s3_M_real_ce1;
reg s3_M_imag_ce0;
reg s3_M_imag_ce1;
reg s4_M_real_ce0;
reg s4_M_real_we0;
reg s4_M_real_ce1;
reg s4_M_real_we1;
reg s4_M_imag_ce0;
reg s4_M_imag_we0;
reg s4_M_imag_ce1;
reg s4_M_imag_we1;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_enable_reg_pp0_iter4;
reg    ap_idle_pp0;
wire    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln22_fu_214_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire   [2:0] W4_M_real_address0;
reg    W4_M_real_ce0;
wire   [9:0] W4_M_real_q0;
wire   [2:0] W4_M_imag_address0;
reg    W4_M_imag_ce0;
wire   [8:0] W4_M_imag_q0;
wire    ap_block_pp0_stage0_11001;
wire   [4:0] add_ln_fu_270_p3;
reg   [4:0] add_ln_reg_441;
reg   [4:0] add_ln_reg_441_pp0_iter1_reg;
reg   [4:0] add_ln_reg_441_pp0_iter2_reg;
wire   [63:0] zext_ln27_fu_284_p1;
reg   [63:0] zext_ln27_reg_446;
reg   [63:0] zext_ln27_reg_446_pp0_iter1_reg;
reg   [63:0] zext_ln27_reg_446_pp0_iter2_reg;
reg   [63:0] zext_ln27_reg_446_pp0_iter3_reg;
wire  signed [23:0] sext_ln389_fu_311_p1;
wire  signed [23:0] sext_ln389_5_fu_319_p1;
wire  signed [23:0] sext_ln389_6_fu_323_p1;
wire   [23:0] mul_ln389_fu_327_p2;
reg   [23:0] mul_ln389_reg_478;
reg  signed [23:0] mul_ln389_reg_478_pp0_iter2_reg;
wire   [23:0] mul_ln389_5_fu_333_p2;
reg   [23:0] mul_ln389_5_reg_483;
reg  signed [23:0] mul_ln389_5_reg_483_pp0_iter2_reg;
wire   [63:0] zext_ln26_fu_339_p1;
reg   [63:0] zext_ln26_reg_488;
wire   [63:0] zext_ln23_fu_260_p1;
wire    ap_block_pp0_stage0;
reg   [3:0] j_fu_58;
wire   [3:0] add_ln23_fu_290_p2;
wire    ap_loop_init;
reg   [3:0] ap_sig_allocacmp_j_load;
reg   [1:0] block_num_fu_62;
wire   [1:0] select_ln22_1_fu_252_p3;
reg   [1:0] ap_sig_allocacmp_block_num_load;
reg   [4:0] indvar_flatten_fu_66;
wire   [4:0] add_ln22_fu_220_p2;
reg   [4:0] ap_sig_allocacmp_indvar_flatten_load;
wire   [0:0] icmp_ln23_fu_232_p2;
wire   [1:0] add_ln22_1_fu_246_p2;
wire   [3:0] select_ln22_fu_238_p3;
wire   [0:0] trunc_ln26_fu_266_p1;
wire   [4:0] add_ln27_fu_278_p2;
wire  signed [15:0] mul_ln389_fu_327_p0;
wire  signed [9:0] mul_ln389_fu_327_p1;
wire  signed [23:0] sext_ln389_4_fu_315_p1;
wire  signed [15:0] mul_ln389_5_fu_333_p0;
wire  signed [9:0] mul_ln389_5_fu_333_p1;
wire  signed [23:0] grp_fu_390_p3;
wire  signed [23:0] grp_fu_398_p3;
wire   [15:0] trunc_ln_fu_344_p4;
wire   [15:0] trunc_ln389_2_fu_353_p4;
wire  signed [15:0] grp_fu_390_p0;
wire  signed [8:0] grp_fu_390_p1;
wire  signed [15:0] grp_fu_398_p0;
wire  signed [8:0] grp_fu_398_p1;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg    ap_loop_exit_ready_pp0_iter1_reg;
reg    ap_loop_exit_ready_pp0_iter2_reg;
reg    ap_loop_exit_ready_pp0_iter3_reg;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_enable_reg_pp0_iter4 = 1'b0;
#0 j_fu_58 = 4'd0;
#0 block_num_fu_62 = 2'd0;
#0 indvar_flatten_fu_66 = 5'd0;
#0 ap_done_reg = 1'b0;
end

FFT_FFT_stage_3_W4_M_real_ROM_AUTO_1R #(
    .DataWidth( 10 ),
    .AddressRange( 8 ),
    .AddressWidth( 3 ))
W4_M_real_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(W4_M_real_address0),
    .ce0(W4_M_real_ce0),
    .q0(W4_M_real_q0)
);

FFT_FFT_stage_3_W4_M_imag_ROM_AUTO_1R #(
    .DataWidth( 9 ),
    .AddressRange( 8 ),
    .AddressWidth( 3 ))
W4_M_imag_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(W4_M_imag_address0),
    .ce0(W4_M_imag_ce0),
    .q0(W4_M_imag_q0)
);

FFT_mul_16s_10s_24_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 10 ),
    .dout_WIDTH( 24 ))
mul_16s_10s_24_1_1_U28(
    .din0(mul_ln389_fu_327_p0),
    .din1(mul_ln389_fu_327_p1),
    .dout(mul_ln389_fu_327_p2)
);

FFT_mul_16s_10s_24_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 10 ),
    .dout_WIDTH( 24 ))
mul_16s_10s_24_1_1_U29(
    .din0(mul_ln389_5_fu_333_p0),
    .din1(mul_ln389_5_fu_333_p1),
    .dout(mul_ln389_5_fu_333_p2)
);

FFT_mac_mulsub_16s_9s_24s_24_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 9 ),
    .din2_WIDTH( 24 ),
    .dout_WIDTH( 24 ))
mac_mulsub_16s_9s_24s_24_4_1_U30(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_390_p0),
    .din1(grp_fu_390_p1),
    .din2(mul_ln389_reg_478_pp0_iter2_reg),
    .ce(1'b1),
    .dout(grp_fu_390_p3)
);

FFT_mac_muladd_16s_9s_24s_24_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 9 ),
    .din2_WIDTH( 24 ),
    .dout_WIDTH( 24 ))
mac_muladd_16s_9s_24s_24_4_1_U31(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_398_p0),
    .din1(grp_fu_398_p1),
    .din2(mul_ln389_5_reg_483_pp0_iter2_reg),
    .ce(1'b1),
    .dout(grp_fu_398_p3)
);

FFT_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage0),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue_int == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter3_reg == 1'b1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter0_stage0)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter1 <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter3 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter4 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter4 <= ap_enable_reg_pp0_iter3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln22_fu_214_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            block_num_fu_62 <= select_ln22_1_fu_252_p3;
        end else if ((ap_loop_init == 1'b1)) begin
            block_num_fu_62 <= 2'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln22_fu_214_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            indvar_flatten_fu_66 <= add_ln22_fu_220_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            indvar_flatten_fu_66 <= 5'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln22_fu_214_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            j_fu_58 <= add_ln23_fu_290_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            j_fu_58 <= 4'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        add_ln_reg_441 <= add_ln_fu_270_p3;
        add_ln_reg_441_pp0_iter1_reg <= add_ln_reg_441;
        ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
        ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
        mul_ln389_5_reg_483 <= mul_ln389_5_fu_333_p2;
        mul_ln389_reg_478 <= mul_ln389_fu_327_p2;
        zext_ln27_reg_446[4 : 0] <= zext_ln27_fu_284_p1[4 : 0];
        zext_ln27_reg_446_pp0_iter1_reg[4 : 0] <= zext_ln27_reg_446[4 : 0];
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        add_ln_reg_441_pp0_iter2_reg <= add_ln_reg_441_pp0_iter1_reg;
        ap_loop_exit_ready_pp0_iter3_reg <= ap_loop_exit_ready_pp0_iter2_reg;
        mul_ln389_5_reg_483_pp0_iter2_reg <= mul_ln389_5_reg_483;
        mul_ln389_reg_478_pp0_iter2_reg <= mul_ln389_reg_478;
        zext_ln26_reg_488[4 : 0] <= zext_ln26_fu_339_p1[4 : 0];
        zext_ln27_reg_446_pp0_iter2_reg[4 : 0] <= zext_ln27_reg_446_pp0_iter1_reg[4 : 0];
        zext_ln27_reg_446_pp0_iter3_reg[4 : 0] <= zext_ln27_reg_446_pp0_iter2_reg[4 : 0];
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        W4_M_imag_ce0 = 1'b1;
    end else begin
        W4_M_imag_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        W4_M_real_ce0 = 1'b1;
    end else begin
        W4_M_real_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln22_fu_214_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter3_reg == 1'b1))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_idle_pp0 == 1'b1) & (ap_start_int == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_block_num_load = 2'd0;
    end else begin
        ap_sig_allocacmp_block_num_load = block_num_fu_62;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_indvar_flatten_load = 5'd0;
    end else begin
        ap_sig_allocacmp_indvar_flatten_load = indvar_flatten_fu_66;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_j_load = 4'd0;
    end else begin
        ap_sig_allocacmp_j_load = j_fu_58;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
        s3_M_imag_ce0 = 1'b1;
    end else begin
        s3_M_imag_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        s3_M_imag_ce1 = 1'b1;
    end else begin
        s3_M_imag_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
        s3_M_real_ce0 = 1'b1;
    end else begin
        s3_M_real_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        s3_M_real_ce1 = 1'b1;
    end else begin
        s3_M_real_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter4 == 1'b1))) begin
        s4_M_imag_ce0 = 1'b1;
    end else begin
        s4_M_imag_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter4 == 1'b1))) begin
        s4_M_imag_ce1 = 1'b1;
    end else begin
        s4_M_imag_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter4 == 1'b1))) begin
        s4_M_imag_we0 = 1'b1;
    end else begin
        s4_M_imag_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter4 == 1'b1))) begin
        s4_M_imag_we1 = 1'b1;
    end else begin
        s4_M_imag_we1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter4 == 1'b1))) begin
        s4_M_real_ce0 = 1'b1;
    end else begin
        s4_M_real_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter4 == 1'b1))) begin
        s4_M_real_ce1 = 1'b1;
    end else begin
        s4_M_real_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter4 == 1'b1))) begin
        s4_M_real_we0 = 1'b1;
    end else begin
        s4_M_real_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter4 == 1'b1))) begin
        s4_M_real_we1 = 1'b1;
    end else begin
        s4_M_real_we1 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign W4_M_imag_address0 = zext_ln23_fu_260_p1;

assign W4_M_real_address0 = zext_ln23_fu_260_p1;

assign add_ln22_1_fu_246_p2 = (ap_sig_allocacmp_block_num_load + 2'd1);

assign add_ln22_fu_220_p2 = (ap_sig_allocacmp_indvar_flatten_load + 5'd1);

assign add_ln23_fu_290_p2 = (select_ln22_fu_238_p3 + 4'd1);

assign add_ln27_fu_278_p2 = (add_ln_fu_270_p3 + 5'd8);

assign add_ln_fu_270_p3 = {{trunc_ln26_fu_266_p1}, {select_ln22_fu_238_p3}};

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign grp_fu_390_p0 = sext_ln389_5_fu_319_p1;

assign grp_fu_390_p1 = sext_ln389_6_fu_323_p1;

assign grp_fu_398_p0 = sext_ln389_fu_311_p1;

assign grp_fu_398_p1 = sext_ln389_6_fu_323_p1;

assign icmp_ln22_fu_214_p2 = ((ap_sig_allocacmp_indvar_flatten_load == 5'd16) ? 1'b1 : 1'b0);

assign icmp_ln23_fu_232_p2 = ((ap_sig_allocacmp_j_load == 4'd8) ? 1'b1 : 1'b0);

assign mul_ln389_5_fu_333_p0 = sext_ln389_5_fu_319_p1;

assign mul_ln389_5_fu_333_p1 = sext_ln389_4_fu_315_p1;

assign mul_ln389_fu_327_p0 = sext_ln389_fu_311_p1;

assign mul_ln389_fu_327_p1 = sext_ln389_4_fu_315_p1;

assign s3_M_imag_address0 = zext_ln26_fu_339_p1;

assign s3_M_imag_address1 = zext_ln27_fu_284_p1;

assign s3_M_real_address0 = zext_ln26_fu_339_p1;

assign s3_M_real_address1 = zext_ln27_fu_284_p1;

assign s4_M_imag_address0 = zext_ln27_reg_446_pp0_iter3_reg;

assign s4_M_imag_address1 = zext_ln26_reg_488;

assign s4_M_imag_d0 = (s3_M_imag_q0 - trunc_ln389_2_fu_353_p4);

assign s4_M_imag_d1 = (s3_M_imag_q0 + trunc_ln389_2_fu_353_p4);

assign s4_M_real_address0 = zext_ln27_reg_446_pp0_iter3_reg;

assign s4_M_real_address1 = zext_ln26_reg_488;

assign s4_M_real_d0 = (s3_M_real_q0 - trunc_ln_fu_344_p4);

assign s4_M_real_d1 = (s3_M_real_q0 + trunc_ln_fu_344_p4);

assign select_ln22_1_fu_252_p3 = ((icmp_ln23_fu_232_p2[0:0] == 1'b1) ? add_ln22_1_fu_246_p2 : ap_sig_allocacmp_block_num_load);

assign select_ln22_fu_238_p3 = ((icmp_ln23_fu_232_p2[0:0] == 1'b1) ? 4'd0 : ap_sig_allocacmp_j_load);

assign sext_ln389_4_fu_315_p1 = $signed(W4_M_real_q0);

assign sext_ln389_5_fu_319_p1 = $signed(s3_M_imag_q1);

assign sext_ln389_6_fu_323_p1 = $signed(W4_M_imag_q0);

assign sext_ln389_fu_311_p1 = $signed(s3_M_real_q1);

assign trunc_ln26_fu_266_p1 = select_ln22_1_fu_252_p3[0:0];

assign trunc_ln389_2_fu_353_p4 = {{grp_fu_398_p3[23:8]}};

assign trunc_ln_fu_344_p4 = {{grp_fu_390_p3[23:8]}};

assign zext_ln23_fu_260_p1 = select_ln22_fu_238_p3;

assign zext_ln26_fu_339_p1 = add_ln_reg_441_pp0_iter2_reg;

assign zext_ln27_fu_284_p1 = add_ln27_fu_278_p2;

always @ (posedge ap_clk) begin
    zext_ln27_reg_446[63:5] <= 59'b00000000000000000000000000000000000000000000000000000000000;
    zext_ln27_reg_446_pp0_iter1_reg[63:5] <= 59'b00000000000000000000000000000000000000000000000000000000000;
    zext_ln27_reg_446_pp0_iter2_reg[63:5] <= 59'b00000000000000000000000000000000000000000000000000000000000;
    zext_ln27_reg_446_pp0_iter3_reg[63:5] <= 59'b00000000000000000000000000000000000000000000000000000000000;
    zext_ln26_reg_488[63:5] <= 59'b00000000000000000000000000000000000000000000000000000000000;
end

endmodule //FFT_FFT_stage_3
