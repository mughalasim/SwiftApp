//
//  MainTableViewCell.swift
//  SwiftApp
//
//  Created by Asim Mughal on 20/12/2020.
//

import UIKit

class MainTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var txtSectionName: UILabel!
    @IBOutlet weak var viewMore: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    let collectionIdentifier = "CollectionViewCell"
    
    var items: [ItemModel]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Adding a nested collection view inside each table view cell
        collectionView.delegate = self
        collectionView.dataSource = self
        SharedMethods.registerCollectionView(collectionView, collectionIdentifier)

    }
    
    public func setData(_ section: Sections){
        // Only need to show a certain number of items and the rest depend on the view more option
        let subArray = section.item?.prefix(Settings.shared.MAX_HORIZONTAL_ITEMS)
        items = Array(subArray ?? [])
        self.txtSectionName.text = section.name ?? "No section name"
        if (section.item?.count ?? 0 > Settings.shared.MAX_HORIZONTAL_ITEMS){
            self.viewMore.alpha = 1
        } else {
            self.viewMore.alpha = 0
        }
    }
    
    
    // COLLECTION VIEW CELL -------------------------------------------------------------------
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let i =  indexPath.row
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionIdentifier, for: indexPath) as! CollectionViewCell
        cell.setData(items?[i].meta, items?[i].media)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Settings.shared.HORIZONTAL_ITEMS_WIDTH, height: collectionView.frame.height)
    }

}
