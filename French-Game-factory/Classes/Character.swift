class Character {
    let name: String
    let role: String
    var lifePoints: Int
    var weapon: Weapon
    var isAlive = true
    init(name: String, role: String, lifePoints: Int, weapon: Weapon) {
        self.name = name
        self.role = role
        self.lifePoints = lifePoints
        self.weapon = weapon
    }
}
