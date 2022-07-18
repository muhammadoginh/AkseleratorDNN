clear all;
close all;

%% 教師データ
% Labeled data
% Input
% 教師用のデータを変更すると，出力される判定域が変わります.
% kの入力に対して，tの教師データを与えますので，
% kとtの列の数は同じでなければなりません．
%
% 例：
 % k=[8 8 5 5 6 1;
  %   8 5 8 5 6 1];
 % t=[1 0 0 0 1 1;
  %   0 1 1 1 0 0];
%
%
%k=[9 6 4 4 3;
%   9 4 6 4 3];
%t=[1 0 0 0 1;
%   0 1 1 1 0];
   
%k=[8 8 5 5 4;
%   8 5 8 5 4];		%教師データ用の行列(入力)		input matrix for supervisor data

k=[2 7 6 3 6 3;
   10 2 8 10 9 2;
   5 3 1 3 5 6;
   3 3 6 1 6 10];
   
% Labeled output
t=[1 0 0 1 1 0;
   0 1 1 0 0 1];

%% 中間層と出力層の重みの初期値
% Initialization values of weights (Hidden layer and Output layer)
w2=[0.1 0.4 0.1 0.1;
    0.3 0.5 0.1 0.1;
    0.6 0.1 0.1 0.1];	%教師データ用の行列(中間層の重み)	hidden layer's weight matrix for supervisor data

w3=[0.7 0.2 1.3;
    0.2 0.5 1.1];	%教師データ用の行列(出力層の重み)	output layer's weight matrix for supervisor data

% 中間層と出力層のバイアスの初期値
% Initialization values of bias (Hidden layer and Output layer) 
b2=[-1;
    -1;
    -1];
%b_2=randn(32,1);
b3=[-1;
    -1];
%b_3=randn(3,1);

% Step size
eta = 0.1;		%学習率が高すぎると更新した係数が大きくなりすぎてコストが減らなくなる	
				%Learning rate. If the learning rate is too high, the updated coefficient becomes too large and the cost may not decrease

%%
% 初期状態における a3 の出力
% Forward Process (Initial weight)
[sweet,sour]=meshgrid(0:0.1:9.9, 0:0.1:9.9);

%[asin, pedas]=meshgrid(0:0.1:9.9, 0:0.1:9.9);

[salty,spicy]=meshgrid(0:0.1:9.9, 0:0.1:9.9);
X = [reshape(sweet,1,100*100); reshape(sour,1,100*100); reshape(salty,1,100*100); reshape(spicy,1,100*100)];
z2 = w2 * X + b2*ones(1,size(X,2));			        %中間層の重み付き入力     input weight for hidden layer
a2= 1./(1+exp(-z2));                            %中間層の出力             output for hidden layer
z3 = w3 * a2 + b3*ones(1,size(X,2));		        %出力層の重み付き入力		input weight for output layer
a3= 1./(1+exp(-z3));                            %出力層の出力			output for output layer

% Plot figure
figure(1); 
mesh([0:0.1:9.9],[0:0.1:9.9],reshape(a3(1,:),100,100));
zlim([0 1]); view([0 90]);
grid('on'); hold('all');
title('a^3_1 (Initial weight)');
xlabel('Sweetness'); ylabel('Sourness');
colorbar(); caxis([0 1]);

% Plot figure
figure(2); 
mesh([0:0.1:9.9],[0:0.1:9.9],reshape(a3(2,:),100,100));
zlim([0 1]); view([0 90]);
grid('on'); hold('all');
title('a^3_2 (Initial weight)');
xlabel('Sweetness'); ylabel('Sourness');
colorbar(); caxis([0 1]);
%%

[w2,w3,b2,b3] = Back_propagation(k,w2,w3,b2,b3,t,eta);	%学習		Learning

%%
% 最終状態における a3 の出力
% Forward Process (Final weight)
[sweet,sour]=meshgrid(0:0.1:9.9, 0:0.1:9.9);
[salty,spicy]=meshgrid(0:0.1:9.9, 0:0.1:9.9);
X = [reshape(sweet,1,100*100); reshape(sour,1,100*100); reshape(salty,1,100*100); reshape(spicy,1,100*100)];
z2 = w2 * X + b2*ones(1,size(X,2));			        %中間層の重み付き入力     input weight for hidden layer
a2= 1./(1+exp(-z2));                            %中間層の出力             output for hidden layer
z3 = w3 * a2 + b3*ones(1,size(X,2));			      %出力層の重み付き入力		input weight for output layer
a3= 1./(1+exp(-z3));                            %出力層の出力			output for output layer

% Plot figure
figure(3); 
mesh([0:0.1:9.9],[0:0.1:9.9],reshape(a3(1,:),100,100));
zlim([0 1]); view([0 90]);
grid('on'); hold('all');
title('a^3_1 (Final weight)');
xlabel('Sweetness'); ylabel('Sourness');
colorbar(); caxis([0 1]);

% Plot figure
figure(4); 
mesh([0:0.1:9.9],[0:0.1:9.9],reshape(a3(2,:),100,100));
zlim([0 1]); view([0 90]);
grid('on'); hold('all');
title('a^3_2 (Final weight)');
xlabel('Sweetness'); ylabel('Sourness');
colorbar(); caxis([0 1]);
%%

k_soto = [7;2;3;3]
nilai_wk=w2*k_soto;
display(nilai_wk);
z2temp = w2*k_soto+b2 ;
a2temp = 1./(1+exp(-(z2temp)));
z3temp = w3*a2temp+b3 ;
a3temp = 1./(1+exp(-(z3temp)));
display(w2);
display(k);
display(b2);
display(w3);

display(a2temp);
display(b3);
display("a3soto")
display(a3temp);
display(a3temp)
