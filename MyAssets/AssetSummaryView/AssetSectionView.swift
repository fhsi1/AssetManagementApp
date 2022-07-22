//
//  AssetSectionView.swift
//  MyAssets
//
//  Created by Yujean Cho on 2022/07/22.
//

import SwiftUI

struct AssetSectionView: View {
    // @ObservedObject
    // : ObservableObject 로 만들었던 AssetSummaryData 연결하기 위함
    @ObservedObject var assetSection: Asset
    var body: some View {
        VStack(spacing: 20) {
            AssetSectionHeaderView(title: assetSection.type.title)
            ForEach(assetSection.data) { asset in
                HStack {
                    Text(asset.title)
                        .font(.title)
                        .foregroundColor(.secondary)
                    Spacer()
                    Text(asset.amount)
                        .font(.title2)
                        .foregroundColor(.primary)
                }
                Divider() // 행처럼 보이도록 ForEach 문을 통해 Divider 추가
            }
        }.padding()
    }
}

struct AssetSectionView_Previews: PreviewProvider {
    static var previews: some View {
        let asset = Asset(
        id: 0,
            type: .bankAccount,
            data: [
                AssetData(id: 0, title: "신한은행", amount: "5,300,300원"),
                AssetData(id: 1, title: "국민은행", amount: "15,300,300원"),
                AssetData(id: 2, title: "카카오은행", amount: "25,300,300원")
            ]
        )
        AssetSectionView(assetSection: asset)
    }
}
