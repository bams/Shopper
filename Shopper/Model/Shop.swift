//
//  Shop.swift
//  Shopper
//
//  Created by John Forde on 10/5/18.
//  Copyright © 2018 4DWare. All rights reserved.
//

import Foundation
import IGListKit

class Shop: Equatable, CustomStringConvertible {
	var name = ""
	var aisles: [Aisle] = []

	var description: String {
		return name + String(" Aisle: \(aisles)")
	}

	init(name: String, locationName: String, aisles: [Aisle]) {
		self.name = name
		self.aisles = aisles
	}

	required init() {
		
	}

	// MARK: Equatable Protocol
	static func == (lhs: Shop, rhs: Shop) -> Bool {
		return lhs.name > rhs.name
	}
}

extension Shop: ListDiffable {
	public func diffIdentifier() -> NSObjectProtocol {
		return name as NSObjectProtocol
	}

	public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
		return self == object as? Shop
	}
}