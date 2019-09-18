//
//  InterfaceController.swift
//  SWAP WatchKit Extension
//
//  Created by Jonathan Torres on 5/16/17.
//  Copyright © 2017 Jonathan Torres. All rights reserved.
//

import WatchKit
import Foundation

//Temporary Globa Value for alarms (Stored Alarms will be implementd on the nxt update)
 var allAlarms: [Alarms] = []


class InterfaceController: WKInterfaceController {

    let alarmStorageKey = "ALARM_STORAGE_KEY"
    
    @IBOutlet var timerLabel: WKInterfaceLabel!
    
    //declare a Timer to track the time and a date to format that time
    var timer = Timer()
    var date = Date()

    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        //if there is stored data set that data
        let defaults = UserDefaults.standard
        if let storedAlarms = defaults.array(forKey: alarmStorageKey) as? [Alarms] {
            
        allAlarms = storedAlarms

        }
        
        //Timer to track the current time
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(upadateTimer), userInfo: nil, repeats: true)
                // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
        
    }
    
    //Updating the timer
    func upadateTimer(){
        let date = Date()
        let formater = DateFormatter()
        
        //formate the timer and display it
        formater.setLocalizedDateFormatFromTemplate("@hh:mm:ss")
        
        timerLabel.setText(formater.string(from: date))
        
        //if any of the timers are equal, activate the alarm
        for alarm in allAlarms {
            
            if alarm.time == formater.string(from: date){
                triggerAlarm()
            }
        }
        
    }
    
    
    //Segue to the alarm screen
    func triggerAlarm(){
        
        pushController(withName: "alarmSegue", context: nil)
        
    }
    
    

}
