//
//  ImageView.swift
//  ProjectOne
//
//  Created by Mateus Amorim on 01/09/22.
//

import Foundation
import UIKit

class ImageView: UIViewController {
    
    var selectImage: String?
    
    
    lazy var pictures: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        if let chargeImage = selectImage{
            image.image = UIImage(named: chargeImage)
        }
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(sharedTapped))
        view.backgroundColor = .white
        title = selectImage
        navigationItem.largeTitleDisplayMode = .never
        setupConfiguration()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    @objc func sharedTapped() {
        guard let image = pictures.image?.jpegData(compressionQuality: 0.8) else {
            print("No image found")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    
}

extension ImageView: ViewConfiguration {
    func viewHierarchy() {
        view.addSubview(pictures)
    }
    
    func setupConstrants() {
        pictures.snp.makeConstraints { make in
            make.top.trailing.leading.bottom.equalToSuperview()
        }
    }
}
