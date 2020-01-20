//
//  BearViewController.swift
//  assignment1
//
//  Created by Vivek Gupta on 9/21/19.
//  Copyright © 2019 Vivek Gupta. All rights reserved.
//

import UIKit
import WebKit

class BearViewController: UIViewController , WKNavigationDelegate {
    
    @IBOutlet var webView : WKWebView!
    @IBOutlet var activity: UIActivityIndicatorView!

    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activity.isHidden = false
        activity.startAnimating()
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activity.isHidden = true
        activity.stopAnimating()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  

    override func viewDidLoad() {
        super.viewDidLoad()
        let urlAddress = URL( string:"http://www.savebears.org" )
        let url = URLRequest( url:urlAddress! )
        webView.load(url)
        webView.navigationDelegate = self
        
        // Do any additional setup after loading the view.
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
