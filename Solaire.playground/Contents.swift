import PlaygroundSupport
import Foundation
/*
let dweet_post = "https://dweet.io/dweet/for/board2server"
let dweet_board_post_action = "?board_status=swift_reset"
let dweet_request = dweet_post+dweet_board_post_action
let url = URL(string: dweet_request)

let task = URLSession.shared.dataTask(with: url!) { data, response, error in
    guard error == nil else {
        print(error!)
        return
    }
    guard let data = data else {
        print("Data is empty")
        return
    }
    
    let json = try! JSONSerialization.jsonObject(with: data, options: [])
    print(json)
}
 

task.resume()
PlaygroundPage.current.needsIndefiniteExecution = true
 */
let url = URL(string: "https://dweet.io/dweet/for/board2server?board_status=playground_reset")

let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
    
    if let data = data {
        do {
            // Convert the data to JSON
            let jsonSerialized = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any]
            
            if let json = jsonSerialized, let url = json["url"], let explanation = json["explanation"] {
                print(url)
                print(explanation)
            }
        }  catch let error as NSError {
            print(error.localizedDescription)
        }
    } else if let error = error {
        print(error.localizedDescription)
    }
}

task.resume()
PlaygroundPage.current.needsIndefiniteExecution = true











//
//  ViewController.swift
//  Solaire
//
//  Created by Rex on 5/23/18.
//  Copyright © 2018 UCLA. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var dweetText: UILabel!
    @IBOutlet weak var mySwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mySwitch.addTarget(self, action: #selector(switchToggled(_:)), for: UIControlEvents.valueChanged)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dweet(_ sender: UIButton) {
        dweetText.text = "Hard Reset"
    }
    
    @IBAction func switchToggled(_ sender: UISwitch) {
        changeText()
    }
    
    func changeText() {
        if mySwitch.isOn{
            dweetText.text = "LED: ON"
            let url = URL(string: "https://dweet.io/dweet/for/board2server?led_1=on")
            
            let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
                
                if let data = data {
                    do {
                        // Convert the data to JSON
                        let jsonSerialized = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any]
                        
                        if let json = jsonSerialized, let url = json["url"], let explanation = json["explanation"] {
                            print(url)
                            print(explanation)
                        }
                    }  catch let error as NSError {
                        print(error.localizedDescription)
                    }
                } else if let error = error {
                    print(error.localizedDescription)
                }
            }
            task.resume()
        }
        else{
            dweetText.text = "LED: OFF"
            let url = URL(string: "https://dweet.io/dweet/for/board2server?led_1=off")
            
            let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
                
                if let data = data {
                    do {
                        // Convert the data to JSON
                        let jsonSerialized = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any]
                        
                        if let json = jsonSerialized, let url = json["url"], let explanation = json["explanation"] {
                            print(url)
                            print(explanation)
                        }
                    }  catch let error as NSError {
                        print(error.localizedDescription)
                    }
                } else if let error = error {
                    print(error.localizedDescription)
                }
            }
            task.resume()
        }
    }
}


