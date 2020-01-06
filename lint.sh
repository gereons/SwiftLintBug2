#!/bin/sh
xcodebuild clean -project SwiftLintTest.xcodeproj -scheme SwiftLintTest
rm -rf ~/Library/Developer/Xcode/DerivedData/SwiftLintTest-*
xcodebuild -project SwiftLintTest.xcodeproj -scheme SwiftLintTest >xcodebuild.log
swiftlint analyze --compiler-log-path xcodebuild.log
