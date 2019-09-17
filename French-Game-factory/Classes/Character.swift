class Character {
    var name: String
    let role: String
    let lifePoints: Int
    let weapon: Weapon
    let isAlive = true
    init(name: String, role: String, lifePoints: Int, weapon: Weapon) {
        self.name = name
        self.role = role
        self.lifePoints = lifePoints
        self.weapon = weapon
    }
}
