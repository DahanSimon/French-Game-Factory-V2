class Game {
    var isOver = false
    let player1: Player
    let player2: Player
    var lap = 1
    var magicChestRandomNumber: Int
    init(player1Name: String, player2Name: String) {
        player1 = Player(playerName: player1Name, id: 1)
        player2 = Player(playerName: player2Name, id: 2)
        magicChestRandomNumber = Int.random(in: lap...(lap + magicChestFrequency))
    }
    
    func playing() {
        var playerTurnIsOver = false
        
        var playingPlayer = player1
        var opponent = player2

//         We check which player is playing
        if self.lap % 2 == 0 {
            playingPlayer = player2
            opponent = player1
        }
        
        while playerTurnIsOver == false {
            
            print("\(playingPlayer.name) it's your turn ! Please select a character of your team to play with !")
//            The method selectCharacter ask the player to choose a character in his own team to play with
//            if this method return nil it means that every member of the playing player's team is dead and he lost
            guard let playingCharacter = selectCharacter(player: playingPlayer) else{
                return
            }
            print("You choosed \(playingCharacter.name)")
            print("\(playingCharacter.name) can use \(playingCharacter.weapon.weaponName)")
            
            if lap == self.magicChestRandomNumber {
                magicChestAppear(playingCharacter: playingCharacter)
            }
            if playingCharacter.role == Role.attacker {
                attackerPlaying(playingCharacter: playingCharacter, opponent: opponent)
                playerTurnIsOver = true
            }
            else {
                healerPlaying(playingCharacter: playingCharacter, player: playingPlayer)
                playerTurnIsOver = true
            }
        }
    }
    
    private func attackerPlaying(playingCharacter: Character, opponent: Player) {
 
        print("On which member of \(opponent.name)'s team would like to use \(playingCharacter.weapon.weaponName)")
        guard let attackedCharacter = selectCharacter(player: opponent) else {
            return
        }
        attackedCharacter.lifePoints -= playingCharacter.weapon.damageCapacity
        print("\(playingCharacter.name) attacked \(attackedCharacter.name) with his \(playingCharacter.weapon.weaponName) and now \(attackedCharacter.name)'s lifepoint are down to \(attackedCharacter.lifePoints)")
    }
    
    private func healerPlaying(playingCharacter: Character, player: Player) {
        guard let healedCharacter = selectCharacter(player: player) else{
            return
        }
        if healedCharacter.role != Role.healer {
            healedCharacter.lifePoints += playingCharacter.weapon.healingCapacity
            
            print("\(playingCharacter.name) healed \(healedCharacter.name) with his \(playingCharacter.weapon.weaponName) and now \(healedCharacter.name)'s lifepoint are up to \(healedCharacter.lifePoints)")
        }
        else {
            print("Sorry you can't heal a healer try again ")
            healerPlaying(playingCharacter: playingCharacter, player: player)
        }
    }
    
//    This method tries to create a dictionnary of the alive character of a player and if it can it asks the player to choose a character from the dictionnary it just created otherwise it return nil to make the playing method know that all the member of the player's team is dead
    private func selectCharacter(player: Player) -> Character?{
        var aliveCharacter: [Int: Character]
        aliveCharacter = createDictionnary(player: player)
        if aliveCharacter.count != 0 {
            printPlayersTeam(player: player)
            let playingCharacterIndex = readInput(min: 1, max: aliveCharacter.count)
            if let selectedCharacter = aliveCharacter[playingCharacterIndex] {
                return selectedCharacter
            }
        }
        return nil
    }
    
    func printStats(winner: Player, looser: Player) {
        print("The party is over, \(winner.name) won ! In \(self.lap) laps.\n"
            +  "\nThis is his team :")
        for character in winner.team.values {
            if character.lifePoints > 0 {
                print(" - \(character.name)\t" + "\(character.lifePoints) ")
            }
            else {
                print(" - \(character.name)\t" + " DEAD")
            }
            
        }
        print("\nAgainst \(looser.name), this is his team :")
        for caracter in looser.team.values {
            print(" - \(caracter.name)\t" + "DEAD")
        }
    }
    
    private func magicChestAppear(playingCharacter: Character) {
        print("Wait a minute what's that ?")
        _ = readLine()
        print("A Chest appeeared let's open it !")
        _ = readLine()
//      This line select randomly a number between 0 and 3 to select a weapon in the weapon array you can change the 3 to lower values to exclude weapon from being picked randomly
        let randomWeapon = attackWeaponArray[Int.random(in: 0...3)]
        if playingCharacter.role == Role.healer {
            if playingCharacter.weapon.weaponName == "Prayer" {
                print("Wow \(playingCharacter.name) found a Magic Bean !")
                _ = readLine()
                print("\(playingCharacter.name) is now using Magic Bean to heal his partners !")
                _ = readLine()
                playingCharacter.weapon = Weapon.magicBean()
            }
            else {
                print("Wow \(playingCharacter.name) found a clerical colar !")
                _ = readLine()
                print("\(playingCharacter.name) is now praying to heal his partners !")
                _ = readLine()
                playingCharacter.weapon = Weapon.prayer()
            }
        }
        else {
            print("Wow \(playingCharacter.name) found a \(randomWeapon.weaponName) !")
            print("\(playingCharacter.name) is now using \(randomWeapon.weaponName) as weapon !")
            playingCharacter.weapon = randomWeapon
        }
        let nextLap = self.lap + 1
        self.magicChestRandomNumber = Int.random(in: nextLap...(nextLap + abs(magicChestFrequency)))
    }    
    
    func printPlayersTeam(player: Player) {
        var i = 1
        for (character) in player.team.values {
            if character.lifePoints > 0 {
                print("\(i)- \(character.name), is a \(character.role), he has \(character.lifePoints) lifepoints, he can use his \(character.weapon.weaponName)")
                i += 1
            }
            
        }
    }
    
//    this method create a dictionnary of the alive character of a player's team and returns it
    private func createDictionnary(player: Player) -> [Int: Character] {
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
    
    func playerDidLost(player: Player){
        if player.won == true {
            print("\(player.name) lost !")
            if player.id == 1 {
                printStats(winner: self.player2, looser: player)
            }
            else {
                printStats(winner: self.player1, looser: player)
            }
            self.isOver = true
        }

    }
}
