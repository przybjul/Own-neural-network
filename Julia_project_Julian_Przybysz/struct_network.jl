include("initialisation.jl")
include("forward_propagation.jl")
include("learning_rate.jl")
include("back_propagation.jl")
include("gradient_descent_momentum.jl")


function network_structure(network_dim , Input_data, y_values; epos=11500)
    s1= Dict()
    s2= Dict()
    l_rate = []
    Losses = []
    iterations = []
    # Weights & Bias initialisation
    Weights_bias = weights_bias_initialisation(network_dim)
    # epos cycle
    for i = 1:epos
        push!(iterations , i)
        #forward propagation
        Ŷ , edited_data  = forward_propagation(Input_data, Weights_bias)#dane wejściowe oraz zainicjalizowane wagi i biasy
        learning_rate = plot_learning_rate(Ŷ, y_values)
        push!(l_rate , learning_rate)
        #back_propagation
        grad, loss  = back_propagation(Ŷ, y_values, edited_data)
        push!(Losses , loss)
        Weights_bias, s1, s2 = update_parameters(Weights_bias, grad, i, s1, s2)
    end
    # println("test")
    # println("----")
    return (iterations, parameters = Weights_bias, l_rate, Losses)
end

function test_network(Input_data, params, y_values)
    M , D  = forward_propagation(Input_data, params)
    tr = 0;
    fl = 0;
    
    for i = 1:length(M)
        #global tr 
        #global fl
        predicted_value = M[i] * 10
        predicted_number = round(predicted_value)
        y_val = round(y_values[i]*10)
        if predicted_number == y_val

            print(predicted_number)
            println(" true")
            tr += 1
        else

            print(predicted_number)
            println(" false")
            fl += 1
        end
        println(y_val)
        #println(predicted_number)
    end

    percentage = (tr/(tr+fl))*100
    # println("test")
    # println(M)
    println("----")
    print("true: ")
    println(tr)
    print("false: ")
    println(fl)
    print("truth percentage: ")
    print(percentage)
    println(" %")
    println(length(M))
    return percentage
end