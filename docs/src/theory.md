# Modular Exponentiation Implementation

In the paper Gidney et. al[^1] combined several previously proposed methods for
optimizing the modular exponentiation part of Shor's algorithm. His
implementation is focused on the superconducting qubit platfrom implementing
surface code with lattice surgery implementing some quantum gates. This document
aims to understand each optimization method mentioned in the paper.

## Integer Representation [^2]

We know that a controlled modular adder uses $10n$ Toffoli gates while the
controlled non-modular adder uses $4n$ Toffoli gates. Here $n$ is the number of
qubits used to represent a number. We may reduce the cost of addition if we
could use non-modular addition circuit to mimic the effect of modular adder.

!!! note "Rough Sektch of Modular Addition" 
    In the VBE[^3] paper, a modular addition was implemented. In order to
    compute $(a+b)%N$, you would first need to compte put in register $A$ $a+b$,
    then you compare is $a+b > N$ and put the result in a ctrl qubit. You would
    then use the control qubit to conditionally subtract $N$ from register $A$.
    Lastly, you will need to clear out the control bit with the comparison
    result of regiter $A$ with another register $B$ holding the result of $a+b$.
    

This is achieved by choosing to encode an integer $k$(mod $N$) as quantum state
$\sqrt{2^{-c_{pad}}} \sum_{j=0}^{2^{c_{pad}} -1} \ket{jN+k}$ here $c_{pad}$ is
the number of qubits padded with the high-order qubits.

!!! warning "Order of Qubits"
    Please be aware of endianess of qubits. Craig seems to be using 
    large endianess where high order qubits are placed at the end
        
The number of padding needed scales logarithmically with how well the end result
approximates the modular result.

A naive understanding of the idea is perhaps demonstrated as the follows. Say we
want to compute $(k + y) % N$. Let's define $xN + k' \equiv k+y$ therefore
$(k+y)%N = k'$.

In the proposed encoding system, $k + y$ is encoded as $\ket{k+ y} + \ket{k+N +
y} + \ket{k+2N + y} + ...$ while $k'$ is encoded as $\ket{k'} + \ket{k' + N} +
\ket{k' + 2N} + ...$. Using the equation $k' = k + y - xN$ we could reexpress
$\ket{k'} = ... + \ket{k+y-N} + \ket{k+y} + \ket{k+y+N} + ...$ When the padding
is long enough, the two sums both become very long and they overlap more and
more.

More references including the circuit design for encoding $k$ into the coset
form could be found in section 4 in [^2]. More families of such approximate
encoding scheme can be found in section 3 of [^4].

## Windowed Arithmetic

A windowed arithmetic is algorithm that merges operations into lookup tables
that saves computation. 

### Lookup table

"A lookup table is an operation that retrieves classical data encoded in the
quantum register". To put it more concretely, given the fact that we would like
to accomplish the map of $\ket{j}\ket{0} \rightarrow \ket{j}\ket{T_j}$. We may
precompute the value $T_j$ corresponding to all values in the domain. Then
encode it into a quantum circuit. The quantum circuit will achieve the intended
mapping of $\sum_j \ket{j}\ket{0} \rightarrow \ket{j}\ket{T_j}$.

![Lookup table circuit](lookuptable_circuit.png)

The unconventional control part of the circuit denotes the following.

![Lookup circuit convention](lookupcircuit_convention.png)

Take the first control gate for example, the hollow circle means anti-control,
the second solid circle means control and there is an implicit not gate acted
upon the third line. The qubit on the third line is initialized to be in
$\ket{0}$.

The question mark in the circuit denotes whether to appli the $X$ gate depending
on the value of $T_j$. 

It is motivated by the fact that classical computation is much less expensive
than quantum ones. Therefore, it makes sense to precompute things on the
classical machine and then query in with quantum circuit whenever needed.

!!! note "Lookup Table Uncomputation"
    I am not sure if measurement by uncomputation will be involved in the Shor's
    algorithm paper. The details of it remains unexplored.
    
### Windowed Arithmetic

The windowed arithmetic is a simple idea of breaking down arithmetic of the form
$x += k * y$ into multiple additions $x += 2^i * k * y_{i}$ for $i$ from 0 to
~len(y)~. A windowed version of it adds different. It does $x += 2^i *[y_i
y_{i+1} y_{i+2} ....y_{i+window}] * k$.

Note, this could be easily extended to doing multiplication.

!!! warning "Speed up Source" 
    I don't understand where is the logarithmic speed up coming from.

!!! note "Two's Complement"
    The integers will be represented in 2's complement format. The two's
    complement format consists of a signed bit and n bits. To encode a signed
    integer we first convert the absolute value of the integer $k$ into binary
    form. Then, we encode the bit value into the $n$ bits. Conditioned on the
    integer being negative, both the sign bit will be flipped and the $n$ bits
    number will be increased by 1 ignoring overflow.


## Oblivious Runway

The last algorithmic optimization is oblivious runway. Oblivious runway is an
algorithm that enables piece-wise addition breakdown of an addition circuit on
$n$ qubits.

The circuit that describes the runway is the following.

![Oblivious Runway Circuit](oblivious_runway.png)

It works on the premise that it is very unlikley that a carry will be kept
carrying all the way to the last bit. Therefore, it may break down the addition
into pieces. The carry of each section is thrown away? (What about the decoherence created this way?)


[^1]: [gidney2021factor](@cite)
[^2]: [zalka2006shor](@cite)
[^3]: [vedral1996quantum](@cite)
[^4]: [gidney2019approximate](@cite)
