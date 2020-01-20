//
//  ViewController.swift
//  assignment1
//
//  Created by Vivek Gupta on 9/18/19.
//  Copyright © 2019 Vivek Gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var lblTable : UIButton!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch: UITouch = touches.first!
        let touchPoint : CGPoint = touch.location(in: self.view!)
        
        let tableFrame : CGRect = lblTable.frame
        
        if tableFrame.contains(touchPoint){
            performSegue(withIdentifier: "HomeSegueToTable", sender: self)
        }
        
        
    }
    
    
    @IBAction func backToHP(segue: UIStoryboardSegue)
    {
        
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

