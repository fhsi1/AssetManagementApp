//
//  AssetBannerView.swift
//  MyAssets
//
//  Created by Yujean Cho on 2022/07/22.
//

import SwiftUI

struct AssetBannerView: View {
    let bannerList: [AssetBanner] = [
        AssetBanner(title: "여름 프로모션", description: "여름! 🏄🏻‍♂️", backgroundColor: .systemCyan),
        AssetBanner(title: "공지사항", description: "추가된 공지사항을 확인하세요", backgroundColor: .systemRed),
        AssetBanner(title: "주말 이벤트", description: "주말 이벤트 놓치지 마세요", backgroundColor: .systemYellow),
        AssetBanner(title: "깜짝 이벤트", description: "엄청난 이벤트에 놀라지 마세요", backgroundColor: .systemBlue)
    ]
    @State private var currentPage = 0
    
    var body: some View {
        let bannerCards = bannerList.map{ BannerCard(banner: $0) }
        ZStack(alignment: .bottomTrailing) {
            PageViewController(pages: bannerCards, currentPage: $currentPage) // $currentPage -> @State
            PageControl(numberOfPages: bannerList.count, currentPage: $currentPage)
                .frame(width: CGFloat(bannerCards.count * 18))
                .padding(.trailing)
        }
    }
}

struct AssetBannerView_Previews: PreviewProvider {
    static var previews: some View {
        AssetBannerView()
            .aspectRatio(5/2, contentMode: .fit)
    }
}
