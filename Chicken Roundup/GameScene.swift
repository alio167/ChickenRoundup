//
//  GameScene.swift
//  Chicken Roundup
//
//  Created by clinic18 on 9/30/18.
//  Copyright © 2018 Ali Otondo. All rights reserved.
//

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
    
    // Level specific?
    var currentLevel = 0
    
    // This function is called once GameScene has loaded
    override func didMove(to view: SKView) {
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
        let numStupidChickens = 0
        let numTrees = 0
        let numFences = 0
        let numCorn = 0
        
        let penMaxY = (frame.size.height / 2) - 140
        let penMinY = (frame.size.height / -2) + 150
        let penRangeY = penMaxY - penMinY
        let penMaxX = frame.size.width / 2
        let penMinX = frame.size.width / -2
        let penRangeX = penMaxX - penMinX
        
        // Place basic chickens
        for _ in 0..<numBasicChickens {
            //Initialize chicken
            let basicChicken: SKSpriteNode = SKSpriteNode(imageNamed: "Basic Chicken")
            basicChicken.size.height = 100
            basicChicken.size.width = 100
            basicChicken.zPosition = 4
            self.addChild(basicChicken)
            
            // Randomize location of chicken
            let randomX = CGFloat(arc4random_uniform(UInt32(penRangeY))) + penMinY
            let randomY = CGFloat(arc4random_uniform(UInt32(penRangeX))) + penMinX
            basicChicken.position = CGPoint(x: randomX, y: randomY)
            
        }
        
        // Place stupid chickens
        for _ in 0..<numStupidChickens {
            
        }
        
        // Place trees
        for _ in 0..<numTrees {
            
        }
        
        // Store fences
        
        // Store corn
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
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
