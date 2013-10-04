PROJECT = ReplaceImageCategoryForXcode.xcodeproj
TEST_TARGET = Tests

clean:
	xcodebuild clean \
		-project $(PROJECT)

test:
	xcodebuild \
		-project $(PROJECT) \
		-target $(TEST_TARGET) \
		-sdk iphonesimulator \
		-configuration Debug \
		TEST_AFTER_BUILD=YES \
		TEST_HOST=
