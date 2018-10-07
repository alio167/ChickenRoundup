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
    var backgroundImage: SKSpriteNode!
    var menuButton: SKSpriteNode!
    var objectsBar: SKShapeNode!
    var levelsText: SKLabelNode!
    var timerFrame: SKShapeNode!
    var timer: SKLabelNode!
    
    
    // This function is called once GameScene has loaded
    override func didMove(to view: SKView) {
        // Create the game frame
        initializeGameFrame()
        
        // Add level specific objects
        initializeLevel()
    }
    
    // This function creates the game menu
    private func initializeGameFrame() {
        // Set background
        backgroundImage = SKSpriteNode(imageNamed: "Pen")
        backgroundImage.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        self.addChild(backgroundImage)
        
        // Initialize timerFrame
        let topLeft1 = CGPoint(x: -300, y: 50)
        let bottomLeft1 = CGPoint(x: -300, y: -50)
        let topRight1 = CGPoint(x: 300, y: 50)
        let bottomRight1 = CGPoint(x: 300, y: -50)
        let path1 = CGMutablePath()
        path1.addLine(to: topLeft1)
        path1.addLines(between: [topLeft1, bottomLeft1, bottomRight1, topRight1])
        timerFrame = SKShapeNode()
        timerFrame.name = "timerFrame"
        timerFrame.zPosition = 1
        timerFrame.position = CGPoint(x: 0, y: (frame.size.height / -2) + 200)
        timerFrame.fillColor = UIColor.red
        timerFrame.path = path1
        self.addChild(timerFrame)
        
        // Initialize timer
        timer = SKLabelNode(fontNamed: "ArielRoundedMTBold")
        timer.zPosition = 2
        timer.position = CGPoint(x: 0, y: timerFrame.position.y - 15)
        timer.fontSize = 40
        timer.text = "2:00"
        timer.fontColor = SKColor.black
        self.addChild(timer)
        
        // Initialize menu button
        menuButton = SKSpriteNode(imageNamed: "Pen")
        menuButton.position = CGPoint(x: (frame.size.width / -2) + 100, y: frame.size.height / 2)
        self.addChild(menuButton)
        
        
        // Initialize objects bar
        let topLeft2 = CGPoint(x: -300, y: 50)
        let bottomLeft2 = CGPoint(x: -300, y: -50)
        let topRight2 = CGPoint(x: 300, y: 50)
        let bottomRight2 = CGPoint(x: 300, y: -50)
        let path2 = CGMutablePath()
        path2.addLine(to: topLeft2)
        path2.addLines(between: [topLeft2, bottomLeft2, bottomRight2, topRight2])
        objectsBar = SKShapeNode()
        objectsBar.name = "timerFrame"
        objectsBar.zPosition = 1
        objectsBar.position = CGPoint(x: 0, y: frame.size.height / 2)
        objectsBar.fillColor = UIColor.blue
        objectsBar.path = path2
        self.addChild(objectsBar)
        
    }
    
    private func initializeLevel() {
        
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
