
import UIKit
final class ViewController: UIViewController {
    
   var myProgressView = UIProgressView()
    var myButton = UIButton()
    var myTimer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        createProgress(myProgressView)
        createButton(myButton)
        createTimer()
        
    }
    
    //MARK: - Timer
    func createTimer() {
        myTimer = Timer.scheduledTimer(timeInterval: 1,
                                      target: self,
                                      selector: #selector(updateProgressView),
                                      userInfo: nil, repeats: true)
    }
    
    //MARK: - selector
    
    @objc func updateProgressView() {
        if myProgressView.progress != 1.0 {
            myProgressView.progress += 0.1 / 1.0
        } else if myProgressView.progress == 1.0 {
            UIView.animate(withDuration: 0.7) {
                self.myButton.alpha = 1
                self.myButton.setTitle("Start", for: .normal)
                self.myTimer.invalidate()
            }
        }
    }
    
    
    private func createProgress(_ progressView: UIProgressView) {
        
        progressView.progressViewStyle = .bar
        progressView.frame = CGRect(x: view.center.x, y: view.center.y, width: 150, height: 50)
        progressView.setProgress(0.0, animated: false)
        progressView.progressTintColor = .green
        progressView.trackTintColor = .gray
        progressView.center = view.center
        view.addSubview(progressView)
    }
    
    func createButton(_ button: UIButton) {
        button.frame = CGRect(x: view.bounds.size.width / 4, y: view.center.y + 50, width: 150, height: 50)
        button.alpha = 0.2
        button.setTitle("Загрузка...", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .orange
        view.addSubview(button)
    }


}

