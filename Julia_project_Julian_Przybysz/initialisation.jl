function weights_bias_initialisation(network_dim)
    Weights_bias = Dict()
    # inizjalizacja wag i biasów
    for i=2:4
        Weights_bias["Weight"*string(i-1)] = rand(StableRNG(1),network_dim[i], network_dim[i-1])*0.02#pierwszy człon to zakres losowania #drugi człon to kolumny #trzeci wiersze zaokraglane w gore
        Weights_bias["bias"*string(i-1)] = zeros(network_dim[i], 1)#liczba zer w bias
    end
    return Weights_bias
end