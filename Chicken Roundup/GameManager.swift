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
    var timeExtension: Double = 1.0
    
    init(scene: GameScene) {
        self.scene = scene
    }
    
    // Updates movement of chickens
    func update(time: Double) {
        if nextTime == nil {
            nextTime = time + timeExtension
        } else {
            if time >= nextTime! {
                nextTime = time + timeExtension
                moveChickens()
            }
        }
    }
    
    // Checks if chickens need new targets
    private func moveChickens() {
        for chickenInt in 0..<scene.chickenArray.count {
            let random = CGFloat(arc4random_uniform(10))
            var moving = false
            
            // check if the chicken is moving
            let chickenPosition = CGPoint(x: scene.chickenArray[chickenInt].x, y: scene.chickenArray[chickenInt].y)
            let actualPosition = scene.chickenArray[chickenInt].node.position
            if chickenPosition != actualPosition {
                moving = true
            }
            
            if random == 0 && !moving {
                // Find target coordinates
                let targetX = CGFloat(arc4random_uniform(UInt32(scene.penRangeX))) + scene.penMinX
                let targetY = CGFloat(arc4random_uniform(UInt32(scene.penRangeY))) + scene.penMinY
                let targetPosition = CGPoint(x: targetX, y: targetY)
                
                // Create path from current position to target
                let targetPath = CGMutablePath()
                targetPath.move(to: chickenPosition)
                targetPath.addLine(to: targetPosition)
                
                // Move chicken to target
                let move = SKAction.follow(targetPath, asOffset: false, orientToPath: false, speed: 40.0)
                scene.chickenArray[chickenInt].node.run(move)
                scene.chickenArray[chickenInt].x = Int(targetX)
                scene.chickenArray[chickenInt].y = Int(targetY)
            }
        }
    }
}
