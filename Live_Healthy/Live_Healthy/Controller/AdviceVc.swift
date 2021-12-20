//
//  AdviceVc.swift
//  Live_Healthy
//
//  Created by Hesah Alqhtani on 14/12/2021.
//

import UIKit

class AdviceVc: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UITableViewDelegate,UITableViewDataSource {
   
    
   
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var dataTbl: UITableView!
    
    
    var arrDitesPhotos = [UIImage(named: "keto1")!,UIImage(named: "health")!,UIImage(named: "health1")!,UIImage(named: "health2")!,UIImage(named: "health3")!,UIImage(named: "health5")!,UIImage(named: "fat1")]
    var kindOfDiets = [BingImages]()
    var timer :Timer?
    
   // var diet = [Diet]()
    
    
    func mm(){
        kindOfDiets.append(BingImages(name: "gff", image: UIImage(named: "fat1")!))
        kindOfDiets.append(BingImages(name: "gff", image: UIImage(named: "fat1")!))
        kindOfDiets.append(BingImages(name: "gff", image: UIImage(named: "fat1")!))
        kindOfDiets.append(BingImages(name: "gff", image: UIImage(named: "fat1")!))
        kindOfDiets.append(BingImages(name: "gff", image: UIImage(named: "fat1")!))
        
        
       // diet.append(Diet(title: "hesah", image: UIImage(named: "health2")!))
    }
    var currentCellIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        mm()
        collectionView.delegate = self
        collectionView.dataSource = self
        pageControl.numberOfPages = arrDitesPhotos.count
        dataTbl.delegate = self
        dataTbl.dataSource = self
        
        startTimer()
    }
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval:3, target: self, selector: #selector(moveToNextIndex), userInfo: nil, repeats: true)
        
    }
   @objc func moveToNextIndex() {
       if currentCellIndex < arrDitesPhotos.count - 1 {
           currentCellIndex += 1
       }else{
           currentCellIndex = 0
           
           
       }
       
       
       collectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .centeredHorizontally, animated: true)
       pageControl.currentPage = currentCellIndex
    
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrDitesPhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AdvicesCollectionViewCell", for: indexPath) as! AdvicesCollectionViewCell
        cell.dietImage.image = arrDitesPhotos[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kindOfDiets.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 108
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DataTableViewCell
        let data = kindOfDiets[indexPath.row]
        cell.setupCell(photo: data.image, name: data.name)
       return cell
        }
    
    
    }
    
    
    
    
  


