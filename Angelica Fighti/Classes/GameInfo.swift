//
//  GameInfo.swift
//  Angelica Fighti
//
//  Created by Guan Wong on 6/2/17.
//  Copyright © 2017 Wong. All rights reserved.
//

import Foundation
import SpriteKit


protocol GameInfoDelegate: AnyObject {
    var mainAudio:AVAudio {get}
    func addChild(_ sknode: SKNode)
    func changeGameState(_ state: GameState)
    func getCurrentToonNode() -> SKSpriteNode
}

class GameInfo: GameInfoDelegate {
    
    deinit {
        print ("GameInfo Class deinitiated!")
    }
    
    // Debug Variables
    fileprivate var counter:Int = 0 // only for debug - no purpose
    
    // Main Variables
    weak fileprivate var mainScene:SKScene?
    fileprivate var account:AccountInfo
    fileprivate var currentLevel:Int
    fileprivate var currentGold:Int  // tracking local current in-game
    fileprivate var currentHighscore:Int
    fileprivate var timer:Timer?
    fileprivate let infobar:Infobar
    
    // Secondary Variables
    fileprivate var wavesForNextLevel:Int = 10
    fileprivate var gamestate:GameState
    fileprivate var timePerWave:Double // time to call each wave
    
    // Extra Variables - Maybe need to be removed later on
    private var spawningDelay:Int = 0
    private var accountGoldLabel:HUD?
    
    // Public Variables
    var mainAudio:AVAudio
    var regularEnemy: EnemyModel
    var boss: EnemyModel
    var fireballEnemy: EnemyModel
    var map:Map?
    
    
     init(){
        mainAudio = AVAudio()
        currentLevel = 0
        currentGold = 0
        currentHighscore = 0
        account = AccountInfo()
        fireballEnemy = EnemyModel(type: .fireball)
        regularEnemy = EnemyModel(type: .regular)
        boss = EnemyModel(type: .boss)
        gamestate = .noState
        timePerWave = 3.0 // 3.0 is default
        infobar = Infobar(name: "infobar")
        // delegates
        regularEnemy.delegate = self
        boss.delegate = self
        fireballEnemy.delegate = self

    }
    
    func load(scene: SKScene) -> (Bool, String){
        mainScene = scene
        // play background music
        mainAudio.play(type: .Background_Start)
        if !account.load(){
            return (false, "account error")
        }
        // update infobar
        infobar.updateGoldBalanceLabel(balance: account.getGoldBalance())
        addChild(infobar)
        return createWalls(leftXBound: 0, rightXBound:screenSize.width, width: 50, height: screenSize.height)
    }
    
    private func createWalls(leftXBound:CGFloat, rightXBound:CGFloat, width:CGFloat, height:CGFloat) -> (Bool, String){
        guard let mainScene else{
            return (false, "mainScene is nil")
        }
        // create invisible wall        
        [
            WallData(name: "leftWall", edgeFrom: CGPoint(x: leftXBound, y: 0), to: CGPoint(x: leftXBound, y: screenSize.height)),
            WallData(name: "rightWall" ,edgeFrom: CGPoint(x: rightXBound, y: 0), to: CGPoint(x: rightXBound, y: screenSize.height))
        ]
            .map(createWall)
            .forEach {
                mainScene.addChild($0)
            }
        return (true, "No errors")
    }

    private func didFinishSpawningEnemy(){
        mainScene?.run(SKAction.sequence([SKAction.run { [weak self] in
            // update gamestate
            self?.changeGameState(.bossEncounter)
            // show boss incoming
        }, SKAction.wait(forDuration: 5), SKAction.run { [weak self] in
            guard let self, let mainScene = self.mainScene else { return }
            // summon boss
            self.boss.spawn(scene: mainScene)
        }]))
    }
    
    //  Only called when the gamestate is spawning. 
    //  This function is called every second.
    @objc private func running() {
        let random = randomInt(min: 0, max: 100)
        // Fireball
        if random < 10 {
          //  print("Fireball called with random: ", random)
            fireballEnemy.spawn(scene: mainScene!)
        }
    }
    
