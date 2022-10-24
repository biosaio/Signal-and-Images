% segnali ed immagini. laboratorio 1 

clear all
close all
clc

% Manipolazione di vettori e matrici:
% Creare una matrice A randomica 4 x 6 e un vettore V 1x6 che contenga valori sequenziali con distanza 4. 

A = randn(4,6);
V = 0:4:20;
% Creare una matrice B 5x6 a partire dalla matrice A e	dal vettore V.
B = [A; V];

% Creare la matrice C formata dalle colonne di B disposte in ordine inverso (ovvero la 1° colonna di C è la 6° colonna di B e così via)
C = ones(5,6);
for i = 1:1:6
    C(:,i) = B(:,7-i);
end

% Creare la matrice D formata dalle sole colonne pari di B
D = ones(5,3);
for i = 2:2:6
    D(:,i/2) = B(:,i);
end

% Creare la matrice E formata dalle sole colonne dispari di B
E = ones(5,3);
for i = 1:2:5
    D(:,ceil(i/2)) = B(:,i);
end

% Costruire la matrice F formata dalle righe 1,4,3 di B e dalle colonne 5,2
F = B([1 4 3],[5 2]);

% Costruire il vettore Z formato dagli elementi diagonali della matrice B 
Z = [B(1,1) B(2,2) B(3,3) B(4,4) B(5,5)];



