// SPDX-License-Identifier: Apache-2.0

(* blackbox *)
module BUFG (
    input  logic I,
    output logic O
);
endmodule

(* blackbox *)
module MMCME2_BASE #(
    parameter CLKIN1_PERIOD    = 10,
    parameter DIVCLK_DIVIDE    = 1,
    parameter CLKFBOUT_MULT_F  = 10,
    parameter CLKOUT0_DIVIDE_F = 20
) (
    input  logic CLKIN1,
    input  logic CLKFBIN,
    output logic CLKFBOUT,
    output logic CLKFBOUTB,
    output logic CLKOUT0,
    output logic CLKOUT0B,
    output logic CLKOUT1,
    output logic CLKOUT1B,
    output logic CLKOUT2,
    output logic CLKOUT2B,
    output logic CLKOUT3,
    output logic CLKOUT3B,
    output logic CLKOUT4,
    output logic CLKOUT5,
    output logic CLKOUT6,
    output logic LOCKED,
    input  logic PWRDWN,
    input  logic RST
);
endmodule
