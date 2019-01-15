//
//  DateTimeTouchView.swift
//  CallRecaller
//
//  Created by Brent Michalski on 1/11/19.
//  Copyright © 2019 Perlguy, Inc. All rights reserved.
//

import UIKit
import Font_Awesome_Swift
import DateToolsSwift

@IBDesignable
class DateTimeTouchView: UIView, UITextFieldDelegate {

    @IBOutlet weak var cView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var dateTextField: UITextField!
    
    
    @IBAction func dateFieldTapped(_ sender: Any) {
        
        let minDate = 1.years.earlier
        let maxDate = 1.years.later
        let nowDate = Date()
        
        let alert = UIAlertController(style: .actionSheet, title: "Select date")
        alert.addDatePicker(mode: .dateAndTime, date: nowDate, minimumDate: minDate, maximumDate: maxDate) { date in
            // action with selected date
            print("\nDATE SELECTED: \(date)\n")
            
            self.dateTextField.text = date.dateTimeString()
        }
        alert.addAction(title: "OK", style: .cancel)
        alert.show()
        
        
    }
    
    @IBAction func dfTapped2(_ sender: UITextField, forEvent event: UIEvent) {
        
        print("\nDATE TAPPED: \n")
        
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let minDate = 1.years.earlier
        let maxDate = 1.years.later
        let nowDate = Date()
        
        let alert = UIAlertController(style: .actionSheet, title: "Select date")
        alert.addDatePicker(mode: .dateAndTime, date: nowDate, minimumDate: minDate, maximumDate: maxDate) { date in
            // action with selected date
            print("\nDATE SELECTED: \(date)\n")
            
            self.dateTextField.text = date.dateTimeString()
        }
        alert.addAction(title: "OK", style: .cancel)
        alert.show()
    }
    
    @IBInspectable
    public var image: UIImage? = nil {
        didSet {
            imageView.image = image
        }
    }
    
    
    @IBInspectable
    public var containerBackgroundColor: UIColor? = nil {
        didSet {
            print("\n\nBackground color set!\n\n")
            cView.backgroundColor = containerBackgroundColor
        }
    }
    
    
    @IBInspectable
    public var placeholderText: String? = nil {
        didSet {
            dateTextField.placeholder = placeholderText
        }
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        updateDefaultsForInterfaceBuilder()
    }
    
    
    func updateDefaultsForInterfaceBuilder() {
        if image == nil {
            image = UIImage(icon: .FAUser, size: CGSize(width: 30, height: 30))
        }

        if containerBackgroundColor == nil {
            containerBackgroundColor = .orange
        }

        if placeholderText == nil {
            placeholderText = "Default Placeholder Text"
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initNib()
    }
    
    
    private func initNib() {
        if !self.subviews.isEmpty { return }
        
        let bundle = Bundle(for: DateTimeTouchView.self)
        bundle.loadNibNamed(String(describing: DateTimeTouchView.self), owner: self, options: nil)
        
        self.addSubview(self.cView)
        self.cView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.cView.topAnchor.constraint(equalTo: self.topAnchor),
            self.cView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.cView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.cView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
            ])
        
        clipsToBounds = true
        
        self.dateTextField.delegate = self
    }
    
    
    

}
