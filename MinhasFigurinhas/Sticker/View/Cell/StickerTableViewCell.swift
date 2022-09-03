//
//  StickerTableViewCell.swift
//  MinhasFigurinhas
//
//  Created by Breno Luizetto on 23/08/22.
//

import Foundation
import UIKit

protocol StickerCellDelegate: AnyObject {
    func didTapPossesButton(name: String,
                            index: Int,
                            completion: @escaping ((Bool) -> Void))
}

class StickerTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    private lazy var container: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.alignment = .fill
        view.spacing = 5
        return view
    }()
    
    private lazy var stickerImage: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    private lazy var stickerLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.font = UIFont(name: "Avenir-Medium",
                          size: 18)
        return lbl
    }()
    
    private lazy var possessButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .clear
        btn.titleLabel?.textColor = .white
        btn.addTarget(self,
                      action: #selector(didTapPosssesButton),
                      for: .touchUpInside)
        return btn
    }()
    
    private var viewData: StickerViewData?
    private weak var delegate: StickerCellDelegate?
    
}

//MARK: - Functions
extension StickerTableViewCell {
    func setup(viewData: StickerViewData,
               delegate: StickerCellDelegate?) {
        self.viewData = viewData
        self.delegate = delegate
        
        setItens()
        setupViewConfiguration()
    }
    
    
    private func setItens() {
        guard let viewData = viewData else { return }
        self.stickerLabel.text = CountryHelper.getName(value: viewData.name) + " \(viewData.index)"
        self.stickerImage.image = UIImage(named: viewData.imagePath)
        
        self.checkButton()
    }
    
    private func checkButton() {
        guard let viewData = viewData else { return }

        if viewData.hasSticker {
            possessButton.setButtonState(type: .remove,
                                         isRepeated: viewData.isRepeated ?? false)
        } else {
            possessButton.setButtonState(type: .add,
                                         isRepeated: viewData.isRepeated ?? false)
        }
    }
}

//MARK: - Actions
extension StickerTableViewCell {
    @objc
    private func didTapPosssesButton() {
        delegate?.didTapPossesButton(name: viewData?.name ?? "",
                                     index: viewData?.index ?? 0,
                                     completion: { hasSticker in
            self.viewData?.hasSticker = hasSticker
            self.checkButton()
        })
    }
}

//MARK: - View Protocols
extension StickerTableViewCell: ViewConfiguration {
    func buildViewHierarchy() {
        self.contentView.addSubview(container)
        container.addArrangedSubview(stickerImage)
        container.addArrangedSubview(stickerLabel)
        container.addArrangedSubview(possessButton)
    }
    
    func makeConstraints() {
        container.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(16)
            make.right.bottom.equalToSuperview().offset(-16)
        }
        
        possessButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(90)
        }
        
        stickerImage.snp.makeConstraints { make in
            make.height.equalTo(36)
            make.width.equalTo(48)
        }
    }
    
    func configElements() {
        self.backgroundColor = .clear
        self.selectionStyle = .none
    }
    
}
