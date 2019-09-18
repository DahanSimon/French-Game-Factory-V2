class Player {
    var name: String
    var team = [Character]() //CHaracter
    var won = true
    init(playerName: String) {
        self.name = playerName
    }
    
    
    func createTeam (player: Player) {
        var time = 0
        while time != 3 {
            printCharactersList(name: player.name)
            print("\n\(3 - time) left")
            let pickedCharacter = readLine()!
            if let isInt = Int(pickedCharacter){
                if isInt >= 1 && isInt <= 6 {
                    print("What name would you like to give to your character ?")
                    var pickedCharacterNewName = readLine()!
                    var check = checkCaracterName(player: player, choosedName: pickedCharacterNewName)
                    while check == false {
                        print("This character already exist please choose another name ! (press to continue)")
                        readLine()
                        print("Thank you now please enter an unused name: ")
                        pickedCharacterNewName = readLine()!
                        check = checkCaracterName(player: player, choosedName: pickedCharacterNewName)
                    }
                    if check == true{
                        let newCharacter = selcectAndNameCharacter(pickedCharacter: isInt, newCharacterName: pickedCharacterNewName)
                        player.team.append(newCharacter)
                        time += 1
                    }
                }
                else {
                    print("Please enter a number between 1 and 6.")
                    readLine()
                }
            
            }
            else {
                print("Please enter a numeric value (press enter to continue))")
                readLine()
            }
        }
    }
    func selcectAndNameCharacter(pickedCharacter: Int, newCharacterName: String) -> Character {
        
        switch pickedCharacter {
        case 1:
            let newPriest = Priest(name: newCharacterName)
            return newPriest
        case 2:
            let newDartagnan = Dartagnan(name: newCharacterName)
            return newDartagnan
        case 3:
            let newBaltazar = Baltazar(name: newCharacterName)
            return newBaltazar
        case 4:
            let newRaziel = Raziel(name: newCharacterName)
            return newRaziel
        case 5:
            let newDestroyer = Destroyer(name: newCharacterName)
            return newDestroyer
        default:
            let newRaphaello = Raphaello(name: newCharacterName)
            return newRaphaello
        }
        
    }
    
    func playing(player1: Player, player2: Player) {
        var playerTurnIsOver = false
        while playerTurnIsOver == false {
            print("\(player1.name) it's your turn ! Please select a character of your team to play with !")
            printPlayersTeam(player: player1)
            let playingCharacterIndex = readInput(input: readLine()!, min: 1, max: 3)
            if playingCharacterIndex != -1 && player1.team[playingCharacterIndex].isAlive == true {
                let playingCharacter = player1.team[playingCharacterIndex]
                print("You choosed \(playingCharacter.name)")
                print("\(playingCharacter) can use \(playingCharacter.weapon.weaponName)")
                if playingCharacter.role == "attacker" {
                    print("On wich member of \(player2.name)'s team would like to use \(playingCharacter.weapon.weaponName)")
                    printPlayersTeam(player: player2)
                    let attackedCharacterIndex = readInput(input: readLine()!, min: 1, max: 3)
                    if attackedCharacterIndex != -1 && player2.team[attackedCharacterIndex].isAlive == true {
                        let attackedCharacter = player2.team[attackedCharacterIndex]
                        attackedCharacter.lifePoints -= playingCharacter.weapon.damageCapacity
                        playerTurnIsOver = true
                        if attackedCharacter.lifePoints <= 0 {
                            player2.team[attackedCharacterIndex].isAlive = false
                        }
                    }
                    else {
                        print("The character you choosed is already dead or you entered a wrong value try again (press enter to continue)")
                        readLine()
                    }
                }
                else {
                    print("On wich member of your team would like to use \(playingCharacter.weapon.weaponName)")
                    printPlayersTeam(player: player1)
                    let healedCharacterIndex = readInput(input: readLine()!, min: 1, max: 3)
                    if healedCharacterIndex != -1 && player2.team[healedCharacterIndex].isAlive == true {
                        let healedCharacter = player1.team[healedCharacterIndex]
                        if healedCharacter.role != "healer" {
                            healedCharacter.lifePoints += playingCharacter.weapon.healingCapacity
                            playerTurnIsOver = true
                        }
                        else {
                            print("Sorry you can't heal a heealer try again (press enter to continue)")
                            readLine()
                        }
                        
                    }
                    else {
                        print("The character you choosed is already dead or you entered a wrong value try again (press enter to continue)")
                        readLine()
                    }
                }
                
            }
            else {
                print("The character you choosed is already dead or you entered a wrong value try again (press enter to continue)")
                readLine()
            }
        }
    }
}
