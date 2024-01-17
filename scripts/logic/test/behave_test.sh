#!/bin/bash
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

script_dir_path="$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)"
source ${script_dir_path}/env_test.sh $@

echo "---- Pulling image ${image_full_tag} ----"
docker pull ${image_full_tag}

echo "---- Run behave test for image ${image_id} ----"
cekit --descriptor ${image_descriptor_filename} test --image ${image_full_tag} behave
