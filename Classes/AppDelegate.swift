//
//  AppDelegate.swift
//  assignment1
//
//  Created by Vivek Gupta on 9/18/19.
//  Copyright © 2019 Vivek Gupta. All rights reserved.
//

import UIKit
import SQLite3

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var selectedImage : String = "NoImage"
    var databaseName : String? = "Beardatabase.db"
    var databasePath : String? = ""
   
    var bear : [Data] = []
    var selectedBearImage : String = ""
    var selectedBearName : String = ""
    var selectedBearPhoneNumber : String = ""
    var selectedBearAddress : String = ""
    var selectedBearAge : String = ""
    var selectedBearGender : String = ""
    var selectedBearDob : String = ""
    var selectedBearEmail : String = ""


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let documentPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDir = documentPaths[0]
        databasePath = documentsDir.appending("/"+databaseName!)
        checkAndCreateDatabase()
        readDataFromDatabase()
        return true
    }
    
    func readDataFromDatabase(){
        bear.removeAll()
        
        var db : OpaquePointer? = nil
        if sqlite3_open(self.databasePath, &db) == SQLITE_OK{
            print("succesfully opened connection to database at \(self.databasePath!)")
            
            var queryStatement : OpaquePointer? = nil
            var queryStatementString: String = "select * from entries"
            if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK{
                while sqlite3_step(queryStatement) == SQLITE_ROW{
                    let id : Int = Int(sqlite3_column_int(queryStatement, 0))
                    let cimage = sqlite3_column_text(queryStatement, 1)
                    let cname = sqlite3_column_text(queryStatement, 2)
                    let caddress = sqlite3_column_text(queryStatement, 3)
                    let cphonenumber = sqlite3_column_text(queryStatement, 4)
                    let cemail =  sqlite3_column_text(queryStatement, 5)
                    let cage =  sqlite3_column_text(queryStatement, 6)
                    let cgender = sqlite3_column_text(queryStatement, 7)
                    let cdob = sqlite3_column_text(queryStatement, 8)
                    
                    let image = String(cString: cimage!)
                    let name = String(cString: cname!)
                    let address = String(cString: caddress!)
                    let phonenumber = String(cString: cphonenumber!)
                    let email = String(cString: cemail!)
                    let age  = String(cString: cage!)
                    let gender = String(cString: cgender!)
                    let dob = String(cString: cdob!)
                    
                    let data : Data = Data.init()
                    data.initWithData(theRow: id, theImage: image, theName: name,theAddress: address,thePhoneNumber: phonenumber, theEmail: email, theAge: age, theGender: gender, theDOB: dob)
                    bear.append(data)
                    
                    print("Query result")
                    print("\(id) |\(image)| \(name) | \(address)| \(phonenumber) | \(email) | \(age) | \(gender) | \(dob)")
                    
                    
                }
                sqlite3_finalize(queryStatement)
                
            }else{
                print("Select statement could not be prepared")
            }
            
            sqlite3_close(db)
        }else{print("unable to open databse")
            
        }
    }
    
    func insertIntoDatabase(bear: Data) -> Bool{
        var db : OpaquePointer? = nil
        var returnCode : Bool = true
        
        if  sqlite3_open(self.databasePath, &db) == SQLITE_OK {
            var insertStatement : OpaquePointer? = nil
            var insertStatementString : String = "insert into entries values(NULL,?,?,?,?,?,?,?,?)"
                
            if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK{
                
                let imageStr = bear.image! as NSString
                let nameStr = bear.name! as NSString
                let addressStr = bear.address! as NSString
                let phonenumberStr = bear.phonenumber! as NSString
                let emailStr = bear.email! as NSString
                let ageStr = bear.age! as NSString
                let genderStr = bear.gender! as NSString
                let dobStr = bear.dob! as NSString

                sqlite3_bind_text(insertStatement, 1, imageStr.utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 2, nameStr.utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 3, addressStr.utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 4, phonenumberStr.utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 5, emailStr.utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 6, ageStr.utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 7, genderStr.utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 8, dobStr.utf8String, -1, nil)
                if sqlite3_step(insertStatement) == SQLITE_DONE{
                    let rowID = sqlite3_last_insert_rowid(db)
                    print("successfuly insert row\(rowID)")
                }
                else{
                    print("could not insert row")
                    returnCode = false
                }
                sqlite3_finalize(insertStatement)
            } else {
                print("insert statement could not be prepared")
                 returnCode = false
            }
            sqlite3_close(db)
        }else{
            print("unable to open Database")
        }
        return returnCode
    }
    
    func checkAndCreateDatabase(){
        var success = false
        let fileManager = FileManager.default
        
        success = fileManager.fileExists(atPath: databasePath!)
        if success{
            return
            
        }
        let databasePathFromApp = Bundle.main.resourcePath?.appending("/" + databaseName!)
        try? fileManager.copyItem( atPath: databasePathFromApp!, toPath: databasePath!)
        
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

