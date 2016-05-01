//
//  ViewController.swift
//  SwiftBondSample
//
//  Created by 佐藤一輝 on 5/1/16.
//  Copyright © 2016 ichiki. All rights reserved.
//

import UIKit
import Bond

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    //let viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        let array1 = ObservableArray(["1つ目", "2つ目", "3つ目"])
        let array2 = ObservableArray(["First", "Second"])
        let dataSource = ObservableArray([array1, array2])

        dataSource.bindTo(tableView) { indexPath, dataSource, tableView in
            let cell = tableView.dequeueReusableCellWithIdentifier(
                "Cell", forIndexPath: indexPath)
            let name = dataSource[indexPath.section][indexPath.row]
            cell.textLabel?.text = name
            return cell
        }

        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("SELECT!!!")
    }
}

