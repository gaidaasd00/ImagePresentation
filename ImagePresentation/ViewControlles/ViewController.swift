//
//  ViewController.swift
//  ImagePresentation
//
//  Created by Alexey Gaidykov on 13.12.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var goButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Download and present", for: .normal)
        button.backgroundColor = .green
        button.tintColor = .white
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(goButtonPress), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let customImageView = CustomImageView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(goButton)
        view.addSubview(customImageView)
        
        NSLayoutConstraint.activate([
            goButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            goButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            goButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            goButton.heightAnchor.constraint(equalToConstant: 60),
            
            customImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            customImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            customImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.9),
            customImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9)
        ])
    }

    @objc func goButtonPress() {
        
    }
}

