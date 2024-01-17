#!/bin/sh
#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#
set -e

SOURCES_DIR=/tmp/artifacts
SCRIPT_DIR=$(dirname "${0}")
ADDED_DIR="${SCRIPT_DIR}"/added

unzip "${SOURCES_DIR}"/management-console-quarkus-app.zip -d "${KOGITO_HOME}"/bin/
cp -rv "${ADDED_DIR}"/launch/* "${KOGITO_HOME}"/launch/

chown -R 1001:0 "${KOGITO_HOME}"
chmod -R ug+rwX "${KOGITO_HOME}"

cp -v "${ADDED_DIR}"/kogito-app-launch.sh "${KOGITO_HOME}"
chmod +x-w "${KOGITO_HOME}"/kogito-app-launch.sh

