//
//  CustomImageView.swift
//  ImagePresentation
//
//  Created by Alexey Gaidykov on 13.12.2022.
//

import UIKit

final class CustomImageView: UIImageView {
    let progressIndicatorView = CircularLoaderView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        progressIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(progressIndicatorView)
        
        NSLayoutConstraint.activate([
            progressIndicatorView.widthAnchor.constraint(equalTo: widthAnchor),
            progressIndicatorView.heightAnchor.constraint(equalTo: heightAnchor),
            progressIndicatorView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: 400),
            progressIndicatorView.centerYAnchor.constraint(equalTo: centerYAnchor),
            progressIndicatorView.centerXAnchor.constraint(equalTo: centerXAnchor)

        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
