//
//  ViewController.swift
//  UIStackViewSample
//
//  Created by akatsuki174 on 2016/09/25.
//  Copyright © 2016年 akatsuki174. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var allignmentButton: UIButton!
    @IBOutlet weak var distributionButton: UIButton!
    var allignmentPickerView: UIPickerView!
    var distributionPickerView: UIPickerView!
    let allignmentPickerArray:[UIStackViewAlignment] = [.fill, .leading, .top, .firstBaseline, .center, .trailing, .bottom, .lastBaseline]
    let distributionPickerArray:[UIStackViewDistribution] = [.fill, .fillEqually, .fillProportionally, .equalSpacing, .equalCentering]
    let screenSize = UIScreen.main.bounds.size
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        allignmentPickerView = UIPickerView()
        distributionPickerView = UIPickerView()
        self.setupPickerView(pickerView: allignmentPickerView, tag: 1)
        self.setupPickerView(pickerView: distributionPickerView, tag: 2)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setupPickerView(pickerView: UIPickerView, tag: Int) {
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.showsSelectionIndicator = true
        pickerView.backgroundColor = UIColor.gray
        pickerView.tag = tag
        pickerView.frame = CGRect(x: 0, y: screenSize.height, width: screenSize.width, height: 200)
        self.view.addSubview(pickerView)
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            return "\(allignmentPickerArray[row])"
        } else if pickerView.tag == 2 {
            return "\(distributionPickerArray[row])"
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return allignmentPickerArray.count
        } else if pickerView.tag == 2 {
            return distributionPickerArray.count
        }
        return 0
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView.tag == 1 || pickerView.tag == 2 {
            return 1
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        self.hidePicker(pickerView: pickerView)
    }
    
    private func showPicker(pickerView: UIPickerView) {
        UIView.animate(withDuration: 0.2) {
            pickerView.frame = CGRect(x: 0, y: self.screenSize.height - 200, width: self.screenSize.width, height: 200)
        }
    }
    
    private func hidePicker(pickerView: UIPickerView) {
        UIView.animate(withDuration: 0.2) {
            pickerView.frame = CGRect(x: 0, y: self.screenSize.height, width: self.screenSize.width, height: 200)
        }
    }
    
    @IBAction func didTappedAllignmentButton(_ sender: AnyObject) {
        self.showPicker(pickerView: allignmentPickerView)
    }

    @IBAction func didTappedDistributionButton(_ sender: AnyObject) {
        self.showPicker(pickerView: distributionPickerView)
    }
    
}

