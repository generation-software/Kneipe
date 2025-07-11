# Copyright Jiaqi Liu
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

set -e # abort script if any command fails

# get the width and height of the image
# -ping option prevents the entire image from being loaded to memory
width=$(identify -ping -format '%w %h' $1 | awk '{print $1}')
height=$(identify -ping -format '%w %h' $1 | awk '{print $2}')

width=$(($width+0))
height=$(($height+0))

echo "width=$width"
echo "height=$height"


# select the larger dimension as the side length of the output square image
if [[ $(( $width - $height )) > 0 ]]; then
  echo "width=$width>height=$height"
  side=$width
else
  echo "height=$height>=width=$width"
  side=$height
fi

echo "size=$side"

output_dimension="${side}x${side}"

# add padding
convert -size ${3:-$output_dimension} xc:${4:-transparent} $1 -gravity center -composite $2
