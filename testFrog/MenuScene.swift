//
//  MenuScene.swift
//  testFrog
//
//  Created by suding on 2021/12/17.
//

import Foundation
import SpriteKit

class MenuScene: SKScene {
    
    var background = SKSpriteNode()
    
    override func didMove(to view: SKView) {
      
        if arc4random() % 2 == 0 {
            background = SKSpriteNode(imageNamed: "skymountain")
        } else {
            background = SKSpriteNode(imageNamed: "sky4")
        }
        
       var background = SKSpriteNode()
        background = SKSpriteNode(imageNamed: "sky4")
        background.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        background.zPosition = 0
       // background.setScale(0.5)
        
        self.addChild(background)
        
        
        let titleLabel = SKSpriteNode(imageNamed: "titleLabel")
        titleLabel.position = CGPoint(x: self.size.width / 2, y: self.size.height * 0.7)
        titleLabel.size = CGSize(width: 280, height:  120)
        titleLabel.zPosition = 1
        self.addChild(titleLabel)
        
        
        let playBtn = SKSpriteNode(imageNamed: "start")
        playBtn.name = "playButton"
        playBtn.position = CGPoint(x: self.size.width / 2, y: self.size.height * 0.3)
        playBtn.size = CGSize(width: 250, height:  90)
        playBtn.zPosition = 1
        self.addChild(playBtn)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if let location = touch?.location(in: self) {
                let nodesArray = self.nodes(at: location)
                if nodesArray.first?.name == "playButton" {
                    let scene = GameScene(size: self.size)
                    
                    // gamescene에서 만든 background를 전달함 
                    scene.background = self.background
                    scene.scaleMode = .aspectFill
                    self.view?.presentScene(scene)
                }
            }
        
    }
}
