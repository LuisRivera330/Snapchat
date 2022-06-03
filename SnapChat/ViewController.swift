//
//  ViewController.swift
//  SnapChat
//
//  Created by Mac 13 on 27/05/22.
//

import UIKit
import FirebaseCore
import FirebaseAuth


class iniciarSesionViewController: UIViewController{

    

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    

    
    @IBAction func iniciarSessionTapped(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password:passwordTextField.text!){(user,error) in
            print("Intentando Iniciar Sesión")
            
            if error != nil{
                print("Se presentó el siguiente error: \(error)")
            }else{
                print("Inicio de sesión exitoso")
            }
            
        }

    }
    
    
    
}

