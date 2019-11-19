
let characterList = ["Name: Priest,role: Healer, lifePoints: 80, weapon: Prayer, Healing Capacity: 20",
                      "Name: Dartagnan, role: attacker, lifePoints: 100, weapon: sword, Damage Capacity: 25",
                      "Name: Baltazar, role: attacker, lifePoints: 150, weapon: bowAndArrow, Damage Capacity: 25",
                      "Name: Raziel, role: attacker, lifePoints: 100, weapon: flameThrower, Damage Capacity: 40",
                      "Name: Destroyer, role: attacker, lifePoints: 110, weapon: bazooka, Damage Capacity: 30",
                      "Name: Raphaello, role: healer, lifePoints: 30, weapon: magicBean, Healing Capacity: 100"]

let weaponArray = [Weapon.bowAndArrow(), Weapon.flameThrower(), Weapon.bazooka(), Weapon.sword(), Weapon.magicBean(), Weapon.prayer()]


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
    
    game.player1.createTeam(unusableCharacterNames: [])
    nextPlayer(playersName: game.player1.name)
    
    game.player2.createTeam(unusableCharacterNames: game.player1.characterNames)
    nextPlayer(playersName: game.player2.name)
    
    while game.isOver == false {
        
        game.playing()
        game.lap += 1
        
        if game.player1.lost == true {
            game.printStats(winner: game.player2, looser: game.player1)
        }
        else if game.player2.lost == true {
            game.printStats(winner: game.player1, looser: game.player2)
        }
        
        if game.isOver == false {
            
            if (game.lap % 2 == 0) && game.isOver == false {
                nextPlayer(playersName: game.player1.name)
            }
                
            else if (game.lap % 2 != 0) && game.isOver == false {
                nextPlayer(playersName: game.player2.name)
            }
        }
    }
}
