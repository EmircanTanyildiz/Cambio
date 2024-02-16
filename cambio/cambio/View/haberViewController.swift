//
//  haberViewController.swift
//  cambio
//
//  Created by Emir Can on 6.05.2023.
//

import UIKit

class haberViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableVC: UITableView!
    private var newsTableViewModel :NewsTableViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableVC.delegate = self
        tableVC.dataSource = self
        tableVC.rowHeight = UITableView.automaticDimension
        tableVC.estimatedRowHeight = UITableView.automaticDimension
        veriAl()
    }
    func veriAl(){
        let url = URL(string: "https://raw.githubusercontent.com/EmircanTanyildiz/Cambio/main/news.json")
        webService().haberleriIndir(url: url!) { (haberler) in
            if let haberler = haberler{
                self.newsTableViewModel = NewsTableViewModel(newList: haberler)
                DispatchQueue.main.async {
                    self.tableVC.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsTableViewModel == nil ? 0 : self.newsTableViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! newsCell
        let newsViewModel = self.newsTableViewModel.newsAtIndexPath(indexPath.row)
        cell.titleLabel.text = newsViewModel.title
        cell.storyLabel.text = newsViewModel.story
        return cell
    }
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}
