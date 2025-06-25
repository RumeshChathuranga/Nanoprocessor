# 4-Bit Nano Processor Design

[![VHDL](https://img.shields.io/badge/Language-VHDL-blue.svg)](https://www.vhdl.org/)
[![FPGA](https://img.shields.io/badge/Hardware-Basys3-green.svg)](https://store.digilentinc.com/basys-3-artix-7-fpga-trainer-board-recommended-for-introductory-users/)
[![Vivado](https://img.shields.io/badge/Tool-Vivado-orange.svg)](https://www.xilinx.com/products/design-tools/vivado.html)

A comprehensive 4-bit nano processor implementation designed and developed for **CS1050 Computer Organization and Digital Design** course. This project features both basic and improved versions of a fully functional processor with custom instruction sets, complete with simulation testbenches and FPGA implementation.

## 🎯 Project Overview

This project implements a 4-bit nano processor capable of executing a custom instruction set. The processor is designed using VHDL and synthesized for Xilinx Basys 3 FPGA board. The project includes two versions:

- **Basic Version**: 4 instructions, 8 registers, 8 program memory locations
- **Improved Version**: 12 instructions, 16 registers, 16 program memory locations

## ✨ Features

### Basic Nano Processor
- 4-bit data width
- 8 general-purpose registers (R0-R7)
- 4 instruction types: ADD, NEG, MOVI, JZR
- 8×12-bit Program ROM
- Clocked synchronization
- 7-segment display output
- LED indicators for overflow and zero flags

### Improved Nano Processor
- Extended to 16 registers (R0-R15)
- 12 instruction types including:
  - Arithmetic: ADD, NEG, MUL
  - Logic: AND, OR, NOT, XOR
  - Shift: Left/Right bit shifting
  - Compare: 4-bit comparison operations
  - Data transfer: MOVI
  - Control flow: JZR
- 16×16-bit Program ROM
- Enhanced ALU with multiplication support
- Comparison indicators (A>B, A=B, A<B)
- Separate overflow flags for addition and multiplication

## 🏗️ Architecture

### Core Components

#### Basic Version
- **Program ROM**: Stores 8 instructions (12-bit each)
- **Instruction Decoder**: 2-to-4 decoder for opcode interpretation
- **Program Counter**: 3-bit counter for instruction addressing
- **Register Bank**: 8×4-bit register file
- **ALU**: 4-bit Add/Subtract Unit
- **Multiplexers**: Data routing and selection
- **Clock Management**: Slow clock generator for synchronization

#### Improved Version
- **Program ROM**: Stores 16 instructions (16-bit each)
- **Instruction Decoder**: 4-to-12 decoder for extended instruction set
- **Program Counter**: 4-bit counter for expanded addressing
- **Register Bank**: 16×4-bit register file
- **Enhanced ALU**: Addition, subtraction, and multiplication
- **Logic Units**: Bitwise AND, OR, NOT, XOR operations
- **Bit Shifters**: Left and right shift operations
- **Comparator**: 4-bit magnitude comparator
- **Operation Selector**: Intelligent operation routing

## 📋 Instruction Set

### Basic Version (4 Instructions)
| Opcode | Instruction | Format | Description |
|--------|-------------|--------|-------------|
| 00 | ADD Ra, Rb | 00 Ra Rb 0000 | Ra ← Ra + Rb |
| 01 | NEG Ra, Rb | 01 Ra Rb 0000 | Ra ← Ra - Rb |
| 10 | MOVI Ra, d | 10 Ra d | Ra ← d (immediate) |
| 11 | JZR Ra, d | 11 Ra 000 d | Jump to d if Ra = 0 |

### Improved Version (12 Instructions)
| Opcode | Instruction | Description |
|--------|-------------|-------------|
| 0000 | ADD Ra, Rb | Addition |
| 0001 | NEG Ra, Rb | Subtraction |
| 0010 | MOVI Ra, d | Move immediate |
| 0011 | JZR Ra, d | Jump if zero |
| 0100 | MUL Ra, Rb | Multiplication |
| 0101 | COMP Ra, Rb | Compare |
| 0110 | AND Ra, Rb | Bitwise AND |
| 0111 | OR Ra, Rb | Bitwise OR |
| 1000 | NOT Ra | Bitwise NOT |
| 1001 | XOR Ra, Rb | Bitwise XOR |
| 1010 | SHL Ra | Shift left |
| 1011 | SHR Ra | Shift right |

## 🚀 Getting Started

### Prerequisites
- Xilinx Vivado Design Suite (2018.3 or later)
- Basys 3 FPGA Development Board (optional, for hardware testing)
- Basic knowledge of VHDL and digital design

### Installation and Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-username/nanoprocessor-design.git
   cd nanoprocessor-design
   ```

2. **Open in Vivado**
   - Launch Vivado Design Suite
   - Create new project or open existing project file
   - Add source files from the repository

3. **Simulation**
   - Run individual component simulations using provided testbenches
   - Execute full processor simulation with `NanoprocessorSim.vhd`

4. **Synthesis and Implementation**
   - Synthesize the design for Basys 3 target
   - Implement and generate bitstream
   - Program the FPGA board

## 📁 Project Structure

```
nanoprocessor-design/
├── basic-version/
│   ├── src/
│   │   ├── nanoprocessor.vhd
│   │   ├── instruction_decoder.vhd
│   │   ├── register_bank.vhd
│   │   ├── program_counter.vhd
│   │   ├── asu.vhd
│   │   └── ...
│   ├── sim/
│   │   ├── nanoprocessor_sim.vhd
│   │   └── component_testbenches/
│   └── constraints/
│       └── basys3.xdc
├── improved-version/
│   ├── src/
│   │   ├── improved_nanoprocessor.vhd
│   │   ├── improved_instruction_decoder.vhd
│   │   ├── multiplier.vhd
│   │   ├── comparator.vhd
│   │   └── ...
│   ├── sim/
│   │   └── improved_testbenches/
│   └── constraints/
│       └── improved_basys3.xdc
├── docs/
│   ├── lab_report.pdf
│   ├── schematics/
│   └── timing_diagrams/
└── README.md
```

## 🔬 Testing and Simulation

### Component-Level Testing
Each component includes individual testbenches:
- Register Bank simulation
- ALU functionality testing
- Instruction Decoder verification
- Program Counter behavior
- Multiplexer operations

### System-Level Testing
- Complete processor simulation with sample programs
- Timing analysis and verification
- Resource utilization reports
- Hardware validation on Basys 3 FPGA

### Sample Test Programs

**Basic Version Example:**
```assembly
MOVI R7, 1    ; Load 1 into R7
MOVI R2, 2    ; Load 2 into R2  
ADD R7, R2    ; R7 = R7 + R2 = 3
MOVI R3, 3    ; Load 3 into R3
ADD R7, R3    ; R7 = R7 + R3 = 6
JZR R0, 7     ; Jump to address 7
```

## 📊 Performance Metrics

### Resource Utilization (Basys 3)

#### Basic Version
- **LUTs**: ~150 (optimized)
- **Flip-Flops**: ~50
- **Maximum Frequency**: ~100 MHz
- **Power Consumption**: Low

#### Improved Version
- **LUTs**: ~400 (extended functionality)
- **Flip-Flops**: ~80
- **Maximum Frequency**: ~85 MHz
- **Additional Resources**: DSP blocks for multiplication

## 🎛️ Hardware Interface

### Basys 3 FPGA Connections
- **Clock Input**: 100 MHz system clock (automatically divided)
- **Reset**: Push button (U18)
- **Output LEDs**: 
  - LD0-LD3: Register R7 value display
  - LD15: Zero flag
  - LD14: Overflow flag (addition)
  - LD13: Overflow flag (multiplication) - Improved version
  - LD12-LD10: Comparison results (A>B, A=B, A<B) - Improved version
- **7-Segment Display**: Shows R7 register value in hexadecimal

## 🔧 Design Methodology

### Development Approach
1. **Modular Design**: Each component designed and tested independently
2. **Bottom-Up Integration**: Components integrated systematically
3. **Comprehensive Testing**: Multiple simulation levels
4. **Resource Optimization**: Efficient use of FPGA resources
5. **Scalable Architecture**: Easy extension and modification

### Key Design Decisions
- **Clock Management**: Slow clock generation for visual debugging
- **Memory Architecture**: LUT-based ROM for instruction storage
- **Data Path**: Optimized multiplexer networks for data routing
- **Control Logic**: Decoder-based instruction interpretation

## 👥 Team Members

**Group 21**
- **230202D** - GINIGE D.N.
- **230104E** - CHATHURANGA R.M.R.
- **230102V** - CHARINDITH A.J.R.J.
- **230185B** - FERNANDO S.D.

## 📚 Documentation

- **Complete Lab Report**: [Lab Report PDF](docs/lab_report.pdf)
- **Design Schematics**: Available in `docs/schematics/`
- **Timing Diagrams**: Available in `docs/timing_diagrams/`
- **Component Documentation**: Individual VHDL file headers

## 🔮 Future Enhancements

- **Pipeline Implementation**: Multi-stage instruction pipeline
- **Cache Memory**: Instruction and data cache systems
- **Interrupt Handling**: External interrupt processing
- **Floating Point Unit**: IEEE 754 floating-point operations
- **Extended Instruction Set**: More complex operations
- **Memory Management**: Virtual memory and protection

## 🤝 Contributing

Contributions are welcome! Please feel free to submit pull requests or open issues for:
- Bug fixes
- Performance improvements
- Documentation enhancements
- Additional test cases
- New features

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- **Course**: CS1050 Computer Organization and Digital Design
- **Institution**: University Of Moratuwa
- **Tools**: Xilinx Vivado Design Suite
- **Hardware**: Digilent Basys 3 FPGA Board

---

**Note**: This project was developed as part of academic coursework. The design serves as an educational implementation of processor architecture principles.

