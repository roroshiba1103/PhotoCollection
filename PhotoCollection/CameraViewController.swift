//
//  CameraViewController.swift
//  PhotoCollection
//
//  Created by 安部瞳 on 2023/05/24.
//

import UIKit

class CameraViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let cameraArray: Array = ["Canon", "Nikon", "SONY", "FUJIFILM", "Panasonic", "OLYMPUS", "PENTAX", "LEICA", "Hasselblad"]
    
    @IBOutlet weak var cameraTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cameraTableView.register(UINib(nibName: "SelectCameraTableViewCell", bundle: nil), forCellReuseIdentifier: "SelectCameraTableViewCell")
        cameraTableView.rowHeight = 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SelectCameraTableViewCell", for: indexPath) as! SelectCameraTableViewCell
        cell.cameraLabel?.text = cameraArray[indexPath.row]
        cell.cameraImage.image = UIImage(systemName: "camera.fill")
        cell.contentView.layer.cornerRadius = 5
        cell.contentView.backgroundColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
        return cell
    }
    
    func tableView(_ table: UITableView,didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toCameraPhotoViewController",sender: nil)
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
