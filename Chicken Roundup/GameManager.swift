//
//  GameManager.swift
//  Chicken Roundup
//
//  Created by clinic18 on 9/30/18.
//  Copyright © 2018 Ali Otondo. All rights reserved.
//

import SpriteKit

class GameManager {
    var scene: GameScene!
    var nextTime: Double?
    var timeExtension: Double = 0.15
    
    init(scene: GameScene) {
        self.scene = scene
    }
}
