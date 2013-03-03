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
$ curl -i -H "Accept: text/plain" http://localhost:8000/elements  ; echo ""

[{"hola":"hello"},{"bye":"adios"}]
```

### Create an entry

```
$ curl -i -X POST -H "Accept: application/json" "http://localhost:8000/elements?name=foo&value=ir+works"  ; echo ""

[{"hola":"hello"},{"bye":"adios"},{"foo":"it works"}]
```



## License

Copyright © 2013 Denis Fuenzalida

Distributed under the Eclipse Public License, the same as Clojure.
