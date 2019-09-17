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
}
