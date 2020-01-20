//
//  ChooseViewController.swift
//  assignment1
//
//  Created by Vivek Gupta on 2019-10-12.
//  Copyright © 2019 Vivek Gupta. All rights reserved.
//

import UIKit

class ChooseViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var listData = ["IceBear","Grizzly","Panda"]
    
    var imageData = [UIImage(named:"IceBear"),UIImage(named:"Grizzly"),UIImage(named:"Panda")]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listData.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // let tableCell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell()
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "cell") as?
        SiteCell ?? SiteCell(style: .default, reuseIdentifier: "cell")
        let rowNum = indexPath.row
        tableCell.primaryLabel.text = listData[rowNum]
        tableCell.myImageView.image = imageData[rowNum]
        
        tableCell.accessoryType = .disclosureIndicator
        return tableCell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mainDelegate = UIApplication.shared.delegate as! AppDelegate
        
        mainDelegate.selectedImage = listData[indexPath.row]
        performSegue(withIdentifier: "toRegisterViewController", sender: nil)
    }
    
   
  
    
    


    override func viewDidLoad() {
        super.viewDidLoad()

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
