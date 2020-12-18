#!/usr/bin/env bash


echo "[JavaParser]"
echo "[JavaParser]"
echo "[JavaParser]: See also: http://github.com/javaparser/javaparser/wiki/Release-Process"
echo "[JavaParser]:"
echo "[JavaParser]: This script pulls the latest code from your default tracking branch (set automatically when using git clone)."
echo "[JavaParser]: This script then performs the maven release:prepare."
echo "[JavaParser]: - Note that release:prepare requires user input to define the new and next version."
echo "[JavaParser]:"
echo "[JavaParser]: Once the release has been prepared, several commits will have been created locally but not pushed (configured within pom.xml)."
echo "[JavaParser]: These locally created commits (AND THE NEW TAG!) must then be manually pushed."
echo "[JavaParser]:"
echo "[JavaParser]: - The release prepare can undone either via release:revert -- but note that this will create new revert commits."
echo "[JavaParser]:"
echo "[JavaParser]: - Alternatively, it can be undone by manually deleting the tag and resetting the current branch's head."
echo "[JavaParser]:   (e.g. git reset --hard HEAD^3 to go back three commits, or git reset --hard <SHA>)."
echo "[JavaParser]:   You may also need to manually delete pom backup files."
echo "[JavaParser]:"
echo "[JavaParser]: - As a last resort, you can delete your local copy and clone the repo again."
echo "[JavaParser]"
echo "[JavaParser]"

set -x

git pull

mvn -e clean
mvn -e -Darguments="-DskipTests" release:prepare

set +x

echo "[JavaParser]"
echo "[JavaParser]"
echo "[JavaParser]: Assuming the release:prepare is successful, you MUST now push the changes."
echo "[JavaParser]: - Specifically, release:perform requires the newly created tag to have been pushed."
echo "[JavaParser]"
echo "[JavaParser]"