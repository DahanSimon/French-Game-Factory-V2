class Player {
    let name: String
    var team = [Int: Character]()
    var won: Bool {
        var deadCount = 0
        for character in team.values {
            if character.lifePoints < 0 {
                deadCount += 1
            }
        }
        return deadCount == team.count
    }
    let id: Int
    init(playerName: String, id : Int) {
        self.name = playerName
        self.id = id
    }
    
    
    func createTeam() {
        
        var time = 1
        
        print("Hey \(self.name) You now need to create your team. You will have too pick 3 characters from a list.")
        _ = readLine()
        while time <= 3 {
            printCharactersList(name: self.name)
            
            print("\n\(4 - time) left")
            
            let selectedCharacterIndex = readInput(min: 1, max: characterList.count)
            print("What name would you like to give to your character ?")
            var pickedCharacterNewName = readStringInput()
            
            var check = checkCaracterName(player: self, choosedName: pickedCharacterNewName)
            
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
    
    private func selcectAndNameCharacter(pickedCharacter: Int, newCharacterName: String) -> Character {
        
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
    
    
    private func checkCaracterName(player: Player, choosedName: String) -> Bool{
        for characterName in player.team.values {
            if characterName.name == choosedName {
                return false
            }
        }
        return true
        
    }
    
    
}
