//
//  ViewController.swift
//  Solaire
//
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
        dweetText.text = "Reset"
        let url = URL(string: "https://dweet.io/dweet/for/board2server?led_1=reset")
        
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

