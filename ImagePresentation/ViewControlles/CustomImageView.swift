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
        
        contentMode = .scaleAspectFit
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
        
        let urlString  = "https://mobimg.b-cdn.net/v3/fetch/37/372ba3f7831018e824b4e799ed40f281.jpeg"
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: OperationQueue())
        session.downloadTask(with: url)
            .resume()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomImageView: URLSessionDownloadDelegate {
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        guard let data = try? Data(contentsOf: location) else { return }
        let image = UIImage(data: data)
        DispatchQueue.main.async {
            self.image = image
            self.progressIndicatorView.reveal()
        }
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let progress = totalBytesWritten / totalBytesExpectedToWrite
        DispatchQueue.main.async {
            self.progressIndicatorView.progress = CGFloat(progress)
        }
    }
    
    
}
