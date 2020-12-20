//
//  MainTableViewCell.swift
//  SwiftApp
//
//  Created by Asim Mughal on 20/12/2020.
//

import UIKit

class MainTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var txtSectionName: UILabel!
    @IBOutlet weak var viewMore: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Adding a nested collection view inside each table view cell
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath)

                if let collectionViewCell = cell as? CollectionViewCell {
                    // TODO: configure cell
//                    collectionViewCell.title.text = 
                }

        return cell
    }
    

}
