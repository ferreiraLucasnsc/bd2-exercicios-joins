use academia;

--      USUÁRIO ANALISTA

create user analista IDENTIFIED by 'senhaAnalista';
grant select on academia.endereco_basico to analista;
grant select on academia.horarios_clientes to analista;
grant select on academia.informacoes_contato to analista;
grant select on academia.planos_quantidade to analista;

show grants for analista;

--      USUÁRIO GESTOR

create user gestor identified by 'senha_Gestor_!124';
grant select on academia.* to gestor;
grant insert on academia.* to gestor;
grant update on academia.* to gestor;

show grants for gestor;