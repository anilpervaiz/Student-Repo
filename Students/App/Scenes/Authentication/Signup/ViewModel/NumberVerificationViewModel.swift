//
//  NumberVerificationViewModel.swift
//  Teachers
//
//  Created by Rahim on 18/03/2021.
//

import Foundation

class NumberVerificationViewModel {
    private var resendOtpTimer: Timer?
    private var otpExpireTimer: Timer?
    var userType: UserType?

    private var otpExpireStartTimerInterval: Date!

    var output: ((Output) -> Void)?

    internal func invalidateTimer() {
        resendOtpTimer?.invalidate()
        resendOtpTimer = nil
    }

    init(userType: UserType?) {
        self.userType = userType
    }

    func viewDidLoad() {

        setResendOtpTimer()
        setOtpExpireTimer()
    }

    func viewWillDisappear() {
        invalidateTimer()
        invalidateOTPExpireTimer()
    }

    private func setResendOtpTimer() {
        resendOtpTimer = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(updateResendOtpState), userInfo: nil, repeats: false)
        output?(.canResentOTP(false))
    }

    func didTapOnResendOtpButton() {
        output?(.canResentOTP(false))
        setResendOtpTimer()
        setOtpExpireTimer()
    }

    @objc
    private func updateResendOtpState() {
        output?(.canResentOTP(true))
        invalidateTimer()
    }

    internal func setOtpExpireTimer() {

        invalidateOTPExpireTimer()
        otpExpireStartTimerInterval = Date().addingTimeInterval(60)

        otpExpireTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [weak self] (_) in
            guard let self = self else { return }

            var timeInterval: TimeInterval = self.otpExpireStartTimerInterval.timeIntervalSince(Date())

            if timeInterval <= 0 {
                self.invalidateOTPExpireTimer()
                timeInterval = 0
            }
            self.setOTPExpireTimeValue(with: timeInterval)
        })
        otpExpireTimer?.fire()
    }


    private func invalidateOTPExpireTimer() {
        otpExpireTimer?.invalidate()
        otpExpireTimer = nil
    }

    private func setOTPExpireTimeValue(with timerInterval: TimeInterval) {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        let formattedTime = (formatter.string(from: timerInterval) ?? "00:00")
        output?(.updateCodeExpireTimer(timerString: formattedTime))
    }

    enum Output {
        case canResentOTP(Bool)
        case updateCodeExpireTimer(timerString: String)
    }
}
