//
//  ViewController.swift
//  SelfSizing
//
//  Created by Kyungmin Lee on 2021/09/15.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                 for: indexPath)
        guard let customCell = cell as? CustomTableViewCell else {
            return cell
        }
        customCell.titleLabel?.text = indexPath.description
        customCell.postLabel?.text = """
            asdfasfdasfsdvasdfasdfsavsdafvasdfasvasfsadfasdfsadfasdfasfdasdfasdf
            sdvejlnlnlxnvasdfasfnknslzvlnlznc;lnv;
            enofnaslndfisov
            nlfnlsanfn
            znvlnkvs
            nssvnisnd
            vnlks
            """
        customCell.myImageView?.image = UIImage(named: "\(indexPath.row % 3 + 1)")
        return cell
    }
    
    
}
