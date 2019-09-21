class Game {
    let isOver = false
    let player1: Player
    let player2: Player
    init(player1Name: String, player2Name: String) {
        player1 = Player(playerName: player1Name)
        player2 = Player(playerName: player2Name)
    }
}
