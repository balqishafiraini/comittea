//
//  ViewController.swift
//  comittea
//
//  Created by Balqis on 02/06/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var storyText = ["Hehehe", "Halo", "Balqis cantik"]

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storyText.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "bubbleChatID", for: indexPath) as? BubbleChatCell)!
        cell.bubbleText.text = storyText[indexPath.row]
        return cell
    }
    

    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

