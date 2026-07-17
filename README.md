# 4-Bit Arithmetic Logic Shift Unit (ALSU) | Structural Verilog | FPGA Design Flow

A structural Verilog implementation of a **4-bit Arithmetic Logic Shift Unit (ALSU)** based on the architecture presented in **M. Morris Mano - Computer System Architecture**.

The project demonstrates the complete **RTL FPGA design flow** from Verilog design to FPGA bitstream generation using **Xilinx Vivado**. The ALU consists of three independent functional units—Arithmetic Unit, Logic Unit, and Combinational Shifter—which are integrated into a top-level 4-bit ALU.

---

# Project Objectives

- Design a modular 4-bit Arithmetic Logic Shift Unit
- Implement the design using **structural Verilog**
- Verify functionality using a comprehensive testbench
- Perform behavioral simulation
- Synthesize the RTL
- Analyze RTL schematic
- Generate utilization, timing and power reports
- Apply Basys-3 FPGA constraints
- Generate FPGA bitstream

---

# Features

### Arithmetic Unit

Implements eight arithmetic micro-operations:

- Transfer A
- Increment A
- Add
- Add with Carry
- Subtract with Borrow
- Subtract
- Decrement A
- Transfer A

Implemented using:

- 4 × 1 Multiplexers
- Ripple Carry Adder
- Full Adders

---

### Logic Unit

Implements four logic operations:

- AND
- OR
- XOR
- Complement A

Implemented using:

- Logic Gates
- 4 × 1 Multiplexers

---

### Combinational Shifter

Implements:

- Shift Right
- Shift Left

Implemented using:

- 2 × 1 Multiplexers

---

# Supported Operations

| S3 | S2 | S1 | S0 | Cin | Operation |
|----|----|----|----|-----|-----------|
|0|0|0|0|0|Transfer A|
|0|0|0|0|1|Increment A|
|0|0|0|1|0|Add|
|0|0|0|1|1|Add with Carry|
|0|0|1|0|0|Subtract with Borrow|
|0|0|1|0|1|Subtract|
|0|0|1|1|0|Decrement A|
|0|0|1|1|1|Transfer A|
|0|1|0|0|X|AND|
|0|1|0|1|X|OR|
|0|1|1|0|X|XOR|
|0|1|1|1|X|Complement A|
|1|1|X|X|X|Shift Right|
|1|1|X|X|X|Shift Left|

---

# Design Hierarchy

```
                ALU_4bit
                    │
    ┌───────────────┼───────────────┐
    │               │               │
    ▼               ▼               ▼
Arithmetic Unit  Logic Unit   Combinational Shifter
    │               │               │
4 Full Adders   Logic Gates     4 × 2:1 MUXes
4 × 4:1 MUXes
```

---

# Project Structure

```
ALSU/
│
├── rtl/
│   ├── ALU_4bit.v
│   ├── arithmetic_unit.v
│   ├── logic_unit.v
│   ├── combinational_shifter.v
│   ├── FA.v
│   ├── MUX_2X1.v
│   └── MUX_4X1.v
│
├── tb/
│   └── tb_ALU_4bit.v
│
├── constraints/
│   └── basys3.xdc
│
├── simulation/
│   ├── alu_4bit.vcd
│   └── waveform.png
│
├── synthesis/
│   ├── rtl_schematic.png
│   ├── utilization_report.pdf
│   ├── timing_report.pdf
│   ├── power_report.pdf
│   └── synthesis_report.pdf
│
├── images/
│
└── README.md
```

---

# Design Methodology

```
Problem Specification
        ↓
Architecture Design
        ↓
Structural Verilog RTL
        ↓
Module Integration
        ↓
Testbench Development
        ↓
Behavioral Simulation
        ↓
RTL Verification
        ↓
Synthesis
        ↓
RTL Schematic Analysis
        ↓
Resource Utilization Analysis
        ↓
Timing Analysis
        ↓
Power Analysis
        ↓
Constraint File Creation
        ↓
Bitstream Generation
```

---

# FPGA Target

**Board**

- Digilent Basys-3

**FPGA**

- Xilinx Artix-7 XC7A35T

---

# Tools Used

| Tool | Purpose |
|------|---------|
| Verilog HDL | RTL Design |
| Vivado | Synthesis & FPGA Flow |
| Vivado Simulator | Behavioral Simulation |
| GTKWave *(optional)* | Waveform Analysis |

---

# Functional Verification

A dedicated testbench verifies:

- Transfer A
- Increment A
- Add
- Add with Carry
- Subtract
- Subtract with Borrow
- Decrement
- AND
- OR
- XOR
- Complement
- Shift Right
- Shift Left

Waveforms are generated for functional verification.

---

# FPGA Design Flow

```
RTL Design
      ↓
Behavioral Simulation
      ↓
RTL Verification
      ↓
Synthesis
      ↓
RTL Schematic
      ↓
Implementation
      ↓
Timing Analysis
      ↓
Power Analysis
      ↓
Bitstream Generation
```

---

# Resource Analysis

The synthesized design was analyzed using Vivado for:

- Logic Utilization
- LUT Usage
- Carry Chain Utilization
- Timing Summary
- Power Estimation

---

# Learning Outcomes

This project helped develop practical understanding of:

- Structural Verilog
- Hierarchical RTL Design
- Combinational Datapath Design
- Ripple Carry Adders
- Multiplexer-Based Design
- FPGA Design Flow
- RTL Simulation
- Functional Verification
- Synthesis
- Timing Analysis
- Power Analysis
- Constraint File Creation
- FPGA Bitstream Generation

---

# Future Improvements

- 8-bit / 16-bit ALU implementation
- Status Flags (Zero, Carry, Overflow, Negative)
- Carry Lookahead Adder based Arithmetic Unit
- Barrel Shifter
- Pipelined ALU
- ASIC RTL-to-GDSII implementation using OpenLane/OpenROAD

---

# References

- M. Morris Mano, *Computer System Architecture*
- Xilinx Vivado Design Suite Documentation
- Digilent Basys-3 Reference Manual