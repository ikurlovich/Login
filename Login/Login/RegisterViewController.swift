//
//  RegisterViewController.swift
//  Login
//
//  Created by Илья Курлович on 15.11.2023.
//

import UIKit

final class RegisterViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    // MARK: - Properties
    private var email: String = ""
    private var password: String = ""
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    // MARK: - IBActions
    @IBAction func registerButtonAction(_ sender: Any) {
        
        if ((emailTextField.text?.isEmpty) != nil) && !((passwordTextField.text?.isEmpty) != nil) {
            registerButton.backgroundColor = UIColor.systemGreen
        }
    }
    
    // MARK: - Methods
    
    
}
