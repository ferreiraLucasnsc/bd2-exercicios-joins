--      VIEWS DA BASE 'ACADEMIA'

use academia;

create view endereco_basico as
    select concat(pA.Nome, ' ', pA.Sobrenome) as 'Nome Completo', e.Logradouro, e.Numero
    from `Pessoa_Associada` as pA
    join `Endereco` as e on `pA`.`Endereco_ID` = e.`Endereco_ID`;

create view informacoes_contato as
    select concat(pA.Nome, ' ', pA.Sobrenome) as 'Nome Completo', t.Telefone_Contato, e.CEP
    from `Pessoa_Associada` as pA
    join `Telefone` as t on pA.`Telefone_ID` = t.`Telefone_ID`
    join `Endereco` as e on e.`Endereco_ID` = pA.`Endereco_ID`;

create view planos_quantidade as
    select pL.Nome_plano, count(pA.Pessoa_Associada_ID) as 'Pessoas Inclusas'
    from `Plano` as pL
    left join `Pessoa_Associada` as pA on pL.`Plano_ID` = `pA`.`Plano_ID`
    group by pL.Nome_plano;

create view horarios_clientes as
    select concat(pA.Nome, ' ', pA.Sobrenome) as 'Nome Completo', h.Periodo
    from `Pessoa_Associada` as pA
    join `Treino` as t on pA.`Pessoa_Associada_ID` = t.`Pessoa_Associada_ID`
    join `Horario` as h on h.`Horario_ID` = t.`Horario_ID`;