//
//  RegistrarUsuarioViewController.swift
//  SnapChat
//
//  Created by Mac 13 on 10/06/22.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class RegistrarUsuarioViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func RegistrarTapped(_ sender: Any) {
        Auth.auth().createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!) { (user, error) in
            print("Intentando crear un usuario")
            if error != nil{
                print("Se presento el siguiente error al crear el usuario: \(error)")
            }else{
                print("El usuario fue creado exitosamente")
                
                Database.database().reference().child("usuarios").child(user!.user.uid).child("email").setValue(user!.user.email)
                
                let alerta = UIAlertController(title: "Creación de Usuario", message: "Usuario: \(self.emailTextField.text!) se creo correctamente.", preferredStyle: .alert)
                
                let btnOK = UIAlertAction(title: "Aceptar", style: .default) { (UIAlertAction) in
                    self.performSegue(withIdentifier: "iniciarsegue", sender: nil)
                }
                
                alerta.addAction(btnOK)
                self.present(alerta, animated: true, completion: nil)
                
            }
            
        }
        
    }
    
    
    @IBAction func CancelarTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
