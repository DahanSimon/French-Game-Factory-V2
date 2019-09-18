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
        print("\(i)- \(character.name), is a \(type(of: character)), he has \(character.lifePoints), he can use his \(character.weapon.weaponName) and he is alive: \(character.isAlive)")
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
    print("dead: \(dead)")
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


func printStats(winner: Player, looser: Player, lap: Int) {
    print("La partie est terminé \(winner.name) a gagné ! En \(lap) tours.\n"
        +  "Voici son équipe :\n")
    for character in winner.team {
            print(" - \(character.name)\t" + "\(character.lifePoints) ")
    }
    print("Contre \(looser.name), voici son équipe :")
    for caracter in looser.team {
        print(" - \(caracter.name)\t")
    }
}
