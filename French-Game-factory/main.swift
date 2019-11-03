
let characterList = ["Name: Priest,role: Healer, lifePoints: 80, weapon: Prayer, Healing Capacity: 20",
                      "Name: Dartagnan, role: attacker, lifePoints: 100, weapon: sword, Damage Capacity: 25",
                      "Name: Baltazar, role: attacker, lifePoints: 150, weapon: bowAndArrow, Damage Capacity: 25",
                      "Name: Raziel, role: attacker, lifePoints: 100, weapon: flameThrower, Damage Capacity: 40",
                      "Name: Destroyer, role: attacker, lifePoints: 110, weapon: bazooka, Damage Capacity: 30",
                      "Name: Raphaello, role: healer, lifePoints: 30, weapon: magicBean, Healing Capacity: 100"]

let attackWeaponArray = [Weapon.bowAndArrow(), Weapon.flameThrower(), Weapon.bazooka(), Weapon.sword(), Weapon.magicBean(), Weapon.prayer()]

var characterNames = [String]()

// Change this value to increase or decrease the frequency of occurrence of the magic chest
let magicChestFrequency = 8

while true {
    print("Press enter to start the game !")
    _ = readLine()
    
    let player1Name = presentation(player: 1)
    nextPlayer(playersName: player1Name)
    
    let player2Name = presentation(player: 2)
    nextPlayer(playersName: player2Name)
    
    let game = Game(player1Name: player1Name, player2Name: player2Name)
    
    game.player1.createTeam()
    nextPlayer(playersName: game.player1.name)
    
    game.player2.createTeam()
    nextPlayer(playersName: game.player2.name)
    
    while game.isOver == false {
        
        game.playing()
        game.lap += 1
        
        game.playerDidLost(player: game.player1)
        
        if game.isOver == false {
            
            game.playerDidLost(player: game.player2)
            
            if (game.lap % 2 == 0) && game.isOver == false {
                nextPlayer(playersName: game.player1.name)
            }
                
            else if (game.lap % 2 != 0) && game.isOver == false {
                nextPlayer(playersName: game.player2.name)
            }
        }
    }
}
