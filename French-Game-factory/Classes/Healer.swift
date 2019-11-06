//
//  Healer.swift
//  French-Game-factory
//
//  Created by Simon Dahan on 06/11/2019.
//  Copyright © 2019 Simon Dahan. All rights reserved.
//

class Healer: Character {
    func healerPlaying(player: Player) {
        guard let healedCharacter = player.selectCharacter() else{
            return
        }
        if healedCharacter is Attacker {
            healedCharacter.lifePoints += self.weapon.healingCapacity
            
            print("\(self.name) healed \(healedCharacter.name) with his \(self.weapon.weaponName) and now \(healedCharacter.name)'s lifepoint are up to \(healedCharacter.lifePoints)")
        }
        else {
            print("Sorry you can't heal a healer try again ")
            healerPlaying(player: player)
        }
    }
}
