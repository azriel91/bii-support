# Bii Support

This repository is intended to deduplicate build scripts for biicode blocks.

## Linux Development

You can build your blocks as shared/static libraries by running one of the two commands:

	bii-support/linux/build/shared.sh
	bii-support/linux/build/static.sh

## Travis-CI

### Build Dependencies

The following line can be used in your travis build configuration to install dependencies for building and publishing.

	# installs biicode, cmake, g++/clang, valgrind
	bii-support/travis/install/all-headless.sh

If you are developing with wxwidgets, use the following line instead:

	# installs 'headless' packages, libgtk-3-dev and xvfb
	bii-support/travis/install/all-desktop.sh

### Helper Scripts

The following helper scripts are provided to simplify the automatic biicode publishing workflow:

	bii-support/travis/git/
	├ is_last_commit_travis.sh
	│ # Prints 'true' if the last commit was from travis, 'false' otherwise
	│ # Environmental vars:
	│ #   TRAVIS_COMMIT_MSG (optional) - git commit message for commits made by travis.
	│ #                                  Defaults to "Promoted version. ***travis***".
	│
	├ configure.sh
	│ # Configures user.name and user.email for git
	│ # Environmental vars:
	│ #   USER_NAME - git author name for the build user
	│ #   USER_EMAIL - git author email for the build user
	│
	└ commit_changes.sh
	  # Commits any changes in the working directory and pushes it to the repository
	  # Requires that the git user has previously been set up.
	  # Environmental vars:
	  #   GITHUB_TOKEN (secure) - token with repository write access

	bii-support/travis/publish/
	└ biicode.sh
	  # Publishes the current block to biicode
	  # This automatically calls travis/git/commit_changes.sh after publishing
	  # Environmental vars:
	  #   BII_USER - username of the biicode block
	  #   BII_PASSWORD (secure) - password of the password block
