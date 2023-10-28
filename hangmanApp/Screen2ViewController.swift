//
//  Screen2ViewController.swift
//  hangmanApp
//
//  Created by Matthew Ovie Enamuotor on 27/10/2023.
//

import UIKit

class Screen2ViewController: UIViewController {
    
    @IBOutlet weak var gamePicture: UIImageView!
    
    @IBOutlet weak var answerA: UILabel!
    
    @IBOutlet weak var answerB: UILabel!
    
    @IBOutlet weak var answerC: UILabel!
    
    @IBOutlet weak var answerD: UILabel!
    
    @IBOutlet weak var answerE: UILabel!
    
    @IBOutlet weak var answerF: UILabel!
    
    @IBOutlet weak var answerG: UILabel!
    
    var userMessage: String?
    @IBOutlet weak var hangUserMessage: UILabel!
    
    @IBOutlet weak var winCount: UILabel!
    @IBOutlet weak var lossCount: UILabel!
    
    private let totalGuesses = 5
    private var selectedWord = ""
    private var correctGuesses = Set<Character>()
    private var remainingGuesses = 0
    private var wins = 0
    private var losses = 0
    private var wordLabels: [UILabel] = []
    
    //Reference to start game button
    var startGameButton: UIButton!
    
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
        
        //display message
        if let hangUserMsg = userMessage {
            hangUserMessage.text = hangUserMsg
        }
        
        //we do not want to mutilate our private variable called totalGuesses, so we are using a variable reference
        remainingGuesses = self.totalGuesses
        startNewGame()
    }
    
    //Onclick of end game button
    @IBAction func onEndGameBtnTapped(_ sender: UIButton) {
        dismiss(animated: true)
        
        //disable startGame button on return to first screen
        startGameButton.isEnabled = false
    }
    
    
    //onclick of any alphabet button
    @IBAction func onAlphabetTapped(_ sender: UIButton) {
        guard let letter = sender.titleLabel?.text?.lowercased() else {
            return
        }
        
        //If letter clicked is contained in the selected word
        if selectedWord.contains(letter) {
            correctGuesses.insert(Character(letter))
            
            //iterating through the selected word array by index (0 to 6 (7 letter word)) and replace the text of each element in the word labels array and convert it to a string
            for (index, char) in selectedWord.enumerated() {
                if correctGuesses.contains(char) {
                    wordLabels[index].text = String(char)
                }
            }
            
        // Disable the button and mark it green
        sender.isEnabled = false
        sender.backgroundColor = .green
            
            // Check if the user has guessed the entire word
            if correctGuesses.count == Set(selectedWord).count {
                
                // Handle the user's victory
                wins += 1
                winCount.text = "\(wins)"
                showAlert(isSuccess: true)
            }
            
            
            
        }
        // The letter is not part of the word
        else {
            //Reduce number of guesses available to the user
            remainingGuesses -= 1
            
            // Disable the button and mark it red
            sender.isEnabled = false
            sender.backgroundColor = .red
            
            //change the scene image
            gamePicture.image = UIImage(named: "scene-\(totalGuesses-remainingGuesses+1)")
            
            if remainingGuesses == 2 {
                hintUser()
            }
            
            else if remainingGuesses == 0 {
                // Handle the user's loss
                losses += 1
                lossCount.text = " \(losses)"
                showAlert(isSuccess: false)
            }
        }
    }
    
    //onclick of try again button
    @IBAction func onTapTryAgain(_ sender: UIButton) {
        startNewGame()
    }
    
    
    func startNewGame() {
        //First Picture to be displayed
        gamePicture.image = UIImage(named: "scene-1")
        
        selectedWord = getRandomWord()
        correctGuesses.removeAll()
        remainingGuesses = 5
        
        //placing all correct
        wordLabels = [answerA, answerB, answerC, answerD, answerE, answerF, answerG]
        
        for word in wordLabels {
            word.text = "_"
        }
        
        //iterating through all letters tagged 1 to 26
        for tag in 1...26 {
            if let button = view.viewWithTag(tag) as? UIButton {
                button.isEnabled = true
                button.backgroundColor = .clear
            }
        }
    }
    
    //Random word function
    func getRandomWord() -> String {
        let randomWord = wordsArray.randomElement() ?? ""
        print("Random Word: \(randomWord)")
        return randomWord
    }
    
    //Alert Function
    func showAlert(isSuccess: Bool) {
        let title = isSuccess ? "Woohoo!" : "Uh oh"
        let message = isSuccess ? "You saved me! Would you like to play again?" : "The correct word was \(selectedWord). Would you like to try again?"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let yesButton = UIAlertAction(title: "Yes", style: .default){
            (alertAction) -> Void in self.startNewGame()
        }
        let noButton = UIAlertAction(title: "No", style: .default){
            (alertAction) -> Void in alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(yesButton)
        alert.addAction(noButton)
        show(alert, sender: nil)
    }
    
    
    func hintUser() {
        let title = "Hint"
        
        //using substring to extract the first four letters
        if let endIndex = selectedWord.index(selectedWord.startIndex, offsetBy: 4, limitedBy: selectedWord.endIndex) {
            
            let firstFourWords = selectedWord[selectedWord.startIndex..<endIndex]
            
            let message = "Let's help you out, the first four letters are: \(firstFourWords)..."
            
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

            let thanksButton = UIAlertAction(title: "Thanks", style: .default) {
                (alertAction) -> Void in alert.dismiss(animated: true, completion: nil)
            }
    
        alert.addAction(thanksButton)
        show(alert, sender: nil)
        }
    }


    
}


