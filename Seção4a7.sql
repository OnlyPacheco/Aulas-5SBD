-- Parte 1 – Funções de Caracteres, Números e Datas (Seção 4)

-- 1. Exiba os nomes dos clientes com todas as letras em maiúsculas.
SELECT UPPER(nome) FROM cliente;

-- 2. Exiba os nomes dos clientes formatados com apenas a primeira letra maiúscula.
SELECT INITCAP(nome) FROM cliente;

-- 3. Mostre as três primeiras letras do nome de cada cliente.
SELECT SUBSTR(nome, 1, 3) FROM cliente;

-- 4. Exiba o número de caracteres do nome de cada cliente.
SELECT LENGTH(nome) FROM cliente;

-- 5. Apresente o saldo de todas as contas, arredondado para o inteiro mais próximo.
SELECT numero_conta, ROUND(saldo) FROM conta;

-- 6. Exiba o saldo truncado, sem casas decimais.
SELECT numero_conta, TRUNC(saldo) FROM conta;

-- 7. Mostre o resto da divisão do saldo da conta por 1000.
SELECT numero_conta, MOD(saldo, 1000) FROM conta;

-- 8. Exiba a data atual do servidor do banco.
SELECT SYSDATE FROM dual;

-- 9. Adicione 30 dias à data atual e exiba como "Data de vencimento simulada".
SELECT SYSDATE + 30 AS "Data de vencimento simulada" FROM dual;

-- 10. Exiba o número de dias entre a data de abertura da conta e a data atual.
SELECT numero_conta, SYSDATE - data_abertura AS "Dias desde abertura" FROM conta;

-- Parte 2 – Conversão de Dados e Tratamento de Nulos (Seção 5)

-- 11. Apresente o saldo de cada conta formatado como moeda local.
SELECT numero_conta, TO_CHAR(saldo, 'L999G999D99') FROM conta;

-- 12. Converta a data de abertura da conta para o formato 'dd/mm/yyyy'.
SELECT numero_conta, TO_CHAR(data_abertura, 'DD/MM/YYYY') FROM conta;

-- 13. Exiba o saldo da conta e substitua valores nulos por 0.
SELECT numero_conta, NVL(saldo, 0) FROM conta;

-- 14. Exiba os nomes dos clientes e substitua valores nulos na cidade por 'Sem cidade'.
SELECT nome, NVL(cidade, 'Sem cidade') FROM cliente;

-- 15. Classifique os clientes em grupos com base em sua cidade.
SELECT nome, cidade,
  CASE 
    WHEN cidade = 'Niterói' THEN 'Região Metropolitana'
    WHEN cidade = 'Resende' THEN 'Interior'
    ELSE 'Outra Região'
  END AS "Classificação"
FROM cliente;

-- Parte 3 – Junções entre Tabelas (Seção 6)

-- 16. Exiba o nome de cada cliente, o número da conta e o saldo correspondente.
SELECT c.nome, ct.numero_conta, ct.saldo 
FROM cliente c
JOIN conta ct ON c.codigo = ct.cliente_id;

-- 17. Liste os nomes dos clientes e os nomes das agências onde mantêm conta.
SELECT c.nome, a.nome_agencia 
FROM cliente c
JOIN conta ct ON c.codigo = ct.cliente_id
JOIN agencia a ON ct.agencia_id = a.codigo;

-- 18. Mostre todas as agências, mesmo aquelas que não possuem clientes vinculados (junção externa esquerda).
SELECT a.nome_agencia, c.nome AS cliente_nome 
FROM agencia a
LEFT JOIN conta ct ON a.codigo = ct.agencia_id
LEFT JOIN cliente c ON ct.cliente_id = c.codigo;
