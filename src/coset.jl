function to_coset(k, N, c_pad)
    return [k + ii * N for ii in 0:(2^c_pad - 1)]
end

