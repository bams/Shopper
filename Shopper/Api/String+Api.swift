//
//  String+Api.swift
//  Shopper
//
//  Created by John Forde on 14/5/18.
//  Copyright © 2018 4DWare. All rights reserved.
//

import then

extension String {

	func deleteCategory(shopName: String) -> Promise<Void> {
		let deleteString = "/categories/\(shopName)/\(self)".addingPercentEncoding(withAllowedCharacters: CharacterSet.urlPathAllowed)!
		print("Delete String: \(deleteString)")
		return api.deleteCategory(path: deleteString)
	}

	func saveCategory(shopName: String, aisleNumber: String) -> Promise<String> {
		return api.addCategory(path: "/categories", params: ["shopName": shopName, "aisleNumber": aisleNumber, "category": self])
	}

}
