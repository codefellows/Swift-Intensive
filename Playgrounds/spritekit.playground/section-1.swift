// Playground - noun: a place where people can play

import Cocoa
import SpriteKit
import XCPlayground


var str = "Hello, playground"

var gameView = SKView(frame: NSRect(x: 0, y: 0, width: 200, height: 200))

var gameScene = SKScene(size: CGSizeMake(200, 200))
gameScene.backgroundColor = NSColor.blueColor()
gameView.presentScene(gameScene)

gameScene.physicsWorld.gravity = CGVectorMake(0.0,0.0)
var borderBody = SKPhysicsBody(edgeLoopFromRect: CGRectMake(0, 0, 200, 200))
gameScene.physicsBody = borderBody
gameScene.physicsBody.friction = 0.0

var ball = SKSpriteNode(imageNamed: "ball.png")
var anotherBall = SKSpriteNode(imageNamed: "ball.png")
ball.position = CGPoint(x: 50, y: 50)
ball.physicsBody = SKPhysicsBody(circleOfRadius: 5)
ball.physicsBody.restitution = 1.0
ball.physicsBody.friction = 0.0
ball.physicsBody.linearDamping = 0.0
gameScene.addChild(ball)
XCPShowView("GameView", gameView)

ball.physicsBody.applyImpulse(CGVectorMake(2.0, -3.0))

var paddle = SKSpriteNode(imageNamed: "paddle.png")
paddle.position = CGPoint(x: 100, y: 100)
gameScene.addChild(paddle)
paddle.physicsBody = SKPhysicsBody(rectangleOfSize: paddle.size)
paddle.physicsBody.restitution = 0.1
paddle.physicsBody.friction = 0.4
paddle.physicsBody.dynamic = false




