clc;
clear all;
close all;

 x(1)=0.2350;
 y(1)=0.3500;
 z(1)=0.7350;
 a(1)=0.0125;
 b(1)=0.0157;
 l(1)=3.7700;
 %l(1) = 0.93;

 for i=1:1:2280000
     x(i+1)=l*x(i)*(1-x(i))+b*y(i)*y(i)*x(i)+a*z(i)*z(i)*z(i);
     y(i+1)=l*y(i)*(1-y(i))+b*z(i)*z(i)*y(i)+a*x(i)*x(i)*x(i);
     z(i+1)=l*z(i)*(1-z(i))+b*x(i)*x(i)*z(i)+a*y(i)*y(i)*y(i);
 end

 Sx=ceil(mod((x*1000000),256));
 Sy=ceil(mod((y*1000000),256));
 Sz=ceil(mod((z*1000000),256));

original=imread('lena.png');
%rgb=rgb2gray(original);
rgb=original;

rgb = imresize(rgb,[512 512]);
%imshow(rgb)
[row,col,d]=size(rgb);
%col = ceil(col/3)

PR = reshape(rgb(:,:,1),1,[]);
PG = reshape(rgb(:,:,2),1,[]);
PB = reshape(rgb(:,:,3),1,[]);
for i = 1:1:row*col
    CDR(i)=x(i)*PR(i);
    CDG(i)=y(i)*PG(i);
    CDB(i)=z(i)*PB(i);
end

for i = 1:1:row*col
    CCR(i)=bitxor(uint8(Sx(i)),uint8(CDR(i)));
    CCG(i)=bitxor(uint8(Sy(i)),uint8(CDG(i)));
    CCB(i)=bitxor(uint8(Sz(i)),uint8(CDB(i)));
end
CCRN=reshape(CCR,row,col);
CCGN=reshape(CCG,row,col);
CCBN=reshape(CCB,row,col);

ci=cat(3,CCRN,CCGN,CCBN);

%%%%%%%%% Chirkov map encryption decryption %%%%%%%%%%%%%%%%%%%5
[eI, key] = encrypt(ci);
dI = decrypt( eI , key );

imwrite(eI,'enc.png');

%%%%%%%%%% logistic decryption%%%%%%%%%%%%%5555

dec = dI;
DR = reshape(dec(:,:,1),1,[]);
DG = reshape(dec(:,:,2),1,[]);
DB = reshape(dec(:,:,3),1,[]);

for i = 1:1:row*col
    DDR(i)=bitxor(uint8(Sx(i)),uint8(DR(i)));
    DDG(i)=bitxor(uint8(Sy(i)),uint8(DG(i)));
    DDB(i)=bitxor(uint8(Sz(i)),uint8(DB(i)));
end

xi = 1./x;
yi = 1./y;
zi = 1./z;

for i = 1:1:row*col
    DDDR(i)=xi(i)*DDR(i);
    DDDG(i)=yi(i)*DDG(i);
    DDDB(i)=zi(i)*DDB(i);
end
DDDR=reshape(DDDR,row,col);
DDDG=reshape(DDDG,row,col);
DDDB=reshape(DDDB,row,col);

di = cat(3,DDDR,DDDG,DDDB);
subplot(2,1,2);
imshow(di);
imwrite(di,'dec.png');

figure(1);
subplot(2,2,1);imshow(original);title('original image');
subplot(2,2,2);imshow(eI);title('encrypted image');
subplot(2,2,3);imshow(di);title('decrypted image');

entropy(original)
entropy(eI)
entropy(di)

figure(2);
subplot(3,1,1);
imhist(original);
subplot(3,1,2);
imhist(eI);
subplot(3,1,3);
imhist(di);

% if orignal == di
%     fprintf('same')
% end
