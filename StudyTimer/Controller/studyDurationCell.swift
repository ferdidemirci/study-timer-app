//
//  studyDurationCell.swift
//  Study Timer
//
//  Created by Ferdi DEMİRCİ on 28.06.2022.
//

import UIKit

class studyDurationCell: UITableViewCell {

    @IBOutlet weak var studyDurationTimeLabel: UILabel!
    @IBOutlet weak var studyCheck: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
