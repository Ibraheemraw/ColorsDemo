//
//  ViewController.swift
//  ColorsDemo
//
//  Created by Ibraheem rawlinson on 3/9/20.
//  Copyright © 2020 Ibraheem rawlinson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - PROPERTIES
    @IBOutlet weak var colorCollection: UICollectionView!
    public let spacing: CGFloat = 16.0
    
    //MARK: - LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        callMethods()
    }
    
    //MARK: - METHODS
    private func callMethods(){
        addDelegation()
        CollectionViewUI()
        
    }
    private func segueToDetailVC(myPath indexPath: IndexPath, myCollection collection: [String]) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let detailController = storyBoard.instantiateViewController(identifier: "DetailController") as? DetailController else { return }
         let colorSelected = collection[indexPath.row]
        detailController.expectedColor = colorSelected
        navigationController?.pushViewController(detailController, animated: true)
    }
    private func addDelegation(){
        colorCollection.delegate = self
        colorCollection.dataSource = self
    }
    private func CollectionViewUI(){
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        colorCollection?.collectionViewLayout = layout
    }
    //MARK: - OBJECTIVE C METHODS
    
}
//MARK: - EXTENSIONS
extension ViewController: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         let numberOfItemsPerRow:CGFloat = 2
               let spacingBetweenCells:CGFloat = 16
               
               let totalSpacing = (2 * spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells) //Amount of total spacing in a row
               
        if let collection = self.colorCollection{
                   let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
                   return CGSize(width: width, height: width)
               }else{
                   return CGSize(width: 0, height: 0)
               }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        segueToDetailVC(myPath: indexPath, myCollection: HexColor.colors)
    }
    
}
extension ViewController: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return HexColor.colors.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ColorCell.id, for: indexPath) as? ColorCell else { return UICollectionViewCell() }
            cell.title.text = HexColor.colors[indexPath.row]
        cell.backgroundColor = UIColor.init(hexString: HexColor.colors[indexPath.row])
        if cell.backgroundColor == UIColor.init(hexString: "#000000") {
            cell.title.textColor = .white
        }
        cell.layer.cornerRadius = 18
        return cell
    }
}
 
  
