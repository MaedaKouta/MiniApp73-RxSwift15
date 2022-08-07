//
//  ViewController.swift
//  MiniApp73-RxSwift15
//
//  Created by 前田航汰 on 2022/08/06.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet private weak var textField1: UITextField!
    @IBOutlet private weak var textField2: UITextField!
    @IBOutlet private weak var textField3: UITextField!
    @IBOutlet private weak var textLabel: UILabel!
    private var viewModel: ViewModel?
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = ViewModel(
            textField1Observable: textField1.rx.text.orEmpty.asObservable(),
            textField2Observable: textField2.rx.text.orEmpty.asObservable(),
            textField3Observable: textField3.rx.text.orEmpty.asObservable()
        )

        viewModel?.mixTextObservable
            .bind(to: textLabel.rx.text)
            .disposed(by: disposeBag)

    }

}

