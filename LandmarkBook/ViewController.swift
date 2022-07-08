//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Enes Kaya on 8.07.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var choosenLandmarkName = ""
    var choosenImageView = UIImage()
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = UITableViewCell()
        cell.textLabel?.text = landmarkNames[indexPath.row]
            return cell
            
            
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            landmarkNames.remove(at: indexPath.row)
                 landmarkImage.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toImageViewController", sender: nil)
        choosenImageView = landmarkImage[indexPath.row]
        choosenLandmarkName = landmarkNames[indexPath.row]
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toImageViewController"{
            let destinationVC = segue.destination as! ImageViewController
            destinationVC.selectedImageView = choosenImageView
            destinationVC.selectedLandmark = choosenLandmarkName
        }
    }
    

    @IBOutlet weak var tableView: UITableView!
    
    
    var landmarkNames = [String]()
    var landmarkImage = [UIImage]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
       
        
        landmarkNames.append("Eiffel Tower")
        landmarkNames.append("Tower Bridge")
        landmarkNames.append("Hungarian Parliament")
        landmarkNames.append("Santo Marco Piazza")
        landmarkNames.append("Maiden's Tower")
        landmarkNames.append("Hagia Sophia")
        landmarkNames.append("Berlin Dome")
        landmarkNames.append("Amsterdam Wind Mills")
        landmarkNames.append("Stonehenge")
        
       
        
        landmarkImage.append(UIImage(named: "eiffelTower")!)
        landmarkImage.append(UIImage(named: "towerBridge")!)
        landmarkImage.append(UIImage(named: "hungarianParliament")!)
        landmarkImage.append(UIImage(named: "santoMarcoPiazza")!)
        landmarkImage.append(UIImage(named: "medianTower")!)
        landmarkImage.append(UIImage(named: "hagiaSophia")!)
        landmarkImage.append(UIImage(named: "berlinDome")!)
        landmarkImage.append(UIImage(named: "windMills")!)
        landmarkImage.append(UIImage(named: "Stonehenge")!)
        
        navigationItem.title = "Landmark Book"
        
    }

    
   
 


}

