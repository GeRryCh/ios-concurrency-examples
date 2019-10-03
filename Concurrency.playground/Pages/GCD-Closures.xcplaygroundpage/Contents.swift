//: [Previous](@previous)

/*:
 Alt+Cmd+Enter - Show a Live View
 
 Go back from Second to First screen to destroy the former.
 */

import PlaygroundSupport
import UIKit

class FirstViewController: UIViewController {
    override func loadView() {
        title = "First Screen"
        view = UIView()
        view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        let nextButton = UIButton(type: .system)
        nextButton.setTitle("Next", for: .normal)
        
        view.addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextButton.addTarget(self, action: #selector(goToNextScreen), for: .touchUpInside)
    }
    
    @objc func goToNextScreen() {
        navigationController?.pushViewController(SecondViewController(), animated: true)
    }
}

class SecondViewController: UIViewController {
    override func loadView() {
        title = "Second Screen"
        view = UIView()
        view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.global(qos: .utility).async {
            [weak self] in
            Thread.sleep(forTimeInterval: 3.0)
            DispatchQueue.main.async {
//                guard let self = self else { return }
                print("'self' after async job is done: " +
                    "\(String(describing: self))")
            }
        }
    }
}

let master = FirstViewController()
let nav = UINavigationController(rootViewController: master)

PlaygroundPage.current.liveView = nav

//: [Back](Main)
//: [Next](@next)

