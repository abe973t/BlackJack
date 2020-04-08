//
//  MainView.swift
//  BlackJack
//
//  Created by mcs on 3/22/20.
//  Copyright © 2020 MCS. All rights reserved.
//

import UIKit

class MainView: UIView {
    
    weak var controller: UIViewController?
    var viewModel = ViewModel()
    var deck = [Card]()
    var chips = [Chip]()
    var dealerHand: [Card]!
    var playerHand: [Card]!
    var profile: Profile! {
        didSet {
            cashAmountLabel.text = "\(profile.cash)"
            self.chips = viewModel.generateChips(cashAmount: profile.cash)
        }
    }
    
    var logoImgView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.image = #imageLiteral(resourceName: "blackjackLogo")
        imgView.alpha = 0.6
        return imgView
    }()
    
    var deckImgView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.image = #imageLiteral(resourceName: "backOfCard")
        imgView.layer.shadowOffset = CGSize(width: 20, height: -50)
        imgView.layer.shadowRadius = 10
        imgView.layer.shadowColor = UIColor.black.cgColor
        imgView.transform = CGAffineTransform(rotationAngle: 45)
        return imgView
    }()
    
    var settingsButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(#imageLiteral(resourceName: "gear"), for: .normal)
        return btn
    }()
    
    var cashView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        view.layer.borderWidth = 2
        return view
    }()
    
    let cashLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Cash"
        lbl.textColor = .white
        return lbl
    }()
    
    var cashAmountLabel: UILabel = {
        let cashAmountLbl = UILabel()
        cashAmountLbl.translatesAutoresizingMaskIntoConstraints = false
        cashAmountLbl.textColor = .white
        return cashAmountLbl
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemRed
        
        viewModel = ViewModel()
        viewModel.view = self
        viewModel.generateDeck()
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews() {
        addSubview(logoImgView)
        addSubview(cashView)
        addSubview(settingsButton)
        addSubview(deckImgView)
        
        cashView.addSubview(cashLabel)
        cashView.addSubview(cashAmountLabel)
        
        addConstraints()
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            cashLabel.centerXAnchor.constraint(equalTo: cashView.centerXAnchor),
            cashLabel.topAnchor.constraint(equalTo: cashView.topAnchor, constant: 10),
            cashLabel.widthAnchor.constraint(equalToConstant: 40),
            
            cashAmountLabel.centerXAnchor.constraint(equalTo: cashView.centerXAnchor),
            cashAmountLabel.topAnchor.constraint(equalTo: cashLabel.bottomAnchor, constant: 10),
            cashAmountLabel.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            logoImgView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImgView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            cashView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            cashView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            cashView.widthAnchor.constraint(equalToConstant: 155),
            cashView.heightAnchor.constraint(equalToConstant: 80),
            
            settingsButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            settingsButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            settingsButton.widthAnchor.constraint(equalToConstant: 50),
            settingsButton.heightAnchor.constraint(equalToConstant: 50),
            
            deckImgView.topAnchor.constraint(equalTo: settingsButton.bottomAnchor, constant: 40),
            deckImgView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 35),
            deckImgView.widthAnchor.constraint(equalToConstant: 115),
            deckImgView.heightAnchor.constraint(equalToConstant: 160)
        ])
    }
}
