//
//  WTValueSwitchView.swift
//  UIComponents
//
//  Created by Viktor Prikolota on 02.04.2023.
//

import UIKit
import SnapKit

extension WTValueSwitchView {
    public enum ActivityState {
        case left
        case right

        mutating func toggle() {
            self = self == .left ? .right : .left
        }
    }
}

open class WTValueSwitchView: BaseView {
    private let firstLabel = UILabel()
    private let separatorView = UILabel()
    private let secondLabel = UILabel()
    private let button = UIButton()

    private let animationTimeInterval: TimeInterval = 0.4
    private var animationPoint: CGFloat = 0
    private var animationTimer = Timer()

    public var state = ActivityState.left {
        didSet {
            animateStateSetting()
        }
    }

    public var titles: (firstTitle: String, secondTitle: String)? = nil {
        didSet {
            firstLabel.text = titles?.firstTitle
            secondLabel.text = titles?.secondTitle
        }
    }

    override func setup() {
        super.setup()

        UIFont.registerFonts(from: Bundle.uiComponents)

        setupSeparatorView()
        setupFirstLabel()
        setupSecondLabel()
        setupButton()
    }
}

// MARK: - Setup UI
private extension WTValueSwitchView {
    func setupSeparatorView() {
        addSubview(separatorView)

        separatorView.text = "/"
        separatorView.font = WTFont.robotoMedium(size: 30)
        separatorView.textColor = WTColor.titla_active()

        separatorView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
        }
    }

    func setupFirstLabel() {
        addSubview(firstLabel)

        firstLabel.layoutMargins.bottom = 0
        firstLabel.font = WTFont.robotoMedium(size: 30)
        firstLabel.textColor = WTColor.titla_active()

        firstLabel.snp.makeConstraints {
            $0.bottom.leading.equalToSuperview()
            $0.trailing.equalTo(separatorView.snp.leading).offset(-10)
        }
    }

    func setupSecondLabel() {
        addSubview(secondLabel)

        secondLabel.font = WTFont.robotoRegular(size: 20)
        secondLabel.layoutMargins.bottom = 0
        secondLabel.textColor = WTColor.titla_inactive()

        secondLabel.snp.makeConstraints {
            $0.leading.equalTo(separatorView.snp.trailing).offset(10)
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(2.5)
        }
    }

    func setupButton() {
        addSubview(button)

        button.addTarget(self, action: #selector(buttonHandler), for: .touchUpInside)

        button.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

public extension WTValueSwitchView {
    @IBAction func buttonHandler() {
        state.toggle()
    }
}

private extension WTValueSwitchView {
    func animateStateSetting() {
        let activeLable = state == .left ? secondLabel : firstLabel
        let inactiveLable = state == .left ? firstLabel : secondLabel

        // MARK: - Separator animation
        UIView.animate(withDuration: animationTimeInterval / 4) {
            self.separatorView.alpha = 0.1
        } completion: { _ in
            UIView.animate(withDuration: self.animationTimeInterval / 4,
                           delay: self.animationTimeInterval / 2) {
                self.separatorView.alpha = 1
            }
        }

        // MARK: - Lable transition animation
        UIView.animate(withDuration: animationTimeInterval) {
            activeLable.textColor = WTColor.titla_inactive()
            inactiveLable.textColor = WTColor.titla_active()

            inactiveLable.snp.remakeConstraints {
                $0.leading.bottom.equalToSuperview()
                $0.trailing.equalTo(self.separatorView.snp.leading).offset(-10)
            }

            activeLable.snp.remakeConstraints {
                $0.trailing.equalToSuperview()
                $0.leading.equalTo(self.separatorView.snp.trailing).offset(10)
                $0.bottom.equalToSuperview().inset(2.5)
            }

            self.layoutIfNeeded()
        }

        // MARK: - Lable transformation animation
        animationTimer.invalidate()
        animationTimer = Timer.scheduledTimer(withTimeInterval: animationTimeInterval / 25,
                                              repeats: true,
                                              block: { timer in
            if self.animationPoint < 10 {
                self.animationPoint += 0.4

                let inactiveSize = 20 + self.animationPoint
                inactiveLable.font = inactiveSize > 25
                    ? WTFont.robotoMedium(size: inactiveSize)
                    : WTFont.robotoRegular(size: inactiveSize)

                let activeSize = 30 - self.animationPoint
                activeLable.font = activeSize < 25
                    ? WTFont.robotoRegular(size: activeSize)
                    : WTFont.robotoMedium(size: activeSize)

            } else {
                timer.invalidate()
                self.animationPoint = 0
            }
        })
    }
}
