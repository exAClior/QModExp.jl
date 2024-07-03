# Research Progress

## References to Gidney's paper
I perform a search on paper citing Gidney's
[paper](https://arxiv.org/abs/1905.09749) with the related keyword "modular
exponentiation". My goal is find the most recent progress on algorithmic
implementation of modular exponentiation.

1. on the various ways of quantum implementation of the modular exponentiation
   function for shor's factorization
   
   Merely lists **simple** algorithm for mod exp, no intellectual value.
   
2. Recent Progress in Quantum Computing Relevant to Internet Security

   Talks about Regev's paper, not on mod exp.
   
3. Truncated Modular Exponentiation Operators: A Strategy for Quantum Factoring

   Interesting idea, constructs not the full modular exponentiation operator but
   the one that only maps $1 -> g^e$, other mapping may be wrong. Done to save
   space.
   
4. GOOD quantum modular multiplier via binary-exponenta-based recombination

   Actual new algorithm, worth reading. Table 4 has performance comparison
5. OK Implementations for ShorŠs algorithm for the DLP

   Paper with [code](https://github.com/mhinkie/ShorDiscreteLog)
   
   
6. OK Factoring 2 048-bit RSA Integers in 177 Days with 13 436 Qubits and a
Multimode Memory

   Shor's algorithm is used to benchmark architecture. Presentation seems ok,
   includes windowed method etc, if other source confused, come here.
   
7. A Quantum Leap in Factoring
   Comments on Regev's method vs Shor's for factoring. Off the topic.
   
8. INTERESTING IDEA Space-Efficient and Noise-Robust Quantum Factoring

   Improvement to Regev's idea, uses [paper](https://arxiv.org/pdf/1711.02491)
   to improve space-time complexity and noise resilience of modular
   exponentiation.

9. Reducing the Number of Qubits in Quantum Factoring

   Use Residue Number System for saving of mod exp , slightly off the topic.
   
10. Efficient Construction of a Control Modular Adder on a Carry-Lookahead Adder
    Using Relative-Phase Toffoli Gates

    optimizes the ripple carry adder, not entirely related
    
11. Shor’s Algorithm Using Efficient Approximate Quantum Fourier Transform

    They were already optimizing the t counts, Montgomery multiplication
    
12. Leveraging State Sparsity for More Efficient Quantum Simulations

    Simulating quantum algorithm on classical computers. Un-related


13. A formally certiﬁed end-to-end implementation of Shor’sfactorization
    algorithm
    
    Formal methods verifying correctness of algorithm. un-related
    
14. Review A Comprehensive Study of Quantum Arithmetic Circuits

    Comprehensive review on arithmetic circuit on quantum computer.
    
15. Efficient Quantum Modular Arithmetics for the ISQ Era

    Most recent approach 
