repo_dir := "baselib"
repo_url := "https://github.com/TheWorldAvatar/baselib.git"

clone:
    #!/usr/bin/env bash
    set -euo pipefail
    if [ ! -d "{{ repo_dir }}" ]; then
        git clone {{ repo_url }} {{ repo_dir }}
    fi

# note, this requires making a GitHub personal access token
# at https://github.com/settings/tokens/new and adding into
# ~/.m2/settings.xml like:
# <settings>
#  <servers>
#    <server>
#      <id>github</id>
#      <username>YOUR_GITHUB_USERNAME</username>
#      <password>YOUR_PERSONAL_ACCESS_TOKEN</password>
#    </server>
#  </servers>
# </settings>
build: clone
    #!/usr/bin/env bash
    set -euo pipefail
    if [ ! -f {{ repo_dir }}/target/jps-base-lib.jar ]; then
        cd {{ repo_dir }} && mvn clean install -DskipTests
    fi

convert-interactive: build
    cd {{ repo_dir }}/target && java -cp jps-base-lib.jar uk.ac.cam.cares.jps.base.converter.TBoxGeneration

convert PATH: build
    cd {{ repo_dir }}/target && java --add-opens java.base/java.lang=ALL-UNNAMED -cp jps-base-lib.jar uk.ac.cam.cares.jps.base.converter.TBoxGeneration {{ absolute_path(PATH) }}

convert-all:
    #!/usr/bin/env bash
    set -uo pipefail
    find ./ontology/ -mindepth 2 -maxdepth 2 -type f -iname "*.csv" | sort | while IFS= read -r csv_file; do
        just convert "$csv_file"
    done
