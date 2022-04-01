const { Client, logger } = require("camunda-external-task-client-js");
const { Variables } = require("camunda-external-task-client-js");

// configuration for the Client:
//  - 'baseUrl': url to the Process Engine
//  - 'logger': utility to automatically log important events
const config = { baseUrl: "http://localhost:8080/engine-rest", use: logger };

// create a Client instance with custom configuration
const client = new Client(config);

client.subscribe("registerTopic", async function ({ task, taskService }) {
  var textfield2 = task.variables.get("textfield2").toString();
  var textfield3 = task.variables.get("textfield3").toString();
  var textfield4 = task.variables.get("textfield4").toString();
  var textfield5 = task.variables.get("textfield5").toString();
  var textfield6 = task.variables.get("textfield6").toString();
  var textfield7 = task.variables.get("textfield7").toString();
  var textfield8 = task.variables.get("textfield8").toString();
  var textfield9 = task.variables.get("textfield9").toString();
  var textfield10 = task.variables.get("textfield10").toString();
  var textfield11 = task.variables.get("textfield11").toString();
  var textfield12 = task.variables.get("textfield12").toString();
  var textfield13 = task.variables.get("textfield12").toString();
  var textfield14 = task.variables.get("textfield12").toString();

  var processVariables = new Variables();
  var ethereumRegister = true;


  // web3.js - Ethereum JavaScript API goes here
  var Web3 = require('web3');
  const contract  = require('./registerPRD.json').abi;
  var provider = 'https://rinkeby.infura.io/v3/94a1c396349641de85d1780e45f5a140';
  var web3Provider = new Web3.providers.HttpProvider(provider);
  var web3 = new Web3(web3Provider);
  
  const quartersContract = new web3.eth.Contract(
      contract,
      "0x549AdC9049A641f789C5D33bd9169365aafBf548"
  ).methods;
  
  var inputData = '' + textfield2 + ',' + textfield3 + ',' + textfield4 + ',' + textfield5 + ',' + textfield6 + ',' +
  textfield7 + ',' + textfield8 + ',' + textfield9 + ',' + textfield10 + ',' + textfield11 + ',' +
  textfield12 + ',' + textfield13 + ',' + textfield14 + '';

  console.log(inputData);
  
  async function test(){
      const data = await quartersContract.PRDHeader(inputData);
      const txData = data.encodeABI();
      //console.log(data);
      const promise = await  web3.eth.accounts.signTransaction(
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

