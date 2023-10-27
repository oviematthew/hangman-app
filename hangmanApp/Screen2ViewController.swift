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
    
    
    private var selectedWord = ""
    private var correctGuesses = Set<Character>()
    private var remainingGuesses = 5
    private var wins = 0
    private var losses = 0

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
         
        if let hangUserMsg = userMessage {
            hangUserMessage.text = hangUserMsg
        }
        
        startNewGame()
      }

      func startNewGame() {
          // Reset the game state
          selectedWord = getRandomWord()
          correctGuesses.removeAll()
          remainingGuesses = 5

          // Clear labels and reset button styles
          for label in [answerA, answerB, answerC, answerD, answerE, answerF, answerG] {
              label?.text = ""
          }
          for tag in 1...26 {
              if let button = view.viewWithTag(tag) as? UIButton {
                  button.isEnabled = true
                  button.backgroundColor = .clear
              }
          }
      }

      func getRandomWord() -> String {
          return wordsArray.randomElement() ?? ""
      }

      @IBAction func onExitBtnTapped(_ sender: UIButton) {
          dismiss(animated: true)
          
          
          //disable start game buttob on previous page
          startGameButton.isEnabled = false
      }

    @IBAction func onAlphabetTapped(_ sender: UIButton) {
        guard let letter = sender.currentTitle?.first else {
            return
    }
    

          // Check if the letter is part of the selected word
          if selectedWord.contains(letter) {
              correctGuesses.insert(letter)

              // Update labels to display the correct guesses
              for (index, char) in selectedWord.enumerated() {
                  if correctGuesses.contains(char) {
                      if let label = view.viewWithTag(index + 1) as? UILabel {
                          label.text = String(char)
                      }
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
                  print("Congratulations! You guessed the word: \(selectedWord)")
                  startNewGame()
              }
          } else {
              // The letter is not part of the word
              remainingGuesses -= 1
              sender.isEnabled = false
              sender.backgroundColor = .red

              if remainingGuesses == 0 {
                  // Handle the user's loss
                  losses += 1
                  lossCount.text = " \(losses)"
                  print("Game Over. The word was: \(selectedWord)")
                  startNewGame()
              }
          }
      }
    
    @IBAction func onTapTryAgain(_ sender: UIButton) {
        startNewGame()
    }
    
  }


