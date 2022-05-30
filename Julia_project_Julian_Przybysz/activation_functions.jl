function Sigmoid(Output_data)
    Activated_data = 1 ./ (1 .+ exp.(.-Output_data))
    return (Activated_data = Activated_data, Output_data = Output_data)
end

function ReLU(Output_data)#relu zwraca dodatnie wartosci lub zero, dzieki temu znika problem ze znikającym gradientem
    Activated_data = max.(0, Output_data)
    return (Activated_data = Activated_data,Output_data = Output_data)
end
#sigmoida pochodna
function sigmoid_backwards(dŶ, data_Activated_new)
    d_sig = dŶ .* Sigmoid(data_Activated_new).Activated_data .* (1 .- Sigmoid(data_Activated_new).Activated_data)
    return d_sig
end

#ReLU pochodna
function relu_backwards(dŶ, data_Activated_new)
    d_relu = dŶ .* (data_Activated_new .> 0)#pochodna relu to 0 dla x<0 natomiast 1 dla x>0
    return d_relu
end