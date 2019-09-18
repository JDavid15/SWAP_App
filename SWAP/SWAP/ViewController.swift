//
//  ViewController.swift
//  SWAP
//
//  Created by Jonathan Torres on 5/16/17.
//  Copyright © 2017 Jonathan Torres. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    
    
    var timer = Timer()
    var date = Date()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(upadateTimer), userInfo: nil, repeats: true)
       // timer.fire()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func upadateTimer(){
       let date = Date()
       let formater = DateFormatter()
        
        formater.setLocalizedDateFormatFromTemplate("@hh:mm:ss")
        print(formater.string(from: date))
    
        timeLabel.text = formater.string(from: date)
        
    }

}

