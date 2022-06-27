//
//  ViewController.swift
//  AlertStudy
//
//  Created by Ömer Faruk Kılıçaslan on 27.06.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var password2Textfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var usernameTextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signUpButtonClicked(_ sender: Any) {
        
        if usernameTextfield.text == "" {
           let alert = createAlert(title: "Warning", message: "Username cannot be empty")
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            presentAlert(alert: alert)
            
        }
        
        else if passwordTextfield.text == "" || password2Textfield.text == "" {
            let alert = createAlert(title: "Warning", message: "Password fields cannot be empty")
            
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            presentAlert(alert: alert)
        }
        else if passwordTextfield.text != password2Textfield.text {
            let alert = createAlert(title: "Warning", message: "Password cannot be different")
            
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            presentAlert(alert: alert)
        }
        
        else{
            let alert = createAlert(title: "SUCCESS", message: "Successfully created")
            
            let okAction = UIAlertAction(title: "OK", style: .default) { result in
                
                self.performSegue(withIdentifier: "toSecondVC", sender: nil)
                
            }
            alert.addAction(okAction)
            presentAlert(alert: alert)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toSecondVC" {
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.userName = usernameTextfield.text!
            destinationVC.password = passwordTextfield.text!
        }
        
    }
    
}

extension ViewController {
    
    func createAlert(title: String, message: String) -> UIAlertController {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        return alert
    }
    
    func presentAlert(alert: UIAlertController) {
        present(alert, animated: true, completion: nil)
    }
}

