//
//  DatabaseViewController.swift
//  assignment1
//
//  Created by Vivek Gupta on 2019-10-12.
//  Copyright © 2019 Vivek Gupta. All rights reserved.
//

import UIKit

class DatabaseViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{
    
    
    
    
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainDelegate.bear.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell : detailTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as? detailTableViewCell ?? detailTableViewCell(style: .default, reuseIdentifier: "cell")
        
        let rowNum = indexPath.row
        tableCell.nameLabel.text = mainDelegate.bear[rowNum].name
        tableCell.emailLabel.text = mainDelegate.bear[rowNum].email
        tableCell.ageLabel.text = mainDelegate.bear[rowNum].age
        tableCell.addressLabel.text = mainDelegate.bear[rowNum].address
        tableCell.phonenumberLabel.text = mainDelegate.bear[rowNum].phonenumber
        tableCell.genderLabel.text = mainDelegate.bear[rowNum].gender
        tableCell.dobLabel.text = mainDelegate.bear[rowNum].dob
        let images = (mainDelegate.bear[rowNum].image)
        tableCell.myImageView.image = UIImage(named: images!)
        // i dont know why it is not showing the images it is showing the string in the label and i changed the string to image view it shoud show
        tableCell.imageLabel.text = images
        return tableCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rowNum = indexPath.row
        
        let alertController = UIAlertController(title: mainDelegate.bear[rowNum].name, message: mainDelegate.bear[rowNum].age, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        
        alertController.addAction(cancelAction)
        present(alertController,animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let mainDelegate = UIApplication.shared.delegate as! AppDelegate
          mainDelegate.checkAndCreateDatabase()
          mainDelegate.readDataFromDatabase()
       
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
