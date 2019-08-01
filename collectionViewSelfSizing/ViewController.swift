//
//  ViewController.swift
//  collectionViewSelfSizing
//
//  Created by Aqeel Ahmad on 01/08/2019.
//  Copyright © 2019 Aqeel Ahmad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var values = ["abc" , "defkjfsljefjslfejslls" , "jfsleijfslef" , "sjefj",
                  "dfs" , "f" , "jfiejl jsie" , "sjegewfj",
                  "tw" , "reew" , "gewwewrwerewrwe" , "sjefj"]
    
    @IBOutlet weak var myCollectionView : UICollectionView!
    @IBOutlet weak var collectionLayout: UICollectionViewFlowLayout! {
        didSet {
            collectionLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        // Do any additional setup after loading the view.
    }


}

extension ViewController : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return values.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "autoSizeCellID", for: indexPath) as! autoSizeCell
        cell.mylbl.text = values[indexPath.row]
        return cell
    }
}

class autoSizeCell : UICollectionViewCell {
    @IBOutlet weak var mylbl : UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.leftAnchor.constraint(equalTo: leftAnchor),
            contentView.rightAnchor.constraint(equalTo: rightAnchor),
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
    }
}
