//
//  LoginViewController.swift
//  RestDemo
//
//  Created by mobapp10 on 29/01/2019.
//  Copyright © 2019 Ehb. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var tfUsername: UITextField!
    
    @IBOutlet weak var tfPassword: UITextField!
    
    @IBOutlet weak var swiRemenber: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let settings = UserDefaults.standard
        
        tfUsername.text = settings.string(forKey: "pref_username")
        tfPassword.text = settings.string(forKey: "pref_password")
        swiRemenber.setOn(settings.bool(forKey: "pref_remember"), animated: true)
        
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if(tfUsername.text!.count >= 6 && tfPassword.text!.count >= 4){
            return true
        }
        return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settings = UserDefaults.standard
        
        
        if swiRemenber.isOn{
            
            //waarde naar settings wegschrijven
            settings.set(true, forKey: "pref_remember")
            settings.set(tfUsername.text, forKey: "pref_username")
            settings.set(tfPassword.text, forKey: "pref_password")
            
        }else{
            settings.set(false, forKey: "pref_remember")
            settings.set("", forKey: "pref_username")
            settings.set("", forKey: "pref_password")
            
        }
    }
    
}
