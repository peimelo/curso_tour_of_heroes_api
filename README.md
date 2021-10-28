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
bundle install --without production

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

For all requests, use an **Authorization header**, of size >= 10 characters, so that you can only manipulate your data, for example:

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

### Using Insomnia to test the API

If you want to import the above requests into [Insomnia](https://insomnia.rest/download), use the file `Insomnia.json` at the root of this project.

It will be necessary to install the plugin [insomnia-plugin-dotenv](https://insomnia.rest/plugins/insomnia-plugin-dotenv).

Create an environment variable file at the root of the project to add sensitive data:

```bash
touch .env.development
```

Add the contents below to the file above:

```bash
token=anyTokenCanBeUsed
```

In Insomnia, go to `Manage Environments` and set the `envFilePath` value to the file path `.env.development`:

```json
{
  "baseUrl": "http://localhost:3000/api",
  "envFilePath": "/path/to/file/your_repo/.env.development"
}
```

Any `.env.*` file is being ignored by this project's GIT.
