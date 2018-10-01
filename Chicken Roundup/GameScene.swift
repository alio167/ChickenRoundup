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
    // Declare the menu objects
    var gameTitle1: SKLabelNode!        // "Chicken"
    var gameTitle2: SKLabelNode!        // "Roundup"
    var chickenImage: SKSpriteNode!
    var levelsButton: SKShapeNode!
    var levelsText: SKLabelNode!
    var instructionsButton: SKShapeNode!
    var instructionsText: SKLabelNode!
    
    
    // This function is called once GameScene has loaded
    override func didMove(to view: SKView) {
        // Create the game menu
        initializeMenu()
    }
    
    // This function creates the game menu
    private func initializeMenu() {
        
        self.backgroundColor = UIColor(red: 56.0/255, green: 134.0/255, blue: 255.0/255, alpha: 1.0)
        
        // Initialize gameTitle1 and add it to GameScene
        gameTitle1 = SKLabelNode(fontNamed: "ArielRoundedMTBold")
        gameTitle1.zPosition = 1
        gameTitle1.position = CGPoint(x: 0, y: (frame.size.height / 2) - 250)
        gameTitle1.fontSize = 100
        gameTitle1.text = "Chicken"
        gameTitle1.fontColor = SKColor.black
        self.addChild(gameTitle1)
        
        // Initialize chickenImage and add it to GameScene
        chickenImage = SKSpriteNode(imageNamed: "Basic Chicken")
        chickenImage.zPosition = 1
        chickenImage.position = CGPoint(x: 0, y: gameTitle1.position.y - 200)
        chickenImage.run(SKAction.scale(to: 5, duration: 0))
        self.addChild(chickenImage)
        
        // Initialize gameTitle2 and add it to GameScene
        gameTitle2 = SKLabelNode(fontNamed: "ArielRoundedMTBold")
        gameTitle2.zPosition = 1
        gameTitle2.position = CGPoint(x: 0, y: chickenImage.position.y - 250)
        gameTitle2.fontSize = 100
        gameTitle2.text = "Roundup"
        gameTitle2.fontColor = SKColor.black
        self.addChild(gameTitle2)
        
        // Make square button shape
        let topLeft = CGPoint(x: -300, y: 50)
        let bottomLeft = CGPoint(x: -300, y: -50)
        let topRight = CGPoint(x: 300, y: 50)
        let bottomRight = CGPoint(x: 300, y: -50)
        let path = CGMutablePath()
        path.addLine(to: topLeft)
        path.addLines(between: [topLeft, bottomLeft, bottomRight, topRight])
        
        // Initialize instructionsButton
        instructionsButton = SKShapeNode()
        instructionsButton.name = "instructionsButton"
        instructionsButton.zPosition = 1
        instructionsButton.position = CGPoint(x: 0, y: (frame.size.height / -2) + 200)
        instructionsButton.fillColor = UIColor(red: 156.0/255, green: 210.0/255, blue: 255.0/255, alpha: 1.0)
        instructionsButton.path = path
        self.addChild(instructionsButton)
        
        // Initialize instructionsText
        instructionsText = SKLabelNode(fontNamed: "ArielRoundedMTBold")
        instructionsText.zPosition = 2
        instructionsText.position = CGPoint(x: 0, y: instructionsButton.position.y - 15)
        instructionsText.fontSize = 40
        instructionsText.text = "Instructions"
        instructionsText.fontColor = SKColor.black
        self.addChild(instructionsText)
        
        
        // Initialize levelsButton
        levelsButton = SKShapeNode()
        levelsButton.name = "levelsButton"
        levelsButton.zPosition = 1
        levelsButton.position = CGPoint(x: 0, y: instructionsButton.position.y + 150)
        levelsButton.fillColor = UIColor(red: 156.0/255, green: 210.0/255, blue: 255.0/255, alpha: 1.0)
        levelsButton.path = path
        self.addChild(levelsButton)
        
        // Initialize levelsText
        levelsText = SKLabelNode(fontNamed: "ArielRoundedMTBold")
        levelsText.zPosition = 2
        levelsText.position = CGPoint(x: 0, y: levelsButton.position.y - 15)
        levelsText.fontSize = 40
        levelsText.text = "Levels"
        levelsText.fontColor = SKColor.black
        self.addChild(levelsText)
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
