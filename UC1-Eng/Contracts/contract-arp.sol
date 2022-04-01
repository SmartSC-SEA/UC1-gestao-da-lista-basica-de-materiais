// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

/**
 * @title SC-contracting
 * @dev Contract registration form for users to create a contract.  
 */

contract SmartSC {

    //uint state = 0; 
    string PRDdocument;
    uint DOENumber;
    uint DOEPublicationDate;
    string SADdocument;
    string RequestedMaterials;
    uint SADDate;
    uint shipmentDate;
    uint shipmentNumber;
    uint receiptDate;
    string recipient;
    string approver;
    uint approvalDate;
    string disapprover;
    uint disapprovalDate;
    string disapprovalreason;
    string paymentApproval;
    uint paymentAmount;
    uint paymentDate;


    function PRDRegister(string memory inputstring) public {
        PRDdocument = inputstring;
        //state = 1;
    }

    function PRDDate(uint inputnumber, uint inputdate) public {
        DOENumber = inputnumber;
        DOEPublicationDate = inputdate;
    }

    function SADRegister(string memory inputstring) public {
        SADdocument = inputstring;
        //state = 2;
    }

    function SADReceipt() public {
        SADDate = block.timestamp;
    }

    function SADShipment(uint inputnumber) public{
        shipmentDate = block.timestamp;
        shipmentNumber = inputnumber;
    }

    function orderReceipt(string memory inputname) public{
        receiptDate = block.timestamp;
        recipient = inputname;
    }

    function SADApproval(string memory inputname) public{
        approver = inputname;
        approvalDate = block.timestamp;
    }

    function SADDisapproval(string memory inputname, string memory reasons) public{
        disapprover = inputname;
        disapprovalDate = block.timestamp;
        disapprovalreason = reasons;
    }

    function SADPayment(string memory inputname, uint amount) public{
        paymentApproval = inputname;
        paymentAmount = amount;
        paymentDate = block.timestamp;
    }

    //function checkstate() public view returns (uint){
    //    return state;
    //}

    function terminate() public payable {
        address payable addr = payable(msg.sender);
        selfdestruct (addr);
    }
}