//
//  SwipingController.swift
//  Onboarding Food App
//
//  Created by Marcell Julienne on 01/09/19.
//  Copyright © 2019 Marcell Julienne. All rights reserved.
//

import UIKit

extension UIColor{
    static var mainColour = UIColor(red: 255/255, green: 247/255, blue: 208/255, alpha: 1)
    static var mainColourFade = UIColor(red: 255/255, green: 210/255, blue: 0/255, alpha: 1)
}

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let pages = [
        Page(imageName: "welcome", headerText: "Selamat datang di Pikafood!", bodyText: "Pesan makanan jadi mudah dan tanpa antre dengan Pikafood! Kami bantu anda untuk C.O.B.A (Cari, Order, Bayar dan Ambil) semua dalam satu aplikasi."),
        Page(imageName: "cari", headerText: "Pesan makanan di sekitar-mu!", bodyText: "Pilih dan order makanan di sekitar kamu! Di Pikafood, semua makanan yang ada diurutkan berdasarkan jarak jalan terdekat loh :)"),
        Page(imageName: "bayar", headerText: "Pembayaran dengan e-wallet kesayangan kamu.", bodyText: "Setelah order, bayar langsung di aplikasi Pikafood dengan e-wallet kesayangan kamu! Tersedia pilihan pembayaran Go-Pay."),
        Page(imageName: "antrian", headerText: "Lewati antrian, tinggal ambil ketika makanan siap.", bodyText: "Pikafood akan memberikan notifikasi ketika makanan sudah siap. Lewati antrean dan tinggal ambil di counter khusus Pikafood."),
        Page(imageName: "antrian", headerText: "Lewati antrian, tinggal ambil ketika makanan siap.", bodyText: "Pikafood akan memberikan notifikasi ketika makanan sudah siap. Lewati antrean dan tinggal ambil di counter khusus Pikafood.")
    ]
    
    let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.black, for: .normal)
        
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        
        return button
    }()
    
    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.black, for: .normal)
        
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        
        return button
    }()
    
    lazy var pageControlView: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.numberOfPages = pages.count - 1
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .mainColourFade
        return pageControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBottomControls()
        
        collectionView?.backgroundColor = .mainColour
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.isPagingEnabled = true
    }
}
