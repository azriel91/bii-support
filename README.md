# Bii Support

This repository is intended to deduplicate build scripts for biicode blocks.

	bii-support/
	├── linux
	│   └── build
	│       ├── default.sh	# if BUILD_SHARED_LIBS is set, configures cmake, then builds the blocks
	│       ├── shared.sh	# builds blocks as shared libraries
	│       └── static.sh	# builds blocks as static libraries
	├── travis
	│   └── install
	│       ├── all.sh		# runs all of the subsequent scripts
	│       ├── biicode.sh
	│       ├── clang.sh	# installs clang only if CXX is set to clang++
	│       ├── cmake.sh
	│       └── g++.sh		# installs g++ only if CXX is set to g++
	└── README.md
