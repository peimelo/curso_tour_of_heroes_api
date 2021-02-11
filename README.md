# Tour Of Heroes API

Curso de Ruby on Rails 6 como API de Heroes.

Esse repositório faz parte do [Curso de Ruby on Rails 6 como API](https://www.youtube.com/watch?v=gTR6lx00Nac&list=PLqsayW8DhUmuvgOX08aXYk6Y-HGrdYg20).

<table>
  <tr>
    <td>Ruby version</td>
    <td>
      2.7.2
    </td>
  </tr>
  <tr>
    <td>Rails version</td>
    <td>
      6.1.x
    </td>
  </tr>
  <tr>
    <td>Database</td>
    <td>
      SQLite3 (dev) / PostgreSQL (prod)
    </td>
  </tr>
</table>

## Configurações iniciais para rodar o projeto

```bash
# clonar o projeto
git clone https://github.com/peimelo/curso_tour_of_heroes_api.git

# entrar no diretório clonado
cd curso_tour_of_heroes_api

# instalar as dependências do Ruby on Rails
bundle install

# criar os bancos de dados de development e test
rails db:create

# criar as tabelas
rails db:migrate

# rodar o projeto
rails s
```

O backend fica disponível em `http://localhost:3000`.

## Testes

[![CircleCI](https://circleci.com/gh/peimelo/curso_tour_of_heroes_api.svg?style=svg)](https://circleci.com/gh/peimelo/curso_tour_of_heroes_api)

Para rodar os testes:

```bash
rspec
```

## Usando a HEROES API

### Inclua um Header Authorization

Para todas as requisições deve-se usar um **Authorization header**, de tamanho >= 10 caracteres, para que você manipule apenas seus dados, por exemplo:

```bash
curl --request GET \
  --url 'https://curso-tour-of-heroes-api.herokuapp.com/api/heroes' \
  --header 'Authorization: qualquerTokenPodeSerUsado'
```

### API Endpoint

Os seguintes endpoints estão disponíveis:

| Endpoints                   | Uso                                                                     | Parâmetros         |
| --------------------------- | ----------------------------------------------------------------------- | ------------------ |
| `GET /api/heroes`           | Obtém todos os heroes.                                                  |                    |
| `GET /api/heroes?name=term` | Obtém todos os heroes que no `name` contenha o valor do `term` buscado. | **term**: [String] |
| `GET /api/heroes/:id`       | Obtém os detalhes de um hero.                                           |                    |
| `POST /api/heroes`          | Adiciona um novo hero.                                                  | **name**: [String] |
| `PUT /api/heroes/:id`       | Edita os detalhes de um hero existente.                                 | **name**: [String] |
| `DELETE /api/heroes/:id`    | Remove um hero.                                                         |                    |
