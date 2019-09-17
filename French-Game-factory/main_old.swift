import Foundation

//class Player  {
//    var name: String
//    var team = [String: Caracter]() //CHaracter
////    var playerDidIntroduce = false
////    var playerDidCreateCaracter = false
//    var alreadyExist = false
//    var won = true
//    init(playerName: String) {
////        let playerName = readLine()!
////        print("\n")
//        self.name = playerName
//    }
//
////    On créé une équipe composé de personnage qui possèdent des armes
//    func createCaracter(weaponListTab: [String: Weapon], player: Player) {
////        On ajoute le personnage a l'équipe
//        func addCaracterToTeam(name: String) {
////            Si l'input correspond bien a une arme de la liste
//            if let choosedWeapon = weaponListTab[readLine()!] {
//                print("\n")
//                self.team[name] = Caracter(name: name, weapon: choosedWeapon)
//                print("\(name) posséde maintenant : \(choosedWeapon.name)")
//            }
////                sinon on recommence
//            else {
//                print("Merci de copié et de coller le nom EXACTE de l'arme que vous souhaitez attribuer a \(name)")
//                addCaracterToTeam(name: name)
//            }
//        }
////        On verifie si le nom que l'utilisatuer souhaite donner au personnage n'appartient pas déjà a un autre personnage
//        func initCaracterName(name: String) {
//            for j in self.team.keys {
//                if name == j {
//                    alreadyExist = true
//                    break
//                }
//            }
//
//        }
////        On demande a l'utilisateur de choisir l'arme qu'il souhaite attribué au personnage selectionné
//        func chooseWeapon(name: String) {
//            print("Quelle arme souhaites tu donner a \(name) (copie/colle le nom exact de l'arme) ?\n\n")
//            for weaponName in weaponListTab {
//                print(weaponName.key)
//            }
//        }
//
//
//
//        print("Salut \(player.name) ! \n\nTu as 3 personnage mais ils n'ont pas de nom !\n\n")
////        On demande a l'utilisateur de nommé ses 3 personnages
//        for i in 1...3 {
//            print("\(player.name) ! Comment souhaites tu appeler ton personnage n° \(i) ?")
//            var caracterName: String = readLine()!
//            print("\n")
//            initCaracterName(name: caracterName)
////            print(alreadyExist)
////            On vérifie si le nom n'existe pas déjà
//            if alreadyExist == false {
//                chooseWeapon(name: caracterName)
//                addCaracterToTeam(name: caracterName)
//            }
////                si le nom existe déjà on demande a l'utilisateur de choisir un autre nom
//            else {
//                while alreadyExist == true {
//                    print("Ce personnage existe déja ! Essaie de l'applé autrement :")
//                    caracterName = readLine()!
//                    print("\n")
//                    for j in self.team.keys {
//                        if caracterName == j {
//                            alreadyExist = true
//                            break
//                        }
//                        else {
//                            alreadyExist = false
//                            chooseWeapon(name: caracterName)
//                            addCaracterToTeam(name: caracterName)
//                            break
//                        }
//                    }
//                }
//            }
//        }
//
////        for i in player.team {
////            print(i.value.name + " " + i.value.weapon.name)
////        }
//    }
//
//    func pickCaracter(player : Player) -> String{
//        var l = 1
//        var index = 0
////        var pickedCaracter: Caracter
//        for caracter in player.team.keys {
//            if player.team[caracter]!.isAlive == true {
//                print("\(l). \(caracter): " + "\(player.team[caracter]!.health) PVs")
//                l += 1
//            }
//
//        }
//        while index == 0 {
//            if let i = readLine() {
//                print("\n")
//                if let isInt = Int(i){
//                    if isInt >= 1 && isInt <= 3 {
//                       index = isInt
//                    }
//                    else {
//                        print("merci de rentrer une valeur comprise entre 1 et 3")
//                    }
//                    if l == 2 && index != 1 {
//                        print("Merci de taper 1")
//                        index = 0
//                    }
//                }
//                else {
//                    print("Merci de rentrer une valeur numerique")
//                }
//            }
//
//        }
//
//        l = 1
//        for caracter in player.team.values {
//            var pickedCaracterName: String
//            if l == index && caracter.health > 0 {
//                pickedCaracterName = caracter.name
//                return pickedCaracterName
//            }
//            else if l == index && caracter.health < 0 {
//                index = l + 1
//            }
//            l += 1
//        }
//        return "Une erreur est survenu relancé le programme"
//
//    }
//
//}

//class Character {
//    var health = 100
//    let name: String
//    var weapon: Weapon
//    var isAlive = true // chercher computed var
//
//    init(name: String, weapon: Weapon) {
//        self.name = name
//        self.weapon = weapon
//    }
//}

//class Weapon {
//    let name: String
//    let healthDifference: Int
//    
//    init(weapon: WeaponList) {
//        switch weapon {
//        case .SlingShot:
//            self.healthDifference = 5
//            self.name = weapon.rawValue
//        case .Bazooka:
//            self.healthDifference = 45
//            self.name = weapon.rawValue
//        case .GrossePotion:
//            self.healthDifference = 15
//            self.name = weapon.rawValue
//        case .Gun:
//            self.healthDifference = 15
//            self.name = weapon.rawValue
//        case .Laser:
//            self.healthDifference = 30
//            self.name = weapon.rawValue
//        case .MachineGun:
//            self.healthDifference = 25
//            self.name = weapon.rawValue
//        case .SmallPotion:
//            self.healthDifference = 5
//            self.name = weapon.rawValue
//        case .WaterGun:
//            self.healthDifference = 2
//            self.name = weapon.rawValue
//        }
//    }
//}

