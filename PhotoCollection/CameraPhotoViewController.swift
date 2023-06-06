//
//  CameraPhotoViewController.swift
//  PhotoCollection
//
//  Created by 安部瞳 on 2023/06/02.
//

import UIKit
import RealmSwift

class CameraPhotoViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var titleNavigationItem: UINavigationItem!
    
    @IBOutlet weak var cameraPhotoCollectionView: UICollectionView!
    
    let realm = try! Realm()
    var items: [PhotoItem] = []
    
    var cameraNumber: Int?
    var cameraArray: Array = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleNavigationItem.title = cameraArray[cameraNumber!]

        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 125, height: 125)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        cameraPhotoCollectionView.collectionViewLayout = layout
        
        items = readItems()
        cameraPhotoCollectionView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        items = readItems()
        cameraPhotoCollectionView.reloadData()
    }
    
    func readItems() -> [PhotoItem] {
        return Array(realm.objects(PhotoItem.self).filter("cameraMakerNumber == %@", cameraNumber!))
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell :UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cameraPhotoCollectionCell", for: indexPath)
        let cameraPhotoImageView = cell.contentView.viewWithTag(1) as! UIImageView
        
        if items[indexPath.row].photoData != nil {
            cameraPhotoImageView.image = UIImage(data: items[indexPath.row].photoData!)
        }
        
        return cell
    }
    
    @IBAction func onTappedButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
