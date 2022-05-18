/* Support Table 1 (ST1): Supplier Information Table
  
  This is the table to maintain the supplier informations and its representants. 
  */

CREATE TABLE ST1_supplier_registration (
  -- Supplier information section.
  supRegId             INTEGER  NOT NULL PRIMARY KEY 
  ,supplierName         VARCHAR(100) NOT NULL
  ,supplierCnpj         VARCHAR(18) NOT NULL
  ,supplierAdress       VARCHAR(100) NOT NULL
  ,supplierAdressComp   VARCHAR(10) NOT NULL
  ,supplierNeigh        VARCHAR(40) NOT NULL
  ,supplierCity         VARCHAR(40) NOT NULL
  ,supplierCep          VARCHAR(10) NOT NULL
  ,supplierPhone        VARCHAR(20) NOT NULL

  -- Supplier representant information section.
  ,supplierRepName      VARCHAR(80) NOT NULL
  ,supplierRepCpf       VARCHAR (14) NOT NULL
  ,supplierRepEmail     VARCHAR(20) NOT NULL
);