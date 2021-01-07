# Tour Of Heroes API

Curso de Ruby on Rails 6 como API de Heros.

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
      6.1.0
    </td>
  </tr>
  <tr>
    <td>Database</td>
    <td>
      SQLite3
    </td>
  </tr>
</table>

## Configurações iniciais para rodar o projeto

```bash
# clonar o projeto
git clone https://github.com/peimelo/curso_tour_of_heroes_api.git
cd curso_tour_of_heroes_api

# instalar as dependências do Ruby on Rails
bundle install

# criar os bancos de dados de development e test
rails db:create

# criar as tabelas
rails db:migrate
```

## Rodar o projeto

```
rails s
```
