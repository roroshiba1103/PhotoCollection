//
//  SelectCameraViewController.swift
//  PhotoCollection
//
//  Created by 安部瞳 on 2023/05/24.
//

import UIKit

class SelectCameraViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let cameraArray: Array = ["Canon", "Nikon", "SONY", "FUJIFILM", "Panasonic", "OLYMPUS", "PENTAX", "LEICA", "Hasselblad"]
    
    @IBOutlet weak var selectCameraTableView: UITableView!
    
    var selectedNumber: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectCameraTableView.register(UINib(nibName: "SelectCameraTableViewCell", bundle: nil), forCellReuseIdentifier: "SelectCameraTableViewCell")
        selectCameraTableView.rowHeight = 120
    }
    
    func tableView(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cameraArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SelectCameraTableViewCell", for: indexPath) as! SelectCameraTableViewCell
        cell.cameraLabel?.text = cameraArray[indexPath.row]
        cell.cameraImage.image = UIImage(systemName: "camera.fill")
        cell.cameraImage.tintColor = .gray
        cell.mainBackground.layer.cornerRadius = 5
        cell.mainBackground.backgroundColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
        return cell
    }
    
    func tableView(_ table: UITableView,didSelectRowAt indexPath: IndexPath) {
        selectedNumber = indexPath.row
        performSegue(withIdentifier: "toImageViewController",sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if (segue.identifier == "toImageViewController") {
            let imgVC: ImageViewController = (segue.destination as? ImageViewController)!
            imgVC.selectedMakerNumber = selectedNumber!
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
