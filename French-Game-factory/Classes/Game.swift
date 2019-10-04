class Game {
    var isOver = false
    let player1: Player
    let player2: Player
    var lap = 1
    init(player1Name: String, player2Name: String) {
        player1 = Player(playerName: player1Name)
        player2 = Player(playerName: player2Name)
    }
    
    func playing(game: Game, randomNumber: Int) {
        var playerTurnIsOver = false
        
        var playingPlayer = player1
        var oponent = player2
        if game.lap % 2 == 0 {
            playingPlayer = player2
            oponent = player1
        }
        
        while playerTurnIsOver == false {
            
            print("\(playingPlayer.name) it's your turn ! Please select a character of your team to play with !")
            guard let playingCharacter = selectCharacter(player: playingPlayer) else{
                player1.won = false
                return
            }
            print("You choosed \(playingCharacter.name)")
            print("\(playingCharacter.name) can use \(playingCharacter.weapon.weaponName)")
            if lap == randomNumber {
//                        Make the magicBox appear and change the playing character's weapon
                magicBoxAppear(playingCharacter: playingCharacter)
            }
//                If the character playing character is an attacker
            if playingCharacter.role == Role.attacker {
                
                attackerPlaying(playingCharacter: playingCharacter, oponent: oponent)
                playerTurnIsOver = true
            }
                
            else {
                healerPlaying(playingCharacter: playingCharacter, player: playingPlayer)
                playerTurnIsOver = true
                
                
            }
        }
    }
    
    func attackerPlaying(playingCharacter: Character, oponent: Player) {
 
        print("On wich member of \(oponent.name)'s team would like to use \(playingCharacter.weapon.weaponName)")
        //                    Asking wich character the user would like to attack
        guard let attackedCharacter = selectCharacter(player: oponent) else {
//            if there is nothing to select it means that every member the oponent's team is dead so he lost
            oponent.won = false
            return
        }
        //                        We decrease the attacked character life Points
        attackedCharacter.lifePoints -= playingCharacter.weapon.damageCapacity
        print("\(playingCharacter.name) attacked \(attackedCharacter.name) with his \(playingCharacter.weapon.weaponName) and now \(attackedCharacter.name)'s lifepoint are down to \(attackedCharacter.lifePoints)")
    }
    
    func healerPlaying(playingCharacter: Character, player: Player) {
        //                    Asking wich character the user would like to heal
        guard let healedCharacter = selectCharacter(player: player) else{
            //            if there is nothing to select it means that every member the player's team is dead so he lost
            player.won = false
            return
        }
        if healedCharacter.role != Role.healer {
            //                        We increase the healed character life Points
            healedCharacter.lifePoints += playingCharacter.weapon.healingCapacity
            print("\(playingCharacter.name) healed \(healedCharacter.name) with his \(playingCharacter.weapon.weaponName) and now \(healedCharacter.name)'s lifepoint are up to \(healedCharacter.lifePoints)")
        }
        else {
            print("Sorry you can't heal a healer try again ")
            healerPlaying(playingCharacter: playingCharacter, player: player)
        }
    }
    
    func selectCharacter(player: Player) -> Character?{
        var aliveCharacter: [Int: Character]
        printPlayersTeam(player: player)
//        we create a dictionnary of only the alive character from the player's team
        aliveCharacter = createDictionnary(player: player)
//        if aliveCharcater is empty it means that every member of the player's team is dead so we don(t ask him to choose
        if aliveCharacter.count != 0 {
            let playingCharacterIndex = readInput(min: 1, max: aliveCharacter.count)
            if let selectedCharacter = aliveCharacter[playingCharacterIndex] {
                return selectedCharacter
            }
        }
        return nil
    }
    
    func printStats(winner: Player, looser: Player, lap: Int) {
        print("The party is over, \(winner.name) won ! In \(lap) laps.\n"
            +  "This is his team\n")
        //    We print the winner's team and his character's lifePoints
        for character in winner.team.values {
            if character.lifePoints > 0 {
                print(" - \(character.name)\t" + "\(character.lifePoints) ")
            }
            else {
                print(" - \(character.name)\t" + " DEAD")
            }
            
        }
        print("Against \(looser.name), this is his team :")
        //    We print the loser's team
        for caracter in looser.team.values {
            print(" - \(caracter.name)\t")
        }
    }
    
    func magicBoxAppear(playingCharacter: Character) {
        print("Wait a minute what's that ?")
        _ = readLine()
        print("A box appeeared let's open it !")
        _ = readLine()
        
        //    We pick a random number to choose random weapon
        let randomWeapon = attackWeaponArray[Int.random(in: 0...3)]
        print(randomWeapon.weaponName)
        if playingCharacter.role == Role.healer {
            //        if the playing character is using prayer
            if playingCharacter.weapon.weaponName == "Prayer" {
                print("Wow \(playingCharacter.name) found a Magic Bean !")
                _ = readLine()
                print("\(playingCharacter.name) is now using Magic Bean to heal his partners !")
                _ = readLine()
                //            we change his weapon to magic Bean
                playingCharacter.weapon = Weapon.magicBean()
            }
                //           if the playing character is using magic bean
            else {
                print("Wow \(playingCharacter.name) found a clerical colar !")
                _ = readLine()
                print("\(playingCharacter.name) is now praying to heal his partners !")
                _ = readLine()
                //            we change his weapon to prayer
                playingCharacter.weapon = Weapon.prayer()
            }
        }
            //       if the playing character is an attacker
        else {
            print("Wow \(playingCharacter.name) found a \(randomWeapon.weaponName) !")
            print("\(playingCharacter.name) is now using \(randomWeapon.weaponName) as weapon !")
            //        We change his weapon to a random one
            playingCharacter.weapon = randomWeapon
        }
    }    
    
    func printPlayersTeam(player: Player) {
        var i = 1
        //    We print the players team by going threw the array
        for (character) in player.team.values {
            if character.lifePoints > 0 {
                print("\(i)- \(character.name), is a \(character.role), he has \(character.lifePoints) lifepoints, he can use his \(character.weapon.weaponName)")
                i += 1
            }
            
        }
    }
    
    func createDictionnary(player: Player) -> [Int: Character] {
        var i = 1
        var aliveCharacter = [Int: Character]()
        for (character) in player.team.values {
            if character.lifePoints > 0 {
                aliveCharacter[i] = character
                i += 1
            }
            
        }
        return aliveCharacter
    }
}

let characterList = ["Name: Priest,role: Healer, lifePoints: 80, weapon: Prayer, Healing Capacity: 20",
                     "Name: Dartagnan, role: attacker, lifePoints: 100, weapon: sword, Damage Capacity: 25",
                     "Name: Baltazar, role: attacker, lifePoints: 150, weapon: bowAndArrow, Damage Capacity: 25",
                     "Name: Raziel, role: attacker, lifePoints: 100, weapon: flameThrower, Damage Capacity: 40",
                     "Name: Destroyer, role: attacker, lifePoints: 110, weapon: bazooka, Damage Capacity: 30",
                     "Name: Raphaello, role: healer, lifePoints: 30, weapon: magicBean, Healing Capacity: 100"]

let attackWeaponArray = [Weapon.bowAndArrow(), Weapon.flameThrower(), Weapon.bazooka(), Weapon.sword()]
