// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract Escrow {

	struct details {
		address arbiter;
		address beneficiary;
		address depositor;
		bool isApproved;	
	} 
	 mapping(address => details) contracts;
	 address private owner;

	constructor(address _arbiter, address _beneficiary) payable {
		contracts[msg.sender] = details(_arbiter,_beneficiary,msg.sender,false);
		contracts[msg.sender].arbiter = _arbiter;
		contracts[msg.sender].beneficiary = _beneficiary;
		contracts[msg.sender].depositor = msg.sender;
		owner = msg.sender;
	

	}

	event Approved(uint);

	function approve() external {
		require(msg.sender == contracts[owner].arbiter);
		uint balance = address(this).balance;
		(bool sent, ) = payable(contracts[owner].beneficiary).call{value: balance}("");
 		require(sent, "Failed to send Ether");
		emit Approved(balance);
		contracts[owner].isApproved = true;
	}
}
