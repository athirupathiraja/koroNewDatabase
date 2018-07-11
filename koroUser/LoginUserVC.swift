//
//  LoginUserVC.swift
//  koroUser
//
//  Created by Athiru Pathiraja on 7/11/18.
//  Copyright © 2018 litshiz.org. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class LoginUserVC: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
    SVProgressHUD.show()
    
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
                if error != nil {
                    print("error with login user")
                }
                else {
                        print("successful login")
                    self.performSegue(withIdentifier: "goToHomePageForUser", sender: self)
                    
                    SVProgressHUD.dismiss()
    }
    }
}
    @IBAction func createNewUserButtonPressed(_ sender: Any){
            
            goToRegisterNewUser()
        }

func goToRegisterNewUser() {
    performSegue(withIdentifier: "goToRegisterNewUser", sender: self)
    }
    
    

}
