include("struct_network.jl")
import ProgressMeter: @showprogress
using Plots
using MLJBase
using StableRNGs
using MLDatasets

@time begin

    image_number=420

    train_x_pixels, train_y_numbers = MNIST.traindata(1)
    x_pixels1 = reshape(train_x_pixels, (784, 1))

    train_x_pixel1s, train_y_numbers1 = MNIST.traindata(2)
    x_pixels2 = reshape(train_x_pixel1s, (784, 1))

    x_pixels3=hcat(x_pixels1, x_pixels2) 
    y_values=hcat(train_y_numbers, train_y_numbers1)

    x_pixels4=hcat(x_pixels1, x_pixels2) 
    y_values4=hcat(train_y_numbers, train_y_numbers1)

    for i = 3: image_number
        local train_x_pixels
        local train_y_numbers
        local x_pixels1
        global x_pixels3
        global y_values
        train_x_pixels, train_y_numbers = MNIST.traindata(i)
        x_pixels1 = reshape(train_x_pixels, (784, 1))

        x_pixels3=hcat(x_pixels3, x_pixels1) 
        y_values=hcat(y_values, train_y_numbers)
    end

    # for i = ( image_number+3):(2* image_number-250)
    #     local train_x_pixels
    #     local train_y_numbers
    #     local x_pixels1
    #     global x_pixels4
    #     global y_values4
    #     train_x_pixels, train_y_numbers = MNIST.traindata(i)
    #     x_pixels1 = reshape(train_x_pixels, (784, 1))

    #     x_pixels4=hcat(x_pixels4, x_pixels1) 
    #     y_values4=hcat(y_values4, train_y_numbers)
    # end
    y_values = y_values * 0.1
    # y_values4 = y_values4 * 0.1
 

    #train network
    network_output = network_structure([784, 21, 16, 1], x_pixels3, y_values; epos=7500);
    
    #test network
    final_output = test_network(x_pixels3, network_output.parameters, y_values);

    #plot
    p1 = plot(network_output.iterations,network_output.l_rate)
    p2 = plot(network_output.iterations,network_output.Losses)
    plot(p1, p2,layout = 2, label=["lr" "loss" ],
    title=["Learning rate" "Losses"])
    
end 