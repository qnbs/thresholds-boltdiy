@echo off
REM Copyright 2015 the original author or authors.
REM
REM Licensed under the Apache License, Version 2.0 (the "License");
REM you may not use this file except in compliance with the License.
REM You may obtain a copy of the License at
REM
REM      http://www.apache.org/licenses/LICENSE-2.0
REM
REM Unless required by applicable law or agreed to in writing, software
REM distributed under the License is distributed on an "AS IS" BASIS,
REM WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
REM See the License for the specific language governing permissions and
REM limitations under the License.

REM ############################################################################
REM
REM Gradle start up script for Windows
REM
REM ############################################################################

REM Add default JVM options here. You can also use JAVA_OPTS and GRADLE_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

REM Use the maximum available, or set MAX_FD != -1 to use that value.
set MAX_FD=maximum

REM Add default Gradle options here. You can also use GRADLE_OPTS to pass options to this script.
set DEFAULT_GRADLE_OPTS=

REM Current directory
set DIR=%~dp0

REM Check if the required tools are present
for %%i in (java) do (
  where %%i >nul 2>&1
  if %%errorlevel neq 0 (
    echo Error: '%%i' is not available. Please install it and try again.
    exit /b 1
  )
)

REM Locate the JVM
if not defined JAVA_HOME (
  if defined JAVACMD (
    set JAVA_HOME=%~dp0%JAVACMD%
  ) else (
    for /f "tokens=2 delims==" %%i in ('java -XshowSettings:properties -version 2>&1 ^| find "java.home"') do (
      set JAVA_HOME=%%i
    )
  )
)

REM Add default JVM options based on the JVM version
if not defined JAVA_OPTS (
  set JAVA_OPTS=%DEFAULT_JVM_OPTS%
)

REM Add default Gradle options
if not defined GRADLE_OPTS (
  set GRADLE_OPTS=%DEFAULT_GRADLE_OPTS%
)

REM Set the maximum file descriptors if set
if not "%MAX_FD%"=="maximum" if not "%MAX_FD%"=="-1" (
  ulimit -n %MAX_FD%
)

REM For CI environments, set TMPDIR to a known location to avoid permission issues
if not defined TMPDIR (
  set TMPDIR=C:\tmp
)

REM Execute the Gradle wrapper
"%JAVA_HOME%\bin\java" %JAVA_OPTS% -Dorg.gradle.appname=gradle-wrapper -classpath "%DIR%gradle\wrapper\gradle-wrapper.jar" org.gradle.wrapper.GradleWrapperMain %*
