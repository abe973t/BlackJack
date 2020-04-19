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
    
    var chipsViewContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        view.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        view.layer.borderWidth = 2
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        
        let fiveChip = UIButton()
        fiveChip.translatesAutoresizingMaskIntoConstraints = false
        fiveChip.setImage(#imageLiteral(resourceName: "5chip"), for: .normal)
        
        let quarterChip = UIButton()
        quarterChip.translatesAutoresizingMaskIntoConstraints = false
        quarterChip.setImage(#imageLiteral(resourceName: "25chip"), for: .normal)
        
        let fiftyChip = UIButton()
        fiftyChip.translatesAutoresizingMaskIntoConstraints = false
        fiftyChip.setImage(#imageLiteral(resourceName: "50chip"), for: .normal)
        
        let hundoChip = UIButton()
        hundoChip.translatesAutoresizingMaskIntoConstraints = false
        hundoChip.setImage(#imageLiteral(resourceName: "100chip"), for: .normal)
        
        stackView.addArrangedSubview(fiveChip)
        stackView.addArrangedSubview(quarterChip)
        stackView.addArrangedSubview(fiftyChip)
        stackView.addArrangedSubview(hundoChip)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            fiveChip.heightAnchor.constraint(equalToConstant: 75),
            fiveChip.widthAnchor.constraint(equalToConstant: 75),
            
            quarterChip.heightAnchor.constraint(equalToConstant: 75),
            quarterChip.widthAnchor.constraint(equalToConstant: 75),
            
            fiftyChip.heightAnchor.constraint(equalToConstant: 75),
            fiftyChip.widthAnchor.constraint(equalToConstant: 75),
            
            hundoChip.heightAnchor.constraint(equalToConstant: 75),
            hundoChip.widthAnchor.constraint(equalToConstant: 75),
            
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 5)
        ])
        
        return view
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
        addSubview(chipsViewContainer)
        
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
            deckImgView.heightAnchor.constraint(equalToConstant: 160),
            
            chipsViewContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            chipsViewContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            chipsViewContainer.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            chipsViewContainer.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}
