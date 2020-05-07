//
//  ViewController.swift
//  DoubleScrollView
//
//  Created by eduardo rodríguez on 06/05/2020.
//  Copyright © 2020 Eduardo Rodríguez Pérez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var scrollView1: UIScrollView!
    @IBOutlet weak var tableView1: UITableView!
    @IBOutlet weak var button: UIButton!
    var data = Array(0...100)
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView1.delegate = self
        tableView1.delegate = self
        tableView1.dataSource = self
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        cell.label.text = "\(data[indexPath.row])"
        return cell
    }
}
