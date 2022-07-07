"use strict";
var nodemailer = require('nodemailer');
const userGmail = 'tt8717011@gmail.com'; 
const passGmail = 'Test1234!';


const { Client, logger } = require("camunda-external-task-client-js");
const config = { baseUrl: "http://bpms.eproc.sc.gov.br:8080/engine-rest", use: logger };
const client = new Client(config);
const { Variables } = require("camunda-external-task-client-js");

client.subscribe("EnviarSolicitacaoAoFornecedorTask", async function ({ task, taskService }) {
  
  // email address, contents, other information...
  
  var transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: {
      user: userGmail,
      pass: passGmail
    }
  });

  var mailOptions = {
      from: userGmail,
      to: userGmail,
      subject: "Requisição de materiais de lista básica",
      text:'Prezado fornecedor,\n entramos em contato para notificar o envio de requisição de material, por favor, verifique sua lista de tarefas. Caso tenha alguma dúvida, entre em contato com o órgão requisitante para maiores informações. \n Obrigado.'
  };

  transporter.sendMail(mailOptions, function(error, info){
      if (error) {
          console.log(error);
      } else {
          console.log('Email sent' + info.response);
      }
  });
  
  const processVariables = new Variables();
  processVariables.set("Email sent", "Email sent successfully");
  await taskService.complete(task, processVariables);
});