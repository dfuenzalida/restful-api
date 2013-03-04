(defproject restful-api "0.1.0-SNAPSHOT"
  :description "A Simple RESTful API with a MySQL backend"
  :url "http://example.com/FIXME"
  :license {:name "Eclipse Public License"
            :url "http://www.eclipse.org/legal/epl-v10.html"}
  :dependencies [[org.clojure/clojure "1.4.0"]
                 [compojure "1.0.2"]
                 [ring/ring-jetty-adapter "1.1.0"]
                 [liberator "0.8.0"]
                 [org.clojure/tools.logging "0.2.6"]
                 [ring/ring-json "0.2.0"]]

  :plugins [[lein-ring "0.7.1" :exclusions [org.clojure/clojure]]]

  :ring {:handler restful-api.core/handler
         :adapter {:port 8000}}
  )