//enum WeaponList: String {
//    case SlingShot = "Lance Pierre"
//    case Laser = "Laser"
//    case MachineGun = "Mitraillette"
//    case Gun = "Pistolet"
//    case Bazooka = "Bazooka"
//    case SmallPotion = "Petite Potion"
//    case GrossePotion = "Grosse Potion"
//    case WaterGun = "Pistolet à eau"
//}
//var dead = 0
//var laps = 0
//
//func isDead(player: Player, game: Game) {
//    dead = 0
//    for i in player.team {
//        if  i.value.health <= 0{
//            if i.value.isAlive == true {
//                i.value.isAlive = false
//                print("\(i.key) est mort !, \(i.value.isAlive)")
//            }
//            dead += 1
//        }
//
//    }
//
//    if dead == 3 {
//        game.isOver = true
//        player.won = false
//    }
//}
//
//func playing (player: Player, player2: Player) {
//    print("\(player.name) c'est ton tour !\n")
//    print("Choisis un personnage de ton équipe :\n")
//    let playerSelectedCaracter = player.pickCaracter(player: player)
//    if player.team[playerSelectedCaracter]!.weapon.name == "Petite Potion" || player.team[playerSelectedCaracter]!.weapon.name == "Grosse Potion" {
//        print("\(playerSelectedCaracter) peut soigner, quel personnage de ton équipe souhaites tu soigner ?\n")
//        let heal = player.team[playerSelectedCaracter]!.weapon.healthDifference
//        let healedCaracter = player.pickCaracter(player: player)
////        print(player.team[playerSelectedCaracter]!.health)
//        player.team[healedCaracter]!.health += heal
////        print(player.team[playerSelectedCaracter]!.health)
//        print("\(playerSelectedCaracter) a soingé \(healedCaracter). \n \(healedCaracter) a \(player.team[healedCaracter]!.health) points de vie")
//        isDead(player: player, game: game)
//    }
//    else {
//        print("\(playerSelectedCaracter) peut attaquer, quel personnage de l'équipe adverse souhaites tu attaquer ?\n")
//        let damage = player.team[playerSelectedCaracter]!.weapon.healthDifference
//        let attackedCaracter = player.pickCaracter(player: player2)
////        print(player2.team[playerSelectedCaracter]!.health)
//        player2.team[attackedCaracter]!.health -= damage
////        print(player2.team[playerSelectedCaracter]!.health)
//        print("\(playerSelectedCaracter) a attaqué \(attackedCaracter). \n \(attackedCaracter) a \(player2.team[attackedCaracter]!.health) points de vie")
//
//        isDead(player: player2, game: game)
//    }
//}
//
//func stats(winner: Player, looser: Player, lap: Int) {
//    print("La partie est terminé \(winner.name) a gagné ! En \(lap) tours.\n"
//        +  "Voici son équipe :\n")
//    for caracter in winner.team.keys {
//            print(" - \(caracter)\t" + "\(winner.team[caracter]!.health) ")
//    }
//    print("Contre \(looser.name), voici son équipe :")
//    for caracter in looser.team.keys {
//        print(" - \(caracter)\t")
//    }
//}
//let weaponListTab = ["Lance Pierre": Weapon.init(weapon: .SlingShot), "Laser": Weapon.init(weapon: .Laser), "Mitraillette": Weapon.init(weapon: .MachineGun), "Pistolet": Weapon.init(weapon: .Gun), "Bazooka": Weapon.init(weapon: .Bazooka), "Petite Potion": Weapon.init(weapon: .SmallPotion), "Grosse Potion": Weapon.init(weapon: .GrossePotion), "Pistolet à eau": Weapon.init(weapon: .WaterGun)]
////var player1SelectedCaracter: String
//
//while true {
//    print("\u{001B}[2J")
//    game.isOver = false
//    print("Bonjour Joueur1 quel est ton nom ?")
//    //    création du prmier joueur : player1
//    guard let player1Name = readLine() else { // regarder guard
//        print("An error occured")
//    }
//    let player1 = Player(playerName: player1Name)
//    //    Le joueur 1 créé son équipes
//    player1.createCaracter(weaponListTab: weaponListTab, player: player1)
//    print("Bonjour Joueur2 quel est ton nom ?")
//    guard let player2Name = readLine() else { // regarder guard
//        print("An error occured")
//    }
//    //    création du deuxieme joueur : player2
//    let player2 = Player(playerName: player1Name)
//    //    Tant que le joueur n'a pas perdu on considère qu'il a gagné
////    player2.won = true
//    //    Le joueur 2 créé son équipes
//    player2.createCaracter(weaponListTab: weaponListTab, player: player2)
//    game.isInitialised = true
//
////    Tant que tout personnges d'une même équipe ne sont pas mort
//    while game.isOver == false {
////        Le joueur1 commence a jouer
//        playing(player: player1, player2: player2)
////        On vérifie si les membres de l'équipe de joueur1 ne sont pas tous mort
//        isDead(player: player1, game: game)
//        //        On vérifie si les membres de l'équipe de joueur2 ne sont pas tous mort
//        isDead(player: player2, game: game)
////        Si aucune des 2 équipes n'a été décimé
//        if game.isOver == false {
////            c'est le tour de joueur 2
//            playing(player: player2, player2: player1)
//        }
//
//        laps += 1
//    }
////    La partie est terminé on affiche les stats, la partie est finie si c'est joueur1 ou joueur2 qui gagne
//    if player1.won == true{
//        stats(winner: player1,looser: player2,lap: laps)
//    }
//    else if player2.won == true {
//        stats(winner: player2, looser: player1, lap: laps)
//    }
//}
//
//
//






// Présentation powerPoint
// Separer les classes en fichiers
// Revoir constante et variables
// Commeter en anglais
// Fonctions dans les fonctions
