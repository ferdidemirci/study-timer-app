//
//  studyDurationVC.swift
//  Study Timer
//
//  Created by Ferdi DEMİRCİ on 28.06.2022.
//

import UIKit

class studyDurationVC: UIViewController {
    

    @IBOutlet weak var tableView: UITableView!
    
    var arrayStudyDuration = [studyDuration]()
    var standartCheck = ""
    var store = ""
    var delegate: DataTransferable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    
        arrayStudyDuration.append(studyDuration(studyTime: "15", studyCheck: ""))
        arrayStudyDuration.append(studyDuration(studyTime: "20", studyCheck: ""))
        arrayStudyDuration.append(studyDuration(studyTime: "25", studyCheck: "check"))
        arrayStudyDuration.append(studyDuration(studyTime: "30", studyCheck: ""))
        arrayStudyDuration.append(studyDuration(studyTime: "35", studyCheck: ""))
        arrayStudyDuration.append(studyDuration(studyTime: "40", studyCheck: ""))
        arrayStudyDuration.append(studyDuration(studyTime: "45", studyCheck: ""))
        arrayStudyDuration.append(studyDuration(studyTime: "50", studyCheck: ""))
        arrayStudyDuration.append(studyDuration(studyTime: "55", studyCheck: ""))
        arrayStudyDuration.append(studyDuration(studyTime: "60", studyCheck: ""))
        standartCheck = arrayStudyDuration[2].studyTime!
        store = arrayStudyDuration[2].studyCheck!
    }
    
}
extension studyDurationVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayStudyDuration.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studyDurationCell", for: indexPath) as! studyDurationCell
        cell.studyDurationTimeLabel.text = arrayStudyDuration[indexPath.row].studyTime
        if arrayStudyDuration[indexPath.row].studyCheck == "" {
            cell.studyCheck.setImage(UIImage(systemName: ""), for: .normal)
        } else {
            cell.studyCheck.setImage(UIImage(systemName: "checkmark"), for: .normal)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        /*if let rootVC = navigationController?.viewControllers.first as? SettingsVC {

            
            let studyTime = Int(arrayStudyDuration[indexPath.row].studyTime!)
            
            rootVC.studyDurationTime = studyTime
            self.navigationController?.popToRootViewController(animated: true)
        }*/
        
        let studyTime = Int(self.arrayStudyDuration[indexPath.row].studyTime!)
        dismiss(animated: true) {
            self.delegate?.onEmergencyStatus(gelen: "\(studyTime!)")
        }
        
    }
    
}
