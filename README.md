# Computer Architecture Lab Project

**Course**: CE-321L/CS-330L/EE-371L - Computer Architecture Lab (Spring '25)

**Project**: 5-Stage Pipelined RISC-V Processor Implementing Array Sorting Algorithm

## Table of Contents

1. [Project Overview](#project-overview)
2. [Features](#features)
3. [Prerequisites](#prerequisites)
4. [Getting Started](#getting-started)
5. [Design Tasks](#design-tasks)

   1. [Task 1: Single-Cycle Processor](#task-1-single-cycle-processor)
   2. [Task 2: 5-Stage Pipelined Processor](#task-2-5-stage-pipelined-processor)
   3. [Task 3: Hazard Detection & Control](#task-3-hazard-detection--control)
   4. [Task 4: Performance Comparison](#task-4-performance-comparison)
6. [Simulation & Testing](#simulation--testing)
7. [Results](#results)
8. [Challenges & Lessons Learned](#challenges--lessons-learned)
9. [Contributions](#contributions)
10. [Appendix & References](#appendix--references)

---

## Project Overview

This project extends a basic single-cycle RISC-V processor into a fully pipelined architecture capable of executing an array-sorting algorithm in hardware. The goals are to:

* Convert a single-cycle RISC-V CPU to support bubble sort on in-memory data.
* Implement a classic 5-stage pipeline (IF, ID, EX, MEM, WB).
* Add hazard detection and resolution (forwarding, pipeline stalls, flushes).
* Compare execution performance between single-cycle and pipelined implementations.

## Features

* **RISC-V Instruction Set**: Supports all base RV32I instructions plus branch comparisons (`blt`, `bgt`).
* **Sorting Algorithm**: Bubble sort over 7 or more integers stored at memory address `0x100`.
* **5-Stage Pipeline**: Includes instruction fetch, decode, execute, memory, and write-back stages with intermediate pipeline registers.
* **Hazard Management**:

  * Data forwarding unit.
  * Hazard detection unit (stall and flush logic for control/data hazards).
* **Performance Analysis**: Execution time measurements for both processor designs.

## Prerequisites

* Verilog/SystemVerilog simulator (e.g., ModelSim or Verilator).
* RISC-V assembler toolchain (e.g., GNU `riscv64-unknown-elf-gcc`).
* (Optional) GTKWave or waveform viewer for simulation traces.

## Getting Started

1. **Clone the repository**:

   ```bash
   git clone https://github.com/yourusername/CA-Lab-Project.git
   cd CA-Lab-Project
   ```

2. **Simulate Single-Cycle Design (Task 1)**:

   ```bash
   cd CA project.srcs/sim_1/new
   vsim -voptargs="+acc" tb_RISC_V_Processor
   ```

3. **Simulate Pipelined Design (Task 2)**:

   ```bash
   cd CA project.srcs/sim_1/new
   vsim -voptargs="+acc" tb_RISC_V_Processor_task2
   ```

4. **Simulate Hazard-Control Design (Task 3)**:

   ```bash
   cd CA project.srcs/sim_1/new
   vsim -voptargs="+acc" tb_RISC_V_Processor_task3
   ```

## Design Tasks

### Task 1: Single-Cycle Processor

Implemented a single-cycle RISC-V datapath capable of running a bubble sort routine on an in-memory array (7+ integers starting at `0x100`).

### Task 2: 5-Stage Pipelined Processor

Modified Task 1 design to insert IF/ID, ID/EX, EX/MEM, and MEM/WB registers, steering control signals through the pipeline.

### Task 3: Hazard Detection & Control

Introduced forwarding unit for data hazards, hazard detection unit for stalls, and flush logic for control hazards. Validated full sorting algorithm correctness under pipeline hazards.

### Task 4: Performance Comparison

Measured and compared execution time:

* **Single-Cycle**: \~1000 ns
* **Pipelined w/ Hazards**: \~800 ns

## Simulation & Testing

* Each task directory contains a `testbench.v` that automates reset, clock toggling, and data monitoring.
* Waveform outputs are saved under `results/waveforms/` for visual verification.

## Results

* **Correctness**: Sorting algorithm verified for random input arrays.
* **Performance**: Pipelined design shows \~20% speedup over single-cycle (800 ns vs. 1000 ns for 7-element sort).

## Challenges & Lessons Learned

* Handling read-after-write hazards without stalling required careful forwarding logic.
* Implementing early branch detection and pipeline flushes to avoid control hazards.
* Synchronizing pipeline register controls for precise timing.
