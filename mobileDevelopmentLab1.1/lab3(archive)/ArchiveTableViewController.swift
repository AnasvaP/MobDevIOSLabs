//
//  ArchiveTableViewController.swift
//  mobileDevelopmentLab1.1
//
//  Created by Anastasiia Poliukovych on 15.02.2021.
//

import UIKit

class ArchiveTableViewController: UITableViewController {
    
    var parseJSON = ParseJSON()
    var countOfBooks = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.tableView.estimatedRowHeight = 200.0;
        self.tableView.rowHeight = 44
        
        parseJSON.onCompletion = {currentdata in
            self.countOfBooks = currentdata.title.count
           }
        parseJSON.getData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return countOfBooks
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! TableCell
        parseJSON.onCompletion = {currentdata in
            if currentdata.title[indexPath.row] == "" { cell.titleNameOutlet.text = "-"}
            else{ cell.titleNameOutlet.text = currentdata.title[indexPath.row] }
            
            if currentdata.image[indexPath.row] == "" { cell.imageOutlet.image = UIImage(named: "defaultImage") }
            else{ cell.imageOutlet.image = UIImage(named: currentdata.image[indexPath.row]) }
            
            if currentdata.subtitle[indexPath.row] == "" { cell.subtitleOutlet.text = "no subtitle"}
            else{ cell.subtitleOutlet.text = currentdata.subtitle[indexPath.row] }

            cell.priceOutlet.text = currentdata.price[indexPath.row]
            cell.isbn13Outlet.text = currentdata.isbn13[indexPath.row]
           }
        parseJSON.getData()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 44
    }
    
}

class TableCell: UITableViewCell {
    
    @IBOutlet weak var allLabelsStackView: UIStackView!
    @IBOutlet weak var isbn13Outlet: UILabel!
    @IBOutlet weak var priceOutlet: UILabel!
    @IBOutlet weak var subtitleOutlet: UILabel!
    @IBOutlet weak var titleNameOutlet: UILabel!
    @IBOutlet weak var imageOutlet: UIImageView!
}
