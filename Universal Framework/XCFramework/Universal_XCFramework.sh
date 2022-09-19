# Build Device and Simulator versions
xcodebuild archive -scheme "${PROJECT_NAME}" -archivePath "${BUILD_DIR}/iphoneos.xcarchive" -sdk iphoneos SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES
xcodebuild archive -scheme "${PROJECT_NAME}" -archivePath "${BUILD_DIR}/iphonesimulator.xcarchive" -sdk iphonesimulator SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild -create-xcframework \
    -framework "${BUILD_DIR}/iphoneos.xcarchive/Products/Library/Frameworks/"${PROJECT_NAME}".framework" \
    -framework "${BUILD_DIR}/iphonesimulator.xcarchive/Products/Library/Frameworks/"${PROJECT_NAME}".framework" \
    -output "${BUILD_DIR}/"${PROJECT_NAME}".xcframework"

    
# Copy the xcframework to the project directory
cp -R "${BUILD_DIR}/"${PROJECT_NAME}".xcframework" "${PROJECT_DIR}"

# Open the project directory in Finder
open "${PROJECT_DIR}"