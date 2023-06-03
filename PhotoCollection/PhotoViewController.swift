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

        // Do any additional setup after loading the view.
        items = readItems()
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
        
        print(items.count)
        
        for i in 0..<items.count {
            print(items[i].cameraMakerNumber)
            if items[i].photoData != nil {
                photoImageView.image = UIImage(data: items[i].photoData!)
            }
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
