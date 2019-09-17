
var Characters = [""]
while true {
    print("\u{001B}[2J")
    print("Hi you're the first player ! \nWhat's your name ?")
    //    création du prmier joueur : player1
    let player1Name = readLine()!
    print("Hi \(player1Name), can you please give the computer to the next player and press enter?")
    readLine()
    print("Hi you're the second player ! \nWhat's your name ?")
    let player2Name = readLine()!
    print("Hi \(player2Name), can you please give the computer to \(player1Name) and press enter?")
    readLine()
    let game = Game(player1Name: player1Name, player2Name: player2Name)
    game.player1.createTeam(player: game.player1)
    printPlayersTeam(player: game.player1)

    game.player2.createTeam(player: game.player2)
    printPlayersTeam(player: game.player2)    //   Tant que tout personnges d'une même équipe ne sont pas mort
//    while game.isOver == false {
//        //        Le joueur1 commence a jouer
//        playing(player: player1, player2: player2)
//        //        On vérifie si les membres de l'équipe de joueur1 ne sont pas tous mort
//        isDead(player: player1, game: game)
//        //        On vérifie si les membres de l'équipe de joueur2 ne sont pas tous mort
//        isDead(player: player2, game: game)
//        //        Si aucune des 2 équipes n'a été décimé
//        if game.isOver == false {
//            //            c'est le tour de joueur 2
//            playing(player: player2, player2: player1)
//        }
//
//        laps += 1
//    }
//    //    La partie est terminé on affiche les stats, la partie est finie si c'est joueur1 ou joueur2 qui gagne
//    if player1.won == true{
//        stats(winner: player1,looser: player2,lap: laps)
//    }
//    else if player2.won == true {
//        stats(winner: player2, looser: player1, lap: laps)
//    }
}
