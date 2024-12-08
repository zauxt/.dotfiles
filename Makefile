.PHONY: linux clean

linux: clean
	chmod +x ./bin/linux.sh
	./bin/linux.sh

clean:
	chmod +x ./bin/cleanup.sh
	./bin/cleanup.sh
