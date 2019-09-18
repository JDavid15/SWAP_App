//
//  Alarms.swift
//  SWAP
//
//  Created by Jonathan Torres on 5/16/17.
//  Copyright © 2017 Jonathan Torres. All rights reserved.
//

import Foundation

class Alarms: NSObject, NSCoding{
    
    var time: String?
    var alarmDescription: String?
    var alarmDayNightTime: String?

    
    init(_time: String, _description: String, _alarmType: String) {
        
        time = _time
        alarmDescription = _description
        alarmDayNightTime = _alarmType
    }
    
    required convenience init?(coder aDecoder: NSCoder){
        
        self.init(_time: "Time", _description: "Description", _alarmType: "Day/Night")

        
        time = aDecoder.decodeObject(forKey: "timeString") as? String
        alarmDescription = aDecoder.decodeObject(forKey: "descriptionString") as? String
        alarmDayNightTime = aDecoder.decodeObject(forKey: "alarmTypeString") as? String

    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(time, forKey: "nameTime")
        aCoder.encode(alarmDescription, forKey: "descriptionString")
        aCoder.encode(alarmDayNightTime, forKey: "alarmTypeString")
    }
    
}
