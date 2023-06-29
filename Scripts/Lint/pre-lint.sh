#!/usr/bin/env bash
#
# This script generates the input and output files for SwiftLint build phases for the targets we have in the project
# to improve the speed of incrementail builds: https://developer.apple.com/documentation/xcode/improving-the-speed-of-incremental-builds

GIT_ROOT=$(git rev-parse --show-toplevel)
SRC_ROOT=$GIT_ROOT/Sources
PROJECTS_ROOT=$SRC_ROOT/Projects

echo "🧪 Running pre-lint script"

# Create a directory where we store the input/output files. This should be a folder that is ignored by git.
mkdir -p "$SRC_ROOT/.build"

# Path to this new folder where we generate the input & output files
BUILD_FOLDER="$SRC_ROOT/.build"

# The path of the result file where we save the current git diff
RESULT_FILE=$BUILD_FOLDER/git_diff_result

# Create the result file if it doesn't exist yet
if [ ! -f $RESULT_FILE ]
then
	echo "Creating result file"
	# Add a dummy text to the file, so we generate the input files when the file didn't exist before and git has no changes.
	echo -n "dummy" > "$RESULT_FILE"
fi

# Check if there is any .swift file added / deleted / renamed in the current git changes
NEW_FILES=`git diff HEAD --unified=0 -- "${PROJECTS_ROOT}/**/*.swift"`

# Load the git diff result from the last compilation
PREV_GIT_RESULT=$(<"$RESULT_FILE")

# If there were no new .swift files added since the last compilation, we don't need to regenerate the input files
if [[ "$PREV_GIT_RESULT" == "$NEW_FILES" ]]; then
	echo "No changes since last git diff, do nothing"
	exit 0
fi

# Store the current git diff for the next run
echo -n "$NEW_FILES" > "$RESULT_FILE"

# Iterating over all the Projects subdirectories containing project file
find $PROJECTS_ROOT/** -name "Project.swift" -print0 | while read -d $'\0' file
do
    project_path=${file%/*}
    project_name=$(basename $project_path)

    # Create a local project directory where we store the input/output files. This should be a folder that is ignored by git. 
    mkdir -p "$project_path/.build"
    local_build="$project_path/.build"

    # Find all .swift files in the folder to create the xcfilelist file for the SwiftLint build script
    cd ${project_path}
    find Sources -type f -name "*.swift" -not -name "*.generated.swift" | sed -e 's/^/$(SRCROOT)\//;' > "$local_build/${project_name}_swiftlint.xcfilelist"

    # Create a static empty output file. We need to create these empty output files as stated in the documentation linked above:
    # You must still specify an input and output file to prevent Xcode from running the script every time, even if your script doesn’t actually require those files. 
    # For a script that requires no input, provide a file that never changes as the input file. 
    # For a script with no outputs, create a static output file from your script so Xcode has something to check.
    touch "${local_build}/${project_name}_swiftlint_static_output"
done
