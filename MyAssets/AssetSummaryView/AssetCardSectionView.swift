//
//  AssetCardSectionView.swift
//  MyAssets
//
//  Created by Yujean Cho on 2022/07/22.
//

import SwiftUI

struct AssetCardSectionView: View {
    @State private var selectionTab = 1 // 어떤 tab 을 선택 당했는지 (1 is default)
    @ObservedObject var asset: Asset // 관찰가능한 Asset 을 바라보겠다
    
    var assetData: [AssetData] {
        return asset.data
    }
    
    var body: some View {
        VStack {
            AssetSectionHeaderView(title: asset.type.title)
            TabMenuView(
                tabs: ["지난달 결제", "이번달 결제", "다음달 결제"],
                selectedTab: $selectionTab,
                updated: .constant(.nextMonth(amount: "10,000"))
            )
            TabView(
                selection: $selectionTab) {
                    ForEach(0...2, id: \.self) { i in
                        VStack {
                            ForEach(assetData) { data in
                                HStack {
                                    Text(data.title)
                                        .font(.title)
                                        .foregroundColor(.secondary)
                                    Spacer()
                                    Text(data.creditCardAmounts![i].amount)
                                        .font(.title2)
                                        .foregroundColor(.primary)
                                }
                                Divider()
                            }
                        }
                        .tag(i)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
        .padding()
    }
}

struct AssetCardSectionView_Previews: PreviewProvider {
    static var previews: some View {
        let asset = AssetSummaryData().assets[5] // card 에 대한 내용
        AssetCardSectionView(asset: asset)
    }
}
