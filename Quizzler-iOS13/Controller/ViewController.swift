import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreText: UILabel!
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var statusBar: UIProgressView!
    var brainAccessor = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        let userGotAnswer = brainAccessor.checkAnswer(userAnswer: sender.currentTitle!)
        
        if userGotAnswer {
            sender.backgroundColor = UIColor.green
            brainAccessor.updateScore()
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI(){
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        questionText.text = brainAccessor.displayQuestion()
        brainAccessor.updateQuestionNumber()
        statusBar.progress = brainAccessor.updateStatusBar()
        scoreText.text = "Score: \(brainAccessor.currentScore)"
    }
}

