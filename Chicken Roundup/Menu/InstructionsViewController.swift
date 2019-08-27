//
//  InstructionsViewController.swift
//  Chicken Roundup
//
//  Created by clinic18 on 10/6/18.
//  Copyright © 2018 Ali Otondo. All rights reserved.
//

import UIKit

class InstructionsViewController: UIViewController {

  // MARK: Objects
  
  let instructionsView = InstructionsView()
  
  // MARK: Lifestyle

  override func viewDidLoad() {
    super.viewDidLoad()
    view = instructionsView
    
    instructionsView.backButton.addTarget(
      self,
      action: #selector(didTapBackButton(sender:)),
      for: .touchUpInside
    )
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  @objc private func didTapBackButton(sender: UIButton) {
    self.dismiss(animated: true, completion: nil)
  }
}
