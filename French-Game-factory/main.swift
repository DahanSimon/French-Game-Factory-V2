
while true {
//    print("\u{001B}[2J")
    
//    Asking name faor thee first Player
    print("Hi you're the first player ! \nWhat's your name ?")
    let player1Name = readLine()!
    
//    Asking player1 to pass the computer
    nextPlayer(playersName: player1Name)
    
    //    Asking name for second Player
    print("Hi you're the second player ! \nWhat's your name ?")
    let player2Name = readLine()!
    nextPlayer(playersName: player2Name)
    
//    Initialisation of the game (Creating 2 players with there names)
    let game = Game(player1Name: player1Name, player2Name: player2Name)
    
//    Player1 create his team (Choosing his characters and giving them names)
    game.player1.createTeam(player: game.player1)
    nextPlayer(playersName: game.player1.name)
    
//    Player2 create his team (Choosing his characters and giving them names)
    game.player2.createTeam(player: game.player2)
    nextPlayer(playersName: game.player2.name)
    
//    Game can start so no lap
    var lap = 0
    
//    Selecting random number to match the number of laps and make a magicBox appear
    let magicBox = Int.random(in: 1...15)
    
//    The game start
    while true {
//        print(magicBox)
        
//        Player1 is playing
        game.player1.playing(player1: game.player1, player2: game.player2, lap: lap, randomNumber: magicBox)
        
//        Since player1 is attacking Player2 we check if Player2's taem is not dead
        playerLost(player: game.player2)
        
//        One lap is done incrasing the counter
        lap += 1
        
//        if player2's team is not dead
        if game.player2.won != false {
//            print("\(game.player2.name): won: \(game.player2.won)")
            nextPlayer(playersName: game.player1.name)
            
//            Player2 plays
            game.player2.playing(player1: game.player2, player2: game.player1, lap: lap, randomNumber: magicBox)
            
//        Since player2 is attacking Player1 we check if Player2's taem is not dead
            playerLost(player: game.player1)
            
//        One lap is done incrasing the counter
            lap += 1
            
//            If player1 lost we print the stats of the game
            if game.player1.won == false {
                print("\(game.player2.name) lost !")
                printStats(winner: game.player2, looser: game.player1, lap: lap)
                break
            }
            nextPlayer(playersName: game.player2.name)
        }
//        player2 lost, wr print the stats
        else {
            print("\(game.player1.name) lost !")
            printStats(winner: game.player1, looser: game.player2, lap: lap)
            break
        }
    }
}
