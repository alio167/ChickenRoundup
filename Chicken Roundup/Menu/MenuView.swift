//
//  MenuView.swift
//  Chicken Roundup
//
//  Created by Ali Otondo on 8/26/19.
//  Copyright © 2019 Ali Otondo. All rights reserved.
//

import UIKit

class MenuView: ThemableView {
    
  // MARK: Objects
  
  private let headerView = UIView()
  private let chickenImage = UIImageView()
  private let chickenLabel = UILabel()
  private let roundupLabel = UILabel()
  
  private var buttonsStack = UIStackView()
  let levelsButton = UIButton()
  let instructionsButton = UIButton()
  
  // MARK: Lifestyle
    
  init() {
    super.init(Theme())
    configureButtons()
    configureHeader()
    applyTheme()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func applyTheme() {
    backgroundColor = theme.primaryColor
    levelsButton.backgroundColor = theme.secondaryColor
    instructionsButton.backgroundColor = theme.secondaryColor

    chickenLabel.font = theme.menuTitle
    roundupLabel.font = theme.menuTitle
    levelsButton.titleLabel?.font = theme.heading
    instructionsButton.titleLabel?.font = theme.heading
    
    levelsButton.setTitleColor(theme.black, for: .normal)
    instructionsButton.setTitleColor(theme.black, for: .normal)
  }
  
  // MARK: Private
  
  private func configureButtons() {
    let buttonWidth: CGFloat = 300
    let buttonHeight: CGFloat = 75
    let stackHeight: CGFloat = theme.spacingMedium + buttonHeight * 2

    buttonsStack.axis = .vertical
    buttonsStack.distribution = .equalSpacing
    buttonsStack.alignment = .center
    addSubview(buttonsStack)
    buttonsStack.translatesAutoresizingMaskIntoConstraints = false
    buttonsStack.pinEdgesToParent(excluding: [.top, .bottom])
    buttonsStack.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -theme.spacingMedium).isActive = true
    buttonsStack.heightAnchor.constraint(equalToConstant: stackHeight).isActive = true
  
    levelsButton.setTitle("Levels", for: .normal)
    levelsButton.layer.cornerRadius = theme.buttonCornerRadius
    buttonsStack.addArrangedSubview(levelsButton)
    levelsButton.translatesAutoresizingMaskIntoConstraints = false
    levelsButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
    levelsButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
    
    instructionsButton.setTitle("Instructions", for: .normal)
    instructionsButton.layer.cornerRadius = theme.buttonCornerRadius
    buttonsStack.addArrangedSubview(instructionsButton)
    instructionsButton.translatesAutoresizingMaskIntoConstraints = false
    instructionsButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
    instructionsButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
  }
  
  private func configureHeader() {
    let labelHeight: CGFloat = 100
    
    addSubview(headerView)
    headerView.translatesAutoresizingMaskIntoConstraints = false
    headerView.pinEdgesToParent(excluding: [.top, .bottom])
    headerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
    headerView.bottomAnchor.constraint(equalTo: buttonsStack.topAnchor, constant: -theme.spacingMedium).isActive = true
    
    chickenImage.image = UIImage(named: "Basic Chicken")
    headerView.addSubview(chickenImage)
    chickenImage.translatesAutoresizingMaskIntoConstraints = false
    chickenImage.centerInParent()
    chickenImage.heightAnchor.constraint(equalToConstant: theme.chickenHeight * 2).isActive = true
    chickenImage.widthAnchor.constraint(equalToConstant: theme.chickenWidth * 2).isActive = true
    
    chickenLabel.text = "Chicken"
    chickenLabel.textAlignment = .center
    headerView.addSubview(chickenLabel)
    chickenLabel.translatesAutoresizingMaskIntoConstraints = false
    chickenLabel.pinEdgesToParent(excluding: [.top, .bottom])
    chickenLabel.bottomAnchor.constraint(equalTo: chickenImage.topAnchor, constant: -theme.spacingSmall).isActive = true
    chickenLabel.heightAnchor.constraint(equalToConstant: labelHeight).isActive = true
    
    roundupLabel.text = "Roundup"
    roundupLabel.textAlignment = .center
    headerView.addSubview(roundupLabel)
    roundupLabel.translatesAutoresizingMaskIntoConstraints = false
    roundupLabel.pinEdgesToParent(excluding: [.top, .bottom])
    roundupLabel.topAnchor.constraint(equalTo: chickenImage.bottomAnchor, constant: theme.spacingSmall).isActive = true
    roundupLabel.heightAnchor.constraint(equalToConstant: labelHeight).isActive = true
  }
}
