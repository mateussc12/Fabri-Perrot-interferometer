% Função utilizadada para modelar o interferômetro de Fabri Perrot

function padrao_interferencia = calc_Fabry_Perot(r, d, lambda, num_ondas)

	trans = 1 - r;          % Indice de transmissao do segundo espelho
	n = 1;                  % Indice de refracao no meio entre os espelhos
	c = 299792458;          % Velocidade da Luz no vÃ¡cuo [m/s]
	co = c / n;             % [m/s]


	t = linspace(0, 25e-15, length(lambda)); % Vetor tempo
	Eo = 1; % Amplitude da onda 
	padrao_interferencia = zeros(1, length(lambda));

	for i = 1:length(lambda)
		w = 2 * pi * co / lambda(1, i); % Frequencia angular
		betha = 2 * pi * n / lambda(1, i);
		E_vector = zeros((num_ondas - 1), length(lambda)); % Transmissoes seguintes
		x = 1; 
		for j = 1:num_ondas
			E_vector(j, :) = Eo * (r^(j-1)) * trans .* cos(w .* t - betha .* x * d);
	        x = x + 2;
	    end
	    sum_E = sum(E_vector);
	    padrao_interferencia(1, i) = max(sum_E(1, :))^2;
	end
end
