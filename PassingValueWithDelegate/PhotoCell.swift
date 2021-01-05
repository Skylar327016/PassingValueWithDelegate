//
//  PhotoCell.swift
//  PassingValueWithDelegate
//
//  Created by 陳家豪 on 2021/1/5.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    static let reuseId = "PhotoCell"
    let photoImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        contentView.addSubview(photoImageView)
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            photoImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            photoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            photoImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            photoImageView.heightAnchor.constraint(equalTo: photoImageView.widthAnchor)
        ])
        
        photoImageView.layer.cornerRadius = photoImageView.bounds.width / 2
        photoImageView.contentMode = .scaleAspectFill
    }
    
    func set(image: UIImage) {
        DispatchQueue.main.async {
            self.photoImageView.image = image
        }
    }
}
