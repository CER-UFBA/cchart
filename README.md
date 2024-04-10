Este repositorio está associado a publicação intitulada "GRÁFICOS DE CONTROLE PARA PROCESSOS DE CONTAGEM E UNITÁRIOS: UMA ABORDAGEM DE CEP CLÁSSICO E BAYESIANO", na Revista do Seminário Internacional de Estatística com R, url: https://periodicos.uff.br/anaisdoser/article/view/55187. Este trabalho visou promover a difusão de gráficos de controle para o monitoramento estatístico de processos de dados de contagem ou contínuos no intervalo (0,1), como é o caso de taxas, índices e proporções; sendo ambos processos não normais. As cartas de controle são conhecidas por serão uma ferramenta de visualização de um processo onde apresenta os limites de controle de um processo e a dinâmica das observações:

CASO DE CONTAGEM - Um processo univariado é considerado invariante, centrado na média (central limite, CL), distribuido entre os limites superior e inferior (upper-limite, UCL, e lower-limite, LCL), a qual a política de controle adotada pelo Seis Sigma considera a constante L igual a 3. Por exemplo, seja um processo, Y, com n replicas e k blocos de observações com distribuição Poisson($\lambda$), onde $\mathbb{E(\text{Y})}=\mathbb{V(\text{Y})}=\lambda$, e a parametrização esperada da sua dinâmica será definada como:

CL = n $\times \mathbb{E(\text{Y})}$

LCL =  n $\times \mathbb{E(\text{Y})}$ - L $\times$ desvio(Y)

UCL =  n $\times \mathbb{E(\text{Y})}$ + L $\times$ desvio(Y) 

para os casos de processo em que a suposição de média não é igual a variância, se adota as distribuições Poisson modificadas (Poisson-Lindley, Poisson-Shanker e Poisson-Sujatha).

CASO DE UNITÁRIO - O processo também será considerado invariante, centrado na medida central (central limite, CL), distribuido entre os limites superior e inferior (upper-limite, UCL, e lower-limite, LCL). Onde a parametrização esperada da sua dinâmica será definada como:

CL = $\mathbb{E(\text{Y})}$, que será a média do processo

LCL =  $\mathbb{E(\text{Y})}$ - L $\times$ desvio(Y)

UCL =  $\mathbb{E(\text{Y})}$ + L $\times$ desvio(Y) 

O repositório está organizado da seguinte maneira:

- Os arquivos `bayesian_function_chart.R` e `classical_function_chart.R` são programas que estimam os parâmetros e graficação as cartas de controles, onde as respectivas funções de estimação estão implementadas na versão bayesiana e frequentista.

- O arquivo `support_functions.R` contém funções que serão utilizada na função grafica das cartas de controles `plot.control`.

- A pasta "stan" contém os arquivos STAN, que incorporam as funções de densidades necessárias para a estimação via aproximação numérica bayesiana Hamiltonian Monte Carlo (HMC).

| STAN File | Probability Density | Function | Parameter(s) |
| --- | --- | --- | --- |
| --- | **(Countable Response Variable)** | --- | --- |
| `PLindley.stan` | Poisson-Lindley | $` \displaystyle f(y;t)= \frac{(t + y + 2) \times (t + 1)^{-y}}{(t + 1)^3 \times t^{-2}} `$ | $t > 0$ |
| `PShanker.stan` | Poisson-Shanker | $` \displaystyle f(y;h)= \frac{(h^2 + h + y + 1) \times (h + 1)^{-y}}{(h + 1)^2 \times (h^2 + 1) \times h^{-2}} `$ | $h > 0$ |
| `PSujatha.stan` | Poisson-Sujatha | $` \displaystyle f(y;t)= \frac{t^3 \times (y^2 + y \times (t + 4) + (t^2 + 3 \times t + 4)}{((t + 1)^{y+3}) \times (t^2 + t + 2)} `$ | $t > 0$ |
| `Pois.stan`     | Poisson         | $` \displaystyle f(y;\lambda )={\frac{e^{-\lambda }\lambda ^{y}}{y!}} `$ | $\lambda > 0$ |
| --- | **(Unit Response Variable)**  | --- | --- |
| `beta.stan`     | Beta            | $` \displaystyle f(y;a,sc)= \frac{y^{a - 1} \times (1 - y)^{sc - 1}}{exp(B(a, sc))} `$ | $a > 0, sc > 0$ |
| `kumar.stan`    | Kumaraswamy     | $` \displaystyle f(y;a,b)= a \times b \times (y^{a - 1}) \times ((1 - y^a)^{b - 1}) `$| $a > 0, b > 0$ |
| `uhn.stan`      | unit-half-normal | f(y;a)= ... | $a > 0$ |
| `ul.stan`       | unit-Lindley    | $` \displaystyle f(y;\mu)= \frac{(1 - \mu)^2 \times exp\left(-\frac{y(1- \mu)}{\mu(1-y)} \right)}{\mu(1- y)^3} `$ | $\mu > 0$ |

- A pasta "aplication" contém os arquivos R e que originam a Figura 1 do artigo com a aplicação de uma amostra dos registros mínimos diários da umidade relativa do ar da cidade de Copiapó - Atacama/Chile.

- A pasta "data" contém os registros utilizados na aplicação de umidade relativa, dos registros mínimos diários do período de dezembro de 2016 a dezembro de 2020.
