const { Client, logger } = require("camunda-external-task-client-js");
const { Variables } = require("camunda-external-task-client-js");

// configuration for the Client:
//  - 'baseUrl': url to the Process Engine
//  - 'logger': utility to automatically log important events
const config = { baseUrl: "http://bpms.eproc.sc.gov.br:8080/engine-rest", use: logger };

// create a Client instance with custom configuration
const client = new Client(config);

client.subscribe("DespachoDoPedido", async function ({ task, taskService }) {
  var orderDispatchDate = task.variables.get("orderDispatchDate").toString();
  var orderDispatchForm = task.variables.get("orderDispatchForm").toString();
  var orderDispatchNumber= task.variables.get("orderDispatchNumber").toString();
  var invoiceNumber = task.variables.get("invoiceNumber").toString();
  var invoiceUrl = task.variables.get("invoiceUrl").toString();
  
  var deliveryAdress = task.variables.get("deliveryAdress").toString();
  var deliveryAdressComp = task.variables.get("deliveryAdressComp").toString();
  var deliveryNeigh= task.variables.get("deliveryNeigh").toString();
  var deliveryCity = task.variables.get("deliveryCity").toString();
  var deliveryState = task.variables.get("deliveryState").toString();
  var deliveryCep = task.variables.get("deliveryCep").toString();

  console.log(orderDispatchDate,orderDispatchForm,orderDispatchNumber,invoiceNumber,invoiceUrl);
  console.log(deliveryAdress, deliveryAdressComp, deliveryNeigh, deliveryCity, deliveryState, deliveryCep);
  
  var processVariables = new Variables();
  var ethereumRegister = true;


  // web3.js - Ethereum JavaScript API goes here
  var Web3 = require('web3');
  const contract  = require('./contractXABI.json').abi;
  var provider = 'https://rinkeby.infura.io/v3/94a1c396349641de85d1780e45f5a140';
  var web3Provider = new Web3.providers.HttpProvider(provider);
  var web3 = new Web3(web3Provider);
  

  const quartersContract = new web3.eth.Contract(
      contract,
      "0x549AdC9049A641f789C5D33bd9169365aafBf548"
  ).methods;
  
  //var orderInfo = '' + orderDispatchDate + ',' + orderDispatchForm + ',' + orderDispatchNumber + ',' + invoiceNumber + '' + invoiceUrl;
  //var deliveryInfo = '' + deliveryAdress + ',' + deliveryAdressComp + ',' + deliveryNeigh + ',' + deliveryCity + ',' + deliveryState + ',' + deliveryCep;
  //console.log(orderInfo);
  
  async function test(){
      const data = await quartersContract.order(orderDispatchDate, orderDispatchForm, orderDispatchNumber, invoiceNumber, invoiceUrl, deliveryAdress, deliveryAdressComp, deliveryNeigh, deliveryCity, deliveryState, deliveryCep);
      const txData = data.encodeABI();

      const promise = await web3.eth.accounts.signTransaction(
      {
          from:"0x549AdC9049A641f789C5D33bd9169365aafBf548",
          to: "0x549AdC9049A641f789C5D33bd9169365aafBf548",
          data: txData,
          gas: 900000,
      },
      "dedb8b79475589f8d66d5dd9db4cf90657403993c2b2c873819483ba2b681ce7"
      );
  
      let transactionReceipt = await web3.eth.sendSignedTransaction(promise.rawTransaction);
      console.log(transactionReceipt);  
  }
  
  test();

  if (ethereumRegister) {
    console.log("Ethereum Register Done.");
    processVariables.set("ethereumRegister", ethereumRegister);
    await taskService.complete(task, processVariables);
  } else {
    console.log("Ethereum Register Error Handle.");
    processVariables.set("ethereumRegister", ethereumRegister);
    await taskService.handleBpmnError(task, "ethereumRegisterErrorHandle");
  }

});

