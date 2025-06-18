input=[0 0 1;
       0 1 1;
       1 0 1;
       1 1 1];
       correct_Output=[0
                       0
                       1
                       1
                       ];
       Weight=2*rand(1,3)-1;
       for epoch =1:1000000
       Weight=SGD_method(Weight,input,correct_Output);
       end
       save('Trained_Network.mat');
       
    