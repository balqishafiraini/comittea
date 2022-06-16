//
//  T10-35_Story_Intro.swift
//  comittea
//
//  Created by Dennis Anthony on 15/06/22.
//

import UIKit

class T10_35_Story_Intro: UIViewController {
    let ChapThumbnail = UIImage(named: "Chap_Buying Tickets")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}

extension T10_35_Story_Intro: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("ChapterCell", owner: self, options: nil)?.first as! ChapterCell
        cell.Chap_Thumbnail.image = ChapThumbnail
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    

}
