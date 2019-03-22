//
//  LoginViewController.swift
//  Parstagram
//
//  Created by Joyce Huang on 3/20/19.
//  Copyright © 2019 Joyce Huang. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Remove the method below for styling the button
        self.styleButtons()
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        let user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
        
        user.signUpInBackground { (success, error) in
            if success {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print ("Error: \(error?.localizedDescription)")
            }
        }
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        let username = usernameField.text!
        let password = passwordField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print ("Error: \(error?.localizedDescription)")
            }
        }
    }
    
    
    fileprivate func styleButtons() {
        signupButton.translatesAutoresizingMaskIntoConstraints = false
        signupButton.layer.borderWidth = 1
        signupButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        signupButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 9).isActive = true
        signupButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
        signupButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        signupButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.layer.borderWidth = 1
        
       
        loginButton.topAnchor.constraint(equalTo: self.signupButton.bottomAnchor, constant: 20).isActive = true
        loginButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
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
