# README

Esse é desafio proposto pela galera da Luiza Labs.

# Cenário
_O Magalu está expandindo seus negócios e uma das novas missões do time de
tecnologia é criar uma funcionalidade de Produtos Favoritos de nossos Clientes, em
que os nossos aplicativos irão enviar requisições HTTP para um novo backend que
deverá gerenciar nossos clientes e seus produtos favoritos.
Esta nova API REST será crucial para ações de marketing da empresa e terá um
grande volume de requisições então tenha em mente que a preocupação com
performance é algo que temos em mente constantemente._

# Dependencias
Para o projeto rodar ser fazer necessário ter os seguintes serviços:
* ruby 2.5.x
* mysql 5.7.x
* redis-server

# Executar
* git clone git@github.com:rafaeldev/favorite-products.git
* cd favorite-products
* bundle install
* rails db:create db:schema:load db:seed
* rails server

# Endpoints
As chamadas estão disponíveis no arquivo _LuizaLabs.postman_collection.json_ na raiz do projeto.

**tip:** Para que as chamadas possam funcionar, é preciso:
1) Criar o cliente :: POST para /clients
2) Autenticar o usuário criado :: POST para /authenticate
2.b) Pegar o "auth_token" gerado na chamada acima e adicionar no header das demais chamadas :: Authorization: <token-doido>

# Considerações finais
De longe consegui montar o cenário ideal.
Possivelmente o teste vai ser difilcultoso pois a aplicação não está _dockerizada_... Não sei o por quê mas a imagem simplesmente quebra na minha máquina.

### Decisões:
**CI:** Para demonstrar um fluxo mais real de desenvolvimento, configurei o Travis CI.

**Evitar duplicações:** Adicionei o redis para que guarde todos IDs dos produtos. Isso é para validar se o produto de fato existe antes de vincula-lo ao cliente. Uma melhor abordagem para cenário era (talvez) adicionar um ElasticSearch com os produtos vigentes. Como um dos pontos era porformance (pelo menos é uma das premissas de pensamento daí) optei por esse caminho. Banco seria "problematico" pelo IO no disco a cada chamada. Achei demais também fazer a chamada pelo ID a cada chamada do `add_product`.
Um contra muito forte dessa minha abordagem é o tempo de up da aplicação pois precisa consumir várias páginas antes de inicialiar.

**Autenticação:** Optei por fazer via JWT ao invés de usar um [Devise](https://github.com/heartcombo/devise), por exemplo. Nem de perto está de um cenário seguro mas resolvia por hora.

# LICENÇA
[Confira aqui](https://github.com/rafaeldev/favorite-products/blob/master/LICENSE.txt)
