//
//  UIStoryboard+helpers.swift
//  Teachers
//
//  Created by Rahim on 18/03/2021.
//

import UIKit

protocol Initializable where Self: UIViewController {
    static var storyboardName: UIStoryboard.Name { get }
}

extension Initializable {

    private static var identifier: String {
        let name = String.init(describing: Self.self)
        return name
    }

    static func getInstance() -> Self {
        let storyboard = UIStoryboard(name: self.storyboardName.rawValue, bundle: Bundle.main)
        let instance = storyboard.instantiateViewController(withIdentifier: identifier)
        return instance as! Self
    }
}

extension UIStoryboard {
    enum Name: String {
        case signup = "Signup"
        case successState = "SuccessState"
        case login = "Login"
        case createProfile = "CreateProfile"
        case bottomSheet = "BottomSheet"
        case subjects = "Subjects"
        case addSubject = "AddSubject"
        case imagePickerBottomSheet = "ImagePickerOptionSheet"
        case getStarted = "GetStarted"
        case tabbar = "Tabbar"
        case profile = "Profile"
        case student = "Student"
        case schedule = "Schedule"
        case requests = "Requests"
        case dashboard = "Dashboard"
        case notification = "Notification"
        case message = "Messages"
        case rateAndReview = "RateAndReview"
        case sessionDetail = "SessionDetail"
        case rejectSession = "RejectSession"
        case billingInformation = "BillingInformation"
        case language = "Language"
        case addStudyingSubject = "AddStudyingSubject"
        case address = "Address"
        case browse = "Browse"
        case wishlist = "Wishlist"
        case updatePersonalInformation = "UpdatePersonalInformation"
        case teacherProfile = "TeacherProfile"
        case bookSession = "BookSession"
        case sessionBookingCompleted = "SessionBookingCompleted"
        case linkedAccount = "LinkedAccounts"
        case createNewLinkedAccount = "CreateNewLinkedAccount"
        case linkedChildProfile = "LinkedChildProfile"
        case linkedAccountSession = "LinkedAccountSession"
    }
}
