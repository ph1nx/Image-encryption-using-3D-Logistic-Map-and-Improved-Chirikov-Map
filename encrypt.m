% encrypt.m    encrypt image by improved chirikov map 
% [encrypted,key] = encrypt(image,key) encrypt image with the certain key
% [encrypted,key] = encrypt(image) encrypt image with a random key
function [encrypted,key] = encrypt(image,key)

if nargin==1
    key =  10 * rand ( 1 , 4 ); % randomly generated key
end

x=key(1);y=key(2);k=key(3);h=key(4);
[ cols , rows , chans ] =  size ( image ); % image size, number of channels

kk = 2 + exp( mod(h + 10 * sin(k) + k ,2*pi));
hh = 2 + exp( mod(h + 10 * sin(k) ,2*pi));
xx = mod(x + hh * sin(y) + kk * y ,2*pi);
yy =  mod ( x  +  hh  *  sin ( y ) , 2 * pi ); % make the parameters in the proper range

bitArray =  dec2bin ( image , 8 );   % convert integer to 8-bit binary array
bitArray = [ bitArray(:) ]; %展 平

N =  size ( bitArray , 1 );

posX =  zeros ( 1 , 2 * N ); posY =  zeros ( 1 , 2 * N );
posX ( 1 ) = xx ; posY ( 1 ) =  yy ; % position array initialization

for i =  1  :  2 * N - 1  % generate an array of scrambled positions
    posY ( i + 1 ) =  mod ( posX ( i ) +  kk  *  sin ( posY ( i )) , 2 * pi );
    posX(i+1) = mod(posY(i+1) + hh * posX(i) ,2*pi);
end
posX =  ceil ( posX * N /( 2 * pi )); posY =  ceil ( posY * N /( 2 * pi )); % normalized and rounded

for j = [ posX ; posY ] % scrambling
    tmp =  bitArray ( j ( 1 ));
    bitArray ( j ( 1 )) =  bitArray ( j ( 2 ));
    bitArray ( j ( 2 )) =  tmp ;
end

bitArray =  reshape ( bitArray , N / 8,8 ); % restore to a group of 8 bits
Array =  bin2dec ( bitArray ); % restore to integer
encrypted =  uint8 ( reshape ( Array , cols , rows , chans )); % restore shape