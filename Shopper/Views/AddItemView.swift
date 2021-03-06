//
//  AddItemView.swift
//  Shopper
//
//  Created by John Forde on 22/4/18.
//  Copyright © 2018 4DWare. All rights reserved.
//

import Stevia

class AddItemView: UIView {

	let textField = UITextField()
	let tableView = UITableView()
	let addButton = UIButton(type: .contactAdd)
	let closeButton = UIButton()

	convenience init() {
		self.init(frame: CGRect.zero)
		backgroundColor = UIColor.themeColor
		render()
	}

	func render() {
		backgroundColor = UIColor.themeColor
		// Here we use Stevia to make our constraints more readable and maintainable.
		sv([textField,
				addButton,
				closeButton,
				tableView])

		layout(20,
					 |-16-closeButton-(>=16)-|,
					 4,
					 |-16-textField-addButton-16-|,
					 4,
					 |tableView|,
					 0)

		textField.style { t in
			t.backgroundColor = UIColor.white
			t.borderStyle = .roundedRect
			t.autocapitalizationType = .none
			t.tintColor = UIColor.themeColor
			t.textColor = UIColor.black
			t.font = UIFont.mainFont
			t.becomeFirstResponder()
		}

		addButton.style { b in
			b.backgroundColor = UIColor.themeColor//UIColor.white
			b.tintColor = UIColor.textColor
		}

		closeButton.style { b in
			b.backgroundColor = UIColor.themeColor//.lightYellow
			b.setTitleColor(UIColor.textColor, for: .normal)
			b.titleLabel?.font = UIFont.backButtonFont
			b.text("Close")
		}

		tableView.style { t in
			t.backgroundColor = UIColor.white
			t.separatorColor = UIColor.lightColor
			t.register(FrequentItemCell.self, forCellReuseIdentifier: "FrequentItemCell") // Use FrequentItemCell
			t.estimatedRowHeight = 50 // Enable self-sizing cells
		}
	}
}
