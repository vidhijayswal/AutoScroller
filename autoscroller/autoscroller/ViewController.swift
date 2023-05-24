//
//  ViewController.swift
//  autoscroller
//
//  Created by vidhi jayswal on 25/05/19.
//  Copyright © 2019 vidhi jayswal. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{

    
    
    //----------------------
    //MARK: Outlets
    //----------------------
    
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    
    @IBOutlet weak var pageView: UIPageControl!
    
    
    
    
    
    //----------------------
    //MARK: Identifiers
    //----------------------
    
    var imgarr = [  UIImage(named:"Image-4"),
                    UIImage(named:"Image-3") ,
                    UIImage(named:"Image-2") ,
                    UIImage(named:"Image-1") ,
                    UIImage(named:"Image") ]
    
    
    var timer = Timer()
    var counter = 0
    
    
    //----------------------
    //MARK: View Life Cycle
    //----------------------
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        pageView.numberOfPages = imgarr.count
        pageView.currentPage = 0
        
        DispatchQueue.main.async
        {
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
        }
        
    }
    
    @objc func changeImage()
    {
        
        if counter < imgarr.count
        {
            let index = IndexPath.init(item: counter, section: 0)
            self.sliderCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            pageView.currentPage = counter
            counter += 1
        }
        else
        {
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.sliderCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
            pageView.currentPage = counter
            counter = 1
        }
        
    }
    
    
    
    
    
    
    
    //-----------------------------
    //MARK: CollectionView Methods
    //-----------------------------
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return imgarr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        
        if let vc = cell.viewWithTag(111) as? UIImageView
        {
            vc.image = imgarr[indexPath.row]
        }
        return cell
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let size = sliderCollectionView.frame.size
        return CGSize(width: size.width, height: size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    {
        return 0.0
    }

}



