//
//  ScannerInterfaceView.swift
//  ReactNativeCameraKit
//

import UIKit

/*
 * Full screen scanner interface
 */
class ScannerInterfaceView: UIView {
    private let frameView: ScannerFrameView
    private let topOverlayView = UIView()
    private let bottomOverlayView = UIView()
    private let leftOverlayView = UIView()
    private let rightOverlayView = UIView()

    // MARK: - Constants

    private let frameOffset: CGFloat = 30
    private let frameWidth: CGFloat = bounds.size.width - 2 * frameOffset
    private let frameHeight: CGFloat = bounds.size.width - 2 * frameOffset
    private let overlayColor: UIColor = .black.withAlphaComponent(0.4)

    // MARK: - Lifecycle

    init(frameColor: UIColor, laserColor: UIColor) {
        frameView = ScannerFrameView(frameColor: frameColor, laserColor: laserColor)

        super.init(frame: .zero)

        addSubview(frameView)

        frameView.startAnimatingScanner()

        [topOverlayView, bottomOverlayView, leftOverlayView, rightOverlayView].forEach {
            $0.backgroundColor = overlayColor
            addSubview($0)
        }
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)

        // draw square frame for QR scanner
        frameView.frame = CGRect(x: frameOffset, y: 2 * frameOffset, width: frameWidth, height: frameHeight)
        // frameView.center = center

        updateOverlaySize(frameView.frame)
    }

    // MARK: - Public

    var frameSize: CGRect {
        return frameView.frame
    }

    func startAnimatingScanner() {
        frameView.startAnimatingScanner()
    }

    func stopAnimatingScanner() {
        frameView.stopAnimatingScanner()
    }

    func update(frameColor: UIColor) {
        frameView.update(frameColor: frameColor)
    }

    func update(laserColor: UIColor) {
        frameView.update(laserColor: laserColor)
    }

    // MARK: - Private

    private func updateOverlaySize(_ frameRect: CGRect) {
        topOverlayView.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frameRect.origin.y)
        leftOverlayView.frame = CGRect(x: 0, y: frameRect.origin.y, width: frameOffset, height: frameHeight)
        rightOverlayView.frame = CGRect(x: frameRect.size.width + frameOffset, y: frameRect.origin.y, width: frameOffset, height: frameHeight)
        bottomOverlayView.frame = CGRect(x: 0, y: frameRect.origin.y + frameHeight, width: frame.size.width, height: frame.size.height - frameRect.origin.y - frameHeight)
    }
}
