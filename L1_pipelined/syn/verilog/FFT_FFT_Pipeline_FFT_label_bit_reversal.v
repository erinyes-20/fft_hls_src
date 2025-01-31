// ==============================================================
// Generated by Vitis HLS v2023.2
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// ==============================================================

`timescale 1 ns / 1 ps 

module FFT_FFT_Pipeline_FFT_label_bit_reversal (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        data_IN_address0,
        data_IN_ce0,
        data_IN_q0,
        after_rev_M_real_address0,
        after_rev_M_real_ce0,
        after_rev_M_real_we0,
        after_rev_M_real_d0,
        after_rev_M_imag_address0,
        after_rev_M_imag_ce0,
        after_rev_M_imag_we0,
        after_rev_M_imag_d0
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [4:0] data_IN_address0;
output   data_IN_ce0;
input  [31:0] data_IN_q0;
output  [4:0] after_rev_M_real_address0;
output   after_rev_M_real_ce0;
output   after_rev_M_real_we0;
output  [15:0] after_rev_M_real_d0;
output  [4:0] after_rev_M_imag_address0;
output   after_rev_M_imag_ce0;
output   after_rev_M_imag_we0;
output  [15:0] after_rev_M_imag_d0;

reg ap_idle;
reg data_IN_ce0;
reg after_rev_M_real_ce0;
reg after_rev_M_real_we0;
reg after_rev_M_imag_ce0;
reg after_rev_M_imag_we0;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_idle_pp0;
wire    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln39_fu_108_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire   [4:0] rev_32_address0;
reg    rev_32_ce0;
wire   [4:0] rev_32_q0;
wire    ap_block_pp0_stage0_11001;
wire   [63:0] zext_ln39_fu_120_p1;
reg   [63:0] zext_ln39_reg_162;
reg   [63:0] zext_ln39_reg_162_pp0_iter1_reg;
wire    ap_block_pp0_stage0;
wire   [63:0] zext_ln40_fu_130_p1;
reg   [5:0] n_fu_44;
wire   [5:0] add_ln39_fu_114_p2;
wire    ap_loop_init;
reg   [5:0] ap_sig_allocacmp_n_1;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg    ap_loop_exit_ready_pp0_iter1_reg;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 n_fu_44 = 6'd0;
#0 ap_done_reg = 1'b0;
end

FFT_FFT_Pipeline_FFT_label_bit_reversal_rev_32_ROM_AUTO_1R #(
    .DataWidth( 5 ),
    .AddressRange( 32 ),
    .AddressWidth( 5 ))
rev_32_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(rev_32_address0),
    .ce0(rev_32_ce0),
    .q0(rev_32_q0)
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
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_exit_ready_pp0_iter1_reg == 1'b1))) begin
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
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln39_fu_108_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            n_fu_44 <= add_ln39_fu_114_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            n_fu_44 <= 6'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
        zext_ln39_reg_162[5 : 0] <= zext_ln39_fu_120_p1[5 : 0];
        zext_ln39_reg_162_pp0_iter1_reg[5 : 0] <= zext_ln39_reg_162[5 : 0];
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        after_rev_M_imag_ce0 = 1'b1;
    end else begin
        after_rev_M_imag_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        after_rev_M_imag_we0 = 1'b1;
    end else begin
        after_rev_M_imag_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        after_rev_M_real_ce0 = 1'b1;
    end else begin
        after_rev_M_real_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        after_rev_M_real_we0 = 1'b1;
    end else begin
        after_rev_M_real_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln39_fu_108_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_exit_ready_pp0_iter1_reg == 1'b1))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_start_int == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
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
        ap_sig_allocacmp_n_1 = 6'd0;
    end else begin
        ap_sig_allocacmp_n_1 = n_fu_44;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        data_IN_ce0 = 1'b1;
    end else begin
        data_IN_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        rev_32_ce0 = 1'b1;
    end else begin
        rev_32_ce0 = 1'b0;
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

assign add_ln39_fu_114_p2 = (ap_sig_allocacmp_n_1 + 6'd1);

assign after_rev_M_imag_address0 = zext_ln39_reg_162_pp0_iter1_reg;

assign after_rev_M_imag_d0 = {{data_IN_q0[31:16]}};

assign after_rev_M_real_address0 = zext_ln39_reg_162_pp0_iter1_reg;

assign after_rev_M_real_d0 = data_IN_q0[15:0];

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign data_IN_address0 = zext_ln40_fu_130_p1;

assign icmp_ln39_fu_108_p2 = ((ap_sig_allocacmp_n_1 == 6'd32) ? 1'b1 : 1'b0);

assign rev_32_address0 = zext_ln39_fu_120_p1;

assign zext_ln39_fu_120_p1 = ap_sig_allocacmp_n_1;

assign zext_ln40_fu_130_p1 = rev_32_q0;

always @ (posedge ap_clk) begin
    zext_ln39_reg_162[63:6] <= 58'b0000000000000000000000000000000000000000000000000000000000;
    zext_ln39_reg_162_pp0_iter1_reg[63:6] <= 58'b0000000000000000000000000000000000000000000000000000000000;
end

endmodule //FFT_FFT_Pipeline_FFT_label_bit_reversal
