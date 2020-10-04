//
//  CollectionView.swift
//  DequeueTest
//
//  Created by Rafał P. on 15/08/2020.
//  Copyright © 2020 Rafał P. All rights reserved.
//

import UIKit

protocol CollectionViewDequeueProtocol {
    func dequeue(for collectionView: UICollectionView,_ indexPath: IndexPath) -> UICollectionViewCell
}

protocol CollectionViewCellDisplayProtocol {
    func willDisplayCell(at indexPath: IndexPath, for cell: UICollectionViewCell)
}

final class CollectionView: UICollectionView {
    
    private var viewModel = ViewModel()
    
    init() {
        super.init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        delegate = self
        dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(_ viewModel: ViewModel) {
        self.viewModel = viewModel
    }
}

extension CollectionView {
    struct ViewModel {
        var cellDequeue = [CollectionViewDequeueProtocol]()
        var cellDisplayer = [CollectionViewCellDisplayProtocol]()
    }
}

extension CollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.cellDequeue.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        viewModel.cellDequeue[indexPath.item].dequeue(for: collectionView, indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        viewModel.cellDisplayer[indexPath.item].willDisplayCell(at: indexPath, for: cell)
    }
}
