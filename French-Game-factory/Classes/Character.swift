class Character {
    var name: String
    let role: Role
    var lifePoints: Int
    var weapon: Weapon
    init(name: String, role: Role, lifePoints: Int, weapon: Weapon) {
        self.name = name
        self.role = role
        self.lifePoints = lifePoints
        self.weapon = weapon
    }
    static func Priest() -> Character {
        return Character(name: "Priest", role: .healer, lifePoints: 80, weapon: Weapon.prayer())
    }
    static func Dartagnan() -> Character {
        return Character(name: "Dartagnan", role: .attacker, lifePoints: 100, weapon: Weapon.sword())
    }
    static func Baltazar() -> Character {
        return Character(name: "Baltazar", role: .attacker, lifePoints: 150, weapon: Weapon.bowAndArrow())
    }
    static func Raziel() -> Character {
        return Character(name: "Raziel", role: .attacker, lifePoints: 100, weapon: Weapon.flameThrower())
    }
    static func Destroyer() -> Character {
        return Character(name: "Destroyer", role: .attacker, lifePoints: 110, weapon: Weapon.bazooka())
    }
    static func Raphaello() -> Character {
        return Character(name: "Raphaello", role: .healer, lifePoints: 30, weapon: Weapon.magicBean())
    }
}
