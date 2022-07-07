CREATE TABLE supply_authorization (
  prdManId               VARCHAR NOT NULL PRIMARY KEY
  ,supAutNumber           VARCHAR(12) NOT NULL
  ,supAutIssueDate        VARCHAR(9) NOT NULL
  ,supAutManUnitCode      INTEGER  NOT NULL
  ,supAutManUnit          VARCHAR(52) NOT NULL
  ,supAutManTypeCode      INTEGER  NOT NULL
  ,supAutManType          VARCHAR(52) NOT NULL
  ,supAutTotValue         INTEGER  NOT NULL
  ,supAutDeliveryDeadLine INTEGER  NOT NULL
  ,supAutManUnitCnpj      VARCHAR(18) NOT NULL
  ,prdSgpeAgency          VARCHAR(3) NOT NULL
  ,prdSgpeNumber          INTEGER  NOT NULL
  ,prdSgpeYear            INTEGER  NOT NULL
  ,supAutCigNumber        VARCHAR(10) NOT NULL
  ,supAutPaymentDeadLine  INTEGER  NOT NULL
  ,supplierCnpj           VARCHAR(18) NOT NULL
  ,supplierName           VARCHAR(36) NOT NULL
  ,bidNumber              VARCHAR(13) NOT NULL
  ,prdNumber              VARCHAR(15) NOT NULL
  ,itemCode               INTEGER  NOT NULL
  ,itemDescription        VARCHAR(49) NOT NULL
  ,itemMeasureUnit        VARCHAR(5) NOT NULL
  ,commitNoteNumber       VARCHAR(12) NOT NULL
  ,itemQuant              INTEGER  NOT NULL
  ,itemUnitPrice          VARCHAR NOT NULL
  ,itemTotValue           INTEGER  NOT NULL
  ,deliveryAdress         VARCHAR(86) NOT NULL
  ,deliveryAdressComp     VARCHAR(30)
  ,deliveryNeigh          VARCHAR(9) NOT NULL
  ,deliveryCity           VARCHAR(13) NOT NULL
  ,deliveryCep            VARCHAR(10) NOT NULL
  ,deliveryPhone          VARCHAR(30)
  ,sendRequestDate          VARCHAR(10)
  ,orderDispatchDate        TIMESTAMP
  ,orderReceptDate          TIMESTAMP
  ,orderReceptAprov         INTEGER
  ,orderReceptAprovDate     TIMESTAMP
  ,orderReceptPayDate       TIMESTAMP
  ,orderReceptPayNote       VARCHAR(20)
);