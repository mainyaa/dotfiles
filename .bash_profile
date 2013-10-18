# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

#export JDK_HOME=/Library/Java/JavaVirtualMachines/1.6.0_33-b03-424.jdk/Contents/Home
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/1.6.0_33-b03-424.jdk/Contents/Home
export CLASSPATH=.:$JDK_HOME/lib


#export MAVEN_HOME=/usr/local/Cellar/maven/3.0.4
#export M2_HOME=$MAVEN_HOME
#export M2=$MAVEN_HOME/bin
export M2_REPO=$HOME/.m2/repository
# Maven文字化け対策
export _JAVA_OPTIONS="-Dfile.encoding=UTF-8"

#export MANPATH=/opt/local/man:$MANPATH
#export LIBRARY_PATH=/opt/local/lib:$LIBRARY_PATH
#export LD_LIBRARY_PATH=/opt/local/lib:$LD_LIBRARY_PATH
#export C_INCLUDE_PATH=/opt/local/include:$C_INCLUDE_PATH
#export CPLUS_INCLUDE_PATH=/opt/local/include:$CPLUS_INCLUDE_PATH
#export DYLD_FALLBACK_LIBRARY_PATH=/opt/local/lib
#export BOOST_ROOT=/opt/local/include/boost:$BOOST_ROOT

# GAE settings
export GAE_HOME=/Applications/GoogleAppEngineLauncher.app/Contents/Resources/GoogleAppEngine-default.bundle/Contents/Resources/google_appengine
export GAE_SDK_HOME=/Applications/eclipse/plugins/com.google.appengine.eclipse.sdkbundle_1.7.1/appengine-java-sdk-1.7.1
export APPENGINE_HOME=/Applications/GoogleAppEngineLauncher.app/Contents/Resources/GoogleAppEngine-default.bundle/Contents/Resources/google_appengine

# Gradle settings
export GRADLE_OPTS="-Dorg.gradle.daemon=true"

# android settings
export ANDROID_HOME=$HOME/android-sdks
export ANDROID_SDK_HOME=$HOME/android-sdks
export ANDROID_NDK_ROOT=$HOME/android-ndk-r8c

#AWS settings
export AWS_IAM_HOME=$HOME/local/IAMCli-1.5.0

# npm settings
export NPM_PATH=/usr/local/share/npm
export HASKELL_PATH=$HOME/Library/Haskell

# go settings
export GOROOT=/usr/local/Cellar/go/1.0.3/

# ec2 settings

# jsctags
export NODE_PATH=/usr/local/lib/jsctags:${NODE_PATH}
# Appengine/Py
export APPENGINE_HOME=/usr/local/google_appengine
# depot_tools
export DEPOT_TOOLS_HOME=/usr/local/depot_tools
# NaCL Env
export NACL_SDK_ROOT=${HOME}/local/nacl_sdk/pepper_30
export CHROME_PATH="/Applications/Google\\ Chrome\\ Canary.app/Contents/MacOS/chrome"
export NACL_DEBUG_ENABLE=1
export PPAPI_BROWSER_DEBUG=1
export NACL_PLUGIN_DEBUG=1
export NACL_PPAPI_PROXY_DEBUG=1
export NACL_SRPC_DEBUG=4 #(use a higher number for more verbose debug output)
export NACLVERBOSITY=4
export NACL_EXE_STDOUT=DEBUG_ONLY:dev://postmessage
export NACL_EXE_STDERR=DEBUG_ONLY:dev://postmessage

PATH=/usr/local/bin:$PATH:$HOME/bin:$PATH:/opt/local/bin:/opt/local/sbin:$MAVEN_HOME/bin:$JDK_HOME/bin:$JAVA_HOME/bin:$GAE_SDK_HOME/bin:$NPM_PATH/bin:$HASKELL_PATH/bin:$ANDROID_NDK_ROOT:$APPENGINE_HOME:$DEPOT_TOOLS_HOME:$NACL_SDK_ROOT/tools:$HOME/.rvm/bin
export PATH


