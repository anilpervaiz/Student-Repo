// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal enum Colors {
    internal static let sapphireLightTranslucent = ColorAsset(name: "SapphireLightTranslucent")
    internal static let aquaBlue = ColorAsset(name: "aquaBlue")
    internal static let aquaMarine = ColorAsset(name: "aquaMarine")
    internal static let blue = ColorAsset(name: "blue")
    internal static let borderColor = ColorAsset(name: "borderColor")
    internal static let brightRed = ColorAsset(name: "brightRed")
    internal static let captionGray = ColorAsset(name: "captionGray")
    internal static let darkBlue = ColorAsset(name: "darkBlue")
    internal static let darkOverlay = ColorAsset(name: "darkOverlay")
    internal static let disableGray = ColorAsset(name: "disableGray")
    internal static let dullWhite = ColorAsset(name: "dullWhite")
    internal static let gray = ColorAsset(name: "gray")
    internal static let halfBaked = ColorAsset(name: "halfBaked")
    internal static let lightBackgroundTransparent = ColorAsset(name: "lightBackgroundTransparent")
    internal static let lightGray = ColorAsset(name: "lightGray")
    internal static let lightHalfBaked = ColorAsset(name: "lightHalfBaked")
    internal static let primary = ColorAsset(name: "primary")
    internal static let pureWhite = ColorAsset(name: "pureWhite")
    internal static let purple = ColorAsset(name: "purple")
    internal static let sapphireLight = ColorAsset(name: "sapphireLight")
    internal static let successGreen = ColorAsset(name: "successGreen")
    internal static let tomatoRed = ColorAsset(name: "tomatoRed")
    internal static let tomatoRedLight = ColorAsset(name: "tomatoRedLight")
  }
  internal enum Media {
    internal static let add = ImageAsset(name: "Add")
    internal static let currentLocation = ImageAsset(name: "currentLocation")
    internal static let home = ImageAsset(name: "home")
    internal static let checkbox = ImageAsset(name: "checkbox")
    internal static let checkboxSelected = ImageAsset(name: "checkboxSelected")
    internal static let checkedCircle = ImageAsset(name: "checkedCircle")
    internal static let uncheckedCircle = ImageAsset(name: "uncheckedCircle")
    internal static let emailPrimaryBackground = ImageAsset(name: "emailPrimaryBackground")
    internal static let genderFemalePrimaryBackground = ImageAsset(name: "genderFemalePrimaryBackground")
    internal static let locationPrimaryBackground = ImageAsset(name: "locationPrimaryBackground")
    internal static let maleGenderPrimaryBackground = ImageAsset(name: "maleGenderPrimaryBackground")
    internal static let phonePrimaryBackground = ImageAsset(name: "phonePrimaryBackground")
    internal static let profilePrimaryBackground = ImageAsset(name: "profilePrimaryBackground")
    internal static let earningCardIcon = ImageAsset(name: "earningCardIcon")
    internal static let sessionsCardIcon = ImageAsset(name: "sessionsCardIcon")
    internal static let tutoredHoursCardIcon = ImageAsset(name: "tutoredHoursCardIcon")
    internal static let tutoredStudentsCardIcon = ImageAsset(name: "tutoredStudentsCardIcon")
    internal static let earningCollect = ImageAsset(name: "earningCollect")
    internal static let totalEarning = ImageAsset(name: "totalEarning")
    internal static let closeCircular = ImageAsset(name: "closeCircular")
    internal static let filter = ImageAsset(name: "filter")
    internal static let userProfileImage = ImageAsset(name: "userProfileImage")
    internal static let chat = ImageAsset(name: "chat")
    internal static let notification = ImageAsset(name: "notification")
    internal static let onboardingPage1 = ImageAsset(name: "onboardingPage1")
    internal static let onboardingPage2 = ImageAsset(name: "onboardingPage2")
    internal static let onboardingPage3 = ImageAsset(name: "onboardingPage3")
    internal static let mastercard = ImageAsset(name: "mastercard")
    internal static let visa = ImageAsset(name: "visa")
    internal static let setting = ImageAsset(name: "Setting")
    internal static let wishlist = ImageAsset(name: "Wishlist")
    internal static let address = ImageAsset(name: "address")
    internal static let billingInformation = ImageAsset(name: "billingInformation")
    internal static let edit = ImageAsset(name: "edit")
    internal static let mySessions = ImageAsset(name: "mySessions")
    internal static let myWallet = ImageAsset(name: "myWallet")
    internal static let rating = ImageAsset(name: "rating")
    internal static let subjects = ImageAsset(name: "subjects")
    internal static let starIconEmpty = ImageAsset(name: "starIconEmpty")
    internal static let starIconFilled = ImageAsset(name: "starIconFilled")
    internal static let send = ImageAsset(name: "Send")
    internal static let sessionTypeOnline = ImageAsset(name: "sessionTypeOnline")
    internal static let timeIcon = ImageAsset(name: "timeIcon")
    internal static let facebookIcon = ImageAsset(name: "facebookIcon")
    internal static let googleIcon = ImageAsset(name: "googleIcon")
    internal static let tabbarBrowseNormal = ImageAsset(name: "tabbarBrowseNormal")
    internal static let tabbarBrowseSelected = ImageAsset(name: "tabbarBrowseSelected")
    internal static let tabbarDashboardNormal = ImageAsset(name: "tabbarDashboardNormal")
    internal static let tabbarDashboardSelected = ImageAsset(name: "tabbarDashboardSelected")
    internal static let tabbarProfileNormal = ImageAsset(name: "tabbarProfileNormal")
    internal static let tabbarProfileSelected = ImageAsset(name: "tabbarProfileSelected")
    internal static let tabbarRequestNormal = ImageAsset(name: "tabbarRequestNormal")
    internal static let tabbarRequestsSelected = ImageAsset(name: "tabbarRequestsSelected")
    internal static let tabbarScheduleNormal = ImageAsset(name: "tabbarScheduleNormal")
    internal static let tabbarScheduleSelected = ImageAsset(name: "tabbarScheduleSelected")
    internal static let tabbarStudentNormal = ImageAsset(name: "tabbarStudentNormal")
    internal static let tabbarStudentSelected = ImageAsset(name: "tabbarStudentSelected")
    internal static let location = ImageAsset(name: "location")
    internal static let subjectGray = ImageAsset(name: "subjectGray")
    internal static let avatar = ImageAsset(name: "avatar")
    internal static let backArrow = ImageAsset(name: "backArrow")
    internal static let calendarHeaderLeft = ImageAsset(name: "calendarHeaderLeft")
    internal static let calendarHeaderRight = ImageAsset(name: "calendarHeaderRight")
    internal static let calendarIcon = ImageAsset(name: "calendarIcon")
    internal static let camera = ImageAsset(name: "camera")
    internal static let chatButtonCircularBorder = ImageAsset(name: "chatButtonCircularBorder")
    internal static let circularAddIcon = ImageAsset(name: "circularAddIcon")
    internal static let close = ImageAsset(name: "close")
    internal static let closeIcon = ImageAsset(name: "closeIcon")
    internal static let crossIcon = ImageAsset(name: "crossIcon")
    internal static let deleteIcon = ImageAsset(name: "deleteIcon")
    internal static let downArrow = ImageAsset(name: "down-arrow")
    internal static let downArrowCircularBorder = ImageAsset(name: "downArrowCircularBorder")
    internal static let download = ImageAsset(name: "download")
    internal static let dragableExpand = ImageAsset(name: "dragableExpand")
    internal static let errorIcon = ImageAsset(name: "errorIcon")
    internal static let eyeIcon = ImageAsset(name: "eyeIcon")
    internal static let female = ImageAsset(name: "female")
    internal static let flagButtonCircularBorder = ImageAsset(name: "flagButtonCircularBorder")
    internal static let forwardArrow = ImageAsset(name: "forward-arrow")
    internal static let forwardIcon = ImageAsset(name: "forwardIcon")
    internal static let getStartedIllustration = ImageAsset(name: "getStartedIllustration")
    internal static let heartEmpty = ImageAsset(name: "heartEmpty")
    internal static let heartFilled = ImageAsset(name: "heartFilled")
    internal static let icSearch = ImageAsset(name: "icSearch")
    internal static let inpersonIcon = ImageAsset(name: "inpersonIcon")
    internal static let listIcon = ImageAsset(name: "listIcon")
    internal static let male = ImageAsset(name: "male")
    internal static let messages = ImageAsset(name: "messages")
    internal static let moreOptions = ImageAsset(name: "more-options")
    internal static let parent = ImageAsset(name: "parent")
    internal static let addDocument = ImageAsset(name: "add-document")
    internal static let applePay = ImageAsset(name: "apple-pay")
    internal static let doc = ImageAsset(name: "doc")
    internal static let jpg = ImageAsset(name: "jpg")
    internal static let lectureMode = ImageAsset(name: "lecture-mode")
    internal static let mp4 = ImageAsset(name: "mp4")
    internal static let pdf = ImageAsset(name: "pdf")
    internal static let ratingStar = ImageAsset(name: "rating-star")
    internal static let studentParent = ImageAsset(name: "student-parent")
    internal static let student = ImageAsset(name: "student")
    internal static let subject = ImageAsset(name: "subject")
    internal static let time = ImageAsset(name: "time")
    internal static let zip = ImageAsset(name: "zip")
    internal static let profilePlaceholder = ImageAsset(name: "profilePlaceholder")
    internal static let radioButtonEmpty = ImageAsset(name: "radioButtonEmpty")
    internal static let radioButtonSelected = ImageAsset(name: "radioButtonSelected")
    internal static let radioButtonSelectedWhite = ImageAsset(name: "radioButtonSelectedWhite")
    internal static let refreshIcon = ImageAsset(name: "refreshIcon")
    internal static let rightArrow = ImageAsset(name: "rightArrow")
    internal static let language = ImageAsset(name: "language")
    internal static let logout = ImageAsset(name: "logout")
    internal static let notificationWhite = ImageAsset(name: "notificationWhite")
    internal static let privacy = ImageAsset(name: "privacy")
    internal static let starOutline = ImageAsset(name: "starOutline")
    internal static let subjectIcon = ImageAsset(name: "subjectIcon")
    internal static let successful = ImageAsset(name: "successful")
    internal static let transaction = ImageAsset(name: "transaction")
    internal static let recording = ImageAsset(name: "Recording")
    internal static let uploadFile = ImageAsset(name: "uploadFile")
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal final class ColorAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  internal private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  fileprivate init(name: String) {
    self.name = name
  }
}

internal extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
}

internal extension ImageAsset.Image {
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
