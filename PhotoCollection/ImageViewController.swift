//
//  ImageViewController.swift
//  PhotoCollection
//
//  Created by 安部瞳 on 2023/05/21.
//

import UIKit
import RealmSwift

class ImageViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet var photoImageView: UIImageView!
    
    var selectedMakerNumber: Int?
    
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.shadowImage = UIImage()
        
        presentPickerController(sourceType: .photoLibrary)
        // Do any additional setup after loading the view.
    }
    
    func presentPickerController(sourceType: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
            let picker = UIImagePickerController()
            picker.sourceType = sourceType
            picker.delegate = self
            self.present(picker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        self.dismiss(animated: true, completion: nil)
        photoImageView.image = info[.originalImage] as? UIImage
    }
    
    func createItem(item: PhotoItem) {
        try! realm.write {
            realm.add(item)
        }
    }
    
    func saveData() {
        let item = PhotoItem()
        item.cameraMakerNumber = selectedMakerNumber!
        if let photoData = photoImageView.image {
            item.photoData = photoData.jpegData(compressionQuality: 0.5)
        }
        createItem(item: item)
    }
    
    @IBAction func onTappedCancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onTappedUploadButton() {
        if photoImageView.image != nil {
            saveData()
            self.dismiss(animated: true)
        } else {
            print("画像がありません")
        }
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
