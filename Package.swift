// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Firebase",
  platforms: [.iOS(.v11), .macOS(.v10_12), .tvOS(.v12), .watchOS(.v7)],
  products: [
    .library(
      name: "FirebaseABTesting",
      targets: ["FirebaseABTestingTarget"]
    ),
    .library(
      name: "FirebaseAnalytics",
      targets: ["FirebaseAnalyticsTarget"]
    ),
    .library(
      name: "FirebaseAnalyticsOnDeviceConversion",
      targets: ["FirebaseAnalyticsOnDeviceConversionTarget"]
    ),
    .library(
      name: "FirebaseAppCheck",
      targets: ["FirebaseAppCheckTarget"]
    ),
    .library(
      name: "FirebaseAppDistribution",
      targets: ["FirebaseAppDistributionTarget"]
    ),
    .library(
      name: "FirebaseAuth",
      targets: ["FirebaseAuthTarget"]
    ),
    .library(
      name: "FirebaseCrashlytics",
      targets: ["FirebaseCrashlyticsTarget"]
    ),
    .library(
      name: "FirebaseDatabase",
      targets: ["FirebaseDatabaseTarget"]
    ),
    .library(
      name: "FirebaseDynamicLinks",
      targets: ["FirebaseDynamicLinksTarget"]
    ),
    .library(
      name: "FirebaseFirestore",
      targets: ["FirebaseFirestoreTarget"]
    ),
    .library(
      name: "FirebaseFunctions",
      targets: ["FirebaseFunctionsTarget"]
    ),
    .library(
      name: "FirebaseInAppMessaging",
      targets: ["FirebaseInAppMessagingTarget"]
    ),
    .library(
      name: "FirebaseMLModelDownloader",
      targets: ["FirebaseMLModelDownloaderTarget"]
    ),
    .library(
      name: "FirebaseMessaging",
      targets: ["FirebaseMessagingTarget"]
    ),
    .library(
      name: "FirebasePerformance",
      targets: ["FirebasePerformanceTarget"]
    ),
    .library(
      name: "FirebaseRemoteConfig",
      targets: ["FirebaseRemoteConfigTarget"]
    ),
    .library(
      name: "FirebaseStorage",
      targets: ["FirebaseStorageTarget"]
    ),
    .library(
      name: "Google-Mobile-Ads-SDK",
      targets: ["Google-Mobile-Ads-SDKTarget"]
    ),
    .library(
      name: "GoogleSignIn",
      targets: ["GoogleSignInTarget"]
    )
  ],
  dependencies: [
  ],
  targets: [
    .target(
      name: "Firebase",
      publicHeadersPath: "./"
    ),
    .target(
      name: "FirebaseABTestingTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseABTesting"
      ],
      path: "Sources/FirebaseABTesting"
    ),
    .target(
      name: "FirebaseAnalyticsTarget",
      dependencies: [
        "Firebase",
        "_FBLPromises",
        "_FirebaseAnalytics",
        "_FirebaseCore",
        "_FirebaseCoreInternal",
        "_FirebaseInstallations",
        "_GoogleAppMeasurement",
        "_GoogleUtilities",
        "_nanopb"
      ],
      path: "Sources/FirebaseAnalytics"
    ),
    .target(
      name: "FirebaseAnalyticsOnDeviceConversionTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_FirebaseAnalyticsOnDeviceConversion", condition: .when(platforms: [.iOS])),
        .target(name: "_GoogleAppMeasurementOnDeviceConversion", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAnalyticsOnDeviceConversion"
    ),
    .target(
      name: "FirebaseAppCheckTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_AppCheckCore",
        "_FirebaseAppCheck",
        "_FirebaseAppCheckInterop"
      ],
      path: "Sources/FirebaseAppCheck"
    ),
    .target(
      name: "FirebaseAppDistributionTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_FirebaseAppDistribution", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAppDistribution"
    ),
    .target(
      name: "FirebaseAuthTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuth",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension",
        "_GTMSessionFetcher",
        .target(name: "_RecaptchaInterop", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAuth"
    ),
    .target(
      name: "FirebaseCrashlyticsTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseCoreExtension",
        "_FirebaseCrashlytics",
        "_FirebaseRemoteConfigInterop",
        "_FirebaseSessions",
        "_GoogleDataTransport",
        "_Promises"
      ],
      path: "Sources/FirebaseCrashlytics",
      exclude: [
        "run",
        "upload-symbols"
      ]
    ),
    .target(
      name: "FirebaseDatabaseTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAppCheckInterop",
        "_FirebaseDatabase",
        "_FirebaseSharedSwift",
        "_leveldb"
      ],
      path: "Sources/FirebaseDatabase"
    ),
    .target(
      name: "FirebaseDynamicLinksTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_FirebaseDynamicLinks", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseDynamicLinks"
    ),
    .target(
      name: "FirebaseFirestoreTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAppCheckInterop",
        "_FirebaseCoreExtension",
        "_FirebaseFirestore",
        "_FirebaseFirestoreInternal",
        "_FirebaseSharedSwift",
        "_absl",
        "_grpc",
        "_grpcpp",
        "_leveldb",
        "_openssl_grpc"
      ],
      path: "Sources/FirebaseFirestore"
    ),
    .target(
      name: "FirebaseFunctionsTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension",
        "_FirebaseFunctions",
        "_FirebaseMessagingInterop",
        "_FirebaseSharedSwift",
        "_GTMSessionFetcher"
      ],
      path: "Sources/FirebaseFunctions"
    ),
    .target(
      name: "FirebaseInAppMessagingTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseABTesting",
        .target(name: "_FirebaseInAppMessaging", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseInAppMessaging"
    ),
    .target(
      name: "FirebaseMLModelDownloaderTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseCoreExtension",
        "_FirebaseMLModelDownloader",
        "_GoogleDataTransport",
        "_SwiftProtobuf"
      ],
      path: "Sources/FirebaseMLModelDownloader"
    ),
    .target(
      name: "FirebaseMessagingTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseMessaging",
        "_GoogleDataTransport"
      ],
      path: "Sources/FirebaseMessaging"
    ),
    .target(
      name: "FirebasePerformanceTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseABTesting",
        "_FirebaseCoreExtension",
        .target(name: "_FirebasePerformance", condition: .when(platforms: [.iOS, .tvOS])),
        "_FirebaseRemoteConfig",
        "_FirebaseRemoteConfigInterop",
        "_FirebaseSessions",
        "_FirebaseSharedSwift",
        "_GoogleDataTransport",
        "_Promises"
      ],
      path: "Sources/FirebasePerformance"
    ),
    .target(
      name: "FirebaseRemoteConfigTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseABTesting",
        "_FirebaseRemoteConfig",
        "_FirebaseRemoteConfigInterop",
        "_FirebaseSharedSwift"
      ],
      path: "Sources/FirebaseRemoteConfig"
    ),
    .target(
      name: "FirebaseStorageTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension",
        "_FirebaseStorage",
        "_GTMSessionFetcher"
      ],
      path: "Sources/FirebaseStorage"
    ),
    .target(
      name: "Google-Mobile-Ads-SDKTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_GoogleMobileAds", condition: .when(platforms: [.iOS])),
        .target(name: "_UserMessagingPlatform", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/Google-Mobile-Ads-SDK"
    ),
    .target(
      name: "GoogleSignInTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_AppAuth", condition: .when(platforms: [.iOS])),
        .target(name: "_GTMAppAuth", condition: .when(platforms: [.iOS])),
        "_GTMSessionFetcher",
        .target(name: "_GoogleSignIn", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/GoogleSignIn"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/vvisionnn/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_AppAuth.xcframework.zip",
      checksum: "cdb46d5aa2508707ae5449b04f32af374c39ddfbfdf4448e4810f40868b0279e"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/vvisionnn/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_AppCheckCore.xcframework.zip",
      checksum: "5d29d3d32a2e51f4b46ba2b2854e75d37d270110a9c64b1f945ae9b8c16cb6e7"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/vvisionnn/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FBLPromises.xcframework.zip",
      checksum: "54199da7f5b157c105952e43d4e7de34ade7cfa3b15ad4a487c6f0286433a4a1"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/vvisionnn/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseABTesting.xcframework.zip",
      checksum: "865a8650da069fe5a64c655658d660cdcf64ace0e01e3fe01e915d828a8f0035"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/vvisionnn/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "3d7b862aa19608ea8e0a35d4db184a67bf49dabfaca800a8830c684102e4f962"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/vvisionnn/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "4afb6c493e34fc42ccbdef18542a5ce9f83862a8c53cf82e2daf9d444afa25fd"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/vvisionnn/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "36c1b2c6cd53a48e84d47536b9993d55d030c918cf44032a3841e11854e7b026"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/vvisionnn/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "054caf83ca03961718486219a522c5a2360d8a98316e9141b53e693e8ed4470c"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/vvisionnn/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "dd57de727d39bd4eff7643dbd19ff88a55c7037d25828841f3812802024bc448"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/vvisionnn/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseAuth.xcframework.zip",
      checksum: "db47f7f99f680ceb851b71e6886df127b65c302f64168fafe987e3927ed0877f"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/vvisionnn/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "5d3070384914c4962cfccf2c93066ffcb9dde9ca6a48c59296699d4ee2725739"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/vvisionnn/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseCore.xcframework.zip",
      checksum: "5c14ead1cf81a3c72379164b9667604a2cd353e5aed8b5e797938506632da4bb"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/vvisionnn/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "b7015efe926ad4ca59965eeeb17ac8ea6dcabfb1df409c14817054f55425d957"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/vvisionnn/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "4bc32d91887a89506b53c1931aba2aad18116efb145f2be55dc7905227b34421"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/vvisionnn/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "dedb0537ad468c0a3876683df98c24670a8524589d59c262957723d2967abf7f"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/vvisionnn/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseDatabase.xcframework.zip",
      checksum: "380cd089099625259113c93657cac216556fc7b32c686f0e767dc59f46d7a21a"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/vvisionnn/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "a30fcc770c72026d8249b1795169503803ce83b7d3ee05e86b046bb74ce4d500"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/vvisionnn/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseFirestore.xcframework.zip",
      checksum: "4df5542804fe253df9a101daf3c4fbca74720d232fae94a794c83bedc77d285b"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/vvisionnn/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "5d44637f95897f6818be431e7054b5109541b5c20fce829657cd7a70306b3aac"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/vvisionnn/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseFunctions.xcframework.zip",
      checksum: "965bdbd850d0493303c77fb681efa13a42a3d703335408e9c7bdaf6949153b32"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/vvisionnn/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "e742571b6a225eee4a56649e5b8792e09c636459d14124d34d52ee8420aec90b"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/vvisionnn/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseInstallations.xcframework.zip",
      checksum: "95d8285af86813d165bb8d5f413e79d99b110c0c3936b8926a8dd7d1c8d450de"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/vvisionnn/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "de845c806182c4cf6b4aa4cbed2b6719c6a0cf03bcc744b54753c352359e024b"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/vvisionnn/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseMessaging.xcframework.zip",
      checksum: "7a64e08efb93c9e4d6484cd786dc3955cb97f328240a1f86db160f66453675dd"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/vvisionnn/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "c3b510a023c445066cf87c9e374b5fd47ee1a17dd3b414ebabdac9b697707bd6"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/vvisionnn/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebasePerformance.xcframework.zip",
      checksum: "5efe466a6578d15c4c55fccb054a25a9612853c85422f0a48fc5edf0bc439c89"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/vvisionnn/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "9018efef4e54053f66d132a026153ba1a3ddb0e0e99839eaf7b7fefdef1c1938"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/vvisionnn/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "ec56d0cbbaafd5e7a842072d83b8079063d72d7faa936b08a94e02835b99feea"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/vvisionnn/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseSessions.xcframework.zip",
      checksum: "0b16a7318738865f2baf52e2aec5204582c41de697af015b5174a073e36ce088"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/vvisionnn/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "5053c885229f72fdb8a84fd58ecc7587f9e2e96ed5890dc8641d44c3d64081ed"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/vvisionnn/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseStorage.xcframework.zip",
      checksum: "2817ad083a5a7de0029fb8fed58f769a8e8e179852eb6e31426ff4b37e2f95dd"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/vvisionnn/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_GTMAppAuth.xcframework.zip",
      checksum: "226f8b24f264937afb61e4312f09b902974bbf4d88289a8f64ed69b4b2be6603"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/vvisionnn/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "5b05a2af8ab7ebdfbc4a0b4ff02f8b7ed366347655fa4cc3558b6f178354ab7c"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/vvisionnn/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "a9e7e06df650f369882e79560f3c42eb5a09ed73f12aaee058c3a77eac5313bf"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/vvisionnn/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "b5962fbc171b72f0c8842c6fc4cae3588604cf7aa841baafe6a169da16e6187f"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/vvisionnn/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_GoogleDataTransport.xcframework.zip",
      checksum: "7deeb9492d1ce5416d08edaa411e93ce80566c17847ce6073a192fe33ca7372f"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/vvisionnn/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_GoogleMobileAds.xcframework.zip",
      checksum: "56672cb4505b6f7513856011da59fb8a21b73efd055aab728b23a182bf3c60a6"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/vvisionnn/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_GoogleSignIn.xcframework.zip",
      checksum: "bc20e544e49020a2cdf72844d702eca1f2bac22f57b2eb9d1a2070e16027833a"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/vvisionnn/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_GoogleUtilities.xcframework.zip",
      checksum: "f6467aa459bc780675d042a5c195335e4648398cefdd0161c0ccde61be38d785"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/vvisionnn/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_Promises.xcframework.zip",
      checksum: "ae90ebde850d023c0d2c596c12d94aa5bb2688fe1b9b31e91f1ab1ba58869cdf"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/vvisionnn/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_RecaptchaInterop.xcframework.zip",
      checksum: "8a4b630139272921afb7a7838d50e76083d3dee3f455b884e00f0ce5b538fe1b"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/vvisionnn/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_SwiftProtobuf.xcframework.zip",
      checksum: "01e2667e170bd3a706098e44aa897947089bc4f1f0681821a3fae1e00904dc3e"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/vvisionnn/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "dfadf883cb2ca68b41116e82ca3dc4ce1c40107090bdf48a6bf54a1873741501"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/vvisionnn/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_absl.xcframework.zip",
      checksum: "0ba2530169939c377c1b586d463a1b514ca85f2291ace763e0cafbea55be9b69"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/vvisionnn/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_grpc.xcframework.zip",
      checksum: "e114795d4094337f9187d64e3ef67f33699ee28b3fab978efe40dd3081c11daa"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/vvisionnn/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_grpcpp.xcframework.zip",
      checksum: "7d6da8b10f8608e31957f6ed879eeb1a253ce4651b24f1d63ebac3beef9ac075"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/vvisionnn/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_leveldb.xcframework.zip",
      checksum: "5bfba39a81f60baafd62729d6d5add04893cb3e3be473c464ce9289fbeb1af14"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/vvisionnn/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_nanopb.xcframework.zip",
      checksum: "a6cebf06b91b5fc903848878261e83219dc3b73e5cbbe7c9f4564c9280f2568f"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/vvisionnn/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_openssl_grpc.xcframework.zip",
      checksum: "4ffe6ce473be197aebc4f6dcbcff2d79bc32ac79920f5c806f55e6fc04196087"
    )
  ]
)
    