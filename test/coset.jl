using Test, QModExp

@testset "Coset Representation" begin
    fidelity_trend = Float64[]
    N = 92
    a = 64
    b = 91
    a_plus_b_mod = (a + b) % N

    for c_pad in 1:10
        kets_a = to_coset(a, N, c_pad)
        kets_a_plus_b_mod = to_coset(a_plus_b_mod, N, c_pad)
        kets_a_plus_b = kets_a .+ b

        state_overlap = intersect(kets_a_plus_b, kets_a_plus_b_mod)

        state_fidelity = length(state_overlap) / length(kets_a)
        push!(fidelity_trend, state_fidelity)
    end

    @test fidelity_trend[1] <= fidelity_trend[end]
    @test fidelity_trend[end] ≈ 1.0 atol=1e-3
    log_trend = log.(1 .- fidelity_trend)
    @test (log_trend[2] - log_trend[1]) * (length(log_trend)-1) ≈ log_trend[end] - log_trend[1] # exponential decay of infidelity
end
