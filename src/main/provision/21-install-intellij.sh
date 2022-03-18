#!/bin/bash
# @file 21-install-intellij.sh
# @brief Install and configure IntelliJ.
#
# @description The script installs and configures IntelliJ and some Plugins. A launcher is created as well. The scripts
# downloads IntelliJ from the JetBrains website as well.
#
# ==== Arguments
#
# The script does not accept any parameters.


TARGET_DIR="../../../target"
INTELLIJ_TARGET_DIR="$TARGET_DIR/provision/intellij"
INSTALL_DIR="$HOME/work/tools"
PLUGINS_DIR="$INSTALL_DIR/intellij/idea-IC-211.6693.111/plugins"

mkdir -p "$TARGET_DIR"

################################################################################
#    Install IntelliJ                                                          #
################################################################################

echo -e "$LOG_INFO Install dependencies"
sudo apt-get install -y graphviz
sudo mkdir -p "/opt/local/bin"
ln -s "/usr/bin/dot" "/opt/local/bin/dot"

################################################################################

echo -e "$LOG_INFO Install IntelliJ"
rm -rf "$INTELLIJ_TARGET_DIR"
mkdir -p "$INTELLIJ_TARGET_DIR"
curl -L -o "$INTELLIJ_TARGET_DIR/intellij.tar.gz" https://download.jetbrains.com/idea/ideaIC-2021.1.tar.gz
echo -e "$LOG_DONE Finished download"

rm -rf "$INSTALL_DIR/intellij"
mkdir -p "$INSTALL_DIR/intellij"
tar -zxvf "$INTELLIJ_TARGET_DIR/intellij.tar.gz" -C "$INSTALL_DIR/intellij"
echo -e "$LOG_INFO Extracted to $INSTALL_DIR/intellij"

#### Plugin: PlantUML Integration ##############################################

echo -e "$LOG_INFO Install plugin PlantUML Integration"
curl -L -o "$INTELLIJ_TARGET_DIR/plantuml4idea.zip" "https://plugins.jetbrains.com/plugin/download?rel=true&updateId=113656"
unzip "$INTELLIJ_TARGET_DIR/plantuml4idea.zip" -d "$PLUGINS_DIR"
echo -e "$LOG_DONE Installed plugin PlantUML Integration"

#### Plugin: AsciiDoc ##########################################################

echo -e "$LOG_INFO Install plugin AsciiDoc"
curl -L -o "$INTELLIJ_TARGET_DIR/asciidoctor-intellij-plugin-0.32.35.zip" "https://plugins.jetbrains.com/plugin/download?rel=true&updateId=116177"
unzip "$INTELLIJ_TARGET_DIR/asciidoctor-intellij-plugin-0.32.35.zip" -d "$PLUGINS_DIR"
echo -e "$LOG_DONE Installed plugin AsciiDoc"

echo -e "$LOG_INFO Start IntelliJ"
#echo -e "$LOG_WARN Manual step needed: create launcher"
"$INSTALL_DIR/intellij/idea-IC-211.6693.111/bin/idea.sh" &

#### Add launcher and icon #####################################################

echo -e "$LOG_INFO Create IntelliJ Launcher with Icon"
launcherTarget="/usr/share/applications/intellij.desktop"
sudo cp "resources/intellij-launcher.desktop" "$launcherTarget"
sudo chmod 644 "$launcherTarget"
sudo chown root:root "$launcherTarget"

################################################################################

echo -e "$LOG_DONE IntelliJ setup complete"
