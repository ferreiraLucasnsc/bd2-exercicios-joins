use academia;

--     === EXERCÍCIOS SOBRE JOIN ===

-- 1.  Crie uma query que retorne uma coluna nomeada como 'Nome Completo' com o nome completo das pessoas associadas a academia, uma coluna com o logradouro e outra com o número. Utilize as tabelas Pessoa_Associada e Endereco.
select concat(pA.Nome, ' ', pA.Sobrenome) as 'Nome Completo', e.Logradouro, e.Numero
from `Pessoa_Associada` as pA
join `Endereco` as e on `pA`.`Endereco_ID` = e.`Endereco_ID`;

-- 2. Escreva uma query que retorne uma coluna nomeada como 'Nome Completo' com o nome completo das pessoas associadas a academia, uma coluna com o nome do plano dessa pessoa. Utilize as tabelas Pessoa_Associada e Plano.
select concat(pA.Nome, ' ', pA.Sobrenome) as 'Nome Completo', pL.Nome_plano
from `Pessoa_Associada` as pA
join `Plano` as pL on `pA`.`Plano_ID` = pL.`Plano_ID`;

-- 3. Escreva uma query que retorne uma coluna nomeada como 'Nome Completo' com o nome completo das pessoas associadas a academia, uma coluna com telefone e outra com o cep dessa pessoa. Utilize as tabelas Pessoa_Associada, Telefone e Endereco.
select concat(pA.Nome, ' ', pA.Sobrenome) as 'Nome Completo', t.Telefone_Contato, e.CEP
from `Pessoa_Associada` as pA
join `Telefone` as t on pA.`Telefone_ID` = t.`Telefone_ID`
join `Endereco` as e on e.`Endereco_ID` = pA.`Endereco_ID`;

-- 4. Escreva uma query que retorne uma coluna nomeada como 'Nome Completo' com o nome completo das pessoas associadas a academia, uma coluna com telefone de contato e outra com o cep dessa pessoa. Utilize as tabelas Pessoa_Associada, Telefone e Endereco.
select concat(pA.Nome, ' ', pA.Sobrenome) as 'Nome Completo', t.Telefone_Contato, e.CEP
from `Pessoa_Associada` as pA
join `Telefone` as t on `pA`.`Telefone_ID` = t.`Telefone_ID`
join `Endereco` as e on e.`Endereco_ID` = `pA`.`Endereco_ID`;

-- 5. Crie uma query que retorne uma coluna nomeada como 'Nome Completo' com o nome completo de todas as pessoas associadas a academia, e uma coluna com o telefone de emergência dessa pessoa, caso a pessoa não tiver telefone de emergência, exiba 'PEDENTE', nomeie essa coluna como 'Telefone de Emergência'. Utilize as tabelas Pessoa_Associada e Telefone.
select concat(pA.Nome, ' ', pA.Sobrenome) as 'Nome Completo', IFNULL(t.`Telefone_Emergencia`, 'PENDENTE') as 'Telefone de Emergência'
from `Pessoa_Associada` as pA
left join `Telefone` as t on `pA`.`Telefone_ID` = t.`Telefone_ID`;

-- 6. Crie uma query que retorne duas coluna com os nomes das pessoas associadas que possuem o mesmo endereço. Porém, não deixe que o mesmo nome se repita na mesma linha.
select concat(pA1.Nome, ' ', pA1.Sobrenome) as 'Nome Completo 1', concat(pA2.Nome, ' ', pA2.Sobrenome) as 'Nome Completo 2'
from `Pessoa_Associada` as pA1, `Pessoa_Associada` as pA2
where `pA1`.`Endereco_ID` = `pA2`.`Endereco_ID` and `pA1`.`Pessoa_Associada_ID` <> `pA2`.`Pessoa_Associada_ID`;

-- 7. Crie uma query que retorne duas coluna com os nomes das pessoas treinadoras que possuem o mesmo endereço. Porém, não deixe que o mesmo nome se repita na mesma linha.
select concat(pT1.Nome, ' ', pT1.Sobrenome), concat(pT2.Nome, ' ', pT2.Sobrenome)
from `Pessoa_Treinadora` as pT1, `Pessoa_Treinadora` as pT2
where pT1.`Endereco_ID` = pT2.`Endereco_ID` and pT1.`Pessoa_Treinadora_ID` <> pT2.`Pessoa_Treinadora_ID`;

-- 8. Crie uma query que retorne uma coluna com o nome dos planos outra que com a quantidade de pessoas associadas que possuem esse plano, nomeie como 'Pessoas Inclusas'.
select pL.Nome_plano, count(pA.Pessoa_Associada_ID) as 'Pessoas Inclusas'
from `Plano` as pL
left join `Pessoa_Associada` as pA on pL.`Plano_ID` = `pA`.`Plano_ID`
group by pL.Nome_plano;

-- 9.  Crie uma query que retorne uma coluna nomeada como 'Nome Completo', com o nome completo das pessoas associadas a academia, e uma coluna com o período dessa pessoa. Utilize as tabelas Pessoa_Associada, Treino e Horario.
select concat(pA.Nome, ' ', pA.Sobrenome) as 'Nome Completo', h.Periodo
from `Pessoa_Associada` as pA
join `Treino` as t on pA.`Pessoa_Associada_ID` = t.`Pessoa_Associada_ID`
join `Horario` as h on h.`Horario_ID` = t.`Horario_ID`;

-- 10. Crie uma query que retorne uma coluna nomeada como 'Nome Completo' com o nome completo de todas as pessoas associadas a academia e uma coluna com o nome 'Horario', mostrando o período dessa pessoa. Caso a pessoa não tiver período estipulado, exiba 'LIVRE'. Utilize as tabelas Pessoa_Associada, Aula e Horario.
select concat(pA.Nome, ' ', pA.Sobrenome) as 'Nome Completo', ifnull(h.Periodo, 'LIVRE') as 'Horario'
from `Pessoa_Associada` as pA
left join `Treino` as t on pA.`Pessoa_Associada_ID` = t.`Pessoa_Associada_ID`
left join `Horario` as h on h.`Horario_ID` = t.`Horario_ID`;
