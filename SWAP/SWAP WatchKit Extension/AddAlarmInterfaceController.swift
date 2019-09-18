//
//  AddAlarmInterfaceController.swift
//  SWAP
//
//  Created by Jonathan Torres on 5/16/17.
//  Copyright © 2017 Jonathan Torres. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity


class AddAlarmInterfaceController: WKInterfaceController {
    
    //set all String for the alarms
    let allHours: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"]
    var allMinutes: [String] = [""]
    let dayOrNight: [String] = ["AM", "PM"]

    //have a default alarm if no is selected to avod crash
    var selectedHour: String = "1"
    var selectedMinute: String = "00"
    var selectedDayTime: String = "AM"
    
    //Set all UI elemts
    @IBOutlet var timeHourPicker: WKInterfacePicker!
    @IBOutlet var timeMinutePicker: WKInterfacePicker!
    @IBOutlet var dayTimePicker: WKInterfacePicker!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
    
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        populatrPickers()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    //set a new alarm
    @IBAction func setNewAlarm() {
        allAlarms.append(Alarms(_time: selectedHour + ":" + selectedMinute + ":00 " + selectedDayTime, _description: "", _alarmType: ""))
        
    }
    
    //set all the pciker selected times
    @IBAction func hourPickerSelected(_ value: Int) {
        print("List Picker: \(allHours[value]) selected")
        selectedHour = allHours[value]

    }

    @IBAction func minutePickerSelected(_ value: Int) {
        print("List Picker: \(allMinutes[value]) selected")
        selectedMinute = allMinutes[value]

    }
    
    @IBAction func dayTimePickerSelected(_ value: Int) {
        print("List Picker: \(dayOrNight[value]) selected")
        selectedDayTime = dayOrNight[value]

    }
    
    //populate all timers
    func populatrPickers(){
        
        
        
        for i in 0...60{
            
            allMinutes.append("\(i)")
            
        }
        
        
        
        var hourPickerItems = [WKPickerItem]()

        
        for i in 0...allHours.count - 1 {
            
            let item = WKPickerItem()
            
            item.title = allHours[i]
            
            hourPickerItems.append(item)
            
        }
        timeHourPicker.setItems(hourPickerItems)

        
       var minsPickerItems = [WKPickerItem]()

        
       for i in 0...allMinutes.count - 1 {
        
           let item = WKPickerItem()
        
            item.title = allMinutes[i]
        
           minsPickerItems.append(item)

        
        }
        
        var dayNightPickerItems = [WKPickerItem]()

        let day = WKPickerItem()
        day.title = dayOrNight[0]
        let night = WKPickerItem()
        night.title = dayOrNight[1]
        
        dayNightPickerItems.append(day)
        dayNightPickerItems.append(night)
        
        
        timeHourPicker.setItems(hourPickerItems)
        timeMinutePicker.setItems(minsPickerItems)
        dayTimePicker.setItems(dayNightPickerItems)
        
    }
    
    
    
}
