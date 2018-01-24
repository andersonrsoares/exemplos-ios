//
//  Checkpoint.swift
//  mobilebike
//
//  Created by DevMaker Mobile on 6/10/16.
//  Copyright © 2016 Anderson Soares. All rights reserved.
//
import UIKit

class Checkpoint {
    var checkPointId: Int?=0
    var raceId: Int?=0
    var companyId: Int?=0
    var checkPointStatus :String?=""
    var address :String?=""
    var latitude:Double?=0
    var longitude:Double?=0
    var description :String?=""
    var addressStreet :String?=""
    var addressCity :String?=""
    var addressNumber :String?=""
    init() {
        
    }
}

class CheckpointView{

    var rua :UITextField?
    var numero :UITextField?
    var cidade :UITextField?
    var descricao :UITextField?
    
    init() {
        
    }
}