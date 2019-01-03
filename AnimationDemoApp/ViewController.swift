//
//  ViewController.swift
//  AnimationDemoApp
//
//  Created by Appinventiv on 31/12/18.
//  Copyright © 2018 Vikash. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var loginMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.loginButton.layer.cornerRadius = 24.0
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       // self.headerLabel.center.x  += view.bounds.width
        self.headerLabel.center.y -= 101
        self.usernameTextfield.center.x -= view.bounds.width
        self.passwordTextfield.center.x -= view.bounds.width
        self.loginButton.center.y += view.bounds.height
        self.loginMessage.center.y += view.bounds.height
       // self.usernameTextfield.layer.cornerRadius = 10.0
        //self.passwordTextfield.layer.cornerRadius = 10.0
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    
        UIView.animate(withDuration: 0.7, delay: 0.3, options: .curveEaseInOut, animations: {
            self.headerLabel.center.y += 100
        }, completion: { (success) in
            UIView.animate(withDuration: 0.6, delay: 0.3, options: .curveLinear, animations: {
                self.usernameTextfield.center.x += self.view.bounds.width
                self.passwordTextfield.center.x += self.view.bounds.width
            }, completion: { (bool) in
                UIView.animate(withDuration: 1.0, animations: {
                    self.loginButton.center.y -= self.view.bounds.height
                })
            })
            
        })
       
    }
    
    @IBAction func clickLoginButton(_ sender: UIButton) {
        
        self.view.endEditing(true)
        if (self.usernameTextfield.text?.isEmpty)! {
            self.animateViewForEmptyTextField(self.usernameTextfield)
        } else if (self.passwordTextfield.text?.isEmpty)! {
            self.animateViewForEmptyTextField(self.passwordTextfield)
        } else {
            self.view.alpha = 0.4
            UIView.animate(withDuration: 0.5) {
                self.loginMessage.center.y -= self.view.bounds.height
            }
        }
    }
    
     private func animateViewForEmptyTextField(_ textfield: UITextField) {
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveLinear, animations: {
            textfield.layer.borderWidth = 1.0
            textfield.layer.borderColor = UIColor.red.cgColor
            // self.usernameTextfield.center.x -= 10
            textfield.center.x -= 10
        }) { (success) in
            UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveLinear, animations: {
                textfield.center.x += 20
            }, completion: { (success) in
                textfield.center.x -= 10
            })
            
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.clear.cgColor
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        textField.layer.borderColor = UIColor.clear.cgColor
        return true
    }
    
}

