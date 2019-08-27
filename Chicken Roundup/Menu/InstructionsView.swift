//
//  InstructionsView.swift
//  Chicken Roundup
//
//  Created by Ali Otondo on 8/26/19.
//  Copyright © 2019 Ali Otondo. All rights reserved.
//

import UIKit

class InstructionsView: ThemableView {

  // MARK: Objects
  
  private let header = UILabel()
  private let instructions = UIScrollView()
  let backButton = UIButton()
  
  // MARK: Lifestyle
  
  init() {
    super.init(Theme())
    configureHeader()
    configureInstructions()
    configureBackButton()
    applyTheme()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func applyTheme() {
    backgroundColor = theme.primaryColor
    
    header.font = theme.heading
  }
  
  // MARK: Private
  
  private func configureHeader() {
    header.text = "Instructions"
    header.textAlignment = .center
    addSubview(header)
    header.translatesAutoresizingMaskIntoConstraints = false
    header.pinEdgesToParent(excluding: [.top, .bottom])
    header.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
    header.heightAnchor.constraint(equalToConstant: theme.headerHeight).isActive = true
  }
  
  private func configureInstructions() {
    addSubview(instructions)
    instructions.translatesAutoresizingMaskIntoConstraints = false
    instructions.pinEdgesToParent(excluding: [.top, .bottom])
    instructions.topAnchor.constraint(equalTo: header.bottomAnchor).isActive = true
    instructions.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
  }
  
  private func configureBackButton() {
    backButton.setImage(UIImage(named: "Back"), for: .normal)
    addSubview(backButton)
    backButton.translatesAutoresizingMaskIntoConstraints = false
    backButton.pinEdgesToParent(including: [.leading])
    backButton.centerYAnchor.constraint(equalTo: header.centerYAnchor).isActive = true
    backButton.widthAnchor.constraint(equalToConstant: theme.backButtonSize).isActive = true
    backButton.heightAnchor.constraint(equalToConstant: theme.backButtonSize).isActive = true
  }
}
