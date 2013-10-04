SCHEME = Tests

clean:
	xcodebuild clean

test:
	xcodebuild test \
		-scheme $(SCHEME) \
		-destination 'platform=iOS Simulator,name=iPhone Retina (4-inch 64-bit)'   

