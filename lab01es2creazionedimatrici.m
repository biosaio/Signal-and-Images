% segnali ed immagini. laboratorio 1 

clear all
close all
clc

% Creazione di matrici:
% Creare una matrice Z 256x256 di zeri (funzione zeros)
Z = zeros(256,256);

% Posizionare al centro della matrice un quadrato di lato128 i cui valori siano tutti 1.
l = 256; r = 64;
Z(l/2-r:l/2+r,l/2-r:l/2+r) = 1;
figure(1);
subplot(1,2,1);
imshow(Z);
% Creare una matrice T partendo dalla matrice Z modificata e aggiungendo un ulteriore quadrato di lato 32 al centro i cui valori siano tutti 0.5.
p1=l/2-r/2;
p2=l/2+r/2;
T = Z;
T(p1:p2,p1:p2) = 0.5;
subplot(1,2,2);
imshow(T);

%Visualizzare le matrici Z e T dell%esercizio 2 in una figura con due subplot. 
%Salvare le imagini su file.
%imwrite(Z,"Z.jpg");
%imwrite(T,"T.jpg");


% Caricare l'immagine a colori  tract.png' e assegnarla ad una variabile di nome “tract”. Visualizzare in una figura con 3 subplot le 3 componenti RGB.
tract = imread('tract.png');
figure(2);
subplot(1,3,1);
imshow(tract(:,:,1)); %red
subplot(1,3,2);
imshow(tract(:,:,2)); %green
subplot(1,3,3);
imshow(tract(:,:,3)); %blue

% Convertire in scala di grigi l'immagine tract e generare: 
tract_grey = rgb2gray(tract);

% l%immagine "tract_sub” data dalla sottrazione di tract_gray e la matrice Z;
Z = uint8(Z);
tract_sub = tract_grey - Z; 
% L%immagine "tract_mult” data dalla moltiplicazione di tract_gray e la matrice Z;
tract_mult = tract_grey .* Z;
% Visualizzare in una figura con 4 subplot i risultati del punto ii. 
figure(3);
subplot(2,2,1);
imshow(Z);
subplot(2,2,2);
imshow(tract_grey);
subplot(2,2,3);
imshow(tract_sub);
subplot(2,2,4);
imshow(tract_mult);

% Caricare un%immagine (lena, empire state building, scacchiera o tract), convertirla in scala di grigi e visualizzare le due immagini con un subplot.
lena = imread('lena.jpeg');
lena_g = rgb2gray(lena);
figure(4);
subplot(1,2,1); imshow(lena);
subplot(1,2,2); imshow(lena_g);

% Definire i seguenti kernel per l'edge detection.
K1 = [1 1 1; 0 0 0; -1 -1 -1];
K2 = [1 0 -1; 1 0 -1; 1 0 -1];

% Implementare in MATLAB il seguente pseudo codice:
[m, n] = size(lena_g);
horizontal_line = zeros(m,n);
vertical_line = zeros(m,n);
for i = 2:m-1
    for j =2:n-1
        horizontal_line(i-1:i+1,j-1:j+1) = sum(sum(double(lena_g(i-1:i+1,j-1:j+1)) .* K1));
        vertical_line(i-1:i+1,j-1:j+1) = sum(sum(double(lena_g(i-1:i+1,j-1:j+1)) .* K2));
    end
end

% d) Combina le immagini con le linee verticali e orizzontali seguendo la formula: radice_quadrata(horizontal_line^2 + vertical_line^2)
combined = sqrt(power(vertical_line,2) + power(horizontal_line,2));

% e) Visualizza le immagini con le linee verticali, orizzontali e la
% combinazione delle due in un subplot, mettendo le prime due immagini in
% posizione 1 e 3, e la combinazione in posizione 5

figure(5);
subplot(2,3,1); 
imshow(horizontal_line,[]); 
title('horizontal line');
subplot(2,3,3); 
imshow(vertical_line,[]); 
title('vertical line');
subplot(2,3,5); 
imshow(combined,[]); 
title('combined');

