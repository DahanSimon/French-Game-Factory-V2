class Player {
    let name: String
    var team = [Character]() //CHaracter
    var won = true
    init(playerName: String) {
        self.name = playerName
    }
    
    
    func createTeam (player: Player) {
        
//        initalising a counter for the number of times a character has been added to the player's team
        var time = 0
        
//        A player can only have 3 member of his team so we keep asking for new member 3 times
        while time != 3 {
            
//            We print the list of character
            printCharactersList(name: player.name)
            
//            Printing how many character the player have to add to his team left
            print("\n\(3 - time) left")
            
//            Reading the Input
            let pickedCharacter = readLine()!
            
//            we check if the input is a number between 1 and 6
            let selectedCharacterIndex = readInput(input: pickedCharacter, min: 1, max: 6)
            
//            if the input is a number between 1 and 6
                if selectedCharacterIndex != -1 {
                    
//                    Asking for the name of the character
                    print("What name would you like to give to your character ?")
                    var pickedCharacterNewName = readLine()!
                    
//                    We check that the name has not been already given to someone in the same team
                    var check = checkCaracterName(player: player, choosedName: pickedCharacterNewName)
                    
//                    If the name has already been given to someone else we ask for a new name
                    while check == false {
                        if pickedCharacterNewName != "" {
                            print("This character already exist please choose another name ! (press to continue)")
                            _ = readLine()
                            print("Thank you now please enter an unused name: ")
                            pickedCharacterNewName = readLine()!
                            check = checkCaracterName(player: player, choosedName: pickedCharacterNewName)
                        }
                        else {
                            print("You can't leave a character nameless ! Please enter a new name: ")
                            pickedCharacterNewName = readLine()!
                            check = checkCaracterName(player: player, choosedName: pickedCharacterNewName)
                        }
                        
                    }
                    let newCharacter = selcectAndNameCharacter(pickedCharacter: selectedCharacterIndex + 1, newCharacterName: pickedCharacterNewName)
                    player.team.append(newCharacter)
                    time += 1
                }
                    
//              If the user entered something else than a number between 1 and 6 we start again
                else {
                    print("Please enter a number between 1 and 6. (press enter to continue)")
                     _ = readLine()
                }
        }
    }
    
//    Return a Charachter based on what type of character the user wantedd and give him the name the user wnated to
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
    
    func playing(player1: Player, player2: Player, lap: Int, randomNumber: Int) {
//        print(lap)
//        print(randomNumber)
        var playerTurnIsOver = false
        while playerTurnIsOver == false {
            print("\(player1.name) it's your turn ! Please select a character of your team to play with !")
            
//          We print the player's team
            printPlayersTeam(player: player1)
            
//            We read the input and check if it is valid
            let playingCharacterIndex = readInput(input: readLine()!, min: 1, max: 3)
            
//            if the input is valid and the character is not dead
            if playingCharacterIndex != -1 && player1.team[playingCharacterIndex].isAlive == true {
                let playingCharacter = player1.team[playingCharacterIndex]
                print("You choosed \(playingCharacter.name)")
                print("\(playingCharacter.name) can use \(playingCharacter.weapon.weaponName)")
                
//                If the character playing is an attacker
                if playingCharacter.role == "attacker" {
                    
//                    Check if we need to make the magic box appear
                    if lap == randomNumber {
//                        Make the magicBox appear and change the playing character's weapon
                        magicBoxAppear(playingCharacter: playingCharacter)
                    }
                    
//                    Asking wich character the user would like to attack
                    print("On wich member of \(player2.name)'s team would like to use \(playingCharacter.weapon.weaponName)")
                    
//                    We print the second player's team
                    printPlayersTeam(player: player2)
                    
 //            We read the input and check fi it is valid
                    let attackedCharacterIndex = readInput(input: readLine()!, min: 1, max: 3)
  //            if the input is valid and the character is not dead
                    if attackedCharacterIndex != -1 && player2.team[attackedCharacterIndex].isAlive == true {
                        let attackedCharacter = player2.team[attackedCharacterIndex]
                        
//                        We decrease the attacked character life Points
                        attackedCharacter.lifePoints -= playingCharacter.weapon.damageCapacity
                        print("\(playingCharacter.name) attacked \(attackedCharacter.name) with his \(playingCharacter.weapon.weaponName) and now \(attackedCharacter.name)'s lifepoint are down to \(attackedCharacter.lifePoints)")
                        
                        playerTurnIsOver = true
                        
//                    If the attacked character is dead
                        if attackedCharacter.lifePoints <= 0 {
                            player2.team[attackedCharacterIndex].isAlive = false
                        }
                    }
                        
//                  The entry is  not valid
                    else {
                        print("The character you choosed is already dead or you entered a wrong value try again (press enter to continue)")
                        _ = readLine()
                    }
                }
                    
//                If the character playing is a healer
                else {
                    
//                    Check if we need to make the magic box appear
                    if lap == randomNumber {
//                        Make the magicBox appear and change the playing character's weapon
                        magicBoxAppear(playingCharacter: playingCharacter)
                    }
//                    Asking wich character the user would like to heal
                    print("On wich member of your team would like to use \(playingCharacter.weapon.weaponName)")
                    printPlayersTeam(player: player1)
                    let healedCharacterIndex = readInput(input: readLine()!, min: 1, max: 3)
//            if the input is valid and the character is not dead
                    if healedCharacterIndex != -1 && player2.team[healedCharacterIndex].isAlive == true {
                        let healedCharacter = player1.team[healedCharacterIndex]
                        if healedCharacter.role != "healer" {
//                        We increase the healed character life Points
                            healedCharacter.lifePoints += playingCharacter.weapon.healingCapacity
                            print("\(playingCharacter.name) healed \(healedCharacter.name) with his \(playingCharacter.weapon.weaponName) and now \(healedCharacter.name)'s lifepoint are up to \(healedCharacter.lifePoints)")
                            playerTurnIsOver = true
                        }
                        else {
                            print("Sorry you can't heal a healer try again (press enter to continue)")
                            _ = readLine()
                        }
                        
                    }
                    else {
                        print("The character you choosed is already dead or you entered a wrong value try again (press enter to continue)")
                        _ = readLine()
                    }
                }
                
            }
            else {
                print("The character you choosed is already dead or you entered a wrong value try again (press enter to continue)")
                _ = readLine()
            }
        }
    }
}
