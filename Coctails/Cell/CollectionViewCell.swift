//
//  CollectionViewCell.swift
//  Coctails
//
//  Created by Sergey Simashov on 05.04.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var label: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        view.layer.cornerRadius = 10
        view.layer.backgroundColor = UIColor.lightGray.cgColor
        label.textColor = UIColor.white
        let tapGesture = UILongPressGestureRecognizer(target: self, action: #selector(didTap(recognizer:)))
        tapGesture.minimumPressDuration = 0
        tapGesture.cancelsTouchesInView = false
        addGestureRecognizer(tapGesture)
    }
    
    @objc func didTap(recognizer: UILongPressGestureRecognizer) {
        if recognizer.state == .began {
            view.layer.backgroundColor = UIColor.red.cgColor
        }
    }
    
    //MARK: - cell configuration
    func configure(model: Drinks) {
        self.label.text = model.drinkName
    }
}
