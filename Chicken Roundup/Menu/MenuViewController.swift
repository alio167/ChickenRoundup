//
//  MenuViewController.swift
//  Chicken Roundup
//
//  Created by clinic18 on 10/6/18.
//  Copyright © 2018 Ali Otondo. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
  // MARK: Objects
  
  let menuView = MenuView()
  
  // MARK: Lifestyle

  override func viewDidLoad() {
    super.viewDidLoad()
    view = menuView
    
    menuView.levelsButton.addTarget(
      self,
      action: #selector(didTapLevelsButton(sender:)),
      for: .touchUpInside
    )
    menuView.instructionsButton.addTarget(
      self,
      action: #selector(didTapInstructionsButton(sender:)),
      for: .touchUpInside
    )
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @objc private func didTapLevelsButton(sender: UIButton) {
    self.present(LevelsViewController(), animated: true, completion: nil)
  }
  
  @objc private func didTapInstructionsButton(sender: UIButton) {
    self.present(InstructionsViewController(), animated: true, completion: nil)
  }
}
