//
//  LoginView.swift
//  BlackJack
//
//  Created by mcs on 3/22/20.
//  Copyright © 2020 MCS. All rights reserved.
//

import UIKit

class LoginView: UIView {

    var logoImgView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFit
        imgView.image = #imageLiteral(resourceName: "blackjackLogo")
        return imgView
    }()

    var userNameTxtField: UITextField = {
        let txtField = UITextField()
        txtField.translatesAutoresizingMaskIntoConstraints = false
        txtField.backgroundColor = .black
        txtField.textColor = .white
        txtField.layer.cornerRadius = 10
        txtField.placeholder = "Enter Username"
        return txtField
    }()
    
    var loginButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 10
        btn.setTitle("Start Playing", for: .normal)
        btn.backgroundColor = .black
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemRed
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews() {
        addSubview(logoImgView)
        addSubview(userNameTxtField)
        addSubview(loginButton)
        
        addConstraints()
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            logoImgView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImgView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            logoImgView.widthAnchor.constraint(equalToConstant: 400),
            logoImgView.heightAnchor.constraint(equalToConstant: 250),
            
            userNameTxtField.centerXAnchor.constraint(equalTo: centerXAnchor),
            userNameTxtField.topAnchor.constraint(equalTo: logoImgView.bottomAnchor, constant: 35),
            userNameTxtField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            userNameTxtField.trailingAnchor.constraint(equalTo: trailingAnchor, constant:  -20),
            userNameTxtField.heightAnchor.constraint(equalToConstant: 50),
            
            loginButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: userNameTxtField.bottomAnchor, constant: 20),
            loginButton.widthAnchor.constraint(equalToConstant: 200),
        ])
    }
}
