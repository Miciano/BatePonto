//
//  DatePickerViewController.swift
//  BatePonto
//
//  Created by Fabio Miciano on 11/02/2018.
//  Copyright © 2018 Fabio Miciano. All rights reserved.
//

import Foundation
import UIKit

enum DateActions {
    case confirm(date: String, controller: DatePickerViewController)
    case cancel(controller: DatePickerViewController)
}

class DatePickerViewController: UIViewController {
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var viewBackGround: UIView!
    
    var delegate: ActionButtonProtocol! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.backgroundColor = .white
    }
    
    public func fadeInAnimation() {
        UIView.animate(withDuration: 0.5) {[weak self] in
            self?.viewBackGround.backgroundColor = .black
            self?.viewBackGround.alpha = 0.6
        }
    }
    
    public func fadeOutAnimation(completion: @escaping (Bool)->Void) {
        
        UIView.animate(withDuration: 0.5, animations: {[weak self] in
            self?.viewBackGround.alpha = 0.0
        }) { (finished) in
            if finished { completion(finished) }
        }
    }
    
    @IBAction func cancelAction(_ sender: UIButton) {
        delegate?.actionButton(type: DateActions.cancel(controller: self))
    }
    
    @IBAction func confirmAction(_ sender: UIButton) {
        delegate?.actionButton(type: DateActions.confirm(date: datePicker.date.forString(), controller: self))
    }
}
