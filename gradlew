#!/usr/bin/env sh
# Copyright 2015 the original author or authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

################################################################################
##
## Gradle start up script for UNIX
##
################################################################################

# Add default JVM options here. You can also use JAVA_OPTS and GRADLE_OPTS to pass JVM options to this script.
DEFAULT_JVM_OPTS=""

# Use the maximum available, or set MAX_FD != -1 to use that value.
MAX_FD="maximum"

# Add default Gradle options here. You can also use GRADLE_OPTS to pass options to this script.
DEFAULT_GRADLE_OPTS=""

# Current directory
DIR="$(cd "$(dirname "$0")" && pwd)"

# Check if the required tools are present
for cmd in java; do
  if ! command -v "$cmd" >/dev/null 2>&1; then
    echo "Error: '$cmd' is not available. Please install it and try again."
    exit 1
  fi
done

# Locate the JVM
if [ -z "$JAVA_HOME" ]; then
  if [ -n "$JAVACMD" ]; then
    JAVA_HOME=$(dirname "$JAVACMD")
  else
    JAVA_HOME=$(java -XshowSettings:properties -version 2>&1 | grep 'java.home' | cut -d '=' -f 2 | tr -d ' ')
  fi
fi

# Add default JVM options based on the JVM version
if [ -z "$JAVA_OPTS" ]; then
  JAVA_OPTS="$DEFAULT_JVM_OPTS"
fi

# Add default Gradle options
if [ -z "$GRADLE_OPTS" ]; then
  GRADLE_OPTS="$DEFAULT_GRADLE_OPTS"
fi

# Set the maximum file descriptors if set
if [ "$MAX_FD" != "maximum" ] && [ "$MAX_FD" != "-1" ]; then
  ulimit -n "$MAX_FD"
fi

# For CI environments, set TMPDIR to a known location to avoid permission issues
if [ -z "$TMPDIR" ]; then
  TMPDIR="/tmp"
fi

# Execute the Gradle wrapper
exec "$JAVA_HOME/bin/java" $JAVA_OPTS -Dorg.gradle.appname=gradle-wrapper -classpath "$DIR/gradle/wrapper/gradle-wrapper.jar" org.gradle.wrapper.GradleWrapperMain "$@"
