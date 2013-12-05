SCHEME = Tests
DESTINATION = "name=iPhone Retina (4-inch 64-bit),OS=7.0"

clean:
	xcodebuild clean

test:
	xcodebuild test \
		-scheme $(SCHEME) \
		-destination $(DESTINATION)

test-with-coverage:
	xcodebuild test \
		-scheme $(SCHEME) \
		-destination $(DESTINATION) \
		GCC_INSTRUMENT_PROGRAM_FLOW_ARCS=YES \
		GCC_GENERATE_TEST_COVERAGE_FILES=YES \
		GCC_PREPROCESSOR_DEFINITIONS='${inherited} GCOV_FLUSH=1'

send-coverage:
	coveralls \
		--exclude Demo \
		--exclude Tests \
		--verbose
