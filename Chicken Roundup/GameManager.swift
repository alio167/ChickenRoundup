//
//  GameManager.swift
//  Chicken Roundup
//
//  Created by clinic18 on 9/30/18.
//  Copyright © 2018 Ali Otondo. All rights reserved.
//

/*
 In this page::
 takes care of stuff done at each time interval
 takes care of chicken's random moving
 */

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
        // Check if a chicken is in a tree or out of bounds
        for chickenInt in 0..<scene.chickenArray.count {
            // Check if out of bounds
            var chickenPosition = scene.chickenArray[chickenInt].node.position
            let chickenWidth = scene.chickenArray[chickenInt].node.size.width
            let chickenHeight = scene.chickenArray[chickenInt].node.size.height
            let boundsResults = scene.outOfBounds(objectPosition: chickenPosition, width: chickenWidth, height: chickenHeight)
            if boundsResults.outOfBounds {
                // Stop the chicken
                scene.chickenArray[chickenInt].node.removeAllActions()
                
                // The chicken needs to be moved out of the tree. It's current position is saved as newX and newY
                var newX = scene.chickenArray[chickenInt].node.position.x
                var newY = scene.chickenArray[chickenInt].node.position.y
                
                // Find which direction the chicken needs go and by how much
                if boundsResults.direction == 1 {
                    // go left
                    newX -= boundsResults.distance
                } else if boundsResults.direction == 2 {
                    // go right
                    newX += boundsResults.distance
                } else if boundsResults.direction == 3 {
                    // go up
                    newY += boundsResults.distance
                } else if boundsResults.direction == 4 {
                    // go down
                    newY -= boundsResults.distance
                }
                
                // Move the chicken out of the tree
                let newPosition = CGPoint(x: newX, y: newY)
                scene.chickenArray[chickenInt].node.position = newPosition
                scene.chickenArray[chickenInt].position = newPosition
            }
            
            // Check if in a tree
            chickenPosition = scene.chickenArray[chickenInt].node.position
            let treeResults = scene.inTree(chickenPosition: chickenPosition)
            if treeResults.inTree {
                // Stop the chicken
                scene.chickenArray[chickenInt].node.removeAllActions()
                
                // The chicken needs to be moved out of the tree. It's current position is saved as newX and newY
                var newX = scene.chickenArray[chickenInt].node.position.x
                var newY = scene.chickenArray[chickenInt].node.position.y
                
                // Find which direction the chicken needs go and by how much
                if treeResults.direction == 1 {
                    // go left
                    newX -= treeResults.distance
                } else if treeResults.direction == 2 {
                    // go right
                    newX += treeResults.distance
                } else if treeResults.direction == 3 {
                    // go up
                    newY += treeResults.distance
                } else if treeResults.direction == 4 {
                    // go down
                    newY -= treeResults.distance
                }
                
                // Move the chicken out of the tree
                let newPosition = CGPoint(x: newX, y: newY)
                scene.chickenArray[chickenInt].node.position = newPosition
                scene.chickenArray[chickenInt].position = newPosition
            }

        }
        
        
        if nextTime == nil {
            nextTime = time + timeExtension
        } else {
            if time >= nextTime! {
                nextTime = time + timeExtension
                moveChickens()
                updateTimer()
            }
        }
    }
    
    // Checks if chickens need new targets
    private func moveChickens() {
        for chickenInt in 0..<scene.chickenArray.count {
            // Give the chicken a 1 in 10 chance of moving
            let random = CGFloat(arc4random_uniform(10))
            
            // Check if the chicken is already moving
            let targetPosition = scene.chickenArray[chickenInt].position
            let actualPosition = scene.chickenArray[chickenInt].node.position
            var moving = false
            if targetPosition != actualPosition {
                moving = true
            }
            
            if random == 0 && !moving {
                // Find target coordinates
                let targetX = CGFloat(arc4random_uniform(UInt32(scene.penRangeX))) + scene.penMinX
                let targetY = CGFloat(arc4random_uniform(UInt32(scene.penRangeY))) + scene.penMinY
                let targetPosition = CGPoint(x: targetX, y: targetY)
                
                // Create path from current position to target
                let targetPath = CGMutablePath()
                targetPath.move(to: actualPosition)
                targetPath.addLine(to: targetPosition)
                
                // Move chicken to target
                let move = SKAction.follow(targetPath, asOffset: false, orientToPath: false, speed: 50.0)
                scene.chickenArray[chickenInt].node.run(move)
                scene.chickenArray[chickenInt].position = CGPoint(x: targetX, y: targetY)
            }
        }
    }
}

func updateTimer() {
    
}
