#Metoda najszybszego spadku z bezwładnością -Metoda najszybszego spadku porusza się z prędkością proporcjonalną do gradientu. Na
# "płaskich" fragmentach przestrzeni rozwiązań (punkty siodłowe) gradient ma małe wartości i
# optymalizator porusza się wolno. Dodanie bezwładności pozwala optymalizatorowi pokonać te
# obszary, w których gradient zanika.
function update_parameters(parameters, grad, i, s1, s2)  
    a=0.11
    b=0.08 
    params=Dict()

    if i ==1
        for j = 0: (2)

            if j ==0
                s1["S1_"*string(j + 1)] = zeros(size(parameters["Weight"*string(j + 1)], 1),size(parameters["Weight"*string(j + 1)], 2))    
                s2["S2_"*string(j + 1)] = zeros(size(parameters["bias"*string(j + 1)], 1),size(parameters["bias"*string(j + 1)], 2))
            
            elseif j ==1
                s1["S1_"*string(j + 1)] = zeros(size(parameters["Weight"*string(j + 1)], 1), size(parameters["Weight"*string(j + 1)], 2))    
                s2["S2_"*string(j + 1)] = zeros(size(parameters["bias"*string(j + 1)], 1),size(parameters["bias"*string(j + 1)], 2))
            else
                s1["S1_"*string(j + 1)] = zeros(size(parameters["Weight"*string(j + 1)], 1),size(parameters["Weight"*string(j + 1)], 2))    
                s2["S2_"*string(j + 1)] = zeros(size(parameters["bias"*string(j + 1)], 1),size(parameters["bias"*string(j + 1)], 2))
            end
        end
    end

    for j = 0: (2)

        s1["S1_"*string(j + 1)][:] = (b*s1["S1_"*string(j + 1)])-(a*grad["dWeight"*string(j + 1)])
        s2["S2_"*string(j + 1)][:] = (b*s2["S2_"*string(j + 1)])-(a*grad["dbias"*string(j + 1)])

        params["Weight"*string(j + 1)] = parameters["Weight"*string(j + 1)] + s1["S1_"*string(j + 1)]
        params["bias"*string(j + 1)] = parameters["bias"*string(j + 1)] + s2["S2_"*string(j + 1)]

    end

    return params, s1 , s2
end


