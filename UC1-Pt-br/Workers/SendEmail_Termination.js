"use strict";
var nodemailer = require('nodemailer');
const userGmail = 'tt8717011@gmail.com'; 
const passGmail = 'Test1234!';


const { Client, logger } = require("camunda-external-task-client-js");
const config = { baseUrl: "http://localhost:8080/engine-rest", use: logger };
const client = new Client(config);
const { Variables } = require("camunda-external-task-client-js");

client.subscribe("SendTerminationEmail", async function ({ task, taskService }) {
  var textfield2 = task.variables.get("textfield2").toString();
  
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
      subject: "Contract Termination",
      text:`Dear supplier,\n I am writing to terminate the contract regarding PRD number: ${textfield2}\n The contract duration is 356 days from the contracting date, and this contract has passed the due date.\n Thank you.`
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