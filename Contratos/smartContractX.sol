// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

/**
 * @title SC-contracting
 * @dev Contract registration form for users to create a contract.  
 */

contract diagramD {

    //uint state = 0; 
    string orderDispatchDate;
    string orderDispatchForm;
    string orderDispatchNumber;
    string invoiceNumber;
    string invoiceUrl;
    
    string deliveryAdress;
    string deliveryAdressComp;
    string deliveryNeigh;
    string deliveryCity;
    string deliveryState;
    string deliveryCep;

    string orderReceptDate;
    string orderReceptAprov;
    string orderReceptPayDate;
    string orderReceptPayNote;


    function order(string memory orderDispatchDate_, string memory orderDispatchForm_, string memory orderDispatchNumber_, string memory invoiceNumber_, string memory invoiceUrl_) public {
        orderDispatchDate = orderDispatchDate_;
        orderDispatchForm = orderDispatchForm_;
        orderDispatchNumber = orderDispatchNumber_;
        invoiceNumber = invoiceNumber_;
        invoiceUrl = invoiceUrl_;
    }

    function delivery (string memory deliveryAdress_, string memory deliveryAdressComp_, string memory deliveryNeigh_, string memory deliveryCity_, string memory deliveryState_, string memory deliveryCep_) public {
        deliveryAdress = deliveryAdress_;
        deliveryAdressComp = deliveryAdressComp_;
        deliveryNeigh = deliveryNeigh_;
        deliveryCity = deliveryCity_;
        deliveryState = deliveryState_;
        deliveryCep = deliveryCep_;
    }

    function deliveryApproval (string memory orderReceptDate_) public {
        orderReceptDate = orderReceptDate_;
    }

    function receiptApproval (string memory orderReceptAprov_) public {
        orderReceptAprov = orderReceptAprov_;
    }

    function receiptDate (string memory orderReceptPayDate_, string memory orderReceptPayNote_) public {
        orderReceptPayDate = orderReceptPayDate_;
        orderReceptPayNote = orderReceptPayNote_;
    }
}