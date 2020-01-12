//
//  ViewController.swift
//  MindvalleyAssignment
//
//  Created by ds-mayur on 1/10/20.
//  Copyright © 2020 Mayur Rathod. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: Variables
    var pinItems : [PinItems]   = []
    private let pinService      = PinListService()
    
    //CollectionView refresh
    private lazy var refreshControl: UIRefreshControl = {
        let control = UIRefreshControl()
        control.tintColor = .darkGray
        return control
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setting up the ui element
        setUI()
    }
    
    //Setting up the UI Elements
    func setUI(){
        
        //Setting up the title
        self.title = "Pinboard"
        
        //Fetching the Pins from the server
        getPinsAPICall()
        
        //Setting up collectionView
        setupCollectionView()
        
    }
    
    //Fetching the data from the server
    func getPinsAPICall(){
        
        pinService.getPins { (response) in
            switch response{
            case .success(let pins):
                //Adding += for pagination 
                self.pinItems += pins
                DispatchQueue.main.async {
                    self.updateCollectionViewOnSuccessPinFetch()
                }
            case .failure(_):
                print("Error : \(response)")
                break
            }
        }
    }
    
    //Setting up the collectionView after fetching data from the server
    func updateCollectionViewOnSuccessPinFetch() {
        
        if let layout = collectionView?.collectionViewLayout as? MindValleyBoardCustomLayout {
            layout.prepare()
        }
        
        collectionView.reloadData()
        refreshControl.endRefreshing()
        setupRefreshControl()
    }
    
    //Setting up the collectionView
    func setupCollectionView(){
        if let layout = collectionView.collectionViewLayout as? MindValleyBoardCustomLayout{
            layout.delegate = self
            layout.invalidateLayout()
        }
        
        collectionView.refreshControl = refreshControl
        registerCollectionViewCell()
    }
    
    func setupRefreshControl() {
        refreshControl.addTarget(self, action: #selector(refreshPinData), for: .valueChanged)
    }
    
    @objc
    func refreshPinData() {
        pinService.cancelAllPendingRequest()
        pinItems = []
        collectionView.reloadData()
        getPinsAPICall()
    }
    
    func registerCollectionViewCell() {
        let nib = UINib(nibName: Constants.collectionViewPinCellName, bundle: Bundle.main)
        collectionView.register(nib, forCellWithReuseIdentifier: Constants.collectionCell)
    }
}

extension ViewController : UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pinItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.collectionCell, for: indexPath) as? PinItemCollectionViewCell{
            cell.tag = indexPath.row
            cell.pinsItems = pinItems[indexPath.item]
            return cell
        }
        
        return UICollectionViewCell()
    }
}


extension ViewController : MindValleyBoardCustomLayoutDelegate {
    
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        return getReducedHeightForItem(at: indexPath.row) + 32.33
    }
    
    func getReducedHeightForItem(at index: Int) -> CGFloat {
        
        let cellWidth = collectionView.contentSize.width / 2
        let width: CGFloat =  CGFloat(integerLiteral: pinItems[index].width ?? 0)
        let height: CGFloat = CGFloat(integerLiteral: pinItems[index].height ?? 0)
        
        let factor = width / cellWidth
        let reducedHeight = height / factor
        
        return reducedHeight
    }
}


extension ViewController : UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView.isReachToBottom() {
            print("Pagination With Page Index Can Be Done Here")
        }
    }
}
