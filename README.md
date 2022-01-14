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
