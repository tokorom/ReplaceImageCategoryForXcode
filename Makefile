SCHEME = Tests

clean:
	xcodebuild clean

test:
	xcodebuild test \
		-scheme $(SCHEME) \
		-destination "name=iPhone Retina (4-inch 64-bit),OS=7.0"
