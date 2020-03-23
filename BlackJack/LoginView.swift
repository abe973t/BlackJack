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
        return imgView
    }()

    var userNameTxtField: UITextField = {
        let txtField = UITextField()
        txtField.translatesAutoresizingMaskIntoConstraints = false
        return txtField
    }()
    
    var loginButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .green
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addView() {
        addSubview(logoImgView)
        addSubview(userNameTxtField)
        addSubview(loginButton)
        
        addConstraints()
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            logoImgView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImgView.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            logoImgView.widthAnchor.constraint(equalToConstant: 250),
            logoImgView.heightAnchor.constraint(equalToConstant: 250),
            
            userNameTxtField.centerXAnchor.constraint(equalTo: centerXAnchor),
            userNameTxtField.topAnchor.constraint(equalTo: logoImgView.bottomAnchor, constant: 35),
        ])
        
    }
}
