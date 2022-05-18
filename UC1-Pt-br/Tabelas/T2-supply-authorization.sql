/* table 2 (T2): Supply Authorization Table
  This is the table to register information of each one of the supply requisitions made by the
  government agencies. WE NEED TO DECIDE IF it will be an smart contract in itself or we will
  register the supply requisitions as transaction into the PRD Smart Contract
  */

CREATE TABLE T2_supply_authorization (
  -- Supply authorization (PRD) informaction section.  
  supAutid                  INTEGER  NOT NULL PRIMARY KEY
  ,supAutNumber             VARCHAR(20) NOT NULL
  ,supAutIssueDate          DATE  NOT NULL
  ,supAutManUnitcode        VARCHAR(20) NOT NULL
  ,supAutManUnit            VARCHAR(50) NOT NULL
  ,supAutManTypeCode        VARCHAR(20) NOT NULL
  ,supAutManType            VARCHAR(50) NOT NULL
  ,supAutTotValue           NUMERIC (6,3) NOT NULL
  ,supAutDeliveryDeadLine   INTEGER NOT NULL
  ,supAutManUnitCnpj        VARCHAR(20) NOT NULL
  /*
  (*) Verificar se é criado um processo SGP-e para cada solicitação de fornecimento,  ou a autorização é inserida
  no mesmo processo da ARP. Nos casos em que a mesma ARP é utilizada por mais de um órgão, em geral cada
  órgão abre um processo SGP-e com a mesma ARP para gerenciar suas solicitações. Caso seja um processo SGP-e
  para a mesma ARP em cada órgão é interessante utilizar os campos relativos ao processo SGP-e da ARP.
  Discussão para os campos prdSgpeAgency, prdSgpeNumber e prdSgpeYear.
  */
  ,prdSgpeAgency            VARCHAR(5) NOT NULL
  ,prdSgpeNumber            INTEGER  NOT NULL
  ,prdSgpeYear              INTEGER  NOT NULL
  ,supAutCigNumber          VARCHAR(20) NOT NULL
  ,supAutPaymentDeadLine    INTEGER NOT NULL
  ,supplierCnpj             VARCHAR(20) NOT NULL
  ,supplierName             VARCHAR(60) NOT NULL
  ,bidNumber                VARCHAR(10) NOT NULL
  ,prdNumber                VARCHAR(20) NOT NULL

  -- Item requisition section. In this section we can have more than one requisition per supply authorization
  ,itemCode                 VARCHAR(20) NOT NULL
  ,itemDescription          VARCHAR(60) NOT NULL
  ,itemMeasureUnit          VARCHAR(10) NOT NULL
  ,commitNoteNumber         VARCHAR(20) NOT NULL
  ,itemQuant                INTEGER  NOT NULL
  ,itemUnitPrice            NUMERIC (6,3) NOT NULL
  ,itemTotValue             NUMERIC (6,3) NOT NULL

  --  Delivery adress information section
  ,deliveryAdress           VARCHAR(100) NOT NULL
  ,deliveryAdressComp       VARCHAR(10) NOT NULL
  ,deliveryNeigh            VARCHAR(40) NOT NULL
  ,deliveryCity             VARCHAR(40) NOT NULL
  ,deliveryCep              VARCHAR(10) NOT NULL
  ,deliveryPhone            VARCHAR(20) NOT NULL

  -- Process instance information section
  ,sendRequestDate          VARCHAR(10) NOT NULL
  ,orderDispatchDate        TIMESTAMP NOT NULL
  ,orderReceptDate          TIMESTAMP NOT NULL
  ,orderReceptAprov         BOOLEAN NOT NULL
  ,orderReceptAprovDate     TIMESTAMP NOT NULL
  /*
  (*) Verificar como faremos para registrar as situações nas quais a aprovação é parcial,
  sendo, em geral, por diferença de quantidade. No caso, teríamos que permitir a alteração
  de quantidades nos produtos entregues. Alteramos no saldo ou criamos um campo aqui de registro?
  */
);