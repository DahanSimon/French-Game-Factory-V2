
while true {
    print("Press enter to start the game !")
    _ = readLine()
    print("Hi you're the first player ! \nWhat's your name ?")
    let player1Name = readStringInput()
    nextPlayer(playersName: player1Name)
    
    print("Hi you're the second player ! \nWhat's your name ?")
    let player2Name = readStringInput()
    nextPlayer(playersName: player2Name)
    
    let game = Game(player1Name: player1Name, player2Name: player2Name)
    
    game.player1.createTeam()
    nextPlayer(playersName: game.player1.name)
    
    game.player2.createTeam()
    nextPlayer(playersName: game.player2.name)
    
    
    let magicBox = Int.random(in: 1...15)
    
    while game.isOver == false {
        
        game.playing(game: game, randomNumber: magicBox)
        game.lap += 1
        if game.player1.won == false {
            print("\(game.player1.name) lost !")
            game.printStats(winner: game.player2, looser: game.player1, lap: game.lap)
            game.isOver = true
            break
        }
        else if game.player2.won == false {
            print("\(game.player1.name) lost !")
            game.printStats(winner: game.player1, looser: game.player2, lap: game.lap)
            game.isOver = true
            break
        }
        if game.lap % 2 == 0 {
            nextPlayer(playersName: game.player1.name)
        }
        else {
            nextPlayer(playersName: game.player2.name)
        }
        
    }
}
