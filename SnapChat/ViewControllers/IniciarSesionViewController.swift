//
//  ViewController.swift
//  SnapChat
//
//  Created by Mac 13 on 27/05/22.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import GoogleSignIn
import FirebaseDatabase


class iniciarSesionViewController: UIViewController{

    @IBOutlet var signInButton:GIDSignInButton!

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        GIDSignIn.sharedInstance()?.presentingViewController=self
    }
    

    
    @IBAction func iniciarSessionTapped(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password:passwordTextField.text!){(user,error) in
            print("Intentando Iniciar Sesión")
            
            if error != nil{
                print("Se presentó el siguiente error: \(error)")
                
                let alerta = UIAlertController(title: "Error al iniciar Sesión", message: "Usuario: \(self.emailTextField.text!) no existe", preferredStyle: .alert)
                
                let btnOK = UIAlertAction(title: "Crear", style: .default) { (UIAlertAction) in
                    self.performSegue(withIdentifier: "RegistrarUsuarioSegue", sender: nil)
                }
                
                let btnCancelar = UIAlertAction(title: "Cancelar", style: .default)
                
                
                
                alerta.addAction(btnOK)
                alerta.addAction(btnCancelar)
                self.present(alerta, animated: true, completion: nil)
                
                
                
                /*Auth.auth().createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!) { (user, error) in
                    print("Intentando crear un usuario")
                    if error != nil{
                        print("Se presento el siguiente error al crear el usuario: \(error)")
                    }else{
                        print("El usuario fue creado exitosamente")
                        
                        Database.database().reference().child("usuarios").child(user!.user.uid).child("email").setValue(user!.user.email)
                        
                        let alerta = UIAlertController(title: "Creación de Usuario", message: "Usuario: \(self.emailTextField.text!) se creo correctamente.", preferredStyle: .alert)
                        
                        let btnOK = UIAlertAction(title: "Aceptar", style: .default) { (UIAlertAction) in
                            self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
                        }
                        
                        alerta.addAction(btnOK)
                        self.present(alerta, animated: true, completion: nil)
                        
                    }
                    
                }*/
                
            }else{
                print("Inicio de sesión exitoso")
                self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
            }
            
        }

    }
    
    @IBAction func RegistrarTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "RegistrarUsuarioSegue", sender: nil)
    }
    
    
    
    
}

