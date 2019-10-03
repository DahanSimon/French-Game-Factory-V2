enum Role {
    case healer
    case attacker
}

enum Error: String {
    case outOfRange = "Please enter a value between 1 "
    case numericalValue = "Please enter a numerical value : "
    case emptyInput = "You need to type something :"
}
func printCharactersList(name: String) {
    var i = 1
    print("Please \(name) choose a character: \n")
    for character in  characterList{
        print("\(i)- \(character)")
        
        i += 1
    }
}


// Check if the user's input is an Int and if it is in the right range
func readInput(min: Int, max: Int) -> Int {
    let input = readLine()!
    //    Checking if the input is an Int
    if let isInt = Int(input){
        //        Checking if the input is in the range
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

func readStringInput() -> String {
    var string = readLine()!
    while string == "" {
        print(Error.emptyInput.rawValue)
        string = readLine()!
    }
    return string
}

func nextPlayer(playersName: String) {
    print("Hi \(playersName), can you please give the computer to the next player and press enter?")
    
    //    Waiting for the player to press enter to continue
    _ = readLine()
}


