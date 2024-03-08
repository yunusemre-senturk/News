//
//  Exchange.swift
//  news
//
//  Created by Yunus Emre Şentürk on 1.03.2024.
//

import UIKit

class Exchange: UIView {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var money: UILabel!
    @IBOutlet weak var rateImage: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
    
    private func configureView(){
        let bundle = Bundle.init(for: Exchange.self)
        if let viewToAdd = bundle.loadNibNamed("Exchange", owner: self, options: nil), let contentView = viewToAdd.first as? UIView {
            addSubview(contentView)
            contentView.frame = self.bounds
            contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        }
    }
    
}
