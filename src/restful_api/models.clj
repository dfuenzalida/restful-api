(ns restful-api.models
  (:use [korma.db]
        [korma.core]))

(defdb db
  (mysql {:db "sample" :user "root" :password "root"}))

;; ENTITIES

(defentity products
  (table :PRODUCT)
  (pk :PRODUCT_ID)
  (entity-fields [:DESCRIPTION :name][:PRODUCT_CODE :code]))

(defentity manufacturers
  (table :MANUFACTURER)
  (pk :MANUFACTURER_ID))

;; FUNCTIONS

(defn get-products []
  (select products
          (fields
           [:PRODUCT_ID :id]
           [:PRODUCT_CODE :code]
           [:DESCRIPTION :name])
          ))

(defn get-manufacturers []
  (select manufacturers
          (fields
           [:MANUFACTURER_ID :id]
           [:NAME :name]
           [:ADDRESSLINE1 :address1]
           [:ADDRESSLINE2 :address2]
           [:CITY :city]
           [:STATE :state]
           [:ZIP :zip]
           [:PHONE :phone]
           [:EMAIL :email])))

(defn create-manufacturer [params]
  (let [id (inc (:id (first (select manufacturers (fields [:MANUFACTURER_ID :id]) (order :id :DESC)(limit 1)))))]
    (insert manufacturers
            (values {:MANUFACTURER_ID id
                     :NAME            (params "name")
                     :ADDRESSLINE1    (params "address1")
                     :ADDRESSLINE2    (params "address2")
                     :CITY            (params "city")
                     :STATE           (params "state")
                     :ZIP             (params "zip")
                     :PHONE           (params "phone")
                     :FAX             (params "fax")
                     :EMAIL           (params "email")}))))
