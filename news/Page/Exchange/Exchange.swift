//
//  ExchangeController.swift
//  news
//
//  Created by Yunus Emre Şentürk on 1.03.2024.
//

import UIKit

class ExchangeController: UIView {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var money: UILabel!
    @IBOutlet weak var rate: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
    
    private func configureView(){
        let bundle = Bundle.init(for: ExchangeController.self)
        if let viewToAdd = bundle.loadNibNamed("ExchangeController", owner: self, options: nil), let contentView = viewToAdd.first as? UIView {
            addSubview(contentView)
            contentView.frame = self.bounds
            contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        }
    }
    
}
