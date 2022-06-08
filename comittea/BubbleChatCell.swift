//
//  BubbleChatCell.swift
//  comittea
//
//  Created by Balqis on 08/06/22.
//

import UIKit

class BubbleChatCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    @IBOutlet weak var bubbleText: UILabel!
    @IBOutlet weak var chatBubble: UIImageView!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
