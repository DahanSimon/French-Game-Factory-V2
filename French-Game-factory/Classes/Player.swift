class Player {
    let name: String
    var team = [Int: Character]()
    var won = true
    init(playerName: String) {
        self.name = playerName
    }
    
    
    func createTeam() {
        
        //        initalising a counter for the number of times a character has been added to the player's team
        var time = 1
        
        //        A player can only have 3 member of his team so we keep asking for new member 3 times
        while time <= 3 {
            //            We print the list of character
            printCharactersList(name: self.name)
            
            //            Printing how many character the player have to add to his team left
            print("\n\(4 - time) left")
            
            //            we check if the input is a number between 1 and 6
            let selectedCharacterIndex = readInput(min: 1, max: characterList.count)
            //                    Asking for the name of the character
            print("What name would you like to give to your character ?")
            var pickedCharacterNewName = readStringInput()
            
            //                    We check that the name has not been already given to someone in the same team
            var check = checkCaracterName(player: self, choosedName: pickedCharacterNewName)
            
            //                    If the name has already been given to someone else we ask for a new name
            while check == false {
                print("This character already exist please choose another name ! Please enter an unused name: ")
                pickedCharacterNewName = readStringInput()
                check = checkCaracterName(player: self, choosedName: pickedCharacterNewName)
                
            }
            let newCharacter = selcectAndNameCharacter(pickedCharacter: selectedCharacterIndex, newCharacterName: pickedCharacterNewName)
            self.team[time] = newCharacter
            time += 1
        }
    }
    
    //    Return a Charachter based on what type of character the user wantedd and give him the name the user wnated to
    func selcectAndNameCharacter(pickedCharacter: Int, newCharacterName: String) -> Character {
        
        switch pickedCharacter {
        case 1:
            let newPriest = Character.Priest()
            newPriest.name = newCharacterName
            return newPriest
        case 2:
            let newDartagnan =  Character.Dartagnan()
            newDartagnan.name = newCharacterName
            return newDartagnan
        case 3:
            let newBaltazar = Character.Baltazar()
            newBaltazar.name = newCharacterName
            return newBaltazar
        case 4:
            let newRaziel = Character.Raziel()
            newRaziel.name = newCharacterName
            return newRaziel
        case 5:
            let newDestroyer = Character.Destroyer()
            newDestroyer.name = newCharacterName
            return newDestroyer
        default:
            let newRaphaello = Character.Raphaello()
            newRaphaello.name = newCharacterName
            return newRaphaello
        }
        
    }
    
    
    // This function checks if the name given to a character hasn't been already given to a member of the same team
    func checkCaracterName(player: Player, choosedName: String) -> Bool{
        //    Runnig through the array containing the player's team
        for characterName in player.team.values {
            //                if the name already exist return false
            if characterName.name == choosedName {
                return false
            }
        }
        //    if the name doesn't exist return true
        return true
        
    }
    
    
}
