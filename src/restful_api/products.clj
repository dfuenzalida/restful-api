(ns restful-api.products
  (:use [korma.db]
        [korma.core]))

(defdb db
  (mysql {:db "sample" :user "root" :password "root"}))

(defentity products
  (table :PRODUCT)
  (pk :PRODUCT_ID)
  (entity-fields [:DESCRIPTION :name][:PRODUCT_CODE :code]))

(defn get-products []
  (select products
          (fields
           [:PRODUCT_ID :id]
           [:PRODUCT_CODE :code]
           [:DESCRIPTION :name])
          ))
