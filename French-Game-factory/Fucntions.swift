func printCharactersList(name: String) {
    var i = 1
    print("Please \(name) choose a character: \n")
    for character in characterList {
            print("\(i)- \(character)")
       
        i += 1
    }
}



func checkCaracterName(player: Player, choosedName: String) -> Bool{
            for characterName in player.team {
                if characterName.name == choosedName {
                    return false
                }
            }
    return true

}


func printPlayersTeam(player: Player) {
    var i = 1
    for character in player.team {
        print("\(i)- \(character.name), is a \(type(of: character)), he has \(character.lifePoints), he can use his \(character.weapon)")
        i += 1
    }
}


func playerLost(player: Player) {
    var dead = 0
    for character in player.team {
        if character.isAlive == false {
            dead += 1
        }
    }
    if dead == 3 {
        player.won = false
    }
}

func readInput(input: String, min: Int, max: Int) -> Int {
    if let isInt = Int(input){
        if isInt >= min && isInt <= max {
            return isInt - 1
        }
    }
    return -1
}
