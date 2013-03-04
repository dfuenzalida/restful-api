# restful-api

A simple Clojure RESTful web API backed by a database, built on clojure-liberator.

## Usage

```
$ lein deps
$ lein ring server-headless
```

Then visit `http://0.0.0.0:8000/elements` on a browser to obtain a list of elements in the database, or use Curl to fetch the list / create new entries:

### List entries

```
$ curl -H "Accept: text/plain" http://localhost:8000/elements  ; echo ""

[{"hola":"hello"},{"bye":"adios"}]
```

### Create an entry

```
$ curl -H "Content-type: application/json" http://localhost:8000/elements -X POST --data "{\"name\":\"foo\",\"value\":\"bar\"}"  ; echo ""

[{"hola":"hello"},{"bye":"adios"},{"foo":"bar"}]
```

## License

Copyright © 2013 Denis Fuenzalida

Distributed under the Eclipse Public License, the same as Clojure.
