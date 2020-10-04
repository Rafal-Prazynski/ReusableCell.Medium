//
//  ViewController.swift
//  DequeueTest
//
//  Created by Rafał P on 15/08/2020.
//  Copyright © 2020 Rafał P. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    private let collectionView = CollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width - 20, height: UIScreen.main.bounds.width - 20)
        flowLayout.minimumLineSpacing = 20
        flowLayout.minimumInteritemSpacing = 20
        collectionView.setCollectionViewLayout(flowLayout, animated: false)
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        
        let model = CollectionViewCellBuilder(collectionView: collectionView).collectionViewModel(for: MOCK.getPepe())
        collectionView.set( model)
    }
}
