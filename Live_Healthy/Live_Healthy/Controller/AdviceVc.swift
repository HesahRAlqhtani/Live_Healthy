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
    
    var lblTitleGroup : String?
    var adviceImageGroup : UIImage?
    var desLabelGroup : String?
    
    
    
    var arrDitesPhotos = [UIImage(named: "1")!,UIImage(named: "2")!,UIImage(named: "3")!,UIImage(named: "4")!,UIImage(named: "5")!,UIImage(named: "6")!,UIImage(named: "7")]
    var kindOfDiets = [BringImages]()
    var timer :Timer?
    
    var diet = [Diet]()
    
    
    func images(){
        kindOfDiets.append(BringImages(name: "Healthy Food".loclaized, image: UIImage(named: "healthyFood")!))
        kindOfDiets.append(BringImages(name: "Sports".loclaized, image: UIImage(named: "fat1")!))
        kindOfDiets.append(BringImages(name: "More Tips".loclaized, image: UIImage(named: "moreAdvice")!))
      
    }
    var currentCellIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        images()
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      //  print(diet[indexPath.row])
//    Use switch
        switch indexPath.row {
        case 0:
            adviceImageGroup = UIImage(named: "healthyFood")
            lblTitleGroup = "Benefits of healthy eating".loclaized
            desLabelGroup = "Opting for a balanced, adequate and varied diet is an important step towards a happy and healthy lifestyle.Vitamins and minerals in the diet are vital to boost immunity and healthy development,                                                           A healthy diet can protect the human body against certain types of diseases, in particular noncommunicable diseases such as obesity, diabetes, cardiovascular diseases, some types of cancer and skeletal conditions.              Healthy diets can also contribute to an adequate body weight.                              Healthy eating is a good opportunity to enrich life by experimenting with different foods from different cultures, origins and with different ways to prepare food.                    The benefits of eating a wide variety of foods are also emotional, as variety and colour are important ingredients of a balance diet.".loclaized
        case 1:
        adviceImageGroup = UIImage(named: "fat1")
            lblTitleGroup = "The benefits of walking".loclaized
            desLabelGroup = "Walking for 30 minutes or more a day on most days of the week is a great way to improve or maintain your overall health.If you can't manage 30 minutes a day, remember 'Even a little is good, but more is better.'Walking with others can turn exercise into a fun social event.                               See your doctor for a check-up before embarking on any new fitness program, especially if you are over 40, overweight or haven't exercised for a long time.".loclaized
        case 2:
        adviceImageGroup = UIImage(named: "moreAdvice")
            lblTitleGroup = "more Tips for Your life healthy".loclaized
            desLabelGroup = "Drink more water. Most of us don’t drink enough water every day.                                              Water is essential for our bodies to function. Do you know over 60% of our body is made up of water? Water is needed to carry out body functions, remove waste, and carry nutrients and oxygen around our body. Since we lose water daily through urine, bowel movements, perspiration, and breathing, we need to replenish our water intake,Alse >                                             Get enough sleep. When you don’t rest well, you compensate by eating more. Usually, it’s junk food. Get enough rest and you don’t need to snack to stay awake. Also, lack of sleep causes premature aging and you don’t want that".loclaized
            
             
        default:
            print("")
        }
    
        performSegue(withIdentifier: "passData", sender: nil)
            
        
        }
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let vc = segue.destination as! SecondVC
            vc.adviceImageGroup = adviceImageGroup
            vc.lblTitleGroup = lblTitleGroup
            vc.desLabelGroup = desLabelGroup
         
    }
    
    
    }
    
    
    
    
  


