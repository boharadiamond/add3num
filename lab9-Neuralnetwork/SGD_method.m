function Weight=SGD_method(Weight,input,correct_Output)
alpha=0.9;
%[N,C]=size(input);
N=4;
for k=1:N
    transposed_Input=input(k,:)';
    d=correct_Output(k);
    weighted_Sum=Weight*transposed_Input;
    output=sigmoid(weighted_Sum);
    error=d-output;
    delta=output*(1-output)*error;
    dweight=alpha*delta*transposed_Input;
    weight(1)=Weight(1)+dweight(1);
    weight(2)=Weight(2)+dweight(2);
    weight(3)=Weight(3)+dweight(3);
end
end
