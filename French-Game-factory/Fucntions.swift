enum Role {
    case healer
    case attacker
}

enum Error: String {
    case outOfRange = "Please enter a value between 1 "
    case numericalValue = "Please enter a numerical value : "
    case emptyInput = "You need to type something :"
}

// When a player is creating his team this functions prints the list of Character that the player can choose from
func printCharactersList(name: String) {
    var i = 1
    print("Please \(name) choose a character: \n")
    for character in  characterList{
        print("\(i)- \(character)")
        
        i += 1
    }
}

// This functions checks if the input is a number and if it is between a define range
func readInput(min: Int, max: Int) -> Int {
    let input = readLine()!
    if let isInt = Int(input){
        if isInt >= min && isInt <= max {
            return isInt
        }
        else {
            print("\(Error.outOfRange.rawValue) and \(max) :")
            return readInput(min: min, max: max)
            
        }
    }
    else {
        print(Error.numericalValue.rawValue)
        return readInput(min: min, max: max)
    }
}

// This function check if the user did enter something
func readStringInput() -> String {
    var string = readLine()!
    while string == "" {
        print(Error.emptyInput.rawValue)
        string = readLine()!
    }
    return string
}

// This function ask the playing player to give the computer to the next player
func nextPlayer(playersName: String) {
    print("Hi \(playersName), can you please give the computer to the next player and press enter?")
    _ = readLine()
}

// This function ask the player's name 
func presentation(player: Int) -> String {
    print("Hi you're the player number \(player)! \nWhat's your name ?")
    let playerName = readStringInput()
    return playerName
}
