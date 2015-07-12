# Bii Support

This repository is intended to deduplicate build scripts for biicode blocks.

	bii-support/
	├── linux
	│   ├── internal
	│   │   └── build.sh			# run only if BUILD_SHARED_LIBS is set
	│   ├── build-shared-libs.sh	# builds blocks as shared libraries
	│   └── build-static-libs.sh	# builds blocks as static libraries
	├── travis
	│   ├── install-all.sh			# runs all of the subsequent scripts
	│   ├── install-biicode.sh
	│   ├── install-clang.sh		# installs clang only if CXX is set to clang++
	│   ├── install-cmake.sh
	│   └── install-g++.sh			# installs g++ only if CXX is set to g++
	└── README.md
