# NOTE: Assertions have been autogenerated by utils/update_mca_test_checks.py
# RUN: llvm-mca -mtriple=x86_64-unknown-unknown -mcpu=btver2 -iterations=1000 -timeline < %s | FileCheck %s

add %eax, %ecx
add %esi, %eax
add %eax, %edx

# CHECK:      Iterations:        1000
# CHECK-NEXT: Instructions:      3000
# CHECK-NEXT: Total Cycles:      1506
# CHECK-NEXT: Total uOps:        3000

# CHECK:      Dispatch Width:    2
# CHECK-NEXT: uOps Per Cycle:    1.99
# CHECK-NEXT: IPC:               1.99
# CHECK-NEXT: Block RThroughput: 1.5

# CHECK:      Instruction Info:
# CHECK-NEXT: [1]: #uOps
# CHECK-NEXT: [2]: Latency
# CHECK-NEXT: [3]: RThroughput
# CHECK-NEXT: [4]: MayLoad
# CHECK-NEXT: [5]: MayStore
# CHECK-NEXT: [6]: HasSideEffects (U)

# CHECK:      [1]    [2]    [3]    [4]    [5]    [6]    Instructions:
# CHECK-NEXT:  1      1     0.50                        addl	%eax, %ecx
# CHECK-NEXT:  1      1     0.50                        addl	%esi, %eax
# CHECK-NEXT:  1      1     0.50                        addl	%eax, %edx

# CHECK:      Resources:
# CHECK-NEXT: [0]   - JALU0
# CHECK-NEXT: [1]   - JALU1
# CHECK-NEXT: [2]   - JDiv
# CHECK-NEXT: [3]   - JFPA
# CHECK-NEXT: [4]   - JFPM
# CHECK-NEXT: [5]   - JFPU0
# CHECK-NEXT: [6]   - JFPU1
# CHECK-NEXT: [7]   - JLAGU
# CHECK-NEXT: [8]   - JMul
# CHECK-NEXT: [9]   - JSAGU
# CHECK-NEXT: [10]  - JSTC
# CHECK-NEXT: [11]  - JVALU0
# CHECK-NEXT: [12]  - JVALU1
# CHECK-NEXT: [13]  - JVIMUL

# CHECK:      Resource pressure per iteration:
# CHECK-NEXT: [0]    [1]    [2]    [3]    [4]    [5]    [6]    [7]    [8]    [9]    [10]   [11]   [12]   [13]
# CHECK-NEXT: 1.50   1.50    -      -      -      -      -      -      -      -      -      -      -      -

# CHECK:      Resource pressure by instruction:
# CHECK-NEXT: [0]    [1]    [2]    [3]    [4]    [5]    [6]    [7]    [8]    [9]    [10]   [11]   [12]   [13]   Instructions:
# CHECK-NEXT: 0.50   0.50    -      -      -      -      -      -      -      -      -      -      -      -     addl	%eax, %ecx
# CHECK-NEXT: 0.50   0.50    -      -      -      -      -      -      -      -      -      -      -      -     addl	%esi, %eax
# CHECK-NEXT: 0.50   0.50    -      -      -      -      -      -      -      -      -      -      -      -     addl	%eax, %edx

# CHECK:      Timeline view:
# CHECK-NEXT:                     0123456789
# CHECK-NEXT: Index     0123456789          0

# CHECK:      [0,0]     DeER .    .    .    .   addl	%eax, %ecx
# CHECK-NEXT: [0,1]     DeER .    .    .    .   addl	%esi, %eax
# CHECK-NEXT: [0,2]     .DeER.    .    .    .   addl	%eax, %edx
# CHECK-NEXT: [1,0]     .DeER.    .    .    .   addl	%eax, %ecx
# CHECK-NEXT: [1,1]     . DeER    .    .    .   addl	%esi, %eax
# CHECK-NEXT: [1,2]     . D=eER   .    .    .   addl	%eax, %edx
# CHECK-NEXT: [2,0]     .  DeER   .    .    .   addl	%eax, %ecx
# CHECK-NEXT: [2,1]     .  D=eER  .    .    .   addl	%esi, %eax
# CHECK-NEXT: [2,2]     .   D=eER .    .    .   addl	%eax, %edx
# CHECK-NEXT: [3,0]     .   D=eER .    .    .   addl	%eax, %ecx
# CHECK-NEXT: [3,1]     .    D=eER.    .    .   addl	%esi, %eax
# CHECK-NEXT: [3,2]     .    D==eER    .    .   addl	%eax, %edx
# CHECK-NEXT: [4,0]     .    .D=eER    .    .   addl	%eax, %ecx
# CHECK-NEXT: [4,1]     .    .D==eER   .    .   addl	%esi, %eax
# CHECK-NEXT: [4,2]     .    . D==eER  .    .   addl	%eax, %edx
# CHECK-NEXT: [5,0]     .    . D===eER .    .   addl	%eax, %ecx
# CHECK-NEXT: [5,1]     .    .  D=eE-R .    .   addl	%esi, %eax
# CHECK-NEXT: [5,2]     .    .  D==eE-R.    .   addl	%eax, %edx
# CHECK-NEXT: [6,0]     .    .   D==eER.    .   addl	%eax, %ecx
# CHECK-NEXT: [6,1]     .    .   D==eE-R    .   addl	%esi, %eax
# CHECK-NEXT: [6,2]     .    .    D==eER    .   addl	%eax, %edx
# CHECK-NEXT: [7,0]     .    .    D===eER   .   addl	%eax, %ecx
# CHECK-NEXT: [7,1]     .    .    .D=eE-R   .   addl	%esi, %eax
# CHECK-NEXT: [7,2]     .    .    .D==eE-R  .   addl	%eax, %edx
# CHECK-NEXT: [8,0]     .    .    . D==eER  .   addl	%eax, %ecx
# CHECK-NEXT: [8,1]     .    .    . D==eE-R .   addl	%esi, %eax
# CHECK-NEXT: [8,2]     .    .    .  D==eER .   addl	%eax, %edx
# CHECK-NEXT: [9,0]     .    .    .  D===eER.   addl	%eax, %ecx
# CHECK-NEXT: [9,1]     .    .    .   D=eE-R.   addl	%esi, %eax
# CHECK-NEXT: [9,2]     .    .    .   D==eE-R   addl	%eax, %edx

# CHECK:      Average Wait times (based on the timeline view):
# CHECK-NEXT: [0]: Executions
# CHECK-NEXT: [1]: Average time spent waiting in a scheduler's queue
# CHECK-NEXT: [2]: Average time spent waiting in a scheduler's queue while ready
# CHECK-NEXT: [3]: Average time elapsed from WB until retire stage

# CHECK:            [0]    [1]    [2]    [3]
# CHECK-NEXT: 0.     10    2.5    0.4    0.0       addl	%eax, %ecx
# CHECK-NEXT: 1.     10    2.1    0.7    0.5       addl	%esi, %eax
# CHECK-NEXT: 2.     10    2.6    0.0    0.3       addl	%eax, %edx
# CHECK-NEXT:        10    2.4    0.4    0.3       <total>
