//
//  HomeViewController.swift
//  WhiteLabel-Template
//
//  Created by Davi Cabral de Oliveira on 23/11/19.
//  Copyright © 2019 Davi Cabral de Oliveira. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .clear
        collection.dataSource = self
        collection.delegate = self
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(CharCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        view.addSubview(collection)
        return collection
    }()
    
    #if DEBUG
    private lazy var debugView: DebugView = {
        let debugView = DebugView(frame: .zero)
        debugView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(debugView)
        return debugView
    }()
    #endif
    
    var objects: [Char]? {
        didSet{
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let safeArea = view.safeAreaLayoutGuide
        let topAnchor: NSLayoutYAxisAnchor
        let distance: CGFloat
        
        #if DEBUG
            topAnchor = debugView.bottomAnchor
            distance = 0
        
        NSLayoutConstraint.activate([
            debugView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            debugView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            debugView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            debugView.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        #else
            topAnchor = safeArea.topAnchor
            distance = 16
        #endif
        
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor, constant: distance),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        FetchService.all { [weak self] (chars) in
            self?.objects = chars
        }
    }

}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return objects?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let char = objects?[indexPath.row], let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CharCollectionViewCell else {
            fatalError()
        }
        
        cell.setup(char)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if Settings.shared.hasSelection {
            guard let char = objects?[indexPath.row] else {
                return
            }
            
            let controller = DescriptionViewController(char: char)
            navigationController?.pushViewController(controller, animated: true)           
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfColumns = CGFloat(Settings.shared.numberOfColumns)
        let totalWidth = collectionView.frame.width
        let padding: CGFloat = 10
        let widthWithoutPadding = totalWidth - (numberOfColumns * padding)
        let itemSize: CGFloat = widthWithoutPadding / numberOfColumns
        return CGSize(width: itemSize,height: itemSize)
    }
}

