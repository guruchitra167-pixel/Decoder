# 2-to-4 Decoder Using Verilog HDL

## 1. Project Title

**2-to-4 Decoder Design and Simulation Using Verilog HDL**

## 2. Introduction

A decoder is a combinational digital circuit that converts binary input information into a corresponding output signal.

A **2-to-4 decoder** has:

* 2 input lines
* 4 output lines
* 1 enable input

For each valid 2-bit input combination, exactly one output becomes HIGH when the decoder is enabled.

## 3. Objective

The objectives of this project are:

* To design a 2-to-4 decoder using Verilog HDL.
* To understand the operation of a decoder.
* To create a Verilog testbench.
* To test all possible input combinations.
* To simulate and verify the output waveform.

## 4. Inputs and Outputs

### Inputs

* `A` – Input bit 1
* `B` – Input bit 0
* `Enable` – Enables or disables the decoder

### Outputs

* `Y[0]`
* `Y[1]`
* `Y[2]`
* `Y[3]`

## 5. Truth Table

When `Enable = 0`, all outputs are LOW.

When `Enable = 1`, one output is HIGH according to the input combination.

| Enable | A | B | Y3 | Y2 | Y1 | Y0 |
| ------ | - | - | -- | -- | -- | -- |
| 0      | X | X | 0  | 0  | 0  | 0  |
| 1      | 0 | 0 | 0  | 0  | 0  | 1  |
| 1      | 0 | 1 | 0  | 0  | 1  | 0  |
| 1      | 1 | 0 | 0  | 1  | 0  | 0  |
| 1      | 1 | 1 | 1  | 0  | 0  | 0  |

## 6. Block Diagram

```text
             +----------------+
      A ---->|                |
      B ---->|    2-to-4      |----> Y0
             |    DECODER     |----> Y1
 Enable ---->|                |----> Y2
             |                |----> Y3
             +----------------+
```

## 7. Working Principle

The decoder uses the two input bits to select one of the four outputs.

The output equations are:

```text
Y0 = Enable · ~A · ~B
Y1 = Enable · ~A · B
Y2 = Enable · A · ~B
Y3 = Enable · A · B
```

For example:

```text
A = 1
B = 0
```

The selected output is:

```text
Y2 = 1
```

and all other outputs are `0`.

## 8. Project Structure

```text
2-to-4-decoder/
│
├── README.md
│
├── src/
│   └── decoder_2to4.v
│
└── testbench/
    └── tb_decoder_2to4.v
```

## 9. Tools Required

The project can be simulated using:

* Icarus Verilog
* GTKWave
* ModelSim
* Vivado

## 10. Simulation

### Compile the Verilog files

```bash
iverilog -o decoder_sim src/decoder_2to4.v testbench/tb_decoder_2to4.v
```

### Run the simulation

```bash
vvp decoder_sim
```

### Open the waveform

```bash
gtkwave decoder_2to4.vcd
```

Add the following signals in GTKWave:

```text
Enable
A
B
Y
```

## 11. Expected Simulation Output

```text
Time = 0  | Enable = 0 | A = 0 | B = 0 | Y = 0000
Time = 10 | Enable = 1 | A = 0 | B = 0 | Y = 0001
Time = 20 | Enable = 1 | A = 0 | B = 1 | Y = 0010
Time = 30 | Enable = 1 | A = 1 | B = 0 | Y = 0100
Time = 40 | Enable = 1 | A = 1 | B = 1 | Y = 1000
```

## 12. Applications

2-to-4 decoders are used in:

* Memory address decoding
* Data routing
* Digital logic circuits
* Microprocessors
* Control systems
* Instruction decoding
* Communication systems

## 13. Advantages

* Simple combinational circuit.
* Fast operation.
* Easy to implement using logic gates.
* Useful for selecting one output from multiple outputs.
* Can be extended to larger decoders.

## 14. Conclusion

A 2-to-4 decoder was successfully designed using Verilog HDL.

The testbench verifies all possible input combinations. The simulation confirms that exactly one output is HIGH for each valid input combination when the decoder is enabled.

Therefore, the Verilog decoder design is functionally correct.

## 15. Author

**Project:** 2-to-4 Decoder Using Verilog HDL
**Language:** Verilog HDL
**Simulation:** Icarus Verilog and GTKWave
