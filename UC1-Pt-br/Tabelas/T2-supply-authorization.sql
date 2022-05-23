/* table 2 (T2): Supply Authorization Table
  This is the table to register information of each one of the supply requisitions made by the
  government agencies. WE NEED TO DECIDE IF it will be an smart contract in itself or we will
  register the supply requisitions as transaction into the PRD Smart Contract
  */

CREATE TABLE T2_supply_authorization (
  -- Supply authorization (SA) informaction section.  
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
  /*
  (*) Verificar se é criado um processo SGP-e para cada solicitação de fornecimento,  ou a autorização é inserida
  no mesmo processo da ARP. Nos casos em que a mesma ARP é utilizada por mais de um órgão, em geral cada
  órgão abre um processo SGP-e com a mesma ARP para gerenciar suas solicitações. Caso seja um processo SGP-e
  para a mesma ARP em cada órgão é interessante utilizar os campos relativos ao processo SGP-e da ARP.
  Discussão para os campos prdSgpeAgency, prdSgpeNumber e prdSgpeYear.
  */
  ,prdSgpeAgency          VARCHAR(3) NOT NULL
  ,prdSgpeNumber          INTEGER  NOT NULL
  ,prdSgpeYear            INTEGER  NOT NULL
  ,supAutCigNumber        VARCHAR(10) NOT NULL
  ,supAutPaymentDeadLine  INTEGER  NOT NULL
  ,supplierCnpj           VARCHAR(18) NOT NULL
  ,supplierName           VARCHAR(36) NOT NULL
  ,bidNumber              VARCHAR(13) NOT NULL
  ,prdNumber              VARCHAR(15) NOT NULL

  -- Item requisition section. In this section we can have more than one requisition per supply authorization
  ,itemCode               INTEGER  NOT NULL
  ,itemDescription        VARCHAR(49) NOT NULL
  ,itemMeasureUnit        VARCHAR(5) NOT NULL
  ,commitNoteNumber       VARCHAR(12) NOT NULL
  ,itemQuant              INTEGER  NOT NULL
  ,itemUnitPrice          VARCHAR NOT NULL
  ,itemTotValue           INTEGER  NOT NULL

  --  Delivery adress information section
  ,deliveryAdress         VARCHAR(86) NOT NULL
  ,deliveryAdressComp     VARCHAR(30)
  ,deliveryNeigh          VARCHAR(9) NOT NULL
  ,deliveryCity           VARCHAR(13) NOT NULL
  ,deliveryCep            VARCHAR(10) NOT NULL
  ,deliveryPhone          VARCHAR(30)

  -- Process instance information section
  ,sendRequestDate          VARCHAR(10)
  ,orderDispatchDate        TIMESTAMP
  ,orderReceptDate          TIMESTAMP
  ,orderReceptAprov         INTEGER
  ,orderReceptAprovDate     TIMESTAMP
  
  -- novos campos incluídos na versão do diagrama no qual existe a tarefa/form de confirmação de pagamento.
  ,orderReceptPayDate       TIMESTAMP
  ,orderReceptPayNote       VARCHAR(20)
  /*
  (*) Verificar como faremos para registrar as situações nas quais a aprovação é parcial,
  sendo, em geral, por diferença de quantidade. No caso, teríamos que permitir a alteração
  de quantidades nos produtos entregues. Alteramos no saldo ou criamos um campo aqui de registro?
  */
);