//
//  ViewController.swift
//  Login
//
//  Created by Илья Курлович on 04.11.2023.
//

import UIKit

// MARK: - Extension for animation "Shake"
extension UIView {
    func shake(duration: CFTimeInterval = 0.05, repeatCount: Float = 7) {
        let animation = CAKeyframeAnimation(keyPath: "transform.rotation")
        animation.values = [-0.02, 0.02]
        animation.repeatCount = repeatCount
        animation.duration = duration
        animation.isAdditive = true
        self.layer.add(animation, forKey: "shake")
    }
}

// MARK: - Extension for text field
extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !text.isEmpty else { return }
        
        switch textField {
        case textFieldEmail:
            let isValidEmail = check(email: text)
            if isValidEmail {
                email = text
                imageEmail.tintColor = .systemMint
                lineEmail.backgroundColor = .systemMint
            } else {
                email = ""
                makeErrorField(textField: textField)
            }
        case textFieldPassword:
            let isValidPassword = check(password: text)
            
            if isValidPassword {
                password = text
                imagePassword.tintColor = .systemMint
                linePassword.backgroundColor = .systemMint
            } else {
                password = ""
                makeErrorField(textField: textField)
            }
        default:
            print("error text field")
        }
    }
    
    private func check(email: String) -> Bool {
        return email.contains("@") && email.contains(".")
    }
    
    private func check(password: String) -> Bool {
        return password.count >= 4
    }
    
    private func makeErrorField(textField: UITextField) {
        
        switch textField {
        case textFieldEmail:
            imageEmail.tintColor = .systemRed
            lineEmail.backgroundColor = .systemRed
        case textFieldPassword:
            imagePassword.tintColor = .systemRed
            linePassword.backgroundColor = .systemRed
        default:
            print("Error22")
        }
    }
}

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var lineEmail: UIView!
    @IBOutlet weak var linePassword: UIView!
    @IBOutlet weak var buttonLogin: UIButton!
    @IBOutlet weak var buttonSignUp: UIButton!
    @IBOutlet weak var questionSignUpLabel: UILabel!
    @IBOutlet weak var mainLogo: UIImageView!
    @IBOutlet weak var imageEmail: UIImageView!
    @IBOutlet weak var imagePassword: UIImageView!
    
    // MARK: - Properties
    private let activeColor = UIColor(named: "ColorLoginBotton") ?? UIColor.gray
    
    private var email: String = ""
    private var password: String = ""
    
    private let mockEmail = "abc@gmail.com"
    private let mockPassword = "123456"

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // static white color for placeholders
        colorTextPlaceholderForButtons()
        
        // funny animation for logo
        animationShakeForImage()
        
        // shadow for logo button
        configureButtons()
        
        // delegate
        textFieldEmail.delegate = self
        textFieldPassword.delegate = self
        
        textFieldEmail.becomeFirstResponder()
    }
    
    // MARK: - IBActions
    @IBAction func loginAction(_ sender: Any) {
        textFieldEmail.resignFirstResponder()
        textFieldPassword.resignFirstResponder()
        
        if email.isEmpty {
            makeErrorField(textField: textFieldEmail)
        }
        
        if password.isEmpty {
            makeErrorField(textField: textFieldPassword)
        }
        
        if email == mockEmail && password == mockPassword {
            performSegue(withIdentifier: "goToHomePage", sender: sender)
        } else {
            let alert = UIAlertController(title: "Error".localized, message: "Wrong password or e-mail".localized, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default)
            alert.addAction(action)
            
            present(alert, animated: true)
        }
    }
    
    @IBAction func signUpAction(_ sender: Any) {
    }
    
    // MARK: - Methods
    private func colorTextPlaceholderForButtons() {
        let placeholderColor = UIColor.gray
        textFieldEmail.attributedPlaceholder = NSAttributedString(string: textFieldEmail.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : placeholderColor])
        textFieldPassword.attributedPlaceholder = NSAttributedString(string: textFieldPassword.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : placeholderColor])
    }
    
    private func configureButtons() {
        buttonLogin.layer.shadowColor = activeColor.cgColor
        buttonLogin.layer.shadowOffset = CGSize(width:  0, height: 5)
        buttonLogin.layer.shadowOpacity = 0.4
        buttonLogin.layer.shadowRadius = 5
    }
    
    // MARK: - Block functions for animation
    private func animationShakeForImage() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped(_:)))
        mainLogo.isUserInteractionEnabled = true
        mainLogo.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    @objc private func imageViewTapped(_ sender: UITapGestureRecognizer) {
        mainLogo.shake()
    }
    
}

