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
            
            var check = checkCaracterName(choosedName: pickedCharacterNewName)
            
            while check == false {
                print("This character already exist please choose another name ! Please enter an unused name: ")
                pickedCharacterNewName = readStringInput()
                check = checkCaracterName(choosedName: pickedCharacterNewName)
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
    
    
    private func checkCaracterName(choosedName: String) -> Bool{
        for name in characterNames {
            if name == choosedName {
                return false
            }
        }
        characterNames.append(choosedName)
        return true
    }
    
    
    //    This method tries to create a dictionnary of the alive character of a player and if it can it asks the player to choose a character from the dictionnary it just created otherwise it return nil to make the playing method know that all the member of the player's team is dead
    
    func selectCharacter() -> Character?{
        var aliveCharacter: [Int: Character]
        aliveCharacter = createDictionnary()
        if aliveCharacter.count != 0 {
            printPlayersTeam()
            let playingCharacterIndex = readInput(min: 1, max: aliveCharacter.count)
            if let selectedCharacter = aliveCharacter[playingCharacterIndex] {
                return selectedCharacter
            }
        }
        return nil
    }
    
    
    //    this method create a dictionnary of the alive character of a player's team and returns it
    func createDictionnary() -> [Int: Character] {
        var i = 1
        var aliveCharacter = [Int: Character]()
        for (character) in self.team.values {
            if character.lifePoints > 0 {
                aliveCharacter[i] = character
                i += 1
            }
            
        }
        return aliveCharacter
    }
    
    func printPlayersTeam() {
        var i = 1
        for (character) in self.team.values {
            if character.lifePoints > 0 {
                print("\(i)- \(character.name), is a \(character.role), he has \(character.lifePoints) lifepoints, he can use his \(character.weapon.weaponName)")
                i += 1
            }
            
        }
    }
    
    
}
