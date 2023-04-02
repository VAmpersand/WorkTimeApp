//
//  AuthViewController.swift
//  Pods
//
//  Created by Viktor Prikolota on 27.03.2023.
//

import UIKit
import SnapKit
import UIComponents

public final class AuthViewController: BaseViewController {

    private let contentView = UIView()
    private let titleSwitchView = WTTitleSwitchView()
    private let usernameTextField = WTAuthTextField()
    private let passwordTestField = WTAuthTextField()
    private let loginButton = UIButton()

    override public func setup() {
        super.setup()

        view.backgroundColor = .white

        setupContentView()
        setupTitleSwitchView()
        setupLoginTextField()
        setupPasswordTestField()
        setupLoginButton()
    }
}

private extension AuthViewController {
    func setupContentView() {
        view.addSubview(contentView)

        contentView.snp.makeConstraints {
            $0.centerY.horizontalEdges.equalToSuperview()
        }
    }

    func setupTitleSwitchView() {
        contentView.addSubview(titleSwitchView)

        titleSwitchView.titles = ("Login", "Sign Up")

        titleSwitchView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(45)
        }
    }

    func setupLoginTextField() {
        contentView.addSubview(usernameTextField)

        usernameTextField.placeholder = "Username"

        usernameTextField.snp.makeConstraints {
            $0.top.equalTo(titleSwitchView.snp.bottom).offset(58)
            $0.leading.equalToSuperview().inset(45)
            $0.height.equalTo(28)
        }
    }

    func setupPasswordTestField() {
        contentView.addSubview(passwordTestField)

        passwordTestField.placeholder = "Password"

        passwordTestField.snp.makeConstraints {
            $0.top.equalTo(usernameTextField.snp.bottom).offset(58)
            $0.leading.equalToSuperview().inset(45)
            $0.height.equalTo(28)
        }
    }

    func setupLoginButton() {
        contentView.addSubview(loginButton)

        loginButton.setTitle("Password", for: .normal)
        loginButton.backgroundColor = .blue

        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTestField.snp.bottom).offset(58)
            $0.trailing.equalToSuperview().inset(45)
            $0.bottom.equalToSuperview()
        }
    }
}
