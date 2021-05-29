pragma solidity ^0.4.24;


contract demo{
    address miner; 
    address supplierAddress     = 0xe2B7a0c7bC21E000B8327713513b9D4d2620A414; // 5
    address manufacturerAddress = 0xe2B7a0c7bC21E000B8327713513b9D4d2620A414; // 4
    address distributorAddress  = 0xe2B7a0c7bC21E000B8327713513b9D4d2620A414; // 3
    address retailerAddress     = 0xe2B7a0c7bC21E000B8327713513b9D4d2620A414; // 2
    address consumerAddress     = 0xe2B7a0c7bC21E000B8327713513b9D4d2620A414; // 1
    address regulatorAddress    = 0xe2B7a0c7bC21E000B8327713513b9D4d2620A414; // 0
    
    bool Authenticity = true;
                                  
    constructor (address _miner, int _thisIdentity) public {
        miner = _miner;
        if (_thisIdentity == 0) {
            require(_miner == regulatorAddress, " Account Not Matched");
            thisNodeBool.regulator = true;
        } else if (_thisIdentity == 1) {
            require(_miner == consumerAddress, "Account not Matched");
            thisNodeBool.consumer  = true;
        } else if (_thisIdentity == 2) {
            require(_miner == retailerAddress, "Account not Matched");
            thisNodeBool.retailer = true;
        } else if (_thisIdentity == 3) {
            require(_miner == distributorAddress, "Account not Matched");
            thisNodeBool.distributor = true;
        } else if (_thisIdentity == 4) { 
            require(_miner == manufacturerAddress, "Account not Matched");   
            thisNodeBool.manufacturer = true;
        }
        else if (_thisIdentity == 5) {
            require(_miner == supplierAddress, "Account not Matched");
            thisNodeBool.supplier = true; }
    }
    
  
    modifier onlyConsumer (){
        require(thisNodeBool.consumer == true, "You are not authorised for the action");
        _;
    }
    
    modifier onlyRetailer (){
        require(thisNodeBool.retailer == true, "You are not authorised for this transaction");
        _;
    }
    
    modifier onlyDistributor (){
        require(thisNodeBool.distributor == true, "You are not authorised for this transaction");
        _;
    }
    
    modifier onlyManufacterer (){
        require(thisNodeBool.manufacturer == true, "You are not authorised for this transaction");
        _;
    }
    
    modifier onlySupplier (){
        require(thisNodeBool.supplier == true, "You are not authorised for this transaction");
        _;
    }
    
    modifier onlyRegulator(){
        require(thisNodeBool.regulator == true, "You are not authorised for this transaction");
        _;    
    }
    
      
    struct Status { 
        bool Completed;
        bool Active;
        bool Inprogres;
        bool Haulted; 
        bool Shipped;
        bool  Waiting;
        bool Cancelled;
    }
    Status status;
    
   
   function RegulatoFunction(){
       
       
   }
    
    function SHOWINFO(){
        
        if(thisNodeBool.regulator == true) {
            require(false, " SUPPLIER: KISAN VIAKS WB, MNF: Delhi Factory Address, Dist: Happy Home distributor, Retail: Connaught Place Restaurant, CONSURM: Billed name Ankush Bose, REG: GOVT of India   "); // 0
        } else if(thisNodeBool.consumer == true) {
            require(false, " This product is genuine [BLOCKCHAIN CERTIFIED] "); //1
        } else if(thisNodeBool.retailer == true) {
            require(false, " Connaught Place Restaurant SHOP "); //2
        } else if(thisNodeBool.distributor == true) {
            require(false, " DIST: Happy Home Distributor "); //3
        } else if(thisNodeBool.manufacturer == true) {
            require(false, " SUPPLIER:  WB KISAN VIKAS , MNF: DELHI FACTORY Address  "); //4
        } else if(thisNodeBool.supplier == true) {
            require(false, " SUPPLIER : KISAN VIKAS "); //5
        } 
        
        
        
    
    

     
        
        
    }
    
    function SupplierFunction() onlySupplier {
        metaData.time = block.timestamp;
        metaData.date = 20210101;
        metaData.sender.supplier = true;
        metaData.receiver.manufacturer = true;

        transaction.product = "Wheat";
        transaction.capital = 100;
        
        qualityInfo.quality = "Good";
        qualityInfo.time = block.timestamp;
        qualityInfo.route = "WestbengalToDelhi";
        qualityInfo.batch = "WBDLH20";
        
        logistics.physicalDimension = "10x20x30";
        logistics.quantity = "10";
        logistics.quality = "Good";
        logistics.service = "Roadway";
        Authenticity = true;
        thisNodeBool.supplier = true;
        
    }
    function ManufacturerFunction() onlyManufacterer {
        metaData.time = block.timestamp;
        metaData.date = 20210102;
        metaData.sender.manufacturer = true;
        metaData.receiver.distributor = true;
        
        transaction.product = "Flour";
        transaction.capital = 120;
        
        qualityInfo.quality = "Good";
        qualityInfo.time = block.timestamp;
        qualityInfo.route = "DelhiFactory";
        qualityInfo.batch = "WBDLH20";
        
         logistics.physicalDimension = "10x20x10";
        logistics.quantity = "10";
        logistics.quality = "Good";
        logistics.service = "Roadway";
        Authenticity = true;
        thisNodeBool.supplier = false;
        thisNodeBool.manufacturer = true;
    } 
    
    function DistributorFunction() onlyDistributor {
        metaData.time = block.timestamp;
        metaData.date = 20210103;
        metaData.sender.distributor = true;
        metaData.receiver.retailer = true;
        
        transaction.product = "Flour";
        transaction.capital = 120;
        
        qualityInfo.quality = "Good";
        qualityInfo.time = block.timestamp;
        qualityInfo.route = "NCRRegion";
        qualityInfo.batch = "WBDLH20";
        
        logistics.physicalDimension = "5x2x10";
        logistics.quantity = "10";
        logistics.quality = "Good";
        logistics.service = "Truck";
        Authenticity = true;
        thisNodeBool.manufacturer =false;
        thisNodeBool.distributor = true;
    }
    function RetailerFunction() onlyRetailer {
        metaData.time = block.timestamp;
        metaData.date = 20210105;
        metaData.sender.retailer = true;
        metaData.receiver.consumer = true;
        
        transaction.product = "Roti";
        transaction.capital = 120;
        
        qualityInfo.quality = "Good";
        qualityInfo.time = block.timestamp;
        qualityInfo.route = "NCRRegion";
        qualityInfo.batch = "WBDLH20";
        
        logistics.physicalDimension = "5x2x10";
        logistics.quantity = "10";
        logistics.quality = "Good";
        logistics.service = "Road";
        Authenticity = true;
        thisNodeBool.distributor = false;
        thisNodeBool.retailer = true;
    }
    
    function ConsumerFunction() onlyConsumer {
        metaData.time = block.timestamp;
        metaData.date = 20210105;
        metaData.sender.consumer = true;
        metaData.receiver.consumer = true;
        
        transaction.product = "RummaliRoti";
        transaction.capital = 200;
        
        qualityInfo.quality = "Good, MNF2020, Best Before 2022";
        qualityInfo.time = block.timestamp;
        qualityInfo.batch = "WBDLH20";
        thisNodeBool.retailer = false;
        thisNodeBool.consumer = true;
    }
    
    struct Identity{
        bool regulator;    
        bool consumer;     
        bool retailer;     
        bool distributor;  
        bool manufacturer; 
        bool supplier;
    }
    Identity public thisNodeBool;
    
    struct Transaction{ 
        string product;
        uint capital;
        string equipemnt;
    }
    Transaction transaction;
    
    struct QualityInfo{
        string quality;
        uint time;
        uint temp;
        string route;
        string batch;
    }
    QualityInfo qualityInfo;
    
    struct Logistics{
        string physicalDimension;
        string quantity;
        string service;
        string quality;
    }
    Logistics logistics;
  
    struct MetaData{
        uint time;
        uint date;
        Identity sender;
        Identity receiver;
    }
    MetaData metaData;

}



