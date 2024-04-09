Este repositorio está associado a publicação entitulada "GRÁFICOS DE CONTROLE PARA PROCESSOS DE CONTAGEM E UNITÁRIOS: UMA ABORDAGEM DE CEP CLÁSSICO E BAYESIANO", na Revista do Seminário Internacional de Estatística com R, url: https://periodicos.uff.br/anaisdoser/article/view/55187. Este trabalho visou promover a difusão de gráficos de controle para o monitoramento estatístico de processos de dados de contagem ou contínuos no intervalo (0,1), como é o caso de taxas, índices e proporções; sendo ambos processos não normais.

O repositório está organizado da seguinte maneira:

- Os arquivos `bayesian_function_chart.R` e `classical_function_chart.R` são programas que estimam os parâmetros e graficação as cartas de controles, onde as respectivas funções de estimação estão implementadas na versão bayesiana e frequentista.

- O arquivo `support_functions.R` contém funções que serão utilizada na função grafica das cartas de controles `plot.control`.

- A pasta "stan" contém os arquivos STAN, que incorporam as funções de densidades necessárias para a estimação via aproximação numérica bayesiana Hamiltonian Monte Carlo (HMC).

| STAN File | Probability Function |
| --- | --- |
| --- | **(Countable Response Variable)** |
| `PLindley.stan` | Poisson-Lindley |
| `PShanker.stan` | Poisson-Shanker |
| `PSujatha.stan` | Poisson-Sujatha |
| `Pois.stan`     | Poisson         |
| --- | **(Unit Response Variable)**  |
| `beta.stan`     | Beta            |
| `kumar.stan`    | Kumaraswamy     |
| `uhn.stan`      | unit-half-normal |
| `ul.stan`       | unit-Lindley    |

- A pasta "aplication" contém os arquivos R e que originam a Figura 1 do artigo com a aplicação de uma amostra dos registros mínimos diários da umidade relativa do ar da cidade de Copiapó - Atacama/Chile.

- A pasta "data" contém os registros utilizados na aplicação de umidade relativa, dos registros mínimos diários do período de dezembro de 2016 a dezembro de 2020.
