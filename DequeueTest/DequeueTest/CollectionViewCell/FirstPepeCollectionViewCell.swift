//
//  FirstPepeCollectionViewCell.swift
//  DequeueTest
//
//  Created by Rafał P. on 15/08/2020.
//  Copyright © 2020 Rafał P. All rights reserved.
//

import UIKit

final class FirstPepeCollectionViewCell: UICollectionViewCell {
    
    private let imageView = UIImageView()
    
    func setup(with imageName: String) {
        imageView.image = UIImage(named: imageName)
        contentView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 8),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -8),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -8),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 8),
        ])
    }
}
