# UC1-gestao-da-lista-basica-de-materiais
 Repositório do projeto de automação da gestão da lista básica de materiais do governo do Estado de Santa Catarina com uso de smart contracts e motor de workflow.
 
 ## Arquitetura do protótipo (5 componentes)
 ### **Front-end**
 - *Interface do usuário:* Interação com a aplicação, monitoramento e gestão de processos e tarefas realizada por meio do Camunda BPMS; interação com a blockchain por meio de web3.js e Infura.

### **Back-end**
 - *Motor de workflow:* suporte à automação de processos, regras off-chain, registro e autenticação de informações na blockchain por meio do Camunda BPMS.
 - *contratos inteligentes:* Smart contracts desenvolvidos em Solidity para implementação na rede blockchain Ethereum ou similar.
 - *Banco de dados relacional:* Para armazenamento de dados off-chain (dados de usuários, logs de sistema, regras de negócios relativas ao processo etc.), utiliza-se banco de dados H2, nativo do Camunda BPMS.
 - *Rede Blockchain:* Protótipo construído sobre a rede Ethereum, para armazenamento de dados on-chain e processamento de regras relativas aos contratos inseridos nos smart contracts.

## **Justificativa**
- Alto volume de recursos envolvido no processo de aquisição de materias da lista básica por parte dos órgãos do Governo do Estado;
- Envolvimento de diversos participantes e instituições, com diferentes níveis de confiança entre as partes;
- processo não suportado atualmente por sistemas computacionais, sendo executado por meio de registros em planilhas e trocas de e-mails entre os envolvidos.
- Necessidade de aprimoramento de controles para minimização de potenciais irregularidades no processo de aquisição.

## **Premissas**
- Escopo envolve a gestão administrativa da lista básica de materiais, ou seja, visa gerenciar o fluxo de aquisição e entrega de materiais;
- A aplicação deve estabelecer um tracking das solicitações de aquisição de material, acompanhando seu status desde o momento da solicitação até a aprovação do material entregue pelos fornecedores e liberação do pagamento;
- A aplicação deve calcular o saldo disponível de produtos nas Atas de Registro de Preços e saldo remanescente para aquisição de materiais por parte de cada um dos órgãos do Govenro do Estado (gestão do estoque da ata);
- A aplicação deve explicitar os momentos críticos do processo de aquisição, gerando ao final uma fila de pagamentos por ordem cronológica, imutável, gravada em blockchain e disponível para acesso público.

# UC1-management-of-basic-list-of-materials
 Repository of the automation project of the management of the basic list of materials of the government of the State of Santa Catarina using smart contracts and workflow engine.
 
 ## Prototype architecture (5 components)
 ### **Front-end**
 - *User interface:* Interaction with the application, monitoring and management of processes and tasks performed through Camunda BPMS; interaction with the blockchain through web3.js and Infura.

### **Backend**
 - *Workflow engine:* support for process automation, off-chain rules, registration and authentication of information on the blockchain through Camunda BPMS.
 - *smart contracts:* Smart contracts developed in Solidity for implementation on the Ethereum or similar blockchain network.
 - *Relational database:* For off-chain data storage (user data, system logs, business rules related to the process, etc.), the H2 database, native to Camunda BPMS, is used.
 - *Blockchain Network:* Prototype built on the Ethereum network, for on-chain data storage and processing of rules related to contracts inserted in smart contracts.

## **Justification**
- High volume of resources involved in the process of acquiring materials from the basic list by State Government bodies;
- Involvement of different participants and institutions, with different levels of trust between the parties;
- process not currently supported by computer systems, being executed through records in spreadsheets and email exchanges between those involved.
- Need to improve controls to minimize potential irregularities in the acquisition process.

## **Assumptions**
- Scope involves the administrative management of the basic list of materials, that is, it aims to manage the flow of acquisition and delivery of materials;
- The application must establish a tracking of material acquisition requests, following its status from the moment of the request until the approval of the material delivered by the suppliers and payment release;
- The application must calculate the available balance of products in the Price Registration Minutes and the remaining balance for the acquisition of materials by each of the State Government bodies (stock management of the minutes);
- The application must explain the critical moments of the acquisition process, generating at the end a queue of payments in chronological order, immutable, recorded in blockchain and available for public access.
