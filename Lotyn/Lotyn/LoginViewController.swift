//
//  ViewController.swift
//  Lotyn
//
//  Created by Feiko Ritsema on 14/10/2017.
//  Copyright © 2017 JSF. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    
     var makeSegue : Bool = false
    
    
    @IBOutlet weak var username: UITextField!
    
    
    @IBOutlet weak var password: UITextField!
    
    @IBAction func signIn(_ sender: Any) {
        
        var user: String = username.text!
        var pass: String = password.text!
        
        if((user != "") && (pass != "")){
            
            
            
            print("is it wrong her")
            Auth.auth().signIn(withEmail: user, password: pass) { (user, error) in
                
                print("do we reach this?")
                
                if error == nil {
                    
                    self.makeSegue = true
                }
            }
        }
    }
    
    
    
    
    
        
        
    
    
    
    
    override func shouldPerformSegue(withIdentifier identifier: String ,sender: Any?) -> Bool {
        
        if self.makeSegue == true  {
            
            
            self.makeSegue = false
            return true
            
        }else{
            
            self.makeSegue = false
            return false
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

