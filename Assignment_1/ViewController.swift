//
//  ViewController.swift
//  Assignment_1
//
//  Created by Tsz Kit Cheung on 2023-09-22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var outputLabel: UILabel!
    
    @IBOutlet weak var B1: UIButton!
    
    @IBOutlet weak var B2: UIButton!
    
    @IBOutlet weak var B3: UIButton!
    
    @IBOutlet weak var B4: UIButton!
    
    @IBOutlet weak var B5: UIButton!
    
    @IBOutlet weak var B6: UIButton!
    
    @IBOutlet weak var B7: UIButton!
    
    @IBOutlet weak var B8: UIButton!
    
    @IBOutlet weak var B9: UIButton!
    
    @IBOutlet weak var B0: UIButton!
    
    @IBOutlet weak var Bplus: UIButton!
    
    @IBOutlet weak var Bminus: UIButton!
    
    @IBOutlet weak var Bmultiply: UIButton!

    @IBOutlet weak var Bdivide: UIButton!
    
    @IBOutlet weak var BC: UIButton!
    
    @IBOutlet weak var Bequal: UIButton!
    
    // self-define variable
    var resultArray: [String] = []
    var resultString: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // wrapping of word in outputLabel
        outputLabel.numberOfLines = 0
        outputLabel.lineBreakMode = .byWordWrapping
        
    }
    
    @IBAction func Push(_ sender: UIButton) {
        resultArray = calculatorFunc.push(input: sender.tag)
        resultString = resultArray.joined()
        outputLabel.text = resultString
        
//        print(resultArray)
        
    }
    
    @IBAction func Calculate(_ sender: Any) {
        
        let (result, errorMessage) = calculatorFunc.calculate(inputArray: resultArray)
        
        resultArray.append("=")
        if let eM = errorMessage{
            resultArray.append(eM)
        }
        
        if let ans = result{
            resultArray.append(String(ans))
        }
        resultString = resultArray.joined()
        outputLabel.text = resultString
        
    }
    
}

