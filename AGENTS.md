# Instructions

Read README.md first. It describes what mmRISC-2 is and how the core is designed.

This repository contains the mmRISC-2 RISC-V processor and SoC.
The build system uses Bazel 9 with `rules_openxc7` to synthesize and place-and-route
the Arty A7-100T (`xc7a100tcsg324-1`) FPGA implementation.

# Layout rules

* `AGENTS.md` is the canonical instruction file.
  `CLAUDE.md` and `GEMINI.md` are symlinks to it.
  Keep them symlinks; never replace one with a copy.
* `RTL/` contains the SystemVerilog implementation of the mmRISC-2 core, bus, peripherals, and debug unit.
  `RTL/BUILD.bazel` exposes `sources`, `headers`, and `xilinx_prims`.
* `FPGA/ARTY_A7_100T/` contains the Arty A7-100T constraint files (`TOP_impl.xdc`).
  `FPGA/ARTY_A7_100T/BUILD.bazel` exposes these constraints.
* Root `BUILD.bazel` defines the synthesis, place-and-route, and bitstream targets.

# Build targets

Run Bazel builds from the repository root:

* Synthesize the design for Arty A7-100T:
  ```sh
  bazel build //:top_synth
  ```
  This uses Yosys with the Slang SystemVerilog frontend to synthesize the design.

* Place and route, and produce the FPGA bitstream:
  ```sh
  bazel build //:top_pnr
  ```
  This runs `nextpnr-xilinx` on the synthesized JSON netlist and generates `top_pnr.bit`.

* Program the connected Arty A7-100T board:
  ```sh
  bazel run //:top_prog
  ```
  This invokes `openFPGALoader` to write the bitstream to the device.

# Git and workflow rules

Follow the instructions in `github.com/filmil/ai-coding-sop`:
* Use Conventional Commits v1.0.0 for commit titles.
* No interactive editor may be invoked during git commands (`GIT_EDITOR=true`).
* Append the automated assistant note and the generating prompt to commit and PR descriptions.
* Keep `CLAUDE.md` and `GEMINI.md` symlinked to `AGENTS.md`.
