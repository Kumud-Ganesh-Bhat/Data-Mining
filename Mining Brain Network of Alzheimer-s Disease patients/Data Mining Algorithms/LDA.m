fid = fopen('C:\Users\khan\Desktop\ADDDDDD\AD_2.csv', 'r');
data=csvread(fid);
y = data(:,1);
X = data(:,2:end);
function Z = zscore(X)
  Z = bsxfun(@rdivide, bsxfun(@minus, X, mean(X)), std(X));
end



function [D, W_lda] = lda(X,y) 
  dimension = columns(X);
  labels = unique(y);
  C = length(labels);
  Sw = zeros(dimension,dimension);
  Sb = zeros(dimension,dimension);
  mu = mean(X);

  for i = 1:C
    Xi = X(find(y == labels(i)),:);
    n = rows(Xi);
    mu_i = mean(Xi);
    XMi = bsxfun(@minus, Xi, mu_i);
    Sw = Sw + (XMi' * XMi );
    MiM =  mu_i - mu;
    Sb = Sb + n * MiM' * MiM; 
  endfor

  [W_lda, D] = eig(Sw\Sb);
  [D, i] = sort(diag(D), 'descend');
  W_lda = W_lda(:,i);
end

function X_proj = project(X, W)
  X_proj = X*W;
end

function X = reconstruct(X_proj, W)
 X = X_proj * W';
end



% FOR LDA 
[D, W_lda] = lda(X,y);
Xm2= zscore(Xm);
Xproj1 = project(Xm, W_lda(:,1:2));
coverlda=cumsum(W_lda) / sum(W_lda);
%for i=1:520
adald1=Xproj1(find(y==0.0),:);
adald2=Xproj1(find(y>0.0),:);
%end
plot(adald1(:,1), adald1(:,2),"ro", "markersize", 20, "linewidth", 3); hold on;
plot(adald2(:,1), adald2(:,2),"go", "markersize", 20, "linewidth", 3);

title("LDA AD 1 data set")


