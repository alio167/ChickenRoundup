//
//  ThemableView.swift
//  Chicken Roundup
//
//  Created by Ali Otondo on 8/26/19.
//  Copyright © 2019 Ali Otondo. All rights reserved.
//

import UIKit

class ThemableView: UIView {
  let theme: Theme

  init(_ theme: Theme) {
    self.theme = theme
    super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func applyTheme() {}
}
