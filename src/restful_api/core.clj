(ns restful-api.core
  (:require [clojure.data.json :as json])
  (:use [liberator.core :only [defresource wrap-trace-as-response-header request-method-in]]
        [ring.middleware.multipart-params :only [wrap-multipart-params]]
        [compojure.core :only [context ANY routes]]
        [compojure.handler :only [api]]
        [clojure.tools.logging :only [info error]]))

;; IN-MEMORY DB: a list of random items

(def database (atom [{:hola "hello"} {:bye "adios"}]))

;; RESOURCES

(defresource elements
  :method-allowed? (request-method-in :get :post)
  :post! (fn [context]
           (let [name (get-in context [:request :params :name])
                 value (get-in context [:request :params :value])]
             (info (str "Adding '" name "' -> '" value "'"))
             (swap! database conj {name value})))
  :handle-created (fn [_] (json/write-str @database))
  :handle-ok (fn [_] (json/write-str @database))
  :available-media-types ["text/plain", "application/json"])

;; ROUTES

(defn assemble-routes []
  (->
   (routes
    (ANY "/elements" [] elements))
   (wrap-trace-as-response-header))) ;; See debug output on HTTP headers

;; TESTING:
;; $ lein ring server-headless
;; CURL GET:
;; $ curl -i -H "Accept: text/plain" http://localhost:8000/elements  ; echo ""
;; CURL POST:
;; $ curl -i -X POST -H "Accept: application/json" "http://localhost:8000/elements?name=foo&value=ir+works"  ; echo ""

;; TODO move all the functions below to a different file (server config)

(defn create-handler []
  (fn [request]
    (
     (->
      (assemble-routes)
      api
      wrap-multipart-params)
     request)))

(def handler (create-handler))
