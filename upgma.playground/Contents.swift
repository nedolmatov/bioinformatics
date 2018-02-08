
//  Created by Nikita Dolmatov on 17.01.2018.
//  Copyright © 2018 Nikita Dolmatov. All rights reserved.

import Foundation

class дерево {
	var листья: Array<String> = []
	
	init() { }
	
	func создатьЛистья() {
		
	}
}

class upgma {
	private let качество: Dictionary<String, Double> = ["одинаковые": 0, "дилеция": 2, "не комплементарные": 2.5, "комплементарные": 3]
	private let листья: Dictionary<Character, String>
	private let матрица: Dictionary<Int, Int>
}
