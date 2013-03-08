(defproject restful-api "0.1.0-SNAPSHOT"
  :description "A Simple RESTful API with a MySQL backend"
  :url "http://example.com/FIXME"
  :license {:name "Eclipse Public License"
            :url "http://www.eclipse.org/legal/epl-v10.html"}
  :dependencies [[org.clojure/clojure "1.4.0"]
                 [org.clojure/tools.logging "0.2.6"]
                 [liberator "0.8.0"]
                 [compojure "1.0.2"]
                 [ring/ring-jetty-adapter "1.1.0"]
                 [ring/ring-json "0.2.0"]
                 [korma "0.3.0-beta9"]
                 [mysql/mysql-connector-java "5.1.6"]

                 ;; required by korma:
                 [log4j "1.2.17"
                  :exclusions [javax.mail/mail
                               javax.jms/jms
                               com.sun.jdmk/jmxtools
                               com.sun.jmx/jmxri]]]

  :plugins [[lein-ring "0.7.1" :exclusions [org.clojure/clojure]]]

  :ring {:handler restful-api.core/handler
         :adapter {:port 8000}}
  )
