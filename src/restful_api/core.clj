(ns restful-api.core
  (:require [clojure.data.json :as json]
            [restful-api.models :as models])
  (:use [liberator.core :only [defresource wrap-trace-as-response-header request-method-in]]
        [ring.middleware.multipart-params :only [wrap-multipart-params]]
        [compojure.core :only [context ANY routes]]
        [compojure.handler :only [api]]
        [ring.middleware.json :only [wrap-json-body]]
        [clojure.tools.logging :only [info error]]))

;; IN-MEMORY DB: a list of random items

(def database (atom [{"hola" "hello"} {"bye" "adios"}]))

;; RESOURCES

(defresource elements
  :method-allowed? (request-method-in :get :post)
  :post! (fn [context]
           (let [name (get-in context [:request :body "name"])
                 value (get-in context [:request :body "value"])]
             (info (get-in context [:request]))
             (info (str "Adding '" name "' -> '" value "'"))
             (swap! database conj {name value})))
  :handle-created (fn [_] (json/write-str @database))
  :handle-ok (fn [_] (json/write-str @database))
  :available-media-types ["text/plain", "application/json"])

(defresource manufacturers
  :method-allowed? (request-method-in :get :post)
  :post! (fn [context]
           (let [params (get-in context [:request :body])]
             (info (str "Adding: " params))
             (models/create-manufacturer params)))
  :handle-created (fn [_] (json/write-str (models/get-manufacturers)))

  :handle-ok (fn [_] (json/write-str (models/get-manufacturers)))
  :available-media-types ["text/plain", "application/json"])

(defresource manufacturer-by-id [mid]
  :method-allowed? (request-method-in :get)
  :handle-ok (fn [_]
               (json/write-str
                (first (filter #(= mid (str (:id %))) (models/get-manufacturers)))))
  :available-media-types ["text/plain", "application/json"])

;; ROUTES

(defn assemble-routes []
  (->
   (routes
    (ANY "/elements" [] elements)
    (ANY "/manufacturers" [] manufacturers)
    (ANY "/manufacturers/:id" [id] (manufacturer-by-id id)))
   (wrap-trace-as-response-header))) ;; See debug output on HTTP headers

;; TESTING:
;; $ lein ring server-headless
;; CURL GET:
;; $ curl -i -H "Accept: text/plain" http://localhost:8000/elements  ; echo ""
;; CURL POST:
;; $ curl -i -X POST -H "Content-type: application/json" http://localhost:8000/elements --data "{\"name\":\"woody\",\"value\":\"cowboy\"}"  ; echo ""

;; TODO move all the functions below to a different file (server config)

(defn create-handler []
  (fn [request]
    (
     (->
      (assemble-routes)
      api
      wrap-json-body
      wrap-multipart-params)
     request)))

(def handler (create-handler))
