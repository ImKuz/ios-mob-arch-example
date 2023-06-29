#!/usr/bin/env bash

dir=$(dirname "$0")

# Generates module names enum
sh $dir/CodeGeneration/module-names/script.sh

# Generates dependencies for AppAssember module
sh $dir/CodeGeneration/assembler-dependencies/script.sh

# Generates assemblies list in AppAssember module
sh $dir/CodeGeneration/assembly-list/script.sh

# Create .xcfilelist files for linter
sh $dir/Lint/pre-lint.sh