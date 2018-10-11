pragma solidity ^0.4.25;

contract RealEstate {
    address public seller;
    address public buyer;
    string public streetAddress;
    string title;
    uint256 public price;
    
    function RealEstate () {
        //who is the seller
        seller = msg.sender;
        //what is the street address
        streetAddress = "A265, Block # 3, Karachi";
        //what is title
        title = "My house";
        //what is price
        price = 99000000000000000000; //99 Ehter
        //price = 99 ether; //99 Ehter
    }
    
    function buyHouse () payable public {
        //seller exsist?
        require(seller != 0x0);
        
        //buyer exsist?, Buyer can't buy twice
        require(buyer == 0x0);
        
        //buyer and seller are not same. Seller is not buying his own house
        require(msg.sender != seller );
        
        //buyer is not over or under paying the seller
        require(msg.value == price );
        
        
        buyer = msg.sender;
        //send ethereum from buyer to sellet
        seller.transfer(msg.value);
        
    }
}