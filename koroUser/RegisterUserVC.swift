//
//  RegisterUserVC.swift
//  koroUser
//
//  Created by Athiru Pathiraja on 7/11/18.
//  Copyright © 2018 litshiz.org. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class RegisterUserVC: UIViewController {
    @IBOutlet weak var newUserEmailTextField: UITextField!
    @IBOutlet weak var newUserPasswordTextField: UITextField!
    @IBOutlet weak var passwordReenterTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    @IBAction func registerButtonPressed(_ sender: Any) {
        if newUserPasswordTextField.text != passwordReenterTextField.text {
            
            let alert = UIAlertController(title: "Error", message: "The passwords do not match", preferredStyle: .alert)
            
            let reenterPasswordAction = UIAlertAction(title: "OK", style: .default) { (UIAlertAction) in
                self.emptyTextField()
            }
            
            alert.addAction(reenterPasswordAction)
            
            present(alert, animated: true, completion: nil)
            
            
        }
            
        else {
            Auth.auth().createUser(withEmail: newUserEmailTextField.text!, password: newUserPasswordTextField.text!) { (user, error) in
                
                if error != nil {
                    print(error!)
                } else {
                    print("sucessfully registered new user")
                    self.performSegue(withIdentifier: "registerToHomeForUser", sender: self)
                    
                }
            }
        }
        
        
        
    }
    
    func newUserPasswordTextFieldDidBeginEditing(textfield:UITextField){
        textfield.text = ""
    }
    
    func newUserPasswordOtherTextFieldDidBeginEditing(textfield: UITextField){
        textfield.text = ""
    }
    
    func emptyTextField() {
        newUserPasswordTextFieldDidBeginEditing(textfield: newUserPasswordTextField)
        newUserPasswordOtherTextFieldDidBeginEditing(textfield: passwordReenterTextField)
    }
        
    
 

}