    private func updateGameState(){
        guard let mainScene else{
            print ("ERROR D00: Check updateGameState() from GameInfo")
            return
        }
        
        switch gamestate {
        case .start:
                // Load Map
            let map = Map(maps: global.getTextures(textures: .Map_Ragnarok), scene: mainScene)
            self.map = map
                // Cloud action
                let moveDownCloud = SKAction.moveTo(y: -screenSize.height*1.5, duration: 1)
                
                // Buildings Action
                let scaleAction = SKAction.scale(to: 0.7, duration: 0.3)
                let moveAction = SKAction.moveTo(y: screenSize.height/3, duration: 0.3)
            // TODO: move `main_menu_middle_root` to constant
                let buildingsAction = SKAction.sequence([SKAction.run(SKAction.group([scaleAction, moveAction]), onChildWithName: "main_menu_middle_root"), SKAction.wait(forDuration: 1.5), SKAction.run {
                    mainScene.removeChildren(
                        [
                            "main_menu_middle_root",
                            Global.Main.Main_Menu_Background_1.rawValue,
                            Global.Main.Main_Menu_Background_2.rawValue,
                            Global.Main.Main_Menu_Background_3.rawValue
                        ]
                    )
                    map.run()
                }])
                
            spawnClouds()
                .forEach {
                    mainScene.addChild($0)
                }
                
                // Running Actions
                infobar.fadeAway()
                
            mainScene.run(SKAction.sequence([
                SKAction.run(moveDownCloud, onChildWithName: Global.Main.StartCloud_1.rawValue + "0"),
                SKAction.wait(forDuration: 0.4), SKAction.run(moveDownCloud, onChildWithName: Global.Main.StartCloud_2.rawValue + "1"),
                SKAction.wait(forDuration: 0.4), SKAction.run(moveDownCloud, onChildWithName: Global.Main.StartCloud_1.rawValue + "2"),
                SKAction.wait(forDuration: 0.4), SKAction.run(moveDownCloud, onChildWithName: Global.Main.StartCloud_2.rawValue + "3")
            ]))
                
            mainScene.run(SKAction.sequence([
                buildingsAction,
                SKAction.wait(forDuration: 3),
                SKAction.run {
                    self.changeGameState(.spawning)
                },
                SKAction.wait(forDuration: 0.2),
                SKAction.run { [weak self] in
                    guard let self else {
                        return
                    }
                    let currentToon = self.account.getCurrentToon()
                    let sequence = SKAction.sequence([
                        SKAction.run {
                            self.addChild(currentToon.getBullet().shoot())
                        },
                        SKAction.wait(forDuration: 0.06)
                    ])
                    currentToon.getNode().run(SKAction.repeatForever(sequence))
                }
            ]))
        case .waitingState:
            regularEnemy.increaseDifficulty()
            fireballEnemy.increaseDifficulty()
            boss.increaseDifficulty()
            self.changeGameState(.spawning)
        case .spawning:
            print("Spawning")
            
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(running), userInfo: nil, repeats: true)
            
            wavesForNextLevel = randomInt(min: 5, max: 10)
            
            let action = SKAction.sequence([
                SKAction.run { [weak self] in
                    self?.regularEnemy.spawn(scene: mainScene)
                },
                SKAction.wait(forDuration: 3)
            ])
            
            //totalWaves
            //wavesForNextLevel
            let spawnAction = SKAction.repeat(action, count: wavesForNextLevel)
            let endAction = SKAction.run(didFinishSpawningEnemy)
            
            mainScene.run(SKAction.sequence([spawnAction, endAction]))
            
        case .bossEncounter:
            // use this state to cancel the timer - invalidate
            print("Boss Encounter")
            timer?.invalidate()
       
        default:
            print("Current State: ", gamestate)
        }
    }
    
    // Public Functions:
    internal func getCurrentToon() -> Toon{
        return account.getCurrentToon()
    }
    internal func getCurrentToonNode() -> SKSpriteNode{
       return account.getCurrentToon().getNode()
    }
    
    internal func requestCurrentToonIndex() -> Int{
        return account.getCurrentToonIndex()
    }
    
    internal func getCurrentToonBullet() -> Projectile{
        return account.getCurrentToon().getBullet()
    }
    
    internal func getToonBulletEmmiterNode(x px:CGFloat, y py:CGFloat) -> SKEmitterNode{
        return account.getCurrentToon().getBullet().generateTouchedEnemyEmitterNode(x: px, y: py)
    }
    internal func requestChangeToon(index: Int){
        self.account.selectToonIndex(index: index)
    }
    internal func requestToonDescription(index id:Int) -> [String]{
        return self.account.getToonDescriptionByIndex(index: id)
    }
    
    internal func requestToonName(index id:Int) -> String{
        return self.account.getNameOfToonByIndex(index: id)
    }
    
    internal func requestToonTitle(index id:Int) -> String{
        return self.account.getTitleOfToonByIndex(index: id)
    }
    
    internal func requestToonBulletLevel(index id:Int) -> Int{
        return self.account.getBulletLevelOfToonByIndex(index: id)
    }
    
    internal func requestUpgradeBullet() -> (Bool, String){
        let (success, response) = self.account.upgradeBullet()
        
        if success {
            self.infobar.updateGoldBalanceLabel(balance: self.account.getGoldBalance())
        }
        return (success, response)
    }
    
    internal func prepareToChangeScene(){
        boss.delegate = nil
        regularEnemy.delegate = nil
        fireballEnemy.delegate = nil
        mainAudio.stop()
        map?.prepareToChangeScene()
        timer?.invalidate()
    }
    
    // Maybe change this later to something like:
    // Enum CurrencyType: .Gold, .Diamond... etc
    internal func addCoin(amount:Int){
        currentGold += amount
        infobar.updateGoldLabel(coinCount: self.currentGold)
    }
    
    internal func getCurrentGold() -> Int{
        return self.currentGold
    }
    
    // delegate functions
    internal func addChild(_ sknode: SKNode){
        guard let mainScene else{
            print ("Error:: mainScene does not exist - check Gameinfo Class/ addChild Function")
            return
        }
        mainScene.addChild(sknode)
    }
    
    internal func changeGameState(_ state: GameState){
        gamestate = state
        updateGameState()
    }
    
}
