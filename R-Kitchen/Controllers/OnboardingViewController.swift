//
//  OnboardingViewController.swift
//  R-Kitchen
//
//  Created by Ananth Nair on 10/02/24.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControlSlider: UIPageControl!
    @IBOutlet weak var nxtBtn: UIButton!
    var slider : [OnboardingStructSlide] = [OnboardingStructSlide(title : "Delicious Dishes", description : "Experience a variety of amazing dishes from  different cultures around the world.", image : #imageLiteral(resourceName: "slide2")), OnboardingStructSlide(title : "World class chef", description : "our dishes are prepared by only the best" , image :  #imageLiteral(resourceName: "slide1")), OnboardingStructSlide(title : "Instant World-Wide Delivery", description : "your order will be delivered instantly", image : #imageLiteral(resourceName: "slide3") )]
    
    var currentPage: Int = 0 {
        didSet {
            pageControlSlider.currentPage = currentPage
            if currentPage == slider.count - 1 {
                nxtBtn.setTitle("get Started ", for: .normal)
            } else {
                nxtBtn.setTitle("Next", for: .normal)
            }
            
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //slider = [OnboardingStructSlide(title : "Delicious Dishes", description : "Experience a variety of amazing dishes from  different cultures around the world.", image : #imageLiteral(resourceName: "slide2")), OnboardingStructSlide(title : "World class chef", description : "our dishes are prepared by only the best" , image :  #imageLiteral(resourceName: "slide1")), OnboardingStructSlide(title : "Instant World-Wide Delivery", description : "your order will be delivered instantly", image : #imageLiteral(resourceName: "slide3") )]
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func nxtbtnTapped(_ sender: UIButton) {
        if currentPage == slider.count - 1  {
            print("Go to next page")
            ///navigate 
        } else {
            print("Before :------------\(currentPage)")
            currentPage += 1
            print("After :-------------\(currentPage)")
            let indexPath = IndexPath(item: currentPage, section: 0)
            print(indexPath)
            pageControlSlider.currentPage = currentPage
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            
            //pageControlSlider.
        }
        
        
    }
    
}

extension OnboardingViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slider.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cv = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath)  as! OnboardingCollectionViewCell
        cv.setup(slider[indexPath.row])
        return cv
    }
    
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        print("insideScroll -> Before: ----> \(currentPage)")
        currentPage = Int(scrollView.contentOffset.x / width )
        print("insideScroll -> After: ----> \(currentPage)")
    }
    
}
