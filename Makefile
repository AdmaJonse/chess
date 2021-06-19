.PHONY: all build clean test docs run workflow

build: 
	@echo
	@echo "==================="
	@echo "Building project..."
	@echo "==================="
	gprbuild -p chess.gpr


all: default.cgpr build test docs

default.cgpr:
	gprconfig --batch --config Ada --config C -o $@

clean:
	@echo 
	@echo "==================="
	@echo "Cleaning project..."
	@echo "==================="
	gprclean -r chess.gpr
	rm -rf build/obj
	rm -f build/default.cgpr
	rm -rf docs/gnatdoc
	rm -rf test/harness

test/harness/test_runner:
	@echo
	@echo "==================="
	@echo "Building tests...  "
	@echo "==================="
	mkdir -p test/harness
	gnat test -dd -P chess.gpr -v -r
	gprbuild -p -Ptest/harness/test_driver.gpr


test: test/harness/test_runner 
	@echo 
	@echo "==================="
	@echo "Running tests...   "
	@echo "==================="
	test/harness/test_runner --passed-tests=hide --skeleton-default=pass


docs: 
	@echo 
	@echo "==================="
	@echo "Generating docs..."
	@echo "==================="
	mkdir -p docs/gnatdoc
	gnatdoc -P chess.gpr

run: all
	@echo
	@echo "==================="
	@echo "Running project... "
	@echo "==================="
	build/chess.exe

workflow:
	@echo
	@echo "==================="
	@echo "Running workflow..."
	@echo "==================="
	act -s GITHUB_TOKEN=$(shell cat .token)
