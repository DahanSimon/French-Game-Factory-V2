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
    for character in player.team {
        print("\(character.name), is a \(type(of: character)), he has \(character.lifePoints), he can use his \(character.weapon)")
    }
}
