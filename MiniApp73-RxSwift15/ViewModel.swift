//
//  ViewModel.swift
//  MiniApp73-RxSwift15
//
//  Created by 前田航汰 on 2022/08/06.
//

import Foundation
import RxCocoa
import RxSwift

class ViewModel {

    // var mixTextObservable: Observable<String>
    var mixTextObservable = PublishSubject<String>()
//    var textField2Observable = PublishSubject<String>()
//    var textField3Observable = PublishSubject<String>()
    let disposeBag = DisposeBag()

    init(textField1Observable: Observable<String>,
         textField2Observable: Observable<String>,
         textField3Observable: Observable<String>
    ) {

        Observable
            .combineLatest(textField1Observable, textField2Observable, textField3Observable) { text1, text2, text3 in
                return text1 + text2 + text3
            }
            .subscribe(onNext: { mixText in
                self.mixTextObservable.onNext(mixText)
                print(mixText)
            })
            .disposed(by: disposeBag)

    }
}
