//
//  T10-35_Story_Intro.swift
//  comittea
//
//  Created by Dennis Anthony on 15/06/22.
//

import UIKit

class T10_35_Story_Intro: UIViewController {
    
    let ChapThumbnail = [UIImage(named: "Chap_Planning Ahead"), UIImage(named: "Chap_Buying Tickets"), UIImage(named: "Chap_Seating Placement")]

    @IBOutlet weak var ChapTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.ChapTableView.dataSource = self
        self.ChapTableView.delegate = self
        self.registerTableViewCells()
    }
    
}

extension T10_35_Story_Intro: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ChapThumbnail.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = Bundle.main.loadNibNamed("ChapterCell", owner: self, options: nil)?.first as! ChapterCell
//        cell.Chap_Thumbnail.image = ChapThumbnail
//        return cell
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ChapterCellID") as? ChapterCell {
    
            cell.Chap_Thumbnail.image = ChapThumbnail[indexPath.row]
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    private func registerTableViewCells() {
        let textFieldCell = UINib(nibName: "ChapterCell",
                                  bundle: nil)
        self.ChapTableView.register(textFieldCell,
                                forCellReuseIdentifier: "ChapterCellID")
    }

}
