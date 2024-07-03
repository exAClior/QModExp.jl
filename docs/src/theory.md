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

This is achieved by choosing to encode an integer $k$(mod $N$) as quantum state
$\sqrt{2^{-c_{pad}}} \sum_{j=0}^{2^{c_{pad}} -1} \ket{jN+k}$ here $c_{pad}$ is
the number of qubits padded with the high-order qubits.

    !!! warning "Order of Qubits"
        Please be aware of endianess of qubits. Craig seems to be using large endianess where high order qubits are placed at the end
        
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

Need to write a test later.


[^1]: [gidney2021factor](@cite)
[^2]: [zalka2006shor](@cite)
