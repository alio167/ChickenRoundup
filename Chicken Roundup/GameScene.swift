//
//  GameScene.swift
//  Chicken Roundup
//
//  Created by clinic18 on 9/30/18.
//  Copyright © 2018 Ali Otondo. All rights reserved.
//

/*
 In this page::
 declares objects
 sets pen dimentions
 initializes game
 adds level-specific info to scene
 deals with touches
 */

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    // Declare the game objects
    var backgroundImage: SKSpriteNode!
    var menuButton: SKSpriteNode!
    var objectsBar: SKShapeNode!
    var timerFrame: SKShapeNode!
    var timer: SKLabelNode!
    var game: GameManager!
    
    // Pen restrictions
    var penMaxY: CGFloat!
    var penMinY: CGFloat!
    var penRangeY: CGFloat!
    var penMaxX: CGFloat!
    var penMinX: CGFloat!
    var penRangeX: CGFloat!
    
    // Level specific
    var currentLevel = 0
    var chickenArray: [(node: SKSpriteNode, type: String, position: CGPoint)] = []
    var treeArray: [(node: SKSpriteNode, x: Int, y: Int)] = []
    var fenceArray: [(node: SKSpriteNode, x: Int, y: Int)] = []
    var cornArray: [(node: SKSpriteNode, x: Int, y: Int)] = []
    let chickenHeight: CGFloat = 100
    let chickenWidth: CGFloat = 70
    let treeHeight: CGFloat = 300
    let treeWidth: CGFloat = 250
    
    // Gesture recognition
    var previousTranslateX: CGFloat = 0.0
    var previousTranslateY: CGFloat = 0.0
    var selectedChicken: TouchableObject!
    var fingerOnNode: Bool = false
    
    // This function is called once GameScene has loaded
    override func didMove(to view: SKView) {
        // Set gesture recognition info
        let texture = SKTexture(imageNamed: "Basic Chicken")
        selectedChicken = TouchableObject(texture: texture, name: "none", id: -1)
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(self.handlePanFrom))
        view.addGestureRecognizer(panGestureRecognizer)
        
        
        // Set pen restrictions
        penMaxY = (frame.size.height / 2) - 140
        penMinY = (frame.size.height / -2) + 150
        penRangeY = penMaxY - penMinY
        penMaxX = (frame.size.width / 2) - 100
        penMinX = (frame.size.width / -2) + 100
        penRangeX = penMaxX - penMinX
        
        // Create the game frame
        game = GameManager(scene: self)
        initializeGameFrame()
        
        // Add level specific objects
        currentLevel = 1 // change depending on button selected
        initializeLevel()
    }
    
    // This function creates the game menu
    private func initializeGameFrame() {
        // Set background
        backgroundImage = SKSpriteNode(imageNamed: "Pen")
        backgroundImage.zPosition = 1
        // Scale background
        backgroundImage.size.height = frame.size.height
        backgroundImage.size.width = frame.size.width
        // Top corner of background matches top corner of screen
        backgroundImage.position = CGPoint(x: (frame.size.width / -2) - (backgroundImage.size.width / -2), y: (frame.size.height / 2) - (backgroundImage.size.height / 2))
        self.addChild(backgroundImage)
        
        // Initialize timerFrame
        let topLeft1 = CGPoint(x: -100, y: 40)
        let bottomLeft1 = CGPoint(x: -100, y: -40)
        let topRight1 = CGPoint(x: 100, y: 40)
        let bottomRight1 = CGPoint(x: 100, y: -40)
        let path1 = CGMutablePath()
        path1.addLine(to: topLeft1)
        path1.addLines(between: [topLeft1, bottomLeft1, bottomRight1, topRight1])
        timerFrame = SKShapeNode()
        timerFrame.name = "timerFrame"
        timerFrame.zPosition = 2
        timerFrame.position = CGPoint(x: 0, y: (frame.size.height / 2) - 70)
        timerFrame.fillColor = UIColor.red
        timerFrame.path = path1
        self.addChild(timerFrame)

        // Initialize timer
        timer = SKLabelNode(fontNamed: "ArielRoundedMTBold")
        timer.zPosition = 3
        timer.position = CGPoint(x: 0, y: timerFrame.position.y - 25)
        timer.fontSize = 60
        timer.text = "2:00"
        timer.fontColor = SKColor.black
        self.addChild(timer)

        // Initialize menu button
        menuButton = SKSpriteNode(imageNamed: "Menu")
        menuButton.size.height = 80
        menuButton.size.width = 80
        menuButton.zPosition = 2
        menuButton.position = CGPoint(x: (frame.size.width / 2) - 70, y: timerFrame.position.y)
        self.addChild(menuButton)

        // Initialize objects bar
        let topLeft2 = CGPoint(x: (frame.size.width / -2), y: 75)
        let bottomLeft2 = CGPoint(x: (frame.size.width / -2), y: -75)
        let topRight2 = CGPoint(x: (frame.size.width / 2), y: 75)
        let bottomRight2 = CGPoint(x: (frame.size.width / 2), y: -75)
        let path2 = CGMutablePath()
        path2.addLine(to: topLeft2)
        path2.addLines(between: [topLeft2, bottomLeft2, bottomRight2, topRight2])
        objectsBar = SKShapeNode()
        objectsBar.name = "timerFrame"
        objectsBar.zPosition = 2
        objectsBar.position = CGPoint(x: 0, y: (frame.size.height / -2) + 75)
        objectsBar.fillColor = UIColor(red: 56/255, green: 134/255, blue: 255/255, alpha: 1.0)
        objectsBar.path = path2
        self.addChild(objectsBar)
    }
    
    private func initializeLevel() {
        // Initialize level-specific objects
        let numBasicChickens = 3
        let numStupidChickens = 2
        let numTrees = 2
        let numFences = 0
        let numCorn = 0
        
        
        
        // Place trees
        for _ in 0..<numTrees {
            // Initialize tree
            let tree: SKSpriteNode = Tree()
            tree.size.height = treeHeight
            tree.size.width = treeWidth
            tree.zPosition = 5
            
            // Randomize location of tree making sure it is not out of bounds
            var randomX = CGFloat(arc4random_uniform(UInt32(penRangeX))) + penMinX
            var randomY = CGFloat(arc4random_uniform(UInt32(penRangeY))) + penMinY
            var treePosition = CGPoint(x: randomX, y: randomY)
            
            // Find results of location
            var boundsResults = outOfBounds(objectPosition: treePosition, width: treeWidth, height: treeHeight)
            while boundsResults.outOfBounds {
                // Update position
                randomX = CGFloat(arc4random_uniform(UInt32(penRangeX))) + penMinX
                randomY = CGFloat(arc4random_uniform(UInt32(penRangeY))) + penMinY
                treePosition = CGPoint(x: randomX, y: randomY)
                
                // Update results
                boundsResults = outOfBounds(objectPosition: treePosition, width: treeWidth, height: treeHeight)
            }
            tree.position = treePosition
            
            // Add to array of trees and game
            treeArray.append((node: tree, x: Int(randomX), y: Int(randomY)))
            self.addChild(tree)
        }
        
        // Place basic chickens
        for chickenNum in 0..<numBasicChickens {
            // Initialize chicken
            let basicChicken: SKSpriteNode = BasicChicken(id: chickenNum)
            basicChicken.size.height = chickenHeight
            basicChicken.size.width = chickenWidth
            basicChicken.zPosition = 4
            
            // Randomize location of chicken, making sure its not in the same place as the trees or out of bounds
            var randomX = CGFloat(arc4random_uniform(UInt32(penRangeX))) + penMinX
            var randomY = CGFloat(arc4random_uniform(UInt32(penRangeY))) + penMinY
            var chickenPosition = CGPoint(x: randomX, y: randomY)
            
            // Find results of location
            var boundsResults = outOfBounds(objectPosition: chickenPosition, width: chickenWidth, height: chickenHeight)
            var treeResults = inTree(chickenPosition: chickenPosition)
            while treeResults.inTree || boundsResults.outOfBounds {
                // Update position
                randomX = CGFloat(arc4random_uniform(UInt32(penRangeX))) + penMinX
                randomY = CGFloat(arc4random_uniform(UInt32(penRangeY))) + penMinY
                chickenPosition = CGPoint(x: randomX, y: randomY)
                
                // Update results
                boundsResults = outOfBounds(objectPosition: chickenPosition, width: chickenWidth, height: chickenHeight)
                treeResults = inTree(chickenPosition: chickenPosition)
            }
            basicChicken.position = chickenPosition
            
            // Add to array of chickens and game
            chickenArray.append((node: basicChicken, type: "basic", position: chickenPosition))
            self.addChild(basicChicken)
        }
        
        // Place stupid chickens
        for chickenNum in 0..<numStupidChickens {
            // Initialize chicken
            let stupidChicken: SKSpriteNode = StupidChicken(id: chickenNum)
            stupidChicken.size.height = chickenHeight
            stupidChicken.size.width = chickenWidth
            stupidChicken.zPosition = 4
            
            // Randomize location of chicken, making sure its not in the same place as the trees or out of bounds
            var randomX = CGFloat(arc4random_uniform(UInt32(penRangeX))) + penMinX
            var randomY = CGFloat(arc4random_uniform(UInt32(penRangeY))) + penMinY
            var chickenPosition = CGPoint(x: randomX, y: randomY)
            
            // Find results of location
            var boundsResults = outOfBounds(objectPosition: chickenPosition, width: chickenWidth, height: chickenHeight)
            var treeResults = inTree(chickenPosition: chickenPosition)
            while treeResults.inTree || boundsResults.outOfBounds {
                // Update position
                randomX = CGFloat(arc4random_uniform(UInt32(penRangeX))) + penMinX
                randomY = CGFloat(arc4random_uniform(UInt32(penRangeY))) + penMinY
                chickenPosition = CGPoint(x: randomX, y: randomY)
                
                // Update results
                boundsResults = outOfBounds(objectPosition: chickenPosition, width: chickenWidth, height: chickenHeight)
                treeResults = inTree(chickenPosition: chickenPosition)
            }
            stupidChicken.position = chickenPosition
            
            // Add to array of chickens and game
            chickenArray.append((node: stupidChicken, type: "stupid", position: chickenPosition))
            self.addChild(stupidChicken)
        }
        
        
        
        // Store fences
        
        // Store corn
    }
    
    func outOfBounds(objectPosition: CGPoint, width: CGFloat, height: CGFloat) -> (outOfBounds: Bool, direction: Int, distance: CGFloat) {
        let objectLeft = objectPosition.x - (width / 2)
        let objectRight = objectPosition.x + (width / 2)
        let objectBottom = objectPosition.y - (height / 2)
        let objectTop = objectPosition.y + (height / 2)
        
        var outOfBounds = false
        var direction = 0
        var distance: CGFloat = 0
        
        // Chicken too far left, right, down, or up
        if objectLeft < penMinX || objectRight > penMaxX || objectBottom < penMinY || objectTop > penMaxY {
            outOfBounds = true
            
            // Find direction chicken should move to get back in bounds
            let left = abs(objectRight - penMinX)
            let right = abs(objectLeft - penMaxX)
            let up = abs(objectBottom - penMaxY)
            let down = abs(objectTop - penMinY)
            
            // Find distance chicken should move to get back in bounds
            if left <= right && left <= up && left <= down {
                direction = 1
                distance = left + 1
            } else if right <= up && right <= down {
                direction = 2
                distance = right + 1
            } else if up <= down {
                direction = 3
                distance = up + 1
            } else {
                direction = 4
                distance = down + 1
            }
        }
        
        return (outOfBounds, direction, distance)
    }
    
    func inTree(chickenPosition: CGPoint) -> (inTree: Bool, direction: Int, distance: CGFloat) {
        let chickenLeft = chickenPosition.x - (chickenWidth / 2)
        let chickenRight = chickenPosition.x + (chickenWidth / 2)
        let chickenBottom = chickenPosition.y - (chickenHeight / 2)
        let chickenTop = chickenPosition.y + (chickenHeight / 2)
        
        var inTree = false
        var direction = 0
        var distance: CGFloat = 0
        for tree in treeArray {
            let treePosition = CGPoint(x: tree.x, y: tree.y)
            let treeLeft = treePosition.x - (treeWidth / 4)
            let treeRight = treePosition.x + (treeWidth / 4)
            let treeBottom = treePosition.y - (treeHeight / 2)
            let treeTop = treePosition.y
            
            // Check if chicken is inside the tree
            if (chickenLeft > treeLeft && chickenLeft < treeRight) ||
                (chickenRight > treeLeft && chickenRight < treeRight) {
                // either top or bottom in range, then chicken in tree
                if (chickenTop > treeBottom && chickenTop < treeTop) ||
                    (chickenBottom > treeBottom && chickenBottom < treeTop){
                    inTree = true
                    
                    // Find direction chicken should move to get out of tree
                    let left = abs(chickenRight - treeLeft)
                    let right = abs(chickenLeft - treeRight)
                    let up = abs(chickenBottom - treeTop)
                    let down = abs(chickenTop - treeBottom)
                    
                    // Find distance chicken should move to get out of tree
                    if left <= right && left <= up && left <= down {
                        direction = 1
                        distance = left + 1
                    } else if right <= up && right <= down {
                        direction = 2
                        distance = right + 1
                    } else if up <= down {
                        direction = 3
                        distance = up + 1
                    } else {
                        direction = 4
                        distance = down + 1
                    }
                }
            }
        }
        
        return (inTree, direction, distance)
    }
    
    
    ///// Gesture Recognition ///////
    @objc func handleTapFrom(recognizer: UITapGestureRecognizer) {
        
    }
    
    @objc func handlePanFrom(recognizer: UIPanGestureRecognizer) {
        print("in pan function")
        if recognizer.state == .began {
            // Get the starting location
            var touchLocation = recognizer.location(in: recognizer.view)
            touchLocation = self.convertPoint(fromView: touchLocation)
            print("gesture began")
            
            // Save the node being touched
            self.selectedNodeForTouch(touchLocation: touchLocation)
        } else if recognizer.state == .changed {
            // Get the translation
            var translation = recognizer.translation(in: recognizer.view!)
            translation = CGPoint(x: translation.x, y: -translation.y)
            
            // Move the chicken
            self.panForTranslation(translation: translation)
            recognizer.setTranslation(CGPoint(x: 0, y: 0), in: recognizer.view)
        } else if recognizer.state == .ended {
            //            if selectedNode.name != kAnimalNodeName {
            //                let scrollDuration = 0.2
            //                let velocity = recognizer.velocity(in: recognizer.view)
            //                let pos = selectedNode.position
            //
            //                // This just multiplies your velocity with the scroll duration.
            //                let p = CGPoint(x: velocity.x * CGFloat(scrollDuration), y: velocity.y * CGFloat(scrollDuration))
            //
            //                var newPos = CGPoint(x: pos.x + p.x, y: pos.y + p.y)
            //                newPos = self.boundLayerPos(newPos)
            //                selectedNode.removeAllActions()
            //
            //                let moveTo = SKAction.moveTo(newPos, duration: scrollDuration)
            //                moveTo.timingMode = .easeOut
            //                selectedNode.runAction(moveTo)
            //            }
        }
    }
    
    func selectedNodeForTouch(touchLocation: CGPoint) {
        // Finds the node at the touch location
        let touchedNode = self.atPoint(touchLocation)
        
        // Check if the node is a touchable object
        if touchedNode is TouchableObject {
            // Check if the node is not the same as the previously selected node
            print("touching chicken")
            if !(selectedChicken == touchedNode as? TouchableObject) {
                // Reset the selected node's actions
                selectedChicken.removeAllActions()
                selectedChicken = touchedNode as? TouchableObject
                print("new chicken")
            }
        }
    }
    
    func panForTranslation(translation: CGPoint) {
        let position = selectedChicken.position // error: unexpectedly found nil when unwrapping an optional value
        selectedChicken.position = CGPoint(x: position.x + translation.x, y: position.y + translation.y)
    }
    
    
    
    
    
    
    func touchDown(atPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.green
//            self.addChild(n)
//        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.blue
//            self.addChild(n)
//        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.red
//            self.addChild(n)
//        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        
//        if let label = self.label {
//            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
//        }
//
//        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    // This function is called before each frame is rendered.
    override func update(_ currentTime: TimeInterval) {
        game.update(time: currentTime)
    }
}
