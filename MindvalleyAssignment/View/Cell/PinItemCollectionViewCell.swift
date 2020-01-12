//
//  PinItemCollectionViewCell.swift
//  MindvalleyAssignment
//
//  Created by ds-mayur on 1/11/20.
//  Copyright © 2020 Mayur Rathod. All rights reserved.
//

import UIKit

class PinItemCollectionViewCell: UICollectionViewCell {

    //MARK: IBOutlets
    @IBOutlet weak var pinImageView : UIImageView!
    @IBOutlet weak var bottomView : UIView!
    @IBOutlet weak var userLabel : UILabel!
    
    //MARK: Variables
    var pinsItems : PinItems?{
        didSet{
            populateView()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Setting up the UI Element
        setUI()
    }
    
    //Setting up the UI element
    func setUI(){
        self.layer.cornerRadius  = 6
        self.layer.masksToBounds = true
        
        //Setting up the colors
        userLabel.textColor = UIColor.white
        
        //Setting up the bottomView
        self.bottomView.backgroundColor = UIColor.clear
        let gradientLayer               = CAGradientLayer()
        gradientLayer.colors            = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations         = [0, 1.0]
        gradientLayer.frame             = self.bounds
        
        self.bottomView.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override func prepareForReuse() {
        pinImageView.image = nil
        userLabel.text = ""
    }
    
    //Setting up the data
    func populateView(){
        if let pinItem = pinsItems{
            userLabel.text = pinItem.user?.name ?? ""
            downloadPinImage()
        }
    }
    
    //Loading or downloading the image
    func downloadPinImage(){
        
        if let pinItemURL = pinsItems?.urls?.thumb {
            let pinImageDownloadService = PinImageDownloadingService()
            
            pinImageDownloadService.downloadPinImage(for: "\(tag)", from: pinItemURL) { [weak self] (result, urlPath) in
                
                guard let self = self else { return }
                
                if let pinItemURL = self.pinsItems?.urls?.thumb,
                    urlPath.elementsEqual(pinItemURL) {
                    
                    switch result {
                    case .success(let data):
                        self.setImage(from: data)
                    case .failure(_):
                        let placeholderImage = UIImage(named: "noImage")
                        self.setImage(from: (placeholderImage?.pngData())!)
                        break
                    }
                }
            }
        }
    }
    
    //Setting up the Image
    func setImage(from data: Data) {
        
        let newSize = self.pinImageView.bounds.size
        
        DispatchQueue.global().async {
            
            let image = UIImage(data: data)?.scale(to: newSize)
            DispatchQueue.main.async {
                self.pinImageView.image = image
            }
        }
    }
}
