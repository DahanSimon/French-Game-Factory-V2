func printCharactersList(name: String) {
    var i = 1
    print("Please \(name) choose a character: \n")
    for character in characterList {
            print("\(i)- \(character)")
       
        i += 1
    }
}


// This function checks if the name given to a character hasn't been already given to a member of the same team
func checkCaracterName(player: Player, choosedName: String) -> Bool{
//    Runnig through the array containing the player's team
            for characterName in player.team {
//                if the name already exist return false
                if characterName.name == choosedName {
                    return false
                }
            }
//    if the name doesn't exist return true
    return true

}


func printPlayersTeam(player: Player) {
    var i = 1
//    We print the players team by going threw the array
    for character in player.team {
        print("\(i)- \(character.name), is a \(type(of: character)), he has \(character.lifePoints), he can use his \(character.weapon.weaponName) and he is alive: \(character.isAlive)")
        i += 1
    }
}

//We check if the player lost by checking the isAlive attribut
func playerLost(player: Player) {
    var dead = 0
    for character in player.team {
        if character.isAlive == false {
            dead += 1
        }
    }
//    If all of the players team is dead the player lost
    if dead == 3 {
        player.won = false
    }
}

// Check if the user's input is an Int and if it is in the right range
func readInput(input: String, min: Int, max: Int) -> Int {
    
//    Checking if the input is an Int
    if let isInt = Int(input){
//        Checking if the input is in the range
        if isInt >= min && isInt <= max {
            return isInt - 1
        }
    }
    return -1
}


func printStats(winner: Player, looser: Player, lap: Int) {
    print("The party is over, \(winner.name) won ! In \(lap) laps.\n"
        +  "This is his team\n")
//    We print the winner's team and his character's lifePoints
    for character in winner.team {
            print(" - \(character.name)\t" + "\(character.lifePoints) ")
    }
    print("Against \(looser.name), this is his team :")
//    We print the loser's team
    for caracter in looser.team {
        print(" - \(caracter.name)\t")
    }
}

func nextPlayer(playersName: String) {
    print("Hi \(playersName), can you please give the computer to the next player and press enter?")
    
//    Waiting for the player to press enter to continue
    _ = readLine()
}

func magicBoxAppear(playingCharacter: Character) {
    print("Wait a minute what's that ?")
    _ = readLine()
    print("A box appeeared let's open it !")
    _ = readLine()
    
//    We pick a random number to choose random weapon
    let randomWeapon = Int.random(in: 0...3)
    if playingCharacter.role == "healer" {
//        if the playing character is using prayer
        if playingCharacter.weapon.weaponName == "Prayer" {
            print("Wow \(playingCharacter.name) found a Magic Bean !")
            _ = readLine()
            print("\(playingCharacter.name) is now using Magic Bean to heal his partners !")
            _ = readLine()
//            we change his weapon to magic Bean
            playingCharacter.weapon = magicBean
        }
//           if the playing character is using magic bean
        else {
            print("Wow \(playingCharacter.name) found a clerical colar !")
            _ = readLine()
            print("\(playingCharacter.name) is now praying to heal his partners !")
            _ = readLine()
//            we change his weapon to prayer
            playingCharacter.weapon = prayer
        }
    }
//       if the playing character is an attacker
    else {
        print("Wow \(playingCharacter.name) found a \(attackWeaponArray[randomWeapon].weaponName) !")
        print("\(playingCharacter.name) is now using \(attackWeaponArray[randomWeapon].weaponName) as weapon !")
//        We change his weapon to a random one 
        playingCharacter.weapon = attackWeaponArray[randomWeapon]
    }
}
