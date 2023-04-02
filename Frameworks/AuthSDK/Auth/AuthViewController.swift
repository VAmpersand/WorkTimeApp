//
//  AuthViewController.swift
//  Pods
//
//  Created by Viktor Prikolota on 27.03.2023.
//

import UIKit
import SnapKit
import UIComponents

fileprivate extension Constants {
    static let horisontalOffset: CGFloat = 45
    static let buttonDividerOffset: CGFloat = 5
    static let interItemOffset: CGFloat = 58
    static let fieldHeight: CGFloat = 28
}

public final class AuthViewController: BaseViewController {

    private let contentView = UIView()
    private let loginTabButton = UIButton()
    private let buttonDividerView = UILabel()
    private let signUpTabButton = UIButton()
    private let usernameTextField = WTAuthTextField()
    private let passwordTestField = WTAuthTextField()
    private let loginButton = UIButton()

    override public func setup() {
        super.setup()

        view.backgroundColor = .white

        setupContentView()
        setupLoginTabButton()
        setupButtonDividerView()
        setupSignUpTabButton()
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

    func setupLoginTabButton() {
        contentView.addSubview(loginTabButton)

        loginTabButton.setTitle("Login", for: .normal)
        loginTabButton.setTitleColor(.black, for: .normal)

        loginTabButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(Constants.horisontalOffset)
        }
    }

    func setupButtonDividerView() {
        contentView.addSubview(buttonDividerView)

        buttonDividerView.text = "/"

        buttonDividerView.snp.makeConstraints {
            $0.centerY.equalTo(loginTabButton)
            $0.leading.equalTo(loginTabButton.snp.trailing).offset(Constants.buttonDividerOffset)
        }
    }

    func setupSignUpTabButton() {
        contentView.addSubview(signUpTabButton)

        signUpTabButton.setTitle("Sign Up", for: .normal)
        signUpTabButton.setTitleColor(.black, for: .normal)

        signUpTabButton.snp.makeConstraints {
            $0.bottom.equalTo(loginTabButton)
            $0.leading.equalTo(buttonDividerView.snp.trailing).offset(Constants.buttonDividerOffset)
        }
    }

    func setupLoginTextField() {
        contentView.addSubview(usernameTextField)

        usernameTextField.placeholder = "Username"

        usernameTextField.snp.makeConstraints {
            $0.top.equalTo(loginTabButton.snp.bottom).offset(Constants.interItemOffset)
            $0.leading.equalToSuperview().inset(Constants.horisontalOffset)
            $0.height.equalTo(Constants.fieldHeight)
        }
    }

    func setupPasswordTestField() {
        contentView.addSubview(passwordTestField)

        passwordTestField.placeholder = "Password"

        passwordTestField.snp.makeConstraints {
            $0.top.equalTo(usernameTextField.snp.bottom).offset(Constants.interItemOffset)
            $0.leading.equalToSuperview().inset(Constants.horisontalOffset)
            $0.height.equalTo(Constants.fieldHeight)
        }
    }

    func setupLoginButton() {
        contentView.addSubview(loginButton)

        loginButton.setTitle("Password", for: .normal)
        loginButton.backgroundColor = .blue

        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTestField.snp.bottom).offset(Constants.interItemOffset)
            $0.trailing.equalToSuperview().inset(Constants.horisontalOffset)
            $0.bottom.equalToSuperview()
        }
    }
}
