//
//  ViewController.swift
//  TrafficLight
//
//  Created by Sergio Blanco on 11/12/17.
//  Copyright © 2017 Sergio Blanco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainText: UILabel!
    @IBOutlet weak var headerText: UITextField!
    @IBOutlet weak var redLight: UIButton!
    @IBOutlet weak var redLightLine: UIImageView!
    @IBOutlet weak var yellowLight: UIButton!
    @IBOutlet weak var yellowLightLine: UIImageView!
    @IBOutlet weak var greenLight: UIButton!
    @IBOutlet weak var greenLightLine: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideImages()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func automaticButton(_ sender: Any) {
        greenPressed()
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4), execute: {
                self.yellowPressed()
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
                self.redPressed()
                })
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4), execute: {
                self.hideImages()
            })
        })
        
    }
    
    @IBAction func redButtonLight(_ sender: Any) {
        redPressed()
    }
    @IBAction func yellowButtonLight(_ sender: Any) {
        yellowPressed()
    }
    @IBAction func greenButtonLight(_ sender: Any) {
        greenPressed()
    }
    
    func redPressed(){
        hideImages()
        headerText.textColor = UIColor.red
        headerText.text = "RED LIGHT MEANS:"
        mainText.text = "Stop. Wait behind the stop line."
        unhideImages(color: "red")
    }
    
    func yellowPressed(){
        hideImages()
        headerText.textColor = UIColor.yellow
        headerText.text = "YELLOW LIGHT MEANS:"
        mainText.text = "Continue to cross only if unable to stop safely."
        unhideImages(color: "yellow")
    }
    
    func greenPressed(){
        hideImages()
        headerText.textColor = UIColor.green
        headerText.text = "GREEN LIGHT MEANS:"
        mainText.text = "Proceed through the intersection carefully"
        unhideImages(color: "green")
    }
    
    func hideImages(){
        mainText.isHidden = true
        headerText.isHidden = true
        redLight.isHighlighted = true
        redLightLine.isHidden = true
        yellowLight.isHighlighted = true
        yellowLightLine.isHidden = true
        greenLight.isHighlighted = true
        greenLightLine.isHidden = true
    }
    
    func unhideImages(color : String){
        mainText.isHidden = false
        headerText.isHidden = false
        if color == "red"{
            redLight.isHighlighted = false
            redLightLine.isHidden = false
        }
        if color == "yellow"{
            yellowLight.isHighlighted = false
            yellowLightLine.isHidden = false
        }
        if color == "green"{
            greenLight.isHighlighted = false
            greenLightLine.isHidden = false
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

