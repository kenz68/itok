//
//  SignUpVC.swift
//  EnglishNow
//
//  Created by Nha T.Tran on 5/20/17.
//  Copyright © 2017 IceTeaViet. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase


class SignUpVC: UIViewController {

    
    // MARK: -declare
    @IBAction func btnDismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var registerView: UIView!
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var txtConfirmPassword: UITextField!
    
    @IBOutlet var txtUsername: UITextField!
    
    @IBOutlet var txtError: UILabel!
    
    @IBOutlet var btnSignUp: UIButton!
    
    @IBAction func btnSignUp(_ sender: Any) {
        ProgressHUD.show(view: view)
        if txtPassword.text != txtConfirmPassword.text{
            txtError.text = WSString.passwordNotMatch
            ProgressHUD.hide(view: self.view)
        }
        else{
            if let email = txtEmail.text, let password = txtPassword.text {
                FirebaseClient.shared.signUp(email: email, password: password, userName: txtUsername.text!, skills: skills, completion: {(user, error) in
                    if let firebaseError = error{
                        MessageBox.warning(body: firebaseError.localizedDescription)
                        ProgressHUD.hide(view: self.view)
                        return
                    }
                    if let user = user {
                        ProgressHUD.hide(view: self.view)
                        MessageBox.show(body: "Sign Up successfully!")
                        self.dismiss(animated: true, completion: nil)
                    }
                })
            }
            else {
                self.txtError.text = WSString.invalidEmailPassword
                ProgressHUD.hide(view: self.view)
            }

        }
    }
    
    var skills: [Skill] = [Skill]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        skills.append(Listening())
        skills.append(Speaking())
        skills.append(Pronunciation())
        initShow()
        // Do any additional setup after loading the view.
    }

    // MARK: -init to show
    func initShow(){
        
        registerView.layer.cornerRadius = 5
        txtEmail.layer.cornerRadius = 5
        txtEmail.layer.borderWidth = 1
        txtEmail.layer.borderColor = UIColor(red: 213/255,green: 216/255,blue: 220/255,alpha: 1.0).cgColor
        
        txtPassword.layer.cornerRadius = 5
        txtPassword.layer.borderWidth = 1
        txtPassword.layer.borderColor = UIColor(red: 213/255,green: 216/255,blue: 220/255,alpha: 1.0).cgColor
        txtPassword.isSecureTextEntry = true

        txtUsername.layer.cornerRadius = 5
        txtUsername.layer.borderWidth = 1
        txtUsername.layer.borderColor = UIColor(red: 213/255,green: 216/255,blue: 220/255,alpha: 1.0).cgColor
        
        txtConfirmPassword.layer.cornerRadius = 5
        txtConfirmPassword.layer.borderWidth = 1
        txtConfirmPassword.layer.borderColor = UIColor(red: 213/255,green: 216/255,blue: 220/255,alpha: 1.0).cgColor
        txtConfirmPassword.isSecureTextEntry = true
    
    }
    
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //disappear keyboard when click on anywhere in screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
   }
