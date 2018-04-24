build:
	docker build -t test-app .
	docker run test-app cat /go/bin/darwin_amd64/app > bin/app
	chmod u+x bin/app

.PHONE: build
