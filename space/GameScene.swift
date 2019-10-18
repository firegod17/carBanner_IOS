//
//  GameScene.swift
//  SpaseS
//
//  Created by максим теодорович on 2/28/19.
//  Copyright © 2019 максим теодорович. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var starfield:SKEmitterNode!
    var player:SKSpriteNode!
    
    override func didMove(to view: SKView) {
        starfield = SKEmitterNode(fileNamed: "Starfield")
        starfield.position = CGPoint(x: 0, y: 1472)
        starfield.advanceSimulationTime(10)
        self.addChild(starfield)
        starfield.zPosition = -1
        
        player = SKSpriteNode(imageNamed: "shuttle")
        starfield.position = CGPoint(x: 0, y: -300)
        self.addChild(player)
        
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
