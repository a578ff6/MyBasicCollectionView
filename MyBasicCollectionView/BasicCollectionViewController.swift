//
//  BasicCollectionViewController.swift
//  MyBasicCollectionView
//
//  Created by 曹家瑋 on 2023/11/7.
//

import UIKit

private let reuseIdentifier = "Cell"    // 設定重複使用的id

/// 儲存日本都道府縣
private let japanPlaceItems = [
    "北海道", "青森県", "岩手県", "宮城県", "秋田県",
    "山形県", "福島県", "茨城県", "栃木県", "群馬県",
    "埼玉県", "千葉県", "東京都", "神奈川県", "新潟県",
    "富山県", "石川県", "福井県", "山梨県", "長野県",
    "岐阜県", "静岡県", "愛知県", "三重県", "滋賀県",
    "京都府", "大阪府", "兵庫県", "奈良県", "和歌山県",
    "鳥取県", "島根県", "岡山県", "広島県", "山口県",
    "徳島県", "香川県", "愛媛県", "高知県", "福岡県",
    "佐賀県", "長崎県", "熊本県", "大分県", "宮崎県",
    "鹿児島県", "沖縄県"
]

class BasicCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 設置 collectionView 使用定定義生成的Layout
        collectionView.setCollectionViewLayout(generateLayout(), animated: false)
    }
    
    /// 生成自定義的 Compositional layout
    private func generateLayout() -> UICollectionViewLayout {
        
        // 定義間距值為10
        let spacing: CGFloat = 10
        
        // 設置 item 的大小，使其寬度和高度都佔滿 group
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        
        // 創建一個 item，這個 item 將顯示在 group 中
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // 設置 group 的大小，這裡設定寬度為整個 section 的寬度，高度為70
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(70.0)
        )
        
        // 建立一個 水平的group，這個 group 包含了上面創建的 item
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitem: item,
            count: 1
        )
        
        // 為 group 設定內容邊距
        group.contentInsets = NSDirectionalEdgeInsets(
            top: spacing,
            leading: spacing,
            bottom: 0,
            trailing: spacing
        )
        
        // 使用 group 來創建一個 section
        let section = NSCollectionLayoutSection(group: group)
        
        // 最後建立並回傳一個包含上面定義的 section 的 Compositional Layout
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }

    // MARK: - UICollectionViewDataSource

    // 返回每個 Section 中 Item 的數量，這裡是日本都道府縣的數量
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return japanPlaceItems.count
    }

    // 為每個 Item 提供一個Cell，設定Cell中的地名標籤
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? BasicCollectionViewCell else {
            fatalError("The dequeued cell is not an instance of BasicCollectionViewCell.")
        }
    
        // 設定單元格顯示的地名
        cell.placeNameLabel.text = japanPlaceItems[indexPath.item]
        
        return cell
    }
    

    // MARK: - UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
