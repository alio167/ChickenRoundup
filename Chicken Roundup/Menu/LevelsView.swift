//
//  LevelsView.swift
//  Chicken Roundup
//
//  Created by Ali Otondo on 8/26/19.
//  Copyright © 2019 Ali Otondo. All rights reserved.
//

import UIKit

class LevelsView: ThemableView {
  
  // MARK: Objects
  
  private let header = UILabel()
  let backButton = UIButton()
  
  private let levelsTable = UITableView()
  private let numberOfLevels: Int = 3
  var levelButtons: [LevelButton] = []
  
  // MARK: Lifestyle
  
  init() {
    super.init(Theme())
    configureHeader()
    configureBackButton()
    configureTableView()
    applyTheme()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func applyTheme() {
    backgroundColor = theme.primaryColor
    levelsTable.backgroundColor = theme.clear
    levelsTable.separatorColor = theme.clear
    
    header.font = theme.heading
  }
  
  private func configureHeader() {
    header.text = "Levels"
    header.textAlignment = .center
    addSubview(header)
    header.translatesAutoresizingMaskIntoConstraints = false
    header.pinEdgesToParent(excluding: [.top, .bottom])
    header.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
    header.heightAnchor.constraint(equalToConstant: theme.headerHeight).isActive = true
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
  
  private func configureTableView() {
    levelsTable.isScrollEnabled = true
    addSubview(levelsTable)
    levelsTable.translatesAutoresizingMaskIntoConstraints = false
    levelsTable.topAnchor.constraint(equalTo: header.bottomAnchor, constant: theme.spacingMedium).isActive = true
    levelsTable.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    levelsTable.leadingAnchor.constraint(equalTo: leadingAnchor, constant: theme.spacingLarge).isActive = true
    levelsTable.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -theme.spacingLarge).isActive = true
    
    levelsTable.delegate = self
    levelsTable.dataSource = self
  }
}

extension LevelsView: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return theme.levelButtonSize + theme.spacingMedium * 2
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return numberOfLevels / 2
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let stack = UIStackView()
    stack.axis = .horizontal
    stack.distribution = .equalSpacing
    stack.alignment = .center
    
    let cell = UITableViewCell()
    cell.backgroundColor = theme.clear
    cell.addSubview(stack)
    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.pinEdgesToParent()
    
    let leftNumber = indexPath.row * 2 + 1
    let leftStars: Int = 2
    let leftButton = LevelButton(leftNumber, stars: leftStars, theme: theme)
    levelButtons.append(leftButton)
    leftButton.layer.cornerRadius = theme.buttonCornerRadius
    stack.addArrangedSubview(leftButton)
    leftButton.translatesAutoresizingMaskIntoConstraints = false
    leftButton.heightAnchor.constraint(equalToConstant: theme.levelButtonSize).isActive = true
    leftButton.widthAnchor.constraint(equalToConstant: theme.levelButtonSize).isActive = true
    
    let rightNumber = indexPath.row * 2 + 2
    let rightStars: Int = 1
    let rightButton: LevelButton
    if rightNumber > numberOfLevels {
      rightButton = LevelButton(isSpaceFiller: true, theme: theme)
    } else {
      rightButton = LevelButton(rightNumber, stars: rightStars, theme: theme)
      levelButtons.append(rightButton)
    }
    rightButton.layer.cornerRadius = theme.buttonCornerRadius
    stack.addArrangedSubview(rightButton)
    rightButton.translatesAutoresizingMaskIntoConstraints = false
    rightButton.heightAnchor.constraint(equalToConstant: theme.levelButtonSize).isActive = true
    rightButton.widthAnchor.constraint(equalToConstant: theme.levelButtonSize).isActive = true
    
    return cell
  }
}

class LevelButton: UIButton {
  
  // MARK: Objects

  let number = UILabel()
  
  private let starOne = UIImageView()
  private let starTwo = UIImageView()
  private let starThree = UIImageView()
  var stars: Int = 0 {
    didSet {
      if stars >= 3 {
        starOne.image = UIImage(named: "Star_Filled")
        starTwo.image = UIImage(named: "Star_Filled")
        starThree.image = UIImage(named: "Star_Filled")
      } else if stars >= 2 {
        starOne.image = UIImage(named: "Star_Filled")
        starTwo.image = UIImage(named: "Star_Filled")
        starThree.image = UIImage(named: "Star_Clear")
      } else if stars >= 1 {
        starOne.image = UIImage(named: "Star_Filled")
        starTwo.image = UIImage(named: "Star_Clear")
        starThree.image = UIImage(named: "Star_Clear")
      } else {
        starOne.image = UIImage(named: "Star_Clear")
        starTwo.image = UIImage(named: "Star_Clear")
        starThree.image = UIImage(named: "Star_Clear")
      }
    }
  }
  
  let numberSize: CGFloat = 80
  let starSize: CGFloat = 30

  // MARK: Lifestyle

  init(_ number: Int, stars: Int, theme: Theme) {
    let buttonSize = theme.levelButtonSize
    let padding = theme.spacingSmall
    super.init(frame: CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize))
    
    configureNumber(withNumber: number, padding: padding)
    configureStars(withStars: stars, padding: padding)
    
    applyTheme(theme)
  }
  
  init(isSpaceFiller: Bool, theme: Theme) {
    guard isSpaceFiller else {
      fatalError("This initializer should only be called when it is a space filler")
    }
    
    let buttonSize = theme.levelButtonSize
    super.init(frame: CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize))
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func applyTheme(_ theme: Theme) {
    backgroundColor = theme.secondaryColor
    number.font = theme.heading
  }
  
  // MARK: Private
  
  private func configureNumber(withNumber: Int, padding: CGFloat) {
    number.text = String(withNumber)
    number.textAlignment = .center
    addSubview(number)
    number.translatesAutoresizingMaskIntoConstraints = false
    number.heightAnchor.constraint(equalToConstant: numberSize).isActive = true
    number.widthAnchor.constraint(equalToConstant: numberSize).isActive = true
    number.bottomAnchor.constraint(equalTo: centerYAnchor, constant: padding).isActive = true
    number.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
  }
  
  private func configureStars(withStars: Int, padding: CGFloat) {
    let starStack = UIStackView()
    starStack.axis = .horizontal
    starStack.distribution = .equalSpacing
    starStack.alignment = .center

    addSubview(starStack)
    starStack.translatesAutoresizingMaskIntoConstraints = false
    starStack.topAnchor.constraint(equalTo: centerYAnchor).isActive = true
    starStack.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -padding).isActive = true
    starStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding).isActive = true
    starStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding).isActive = true
    
    starStack.addArrangedSubview(starOne)
    starOne.translatesAutoresizingMaskIntoConstraints = false
    starOne.heightAnchor.constraint(equalToConstant: starSize).isActive = true
    starOne.widthAnchor.constraint(equalToConstant: starSize).isActive = true

    starStack.addArrangedSubview(starTwo)
    starTwo.translatesAutoresizingMaskIntoConstraints = false
    starTwo.heightAnchor.constraint(equalToConstant: starSize).isActive = true
    starTwo.widthAnchor.constraint(equalToConstant: starSize).isActive = true
  
    starStack.addArrangedSubview(starThree)
    starThree.translatesAutoresizingMaskIntoConstraints = false
    starThree.heightAnchor.constraint(equalToConstant: starSize).isActive = true
    starThree.widthAnchor.constraint(equalToConstant: starSize).isActive = true
    
    stars = withStars
  }
}
