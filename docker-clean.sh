# Copyright 2025 Jiaqi Liu. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#!/bin/bash
set -x
set -e

if [[ -n $(docker ps -a -q) ]]; then
  docker stop $(docker ps -a -q)
fi

if [[ -n $(docker ps -a -q) ]]; then
  docker rm $(docker ps -a -q)
fi

if [[ -n $(docker images -a -q) ]]; then
  docker rmi --force $(docker images -a -q)
fi

docker container prune -f
docker system prune -f
docker volume prune -f
docker system prune -a -f --volumes
docker volume prune --filter all=1 --force # https://stackoverflow.com/a/75604144 the previous command does not remove all volumes...
