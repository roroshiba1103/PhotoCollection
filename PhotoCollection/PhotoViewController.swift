//
//  PhotoViewController.swift
//  PhotoCollection
//
//  Created by 安部瞳 on 2023/06/03.
//

import UIKit
import RealmSwift

class PhotoViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var photoCollectionView: UICollectionView!
    //@IBOutlet var photoImageView: UIImageView!
    
    let realm = try! Realm()
    var items: [PhotoItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 125, height: 125)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        photoCollectionView.collectionViewLayout = layout
        
        items = readItems()
        photoCollectionView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        items = readItems()
        photoCollectionView.reloadData()
    }
    
    func readItems() -> [PhotoItem] {
        return Array(realm.objects(PhotoItem.self))
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
        let cell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCollectionCell", for: indexPath)
        let photoImageView = cell.contentView.viewWithTag(1) as! UIImageView
        
        if items[indexPath.row].photoData != nil {
            photoImageView.image = UIImage(data: items[indexPath.row].photoData!)
        }
        
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
