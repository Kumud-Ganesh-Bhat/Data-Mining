clear all;
clc;

labs_training=zeros(520,1);

tfname='D:\IUPUI\DataMining\Project\ADHC.xlsx';
tdata=xlsread(tfname); %consists of 520 training data features

labelsfname='D:\IUPUI\DataMining\Project\tlabels.xlsx';
[id,labels]=xlsread(labelsfname);

testfname='D:\IUPUI\DataMining\Project\testADHC.xlsx';
testdata=xlsread(testfname);

a=containers.Map(id,labels);
U=unique(labels);
doublabels=containers.Map(U,1:size(U));

for i=1:length(tdata)
    labs_training(i) = doublabels(num2str(a(i)));
end


SVMMODEL = fitcsvm(tdata,labs_training,'Standardize',true,'KernelFunction','RBF','KernelScale','auto');
classOrder=SVMMODEL.ClassNames;
sv=SVMMODEL.SupportVectors;
figure;
gscatter(tdata(:,1),tdata(:,52),labs_training);
hold on;
plot(sv(:,1),sv(:,52),'ko','MarkerSize',10);
legend('AD','HC','Support Vector');
hold off;

CVSVMModel=crossval(SVMMODEL);
%MISCLASSIFICATION ERROR
classLoss=kfoldLoss(CVSVMModel);

result=predict(SVMMODEL,testdata);








