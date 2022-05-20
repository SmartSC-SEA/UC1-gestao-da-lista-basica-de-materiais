/* Table 1 (T1): Price Registration Management Table
 
 this is the table to manage all PRDs. In this table we will manage the balances of
 item quantities per supplier and per each one PRD.  From this table we will generate
 the information to create the PRD Smart Contracts filtering the data on this table by 'prdNumber'
 */

CREATE TABLE T1_prd_management (
  -- Price Registration Document (PRD) informaction section.
   prdManId         INTEGER  NOT NULL PRIMARY KEY 
  ,Agency           VARCHAR(3) NOT NULL
  ,bidNumber        VARCHAR(9) NOT NULL
  ,prdNumber        VARCHAR(16) NOT NULL
  ,supplierName     VARCHAR(53) NOT NULL
  ,supplierCnpj     VARCHAR(18) NOT NULL
  ,lotNumber        VARCHAR(7) NOT NULL
  ,lotDescription   VARCHAR(85) NOT NULL
  ,itemNumber       INTEGER  NOT NULL
  ,itemCode         INTEGER  NOT NULL
  ,itemDescription  VARCHAR(57) NOT NULL
  ,itemMeasureUnit  VARCHAR(6) NOT NULL
  ,itemQuant        INTEGER  NOT NULL
  ,itemUnitPrice    NUMERIC(5,3) NOT NULL
  ,itemBrand        VARCHAR(16) NOT NULL
  
  -- PRD Manager information section.
  ,prdManagerName   VARCHAR(19) NOT NULL
  ,prdManagerCpf    VARCHAR(14) NOT NULL
  
  -- SGP-e Bidding Process information section
  ,bidSgpeAgency    VARCHAR(3) NOT NULL
  ,bidSgpeNumber    INTEGER  NOT NULL
  ,bidSgpeYear      INTEGER  NOT NULL
  
  -- SGP-e PRD Process information section
  ,prdSgpeAgency    VARCHAR(2) NOT NULL
  ,prdSgpeNumber    VARCHAR(2) NOT NULL
  ,prdSgpeYear      VARCHAR(2) NOT NULL
  
  -- Supplier Representant information section
  ,supplierRep      VARCHAR(30) NOT NULL
  ,supplierRepCpf   VARCHAR(11) NOT NULL
  ,supplierRepEmail VARCHAR(29)
  ,numPublicDoe     INTEGER  NOT NULL
  ,datePublicDoe    VARCHAR(10) NOT NULL
);