//
//  Theme.swift
//  Chicken Roundup
//
//  Created by Ali Otondo on 8/26/19.
//  Copyright © 2019 Ali Otondo. All rights reserved.
//

import UIKit

class Theme {
  
  // MARK: Color
  
  let primaryColor = UIColor.init(red: 98/255, green: 151/255, blue: 227/255, alpha: 1.0)
  let secondaryColor = UIColor.init(red: 147/255, green: 188/255, blue: 245/255, alpha: 1.0)
  
  let white = UIColor.white
  let black = UIColor.black
  let clear = UIColor.clear
  
  // MARK: Font
  
  let menuTitle = UIFont.init(name: "Chalkboard SE", size: 70)
  let heading = UIFont.init(name: "Chalkboard SE", size: 40)
    
  // MARK: Buttons
  
  let levelButtonSize: CGFloat = 125
  let backButtonSize: CGFloat = 70
  let buttonCornerRadius: CGFloat = 20
  
  // MARK: Spacing
  
  let spacingSmall: CGFloat = 10
  let spacingMedium: CGFloat = 20
  let spacingLarge: CGFloat = 40
  
  // MARK: Size
  
  let headerHeight: CGFloat = 70
    
  let chickenHeight: CGFloat = 100
  let chickenWidth: CGFloat = 70
}
