//
//  ViewController.swift
//  PassingDataByClosure
//
//  Created by Toan on 12/3/18.
//  Copyright © 2018 Toan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textLabel : UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.text! = "Closure"
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let Svc = segue.destination as? SecondViewController else { return }
        Svc.dataDetail = self.textLabel.text
        Svc.passData = {[unowned self](data) -> () in
            self.textLabel.text = data
        }

    }
    
    
    @IBAction func push(_ sender : UIButton) {
//        let Svc = storyboard?.instantiateViewController(withIdentifier: "Second") as! SecondViewController
//
//        navigationController?.pushViewController(Svc, animated: true)
    }
}

typealias closure = (_ data : String?) -> ()

class SecondViewController: UIViewController {
    
    @IBOutlet weak var textField : UITextField!
    var dataDetail: String?
    var passData : closure?
    override func viewDidLoad() {
        super.viewDidLoad()
        if dataDetail != nil {
            textField.text = dataDetail
        }
    }
    @IBAction func returnFirstValue(_ sender: UIButton) {
            passData?(textField.text)
        navigationController?.popToRootViewController(animated: true)
    }
    
}

