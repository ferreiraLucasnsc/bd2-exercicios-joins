use final_space_db;

--      === EXERCÍCIOS SOBRE JOINS ===
-- -> INNER JOIN

-- 1. Escreva uma query que retorne uma coluna com o nome dos personagens e uma coluna com o nome de sua espécie.
select c.`Name` as `PERSONAGEM`, s.`Specie_Name` as `ESPÉCIE`
from `Character` as c
inner join `Specie` as s on s.`Specie_id` = c.`Specie`;

-- 2. Escreva uma querie que retorne uma coluna com os nomes dos personagens e uma coluna com o nome do seu local de origem.
select c.`Name` as `PERSONAGEM`, l.`Location_Name` as `LOCAL DE ORIGEM`
from `Character` as c
inner join `Location` as l on l.`Location_id` = c.`Origin`;

-- 3. Agora, retorne o nome do personagem, sua espécie e o lugar de origem em uma query.
select c.`Name` as `NOME`, s.`Specie_Name` as `ESPÉCIE`, l.`Location_Name` as `LOCAL DE ORIGEM`
from `Character` as c
inner join `Specie` as s on s.`Specie_id` = c.`Specie`
inner join `Location` as l on l.`Location_id` = c.`Origin`;

-- 4. Escreva uma query que retornará uma coluna com o nome da espécie, nomeie como Especie, e uma coluna com a quantidade de personagens daquela espécie, nomeie como Quantidade. Por fim, organize a lista de forma ascendente pela quantidade.
select s.`Specie_Name` as `Especie`, COUNT(c.`Name`) as `Quantidade`
from `Specie` as s
inner join `Character` as c on s.`Specie_id` = c.`Specie`
group by s.`Specie_Name`
order by `Quantidade` asc;

-- 5. Escreva uma query que retorne uma coluna com o nome do Local, nomeie como Local de origem, e uma coluna com quantidade de personagens que tenham origem desse local, nomeie como Quantidade. Por fim, organize a lista de forma decrescente pela quantidade.

select l.`Location_Name` as `Local de Origem`, COUNT(c.`Name`) as `Quantidade`
from `Location` as l
inner join `Character` as c on l.`Location_id` = c.`Origin`
group by l.`Location_Name`
order by `Quantidade` desc;

-- 6. Escreva uma query que retorne os nomes dos personagens que tem como local de origem 'Earth'. Por fim, organize os nomes em ordem alfabética.
select c.`Name` from `Character` as c
inner join `Location` as l on l.`Location_id` = c.`Origin`
where l.`Location_Name` = 'Earth'
order by c.`Name` asc;

-- 7. Escreva uma query que retorne nome e local de origem de todos personagens que são de espécie 'Ventrexian'. Por fim, ordene os nome de forma alfabética-invertida.
select c.`Name`, l.`Location_Name`
from `Character` as c
inner join `Specie` as s on s.`Specie_id` = c.`Specie`
inner join `Location` as l on l.`Location_id` = c.`Origin`
where s.`Specie_Name` = 'Ventrexian'
order by c.`Name` desc;

-- -> LEFT/RIGHT JOIN

-- 1.  Escreva uma query que exiba os nomes de todos os personagens e sua espécie. Observação: O nome de todos os personagens deve aparecer, inclusive os que não tem uma espécie definida.
select c.`Name`, s.`Specie_Name`
from `Character` as c
left join `Specie` as s on s.`Specie_id` = c.`Specie`;

-- 2. Escreva uma query que exiba os nomes de todos os personagens e seu local de origem. Observação: O nome de todos os personagens deve aparecer, inclusive os que não tem um local de origem definido.
select c.`Name`, l.`Location_Name`
from `Character` as c
left join `Location` as l on l.`Location_id` = c.`Origin`;

-- 3. Escreva uma query que mostre nome do personagem e nome de todas as espécies, mesmo as que não possuem personagem com aquela espécie.
select c.`Name`, s.`Specie_Name`
from `Character` as c
right join `Specie` as s on s.`Specie_id` = c.`Specie`;

-- 4. Escreva uma query que retorne nome do personagem e nome de todos locais de origem, inclusive os personagens sem origem desse local.
select c.`Name`, l.`Location_Name`
from `Character` as c
right join `Location` as l on l.`Location_id` = c.`Origin`;

-- 5. Escreva uma query que exiba nomes de todos os personagens e sua espécie. Se o personagem não tiver espécie definida, o campo da espécie deverá mostrar 'Unknown'. Por fim, nomeie a coluna espécie de 'Specie' e a coluna nomes dos personagens de 'Character'.
select c.`Name` as `Character`, IFNULL(s.`Specie_Name`, 'Unknown') as `Specie`
from `Character` as c
left join `Specie` as s on s.`Specie_id` = c.`Specie`
order by `Character` asc;

-- 6. Escreva uma query que retorne nome do personagem e nome de todos locais de origem. Nomeie coluna nome do personagem de 'Character' e coluna do local de 'Local'. Caso não houver personagem com origem do local, o campo que apresentaria no nome do personagem deve mostrar 'Unknown'.
select ifnull(c.`Name`, 'Unknown') as `Character`, l.`Location_Name` as `Local`
from `Character` as c
right join `Location` as l on l.`Location_id` = c.`Origin`;

-- -> SELF JOIN:

-- 1. Escreva uma query que exiba nomes dos personagens em uma coluna e nomes dos personagens com mesmo local de origem na coluna ao lado.
select c1.`Name`, c2.`Name`
from `Character` as c1, `Character` as c2
where c1.`Origin` = c2.`Origin`;

-- 2.  Escreva uma query que exiba nomes dos personagens em uma coluna e nomes dos personagens com mesmo local de origem na coluna ao lado. Agora, sem que nome do personagem apareça duas vezes na mesma linha.
select c1.`Name`, c2.`Name`
from `Character` as c1, `Character` as c2
where c1.`Origin` = c2.`Origin` and c1.`Name` <> c2.`Name`;

-- 3. Escreva uma query que exiba nomes dos personagens em uma coluna e nomes dos personagens da mesma espécie na coluna ao lado.
select c1.`Name`, c2.`Name`
from `Character` as c1, `Character` as c2
where c1.`Specie` = c2.`Specie`;

-- 4. Escreva uma query que exiba nomes dos personagens em uma coluna e nomes dos personagens da mesma espécie na coluna ao lado. Agora, sem que nome do personagem apareça duas vezes na mesma linha.
select c1.`Name`, c2.`Name`
from `Character` as c1, `Character` as c2
where c1.`Specie` = c2.`Specie`;