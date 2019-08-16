function [Result]=Evaluation(imag)
% [sd ag en delta]
% sd ag en delta
Result=zeros(1,3);
% im1=std(imag(:,:,1));
% im2=std(imag(:,:,2));
% im3=std(imag(:,:,3));
Result(1,1)=std(imag);  %% STD
% sd=Result(1,1);
Result(1,2)=avg_gradient(imag);  %% IE
% ag=Result(1,2);
Result(1,3)= entropy(imag);  %% QAB/F
% en=Result(1,3);
% Result(1,4)= sefe(imag);
% delta=Result(1,4);
% delta=sqrt(Result(1,4));
disp('||   STD   ||   AG   ||   EN  ||')
% disp('||   STD   ||   AG   ||   EN  ||  delta ||')