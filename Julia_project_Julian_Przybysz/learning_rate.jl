function plot_learning_rate(Ŷ, Y)
    tr = 0;
    fl = 0;
    
    for i=1:length(Ŷ)

        old_value = round(Y[i] *10)
        new_value = round(Ŷ[i]*10)
        if new_value == old_value
            tr += 1
        else
            fl += 1
        end
    end
    percentage = (tr/(tr+fl))*100
    
    return percentage
end
