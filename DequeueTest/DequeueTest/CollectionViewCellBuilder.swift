//
//  CollectionViewCellBuilder.swift
//  DequeueTest
//
//  Created by Rafał P. on 15/08/2020.
//  Copyright © 2020 Rafał P. All rights reserved.
//

import UIKit

final class CollectionViewCellBuilder {
    private let firstBuilder = FirstPepeBuilder()
    private let secondBuilder = SecondPepeBuilder()
    private let thirdBuilder = ThirdPepeBuilder()
    
    init(collectionView: CollectionView) {
        collectionView.register(FirstPepeCollectionViewCell.self, forCellWithReuseIdentifier: FirstPepeCollectionViewCell.description())
        collectionView.register(SecondPepeCollectionViewCell.self, forCellWithReuseIdentifier: SecondPepeCollectionViewCell.description())
        collectionView.register(ThirdPepeCollectionViewCell.self, forCellWithReuseIdentifier: ThirdPepeCollectionViewCell.description())
    }
    
    func collectionViewModel(for model: PepesModel) -> CollectionView.ViewModel {
        var strings = [String]()
        strings.append(contentsOf: Array(repeating: model.pepes.pepe1.name, count: model.pepes.pepe1.count))
        strings.append(contentsOf: Array(repeating: model.pepes.pepe2.name, count: model.pepes.pepe2.count))
        strings.append(contentsOf: Array(repeating: model.pepes.pepe3.name, count: model.pepes.pepe3.count))
        
        firstBuilder.model = strings
        secondBuilder.model = strings
        thirdBuilder.model = strings
        
        var viewModel = CollectionView.ViewModel()
        viewModel.cellDequeue.append(contentsOf: Array(repeating: firstBuilder, count: model.pepes.pepe1.count))
        viewModel.cellDequeue.append(contentsOf: Array(repeating: secondBuilder, count: model.pepes.pepe2.count))
        viewModel.cellDequeue.append(contentsOf: Array(repeating: thirdBuilder, count: model.pepes.pepe3.count))
        
        viewModel.cellDisplayer.append(contentsOf: Array(repeating: firstBuilder, count: model.pepes.pepe1.count))
        viewModel.cellDisplayer.append(contentsOf: Array(repeating: secondBuilder, count: model.pepes.pepe2.count))
        viewModel.cellDisplayer.append(contentsOf: Array(repeating: thirdBuilder, count: model.pepes.pepe3.count))
        
        return viewModel
    }
}

private final class FirstPepeBuilder: CollectionViewDequeueProtocol, CollectionViewCellDisplayProtocol {
    var model = [String]()
    
    func dequeue(for collectionView: UICollectionView,_ indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FirstPepeCollectionViewCell.description(), for: indexPath) as! FirstPepeCollectionViewCell
        return cell
    }
    
    func willDisplayCell(at indexPath: IndexPath, for cell: UICollectionViewCell) {
        let myCell = cell as! FirstPepeCollectionViewCell
        myCell.setup(with: model[indexPath.row])
    }
}

private final class SecondPepeBuilder: CollectionViewDequeueProtocol, CollectionViewCellDisplayProtocol {
    var model = [String]()
    
    func dequeue(for collectionView: UICollectionView,_ indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.dequeueReusableCell(withReuseIdentifier: SecondPepeCollectionViewCell.description(), for: indexPath) as! SecondPepeCollectionViewCell
    }
    
    func willDisplayCell(at indexPath: IndexPath, for cell: UICollectionViewCell) {
        let myCell = cell as! SecondPepeCollectionViewCell
        myCell.setup(with: model[indexPath.row])
    }
}

private final class ThirdPepeBuilder: CollectionViewDequeueProtocol, CollectionViewCellDisplayProtocol {
    var model = [String]()
    
    func dequeue(for collectionView: UICollectionView,_ indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.dequeueReusableCell(withReuseIdentifier: ThirdPepeCollectionViewCell.description(), for: indexPath) as! ThirdPepeCollectionViewCell
    }
    
    func willDisplayCell(at indexPath: IndexPath, for cell: UICollectionViewCell) {
        let myCell = cell as! ThirdPepeCollectionViewCell
        myCell.setup(with: model[indexPath.row])
    }
}

