include("activation_functions.jl")

function forward_propagation(Input_data, parameters)
    saved_data = []
    # Dwa razy ReLU
    Input_data2, data = forward_activation(Input_data,parameters["Weight"*string(1)],parameters["bias"*string(1)],"relu")
    push!(saved_data , data)
    Input_data3, data = forward_activation(Input_data2,parameters["Weight"*string(2)],parameters["bias"*string(2)],"relu")
    push!(saved_data , data)
   
    # raz sigmoida
    Ŷ, data = forward_activation(Input_data3,parameters[string("Weight"*string(3))],parameters["bias"*string(3)],"sigmoid")
    push!(saved_data, data)
    println(data)
    sdfsf
    return Ŷ, saved_data
end

function forward_activation(Input_data, W, b, activation_type="relu")

    prev_data = (Input_data, W, b)
    Output_data = (W * Input_data) .+ b#Input_data 748x420, Output_data 420x21

    if activation_type == "sigmoid"
        Activated_data, Output_data2 = Sigmoid(Output_data)
    elseif activation_type == "relu"
        Activated_data, Output_data2 = ReLU(Output_data)
    end

    data = (prev_data=prev_data, Output_data=Output_data2)
    return Activated_data, data
end