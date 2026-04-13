function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
% 神经网络代价函数
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));


m = size(X, 1);
         

J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

yy=y;
for i=1:m   
 yboot=zeros(num_labels,1);
 yboot(yy(i))=1;
 yy(i,1:num_labels)=yboot;
end

X = [ones(m,1) X];
z2=X*Theta1';
a2=sigmoid(z2);
a2 = [ones(m, 1) a2];
z3=a2*Theta2';
hx=sigmoid(z3);  
J=(1/m)* sum(sum(  (-yy).*(log(hx))-(1-yy).*(log(1-hx)) ) );
sum_theta1=sum(Theta1.^2) ;
sum_theta2=sum(Theta2.^2) ;
J=J+lambda*(sum(sum_theta1)-sum_theta1(1)+sum(sum_theta2)-sum_theta2(1))/(2*m);


the3=hx-yy;
the2=the3*Theta2.*(a2.*(1-a2));

Theta2_grad=(Theta2_grad+the3'*a2)/m+lambda*Theta2/m;
Theta2_grad(:,1)=Theta2_grad(:,1)-lambda*Theta2(:,1)/m;
 
tex=the2'*X;
tex1=tex(2:end,:);

Theta1_grad=(Theta1_grad+tex1)/m+lambda*Theta1/m;
Theta1_grad(:,1)=Theta1_grad(:,1)-lambda*Theta1(:,1)/m;

grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
