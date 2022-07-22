//
//  AssetSummaryData.swift
//  MyAssets
//
//  Created by Yujean Cho on 2022/07/22.
//

import SwiftUI

class AssetSummaryData: ObservableObject {
    // @Published : 발행한다, 내보낸다. - must class
    @Published var assets: [Asset] = load("assets.json")
    
    // ObservableObject 이므로 body 가 없다.
}

// file 을 주면 원하는 형태로 decoding 을 해준다.
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError(filename + "을 찾을 수 없습니다")
    }
    
    // if find file
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError(filename + "을 찾을 수 없습니다")
    }
    
    // if get data, decode
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError(filename + "을 \(T.self)로 파싱할 수 없습니다")
    }
}
