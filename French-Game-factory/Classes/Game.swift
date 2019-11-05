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
        var playingPlayer: Player {
            if self.lap % 2 == 0 {
                return player2
            }
            else {
                return player1
            }
        }
        var opponent: Player {
            if playingPlayer.id == 1 {
                return player2
            }
            else {
                return player1
            }
        }
        print("\(playingPlayer.name) it's your turn ! Please select a character of your team to play with !")
        //            The method selectCharacter ask the player to choose a character in his own team to play with
        //            if this method return nil it means that every member of the playing player's team is dead and he lost
        guard let playingCharacter = playingPlayer.selectCharacter() else{
            return
        }
        print("\(playingCharacter.name) can use \(playingCharacter.weapon.weaponName)")
        
        if lap == self.magicChestRandomNumber {
            magicChestAppear(playingCharacter: playingCharacter)
        }
        if playingCharacter.role == Role.attacker {
            playingCharacter.attackerPlaying(playingCharacter: playingCharacter, opponent: opponent)
        }
        else {
            playingCharacter.healerPlaying(playingCharacter: playingCharacter, player: playingPlayer)
        }
    }
    
    private func printStats(winner: Player, looser: Player) {
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
        if playingCharacter.role == Role.healer {
            healerGettingNewWeapon(playingCharacter: playingCharacter)
        }
        else {
            attackerGettingNewWeapon(playingCharacter: playingCharacter)
        }
        let nextLap = self.lap + 1
        self.magicChestRandomNumber = Int.random(in: nextLap...(nextLap + abs(magicChestFrequency)))
    }
    
    private func healerGettingNewWeapon(playingCharacter: Character) {
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
    
    private func attackerGettingNewWeapon(playingCharacter: Character) {
        //      This line select randomly a number between 0 and 3 to select a weapon in the weapon array you can change the 3 to lower values to exclude weapon from being picked randomly
        let randomWeapon = attackWeaponArray[Int.random(in: 0...3)]
        print("Wow \(playingCharacter.name) found a \(randomWeapon.weaponName) !")
        print("\(playingCharacter.name) is now using \(randomWeapon.weaponName) as weapon !")
        playingCharacter.weapon = randomWeapon
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
