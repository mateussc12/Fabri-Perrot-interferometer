clc, close all


% Introdução à Fotônica - 2022/02
% Trabalho Numérico

% Alunos: Felipe Antonio Moreira Silva
%         Mateus Souza Coelho

% Objetivo: Desenvolver uma simulação numérica em Matlab, Octave, ou outro
%           software de escolha do aluno, que mostre o funcionamento de um 
%           interferômetro do tipo Fabry-Perot.

% QUESTÃO 01 -------------------------------------------------------------
% PREDEFINIÇÕES DE ENTRADA
r = 0.9;                                   % Indice de reflexo do segundo espelho
d = 62 * 10^-6;                            % Distancia entre os espelhos
lambda = linspace(1500e-9, 1600e-9, 1000); % Comprimentos de onda
num_ondas = 40;                            % Numero de iteracoes, ou seja, quantidade de ondas somadas

% Calcula padraao de interferência
padrao_interferencia = calc_Fabry_Perot(r, d, lambda, num_ondas);

figure()
plot(lambda, padrao_interferencia)
legenda = "d = " + num2str(d) + " e r = " + num2str(r);
plot(lambda, padrao_interferencia, 'DisplayName', legenda, 'LineWidth', 1.2)
grid on
xlabel('Comprimento de Onda (m)')
ylabel('Intensidade |E|²')
xlim([lambda(1) lambda(end)])
legend();
% ------------------------------------------------------------------------

% QUESTÃO 02 -------------------------------------------------------------
% PREDEFINIÇÕES DE ENTRADA
r = [0.01, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.99]; % Indice de reflexo do segundo espelho
d = 62 * 10^-6;                                           % Distancia entre os espelhos
lambda = linspace(1500e-9, 1600e-9, 1000);                % Comprimentos de onda
num_ondas = 40;                                           % Numero de iteracoes, ou seja, quantidade de ondas somadas

figure()
for i = 1:length(r)
	% Calcula padraao de interferência
	padrao_interferencia = calc_Fabry_Perot(r(i), d, lambda, num_ondas);
    legenda = "r = " + num2str(r(i));
    plot(lambda, padrao_interferencia, 'DisplayName', legenda, 'LineWidth', 1.2)
	hold on
	grid on
	xlabel('Comprimento de Onda (m)')
	ylabel('Intensidade |E|²')
    legend();
end
% ------------------------------------------------------------------------

% QUESTÃO 03 -------------------------------------------------------------
% PREDEFINIÇÕES DE ENTRADA
r = 0.9;                                   % Indice de reflexo do segundo espelho          
d = [44, 50, 56, 62, 68, 74, 80] * 10^-6;  % Distancia entre os espelhos
lambda = linspace(1500e-9, 1600e-9, 1000); % Comprimentos de onda
num_ondas = 40;                            % Numero de iteracoes, ou seja, quantidade de ondas somadas

figure()
for i = 1:length(d)
	% Calcula padraao de interferência
	padrao_interferencia = calc_Fabry_Perot(r, d(i), lambda, num_ondas);
    legenda = "d = " + num2str(d(i));
    plot(lambda, padrao_interferencia, 'DisplayName', legenda, 'LineWidth', 1.2)
	hold on
	grid on
	xlabel('Comprimento de Onda (m)')
	ylabel('Intensidade |E|²')
    legend();
end
% ------------------------------------------------------------------------
