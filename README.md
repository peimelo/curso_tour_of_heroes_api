# Tour Of Heroes API

Ruby on Rails 6 course as an API creating a Heroes CRUD.

This repository is part of the [Curso de Ruby on Rails 6 como API](https://www.youtube.com/watch?v=gTR6lx00Nac&list=PLqsayW8DhUmuvgOX08aXYk6Y-HGrdYg20) on YouTube.

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

## Initial settings to run the project

```bash
# clone the project
git clone https://github.com/peimelo/curso_tour_of_heroes_api.git

# enter the cloned directory
cd curso_tour_of_heroes_api

# install Ruby on Rails dependencies
bundle install

# create the development and test databases
rails db:create

# create the tables
rails db:migrate

# run the project
rails s
```

The backend is available at `http://localhost:3000`.

## Tests

![Tests](https://github.com/peimelo/curso_tour_of_heroes_api/actions/workflows/ruby.yml/badge.svg)

To run the tests:

```bash
rspec
```

## Using the HEROES API

### Include a Header Authorization

For all requests, use an **Authorization header**, of size> = 10 characters, so that you can only manipulate your data, for example:

```bash
curl --request GET \
  --url 'https://curso-tour-of-heroes-api.herokuapp.com/api/heroes' \
  --header 'Authorization: anyTokenCanBeUsed'
```

### API Endpoint

The following endpoints are available:

| Endpoints                   | Usage                                     | Params             |
| --------------------------- | ----------------------------------------- | ------------------ |
| `GET /api/heroes`           | Get all of the heroes.                    |                    |
| `GET /api/heroes?name=term` | Get all heroes with `name` like a `term`. | **term**: [String] |
| `GET /api/heroes/:id`       | Get the details of a single hero.         |                    |
| `POST /api/heroes`          | Add a new hero.                           | **name**: [String] |
| `PUT /api/heroes/:id`       | Edit the details of an existing hero.     | **name**: [String] |
| `DELETE /api/heroes/:id`    | Remove the hero.                          |                    |
