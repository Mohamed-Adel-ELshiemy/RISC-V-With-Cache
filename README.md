●RISC_V Single Cycle Processor Description :
» The single-cycle datapath, adding one piece at a time to the state elements from RISC_V single cycle system Figure . The new connections are emphasized in black (or blue, for new control 
signals), whereas the hardware that has already been studied is shown in gray. The example instruction being executed is shown at the bottom of each figure. The program counter contains the 
address of the instruction to execute. The first step is to read this instruction from instruction memory. RISC_V single cycle system Figure shows that the PC is simply connected to the 
address input of the instruction memory. The instruction memory reads out, or fetches, the 32-bit instruction, labeled Instr. In our sample program from RISC_V single cycle system Figure, 
PC is 0x1000. (Note that this is a 32-bit processor, so PC is really 0x00001000, but we omit leading zeros to avoid cluttering the figure.)

 ![image](https://github.com/Mohamed-Adel-ELshiemy/RISC-V-With-Cache/assets/156431969/8bf6c8d5-ea6c-4e46-8bfb-6c2fcbc2eae1)

===========RISC_V single cycle system Figure==========
 ![image](https://github.com/Mohamed-Adel-ELshiemy/RISC-V-With-Cache/assets/156431969/788f175f-26f4-4f5d-af94-7053d34fc3af)

===========RISC_V single cycle control unit===========
●We replace the data memory block in RISC_V single cycle system with the data memory system module (RISC_V single cycle system with cache memory):
 ![image](https://github.com/Mohamed-Adel-ELshiemy/RISC-V-With-Cache/assets/156431969/a605abaf-7591-4b1e-8c05-a2a40c46ee87)

========= Top Level Cache Memory Module========

»Then we use the stall signal as an enable signal for the program counter (PC). If the stall signal equal one the program counter (PC) will never get its next value. It will hold the 
processor from execute.
