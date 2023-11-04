//
//  ViewController.swift
//  Login
//
//  Created by Илья Курлович on 04.11.2023.
//

import UIKit

// MARK: extension for animation "Shake" -
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

class ViewController: UIViewController {
    // MARK: IBOutlets -
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    
    @IBOutlet weak var lineEmail: NSLayoutConstraint!
    @IBOutlet weak var linePassword: NSLayoutConstraint!
    
    @IBOutlet weak var buttonLogin: UIButton!
    @IBOutlet weak var buttonSignUp: UIButton!
    
    @IBOutlet weak var questionSignUpLabel: UILabel!
    
    @IBOutlet weak var mainLogo: UIImageView!
    // MARK: Properties -
    
    // MARK: Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // static white color for placeholders
        colorTextPlaceholderForButtons()
        
        // funny animation for logo
        animationShakeForImage()
        
        // shadow for logo button
        configureButtons()
    }
    // MARK: IBActions -
    @IBAction func loginAction(_ sender: Any) {
    }
    
    @IBAction func signUpAction(_ sender: Any) {
    }
    
    // MARK: Methods -
    private func colorTextPlaceholderForButtons() {
        let placeholderColor = UIColor.gray
        textFieldEmail.attributedPlaceholder = NSAttributedString(string: textFieldEmail.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : placeholderColor])
        textFieldPassword.attributedPlaceholder = NSAttributedString(string: textFieldPassword.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : placeholderColor])
    }
    
    private func configureButtons() {
        buttonLogin.layer.shadowColor = UIColor.systemMint.cgColor
        buttonLogin.layer.shadowOffset = CGSize(width:  0, height: 3)
        buttonLogin.layer.shadowOpacity = 0.2
        buttonLogin.layer.shadowRadius = 5
    }
    
    // MARK: Block functions for animation -
    private func animationShakeForImage() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped(_:)))
        mainLogo.isUserInteractionEnabled = true
        mainLogo.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    @objc private func imageViewTapped(_ sender: UITapGestureRecognizer) {
        mainLogo.shake()
    }
    
}

