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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectCameraTableView.register(UINib(nibName: "SelectCameraTableViewCell", bundle: nil), forCellReuseIdentifier: "SelectCameraTableViewCell")
        selectCameraTableView.rowHeight = 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SelectCameraTableViewCell", for: indexPath) as! SelectCameraTableViewCell
        cell.cameraLabel?.text = cameraArray[indexPath.row]
        cell.cameraImage.image = UIImage(systemName: "camera.fill")
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
