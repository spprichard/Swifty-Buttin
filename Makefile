# From pi
build:
	swift build -c release

# From pi	
run:
	swift build -c release
	./.build/armv7-unknown-linux-gnueabihf/release/button

# From Mac
deploy-project:
	scp -r ./* pi@192.168.100.245:~/button

build-arm:
	swift build -c release --destination /Library/Developer/Destinations/armhf-5.0-RELEASE.json