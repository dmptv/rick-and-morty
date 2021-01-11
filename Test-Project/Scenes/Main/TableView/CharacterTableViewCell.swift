//
//  CharacterTableViewCell.swift
//  Test-Project
//
//  Created by Kanat on 07.01.2021.
//

import Kingfisher
import UIKit

class CharacterTableViewCell: UITableViewCell {

    @IBOutlet private var icon: UIImageView!
    @IBOutlet private var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with viewModel: CharacterViewModelProtocol) {
        icon.kf.setImage(with: viewModel.image)
        titleLabel.text = viewModel.name
    }
    
}
