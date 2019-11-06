//
//  Attacker.swift
//  French-Game-factory
//
//  Created by Simon Dahan on 06/11/2019.
//  Copyright © 2019 Simon Dahan. All rights reserved.
//

class Attacker: Character {
    func attackerPlaying(opponent: Player) {
        
        print("On which member of \(opponent.name)'s team would like to use \(self.weapon.weaponName)")
        guard let attackedCharacter = opponent.selectCharacter() else {
            return
        }
        attackedCharacter.lifePoints -= self.weapon.damageCapacity
        print("\(self.name) attacked \(attackedCharacter.name) with his \(self.weapon.weaponName) and now \(attackedCharacter.name)'s lifepoint are down to \(attackedCharacter.lifePoints)")
    }
}
