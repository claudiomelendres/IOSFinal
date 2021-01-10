//
//  ViewController.swift
//  aprendiendo
//
//  Created by claudio melendres on 21/12/20.
//  Copyright © 2020 claudio melendres. All rights reserved.
//

import UIKit
import PopupDialog

class ViewController: UIViewController {

    // MARK: - Referencias UI
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTestField: UITextField!
    @IBOutlet weak var emailSwitch: UISwitch!
    
    @IBAction func loginButtonAction() {
        
        // 1 obtener valores de los textfield
        let email = emailTextField.text
        let password = passwordTestField.text
        
        if email == "claudio@gmail.com" , password == "123" {
            if emailSwitch.isOn {
                // guradamos valores en el userdefault
                storage.setValue(email, forKey: emailKey)
            } else {
                storage.removeObject(forKey: emailKey)
            }
            
            performSegue(withIdentifier: "home_segue", sender: nil)
        } else {
            
            print("Crdenciales invalidas")
            showErrorDialog()
        }
        
        
    }
    
    private let emailKey = "email"
    private let storage = UserDefaults.standard
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let storedEmail = storage.string(forKey: emailKey){
            emailTextField.text = storedEmail
            emailSwitch.isOn = true
        } else {
            emailSwitch.isOn = false
        }
    }
    
    private func showErrorDialog() {
        let title = "Error"
        let message = "Credenciales invalidas"
        let image = UIImage(named: "pexels-photo-103290")

        // Create the dialog
        let popup = PopupDialog(title: title, message: message, image: image)

        // Create buttons
        let buttonOne = CancelButton(title: "CANCEL") {
            print("You canceled the car dialog.")
        }



        // Add buttons to dialog
        // Alternatively, you can use popup.addButton(buttonOne)
        // to add a single button
        popup.addButtons([buttonOne])

        // Present dialog
        self.present(popup, animated: true, completion: nil)
    }


}

