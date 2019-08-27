//
//  LevelsViewController.swift
//  Chicken Roundup
//
//  Created by clinic18 on 10/6/18.
//  Copyright © 2018 Ali Otondo. All rights reserved.
//

import UIKit

class LevelsViewController: UIViewController {
  
  // MARK: Objects
  
  let levelsView = LevelsView()
  
  // MARK: Lifestyle

  override func viewDidLoad() {
    super.viewDidLoad()
    view = levelsView
    
    levelsView.backButton.addTarget(
      self,
      action: #selector(didTapBackButton(sender:)),
      for: .touchUpInside
    )

    for button in levelsView.levelButtons {
      button.addTarget(
        self,
        action: #selector(didTapLevelButton(sender:)),
        for: .touchUpInside
      )
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @objc private func didTapBackButton(sender: UIButton) {
    self.dismiss(animated: true, completion: nil)
  }
  
  @objc private func didTapLevelButton(sender: LevelButton) {
    // Doesn't work
    let gameViewController = MenuViewController()
    self.present(gameViewController, animated: true, completion: nil)
  }
}
