-- Parte 1 – Recuperando Dados (Seção 1)

-- 1. Exiba todos os dados cadastrados na tabela de clientes.
SELECT * FROM cliente;

-- 2. Exiba apenas os nomes e as cidades dos clientes.
SELECT nome, cidade FROM cliente;

-- 3. Liste todas as contas registradas, exibindo o número da conta e o saldo.
SELECT numero_conta, saldo FROM conta;

-- Parte 2 – Filtros, Projeções e Concatenação (Seção 2)

-- 4. Liste os nomes dos clientes da cidade de Macaé.
SELECT nome FROM cliente WHERE cidade = 'Macaé';

-- 5. Exiba o código e o nome de todos os clientes com código entre 5 e 15.
SELECT codigo, nome FROM cliente WHERE codigo BETWEEN 5 AND 15;

-- 6. Exiba os clientes que moram em Niterói, Volta Redonda ou Itaboraí.
SELECT * FROM cliente WHERE cidade IN ('Niterói', 'Volta Redonda', 'Itaboraí');

-- 7. Exiba os nomes dos clientes que começam com a letra "F".
SELECT nome FROM cliente WHERE nome LIKE 'F%';

-- 8. Exiba uma frase estruturada para todos os clientes.
SELECT nome || ' mora em ' || cidade AS "Frase" FROM cliente;

-- Parte 3 – Ordenações, Operadores Lógicos e Funções (Seção 3)

-- 9. Exiba os dados de todas as contas com saldo superior a R$ 9.000, ordenados do maior para o menor saldo.
SELECT * FROM conta WHERE saldo > 9000 ORDER BY saldo DESC;

-- 10. Liste os clientes que moram em Nova Iguaçu ou que tenham "Silva" no nome.
SELECT * FROM cliente WHERE cidade = 'Nova Iguaçu' OR nome LIKE '%Silva%';

-- 11. Exiba o saldo das contas com arredondamento para o inteiro mais próximo.
SELECT numero_conta, ROUND(saldo) AS saldo_arredondado FROM conta;

-- 12. Exiba o nome de todos os clientes em letras maiúsculas.
SELECT UPPER(nome) AS nome_maiusculo FROM cliente;

-- 13. Exiba os nomes dos clientes que não são das cidades de Teresópolis nem Campos dos Goytacazes.
SELECT nome FROM cliente WHERE cidade NOT IN ('Teresópolis', 'Campos dos Goytacazes');
