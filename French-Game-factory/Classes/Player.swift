class Player {
    let name: String
    var team = [Int: Character]()
    var lost: Bool {
        var deadCount = 0
        for character in team.values {
            if character.lifePoints < 0 {
                deadCount += 1
            }
        }
        return deadCount == team.count
    }
    
    var characterNames: [String] {
        var namesArray = [String]()
        for character in team.values {
            namesArray.append(character.name)
        }
        return namesArray
    }
    let id: Int
    init(playerName: String, id : Int) {
        self.name = playerName
        self.id = id
    }
    
    func createTeam(unusableCharacterNames: [String]) {
        //        Change this value to increase or decreease the numbre of team members (Don't use negative number !)
        let teamMembers = 3
        
        var time = 1
        print("Hey \(self.name) You now need to create your team. You will have too pick 3 characters from a list.")
        _ = readLine()
        while time <= teamMembers {
            printCharactersList(name: self.name)
            
            print("\n\((teamMembers + 1) - time) left")
            
            let selectedCharacterIndex = readInput(min: 1, max: characterList.count)
            print("What name would you like to give to your character ?")
            var pickedCharacterNewName = readStringInput()
                                    
            while (characterNames + unusableCharacterNames).contains(pickedCharacterNewName) {
                print("This character already exist please choose another name ! Please enter an unused name: ")
                pickedCharacterNewName = readStringInput()
            }
            let newCharacter = selcectAndNameCharacter(pickedCharacter: selectedCharacterIndex, newCharacterName: pickedCharacterNewName)
            self.team[time] = newCharacter
            time += 1
        }
    }
    
    private func selcectAndNameCharacter(pickedCharacter: Int, newCharacterName: String) -> Character {
        
        switch pickedCharacter {
        case 1:
            return Healer(name: newCharacterName, lifePoints: 80, weapon: Weapon.prayer()) // Priest
        case 2:
            return Attacker(name: newCharacterName, lifePoints: 100, weapon: Weapon.sword()) // D'artagnan
        case 3:
            return Attacker(name: newCharacterName,lifePoints: 150, weapon: Weapon.bowAndArrow()) // Baltazar
        case 4:
            return Attacker(name: newCharacterName, lifePoints: 100, weapon: Weapon.flameThrower()) // Raziel
        case 5:
            return Attacker(name: newCharacterName, lifePoints: 110, weapon: Weapon.bazooka()) // Destroyer
        default:
            return Healer(name: newCharacterName, lifePoints: 30, weapon: Weapon.magicBean()) // Raphaello
        }
        
    }
    
    //    This method tries to create a dictionnary of the alive character of a player and if it can it asks the player to choose a character from the dictionnary it just created otherwise it return nil to make the playing method know that all the member of the player's team is dead
    func selectCharacter() -> Character?{
        var aliveCharacter: [Int: Character]
        aliveCharacter = createDictionnary()
        if aliveCharacter.count != 0 {
            printPlayersTeam()
            let playingCharacterIndex = readInput(min: 1, max: aliveCharacter.count)
            if let selectedCharacter = aliveCharacter[playingCharacterIndex] {
                print("You choosed \(selectedCharacter.name)")
                return selectedCharacter
            }
        }
        return nil
    }
    
    //    this method create a dictionnary of the alive character of a player's team and returns it
    private func createDictionnary() -> [Int: Character] {
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
                print("\(i)- \(character.name), is a \(type(of: character)), he has \(character.lifePoints) lifepoints, he can use his \(character.weapon.weaponName)")
                i += 1
            }
        }
    }
}
