#!/bin/sh
xcodebuild clean -project SwiftLintTest.xcodeproj -scheme SwiftLintTest
rm -rf ~/Library/Developer/Xcode/DerivedData/SwiftLintTest-*
xcodebuild -project SwiftLintTest.xcodeproj -scheme SwiftLintTest >xcodebuild.log

# swiftlint analyze --compiler-log-path xcodebuild.log

if [ ! -d XcodeCompilationDatabase ]
then
    git clone https://github.com/jerrymarino/XcodeCompilationDatabase
    (cd XcodeCompilationDatabase; make release)
fi

XcodeCompilationDatabase/.build/release/XCodeCompilationDatabase xcodebuild.log
swiftlint analyze --compile-commands compile_commands.json
