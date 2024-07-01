//
//  ImageSettingViewController.swift
//  FinalChoice
//
//  Created by 서충원 on 6/15/24.
//

import UIKit

class ImageSettingViewController: UIViewController {
    
    private var customView = ImageSettingView()
    
    private var number: Int!
    weak var delegate: SelectedProfileDelegate?
    
    init(number: Int) {
        super.init(nibName: nil, bundle: nil)
        self.number = number
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = Names.NavigationTitleNames.profile
        customView.setSelectedProfileImage(number: number)
        customView.profileCollectionView.delegate = self
        customView.profileCollectionView.dataSource = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        delegate?.sendImageNumber(number: number)
    }
}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension ImageSettingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileImageCollectionViewCell.identifier, for: indexPath) as! ProfileImageCollectionViewCell
        cell.configureCell(index: indexPath.item)
        switch indexPath.item {
        case number:
            cell.state = .selected
        default:
            cell.state = .deselected
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let previousCell = collectionView.cellForItem(at: [0,number]) as? ProfileImageCollectionViewCell else { return }
        previousCell.state.toggleState()
        guard let cell = collectionView.cellForItem(at: indexPath) as? ProfileImageCollectionViewCell else { return }
        cell.state.toggleState()
        number = indexPath.item
        customView.setSelectedProfileImage(number: number)
    }
}

protocol SelectedProfileDelegate: AnyObject {
    func sendImageNumber(number: Int)
}
