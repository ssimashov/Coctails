//
//  ViewController.swift
//  Coctails
//
//  Created by Sergey Simashov on 28.03.2022.
//

import UIKit
//import SnapKit

class ViewController: UIViewController, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var drinks = [Drinks]()
    {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    let networkService = NetworkService()
    let reuseIdentifier = "reuseIdentifier"
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        networkService.fetchData()
        { [weak self] result in
            switch result {
            case .success(let drinks):
                self?.drinks = drinks
                print(drinks)
            case .failure(let error):
                print(error)
            }
        }
    }
}

//MARK: - CollectionView Datasource

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return drinks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? CollectionViewCell else { return UICollectionViewCell()}
        cell.configure(model: drinks[indexPath.item])
        return cell
    }
    
}


