//
//  ViewController.swift
//  ProgressBarImplementation
//
//  Created by Sugirdha Vaithyanathan on 1/10/23.
//

import UIKit

class HomeViewController: BaseViewController {
    let nextButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .black
        btn.tintColor = .white
        btn.setTitle("Next", for: .normal)
        return btn
    }()
    
    let barView: UIView = {
        let view = UIView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
    }

    private func layout() {
        barView.translatesAutoresizingMaskIntoConstraints = false
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)

        [barView, nextButton].forEach(view.addSubview(_:))
        
        NSLayoutConstraint.activate([
            barView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            barView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            barView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            barView.heightAnchor.constraint(equalToConstant: 100),

            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nextButton.heightAnchor.constraint(equalToConstant: 24),
            nextButton.widthAnchor.constraint(equalToConstant: 80),
        ])
        
        displayProgressBar(in: barView, progress: progressConstant)
    }
    
    @objc func nextButtonTapped() {
        progressConstant += 5
        
    }

}

// MARK: - BaseViewController
class BaseViewController: UIViewController {
    var progressConstant = 5

}

// MARK: - ProgressBar
extension BaseViewController {
    func displayProgressBar(in parentView: UIView, progress: Int) {
        let progressBar = ProgressBarView(frame: parentView.frame, progress: progress)
        view.addSubview(progressBar)
        progressBar.topAnchor.constraint(equalTo: parentView.bottomAnchor, constant: 10).isActive = true
        progressBar.leadingAnchor.constraint(equalTo: parentView.leadingAnchor).isActive = true
        progressBar.trailingAnchor.constraint(equalTo: parentView.trailingAnchor).isActive = true
        progressBar.heightAnchor.constraint(equalToConstant: 6).isActive = true
    }
}

// MARK: - Other VCs Placeholders
class OneViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
    }
}
class TwoViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
    }
}
class ThreeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
    }
}
