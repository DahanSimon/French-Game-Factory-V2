public class Weapon {
    let weaponName: String
    let damageCapacity: Int
    let healingCapacity: Int
    init (weaponName: String, damageCapacity: Int, healingCapacity: Int) {
        self.weaponName = weaponName
        self.damageCapacity = damageCapacity
        self.healingCapacity = healingCapacity
    }
    
    static func sword() -> Weapon {
        return Weapon(weaponName:"Sword", damageCapacity: 25, healingCapacity: 0)
    }
    static func bowAndArrow() -> Weapon {
        return Weapon(weaponName:"Bow and Arrow", damageCapacity: 25, healingCapacity: 0)
    }
    static func prayer() -> Weapon {
        return Weapon(weaponName:"Prayer", damageCapacity: 0, healingCapacity: 20)
    }
    static func flameThrower() -> Weapon {
        return Weapon(weaponName:"Flame Thrower", damageCapacity: 40, healingCapacity: 0)
    }
    static func bazooka() -> Weapon {
        return Weapon(weaponName:"Bazooka", damageCapacity: 30, healingCapacity: 0)
    }
    static func magicBean() -> Weapon {
        return Weapon(weaponName:"Magic Bean", damageCapacity: 0, healingCapacity: 100)
    }
}
