//
//  UIView Extension.swift
//  Chicken Roundup
//
//  Created by Ali Otondo on 8/26/19.
//  Copyright © 2019 Ali Otondo. All rights reserved.
//

import UIKit

extension UIView {
  enum Edge {
    case top
    case bottom
    case leading
    case trailing
  }
  
  func pinEdgesToParent(excluding edges: [Edge]) {
    var edgesIncluded: [Edge] = []
    if !edges.contains(.top) {
      edgesIncluded.append(.top)
    }
    if !edges.contains(.bottom) {
      edgesIncluded.append(.bottom)
    }
    if !edges.contains(.leading) {
      edgesIncluded.append(.leading)
    }
    if !edges.contains(.trailing) {
      edgesIncluded.append(.trailing)
    }
    pinEdgesToParent(including: edgesIncluded)
  }
  
  func pinEdgesToParent(including edges: [Edge] = [.top, .bottom, .leading, .trailing]) {
    guard let parent = superview else { return }
    
    if edges.contains(.top) {
      topAnchor.constraint(equalTo: parent.topAnchor).isActive = true
    }
    if edges.contains(.bottom) {
      bottomAnchor.constraint(equalTo: parent.bottomAnchor).isActive = true
    }
    if edges.contains(.leading) {
      leadingAnchor.constraint(equalTo: parent.leadingAnchor).isActive = true
    }
    if edges.contains(.trailing) {
      trailingAnchor.constraint(equalTo: parent.trailingAnchor).isActive = true
    }
  }
  
  func centerInParent() {
    guard let parent = superview else { return }
    
    centerXAnchor.constraint(equalTo: parent.centerXAnchor).isActive = true
    centerYAnchor.constraint(equalTo: parent.centerYAnchor).isActive = true
  }
}
