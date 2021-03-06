//
//  ShoppingItem.swift
//  Shopper
//
//  Created by John Forde on 21/5/18.
//  Copyright © 2018 4DWare. All rights reserved.
//

import Foundation

struct ShoppingItem {

	var aisleNumber: String
	var aisleName: String
	var toDos: [ToDo]

	static func getShoppingItems(from shops: [Shop], todos: [ToDo], currentShopName: String) -> [ShoppingItem] {
		var shoppingItems: [ShoppingItem] = []

		var allCategories = Set(todos.map {$0.shoppingCategory})

		let currentShop = shops.filter { shop in
			if shop.name == currentShopName {
				return true
			} else {
				return false
			}
		}.first

		let sortedAisles = currentShop?.aisles.sorted { lhs, rhs in
			return lhs.aisleNumberInt < rhs.aisleNumberInt
		}

		guard let aisles = sortedAisles else {
			// No aisles (most likely no shop selected), so return all ToDo's
			shoppingItems.append(ShoppingItem(aisleNumber: "", aisleName: "Uncategorised", toDos: todos))
			return shoppingItems
		}

		for aisle in aisles {
			var toDosToAdd: [ToDo] = []
			for category in aisle.categories {
				for todo in todos where todo.shoppingCategory == category {
					allCategories.remove(todo.shoppingCategory)
					toDosToAdd.append(todo)
				}
			}
			if !toDosToAdd.isEmpty {
				shoppingItems.append(ShoppingItem(aisleNumber: aisle.aisleNumber, aisleName: aisle.title, toDos: toDosToAdd))
			}
		}

		// Now we need to create an uncategorized category
		var uncategorized: [ToDo] = []
		print("All Categories: \(allCategories)")
		for toDo in todos {
			if allCategories.contains(toDo.shoppingCategory) {
				uncategorized.append(toDo)
			}
		}
		if !uncategorized.isEmpty {
			shoppingItems.append(ShoppingItem(aisleNumber: "", aisleName: "Uncategorised", toDos: uncategorized))
		}

		return shoppingItems
	}
}
