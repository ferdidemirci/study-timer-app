//
//  SettingsVC.swift
//  StudyTimer
//
//  Created by Ferdi DEMİRCİ on 18.06.2022.
//

import UIKit

class SettingsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var studyDurationTime: Int?
    var settingArray = [settingsModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        settingArray.append(settingsModel.init(settingTitle: "Sessions", settingName: ["Study Duration", "Break Duration", "Session Count", "Start Breaks Automatically", "Start Study Automatically"]))
        
        settingArray.append(settingsModel.init(settingTitle: "General", settingName: ["Notifications", "Dark Mode", "Apple Healty", "Sync to Calander", "Commitment Mode"]))
        
        settingArray.append(settingsModel.init(settingTitle: "About", settingName: ["About us", "How it works", "Recommend", "Rate the App", "Feedback"]))
        
        
        
    }
    
    @IBAction func upgradeButton(_ sender: Any) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "delegationSegue" {
            if let studyDurationVC = segue.destination as? studyDurationVC {
                studyDurationVC.delegate = self
            }
        }
    }
    
}

extension SettingsVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingArray.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingArray[section].settingName.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = settingArray[indexPath.section].settingName[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if settingArray[indexPath.section].settingName[indexPath.row] == "Study Duration"  {
            performSegue(withIdentifier: "studyDurationVC", sender: nil)
        }
            
        
        
    }
    	
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "studyDurationVC" {
//            let studyDuration = segue.destination
//        }
//    }

    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))
        let label = UILabel(frame: CGRect(x: 20, y: 0, width: view.frame.width - 20, height: 50))
        label.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.bold)
        label.text = settingArray[section].settingTitle
        
        view.addSubview(label)
        return view
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}
extension SettingsVC: DataTransferable {
    func onEmergencyStatus(gelen: String) {
        print("Gelen veri: \(gelen)")
    }
    
    
}
