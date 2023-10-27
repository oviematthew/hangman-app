//
//  Screen2ViewController.swift
//  hangmanApp
//
//  Created by Matthew Ovie Enamuotor on 27/10/2023.
//

import UIKit

class Screen2ViewController: UIViewController {
    
    
    let wordsArray = [
        "pizzazz", "zyzzyva", "fuzzbox", "pizazzy", "jacuzzi",
        "jazzman", "jazzmen", "jazzbos", "jazzily", "jazzing",
        "zizzing", "quizzed", "zizzled", "quizzer", "quizzes",
        "wazzock", "zizzles", "buzzwig", "jazzers", "jazzier",
        "buzzcut", "muzjiks", "buzzing", "buzzsaw", "fuzzily",
        "fuzzing", "muzzily", "schizzy", "abbozzo", "chazzan",
        "chazzen", "fizzily", "fizzing", "frizzly", "jejunum",
        "jimjams", "jukebox", "jumbuck", "mezuzah", "muzzled",
        "puzzled", "schnozz", "wazzing", "whizzed", "zhuzhed",
        "buzzard", "fizzled", "grizzly", "guzzled", "huzzahs",
        "jujubes", "jujuism", "mizzled", "muezzin", "muzzler",
        "muzzles", "puzzler", "puzzles", "whizzer", "whizzes",
        "zhuzhes", "bezique", "bezzant", "buzzers", "buzzier",
        "cazique", "dizzily", "drizzly", "fizzles", "frazzle",
        "frizzed", "frizzle", "fuzzier", "guzzler", "guzzles",
        "huzzaed", "jezebel", "jumpoff", "karezza", "mazzard",
        "mezquit", "mezuzas", "mezuzot", "mizzens", "mizzles",
        "muzzier", "nuzzled", "palazzi", "palazzo", "pizzles",
        "sizzurp", "skyjack", "swizzle", "twizzle", "wizzens",
        "zigzags", "bezzies", "bizzies", "cozzies", "dazzled",
        "fizzers", "fizzier", "frizzer", "frizzes", "gizzard",
        "grizzle", "hazzans", "jejunal", "jojobas", "jonquil",
        "jujutsu", "jujuist", "jumpcut", "kibbutz", "kolkhoz",
        "kolkozy", "lockjaw", "nozzles", "packwax", "quetzal",
        "quezals", "quickly", "sizzled", "sozzled", "ziplock",
        "zombify", "blowzed", "buxomly", "cachexy", "cajuput",
        "chametz", "chintzy", "chometz", "complex", "cozying",
        "cumquat", "fowlpox", "hutzpah", "hypoxic", "jackals",
        "jackeen", "jauking", "jawfish", "jawlike", "jewfish",
        "jibbahs", "jinking", "jobbery", "jouking", "joypops",
        "jubhahs", "jugband", "jugfuls", "jugging", "jugsful",
        "jumbals", "jumbler", "jumbles", "kajeput", "kebbock",
        "kickoff", "killjoy", "klezmer", "kwanzas", "machzor",
        "mahjong", "maximum", "maxixes", "mazurka", "moujiks",
        "muntjac", "mzungus", "outjump", "oxazine", "oxazole",
        "oxidize", "pickaxe", "punjabi", "pyjamas", "quaffed",
        "quakily", "quaking", "quibble", "quicker", "quickie",
        "quipped", "quippus", "quixote", "showbiz", "squawks",
        "tickbox", "upchuck", "steezed", "squeaky", "squozen"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   
    @IBAction func onExitBtnTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
