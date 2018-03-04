//
//  TimeViewController.swift
//  BatePonto
//
//  Created by Fabio Miciano on 21/01/2018.
//  Copyright © 2018 Fabio Miciano. All rights reserved.
//

import Foundation
import UIKit

class TimeViewController: UIViewController {
    
    @IBOutlet weak var hourLabel: UILabel!
    let calendar = Calendar.current
    var dateSelected: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: self.updateTimer)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        showDatePicker()
    }
    
    private func updateTimer(time: Timer)-> Void {
        
        let date = Date()
        
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let seconds = calendar.component(.second, from: date)
        
        hourLabel.text = String(hour).count == 1 ? "0\(hour):\(minutes):\(seconds)" : "\(hour):\(minutes):\(seconds)"
    }
    
    private func showDatePicker() {
        let datePickerViewController = DatePickerViewController()
        datePickerViewController.delegate = self
        datePickerViewController.modalPresentationStyle = .overCurrentContext
        
        self.present(datePickerViewController, animated: true) {
            datePickerViewController.fadeInAnimation()
        }
    }
}

extension TimeViewController: ActionButtonProtocol {
    
    func actionButton<T>(type: T) {
        guard let type = type as? DateActions else { return }
        var dateController: DatePickerViewController?
        
        switch type {
        case .confirm(let date, let controller):
            dateController = controller
            dateSelected = date
        case .cancel(let controller):
            dateController = controller
        }
        
        dateController?.fadeOutAnimation(completion: {[weak self] (finished: Bool) in
            if finished { self?.dismiss(animated: true, completion: nil) }
        })
    }
}
