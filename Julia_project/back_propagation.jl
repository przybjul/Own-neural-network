include("activation_functions.jl")

function back_propagation(Ŷ, Y, edited_data)
    grad = Dict()
    Y = reshape(Y , size(Ŷ))

    #Mean square error Loss
    Loss = (sum((Y.-Ŷ).^2))/420

    #Mean square error derivative
    dŶ = ((Ŷ.- Y))*2
    
    actual_data = edited_data[3]
    # Last Layer
    grad["dWeight"*string(3)], grad["dbias"*string(3)], grad["dLayer"*string(2)] = derivatives_backward(dŶ,actual_data,"sigmoid")
    
    # First 2 layers 
    actual_data = edited_data[2]
    grad["dWeight"*string(2)], grad["dbias"*string(2)], grad["dLayer"*string(1)] = derivatives_backward(grad["dLayer"*string(2)],actual_data,"relu")
    actual_data = edited_data[1]
    grad["dWeight"*string(1)], grad["dbias"*string(1)], grad["dLayer"*string(0)] = derivatives_backward(grad["dLayer"*string(1)],actual_data,"relu")
  
    return grad, Loss
end

function derivatives_backward(dŶ, data, activation_function="relu")

    old_data_AWB , data_Activated_new = data

    if (activation_function == "relu")

        d_relu = relu_backwards(dŶ , data_Activated_new)
        prev_layer , W , b = old_data_AWB
        s = size(prev_layer, 2)#s to liczba elementów poprzedniego layera
        dW = d_relu * (prev_layer') / s 
        db = sum(d_relu, dims = 2) / s#dims2 dodaje kolumny 
        dprev_layer = (W') * d_relu

    elseif (activation_function == "sigmoid")

        d_sig = sigmoid_backwards(dŶ , data_Activated_new)
        prev_layer , W , b = old_data_AWB
        s = size(prev_layer, 2)#s to liczba elementów poprzedniego layera
        dW = d_sig * (prev_layer') / s 
        db = sum(d_sig, dims = 2) / s#dodaje kolumny 
        dprev_layer = (W') * d_sig

    end

    return dW , db , dprev_layer
end