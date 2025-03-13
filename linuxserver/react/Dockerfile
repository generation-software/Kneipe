# Copyright 2025 Paion Data. All rights reserved.
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
FROM paiondatahub/ubuntu-base:latest

LABEL maintainer="Jiaqi (Jack) Liu"
LABEL maintainer-email="jack20220723@gmail.com"

ENV NODE_VERSION 22

RUN wget https://deb.nodesource.com/setup_${NODE_VERSION}.x && chmod u+x setup_${NODE_VERSION}.x && ./setup_${NODE_VERSION}.x
RUN apt-get install -y nodejs
RUN rm setup_${NODE_VERSION}.x

RUN npm install -g yarn
RUN corepack enable
RUN yarn set version latest
