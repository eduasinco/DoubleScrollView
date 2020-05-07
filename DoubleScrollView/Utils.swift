//
//  Utils.swift
//  DoubleScrollView
//
//  Created by eduardo rodríguez on 06/05/2020.
//  Copyright © 2020 Eduardo Rodríguez Pérez. All rights reserved.
//

import UIKit

class PassthroughView: UIView {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, with: event)
        return view == self ? nil : view
    }
}

class ReselectableSegmentedControl: UISegmentedControl {
}

class HeaderButton: UIButton {
    override var next: UIResponder? {
        get {
            var view: UIScrollView?
            for v in self.superview!.subviews {
                if v is UIScrollView{
                    view = v as? UIScrollView
                }
            }
            return view
        }
    }
}

class SScrollView: UIScrollView {
    override func touchesShouldCancel(in view: UIView) -> Bool {
        return true
    }
}

class MyOwnTableView: UITableView {
    override var intrinsicContentSize: CGSize {
        self.layoutIfNeeded()
        return self.contentSize
    }

    override var contentSize: CGSize {
        didSet{
            self.invalidateIntrinsicContentSize()
        }
    }

    override func reloadData() {
        super.reloadData()
        self.invalidateIntrinsicContentSize()
    }
}
