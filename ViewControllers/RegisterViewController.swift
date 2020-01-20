//
//  RegisterViewController.swift
//  assignment1
//
//  Created by Vivek Gupta on 9/18/19.
//  Copyright © 2019 Vivek Gupta. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var tfName : UITextField!
    @IBOutlet var tfAdress : UITextField!
    @IBOutlet var tfEmail : UITextField!
    @IBOutlet var tfPhoneNumber : UITextField!
    @IBOutlet var sdAge : UISlider!
    @IBOutlet var lbAge : UILabel!
    @IBOutlet var swGender : UISegmentedControl!
    @IBOutlet var dpDatePicker : UIDatePicker!
    @IBOutlet var imgImage : UIImageView!
    
  
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    @IBAction func unwindToRegisterViewController(sender : UIStoryboardSegue){
        
        
    }
    @IBAction func addBear(sender: Any){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat="MM-dd-yyyy"
        let mainDelegate = UIApplication.shared.delegate as! AppDelegate
        
        
       
        let bear : Data = Data.init()
        bear.initWithData(theRow: 0, theImage: mainDelegate.selectedImage , theName: tfName.text!, theAddress: tfAdress.text!, thePhoneNumber: tfPhoneNumber.text! ,theEmail: tfEmail.text! , theAge: lbAge.text!, theGender: "\(swGender.titleForSegment(at:swGender.selectedSegmentIndex))", theDOB: dateFormatter.string(from:dpDatePicker.date))
        
        
        let returnCode = mainDelegate.insertIntoDatabase(bear : bear)
        
        var returnMSg : String = "Bear Added"
        
        if returnCode == false{
            returnMSg = "bear add failed"
        }
        let alertController = UIAlertController(title:"SQLite add", message: returnMSg, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "ok", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
        rememberEnteredData()
    }
    func rememberEnteredData(){
        let defaults = UserDefaults.standard
       // defaults.set(imgImage.image, forKey: "lastimage")
        defaults.set(tfName.text, forKey: "lastName")
        defaults.set(tfAdress.text, forKey: "lastAdress")
        defaults.set(tfEmail.text, forKey: "lastEmail")
        defaults.set(lbAge.text, forKey: "lastAge")
        defaults.set(tfPhoneNumber.text, forKey: "lastPhoneNumber")
        defaults.set(swGender.selectedSegmentIndex, forKey: "lastGender")
        defaults.setValue(dpDatePicker.date, forKey: "lastDate")
        defaults.synchronize()
        
    }
    
    
    @IBAction  func ageDidChange(sender : UISlider){
        lbAge.text = String(format:"Age-:%i",Int(sdAge.value))
        
    }
    
    
    /*
   @IBAction func Button(sender : UIButton)
    {
        
        if (tfName.text!.isEmpty || tfEmail.text!.isEmpty || tfAdress.text!.isEmpty || tfPhoneNumber.text!.isEmpty)
        {
            
            let alert2 = UIAlertController(title : "WARNING", message: "You have left one of the TextFields Blank ?", preferredStyle : .alert)
            
            let cancelAction=UIAlertAction(title : "Cancel" , style: .cancel, handler:nil)
            alert2.addAction(cancelAction)
            present(alert2,animated: true)
            
            
        }else {
            let alert = UIAlertController(title : "Thank You ", message: "Thank You  "+tfName.text!+" for your time we will send updates to your mail: "+tfEmail.text!, preferredStyle : .alert)
            
            let okAction=UIAlertAction(title : "OK" , style: .default, handler:nil)
            
            
            
            alert.addAction(okAction)
            present(alert,animated: true)
            
        }
    }
 */
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let mainDelegate = UIApplication.shared.delegate as! AppDelegate
     	
      //  var images : UIImage = UIImage(named: "\(mainDelegate.selectedImage)")!
        imgImage.image = UIImage(named: mainDelegate.selectedImage)
        
     
        
        let tap = UITapGestureRecognizer( target: self.view , action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat="MM-dd-yyyy"
        
        let defaults = UserDefaults.standard
        if let name = defaults.object(forKey: "lastName") as? String{ tfName.text = name}
         if let email = defaults.object(forKey: "lastEmail") as? String{ tfEmail.text = email}
         if let address = defaults.object(forKey: "lastAdress") as? String{ tfAdress.text = address}
         if let age = defaults.object(forKey: "lastAge") as? String{ lbAge.text = age}
         if let gender = defaults.object(forKey: "lastGender") as? Int{ swGender.selectedSegmentIndex = gender}
         if let phonenumber = defaults.object(forKey: "lastPhoneNumber") as? String{ tfPhoneNumber.text = phonenumber}
       //  if let image = defaults.object(forKey: "lastImage") as? UIImage{ imgImage.image = image}
        if let sddate = defaults.object(forKey: "lastDate") as? Date{ dpDatePicker.date =
            sddate}
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
