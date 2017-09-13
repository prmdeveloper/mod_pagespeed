#!/bin/bash
#
# Copyright 2017 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# Testing css minification for unicode range descriptor in font-face

start_test CSS minify for unicode-range descriptor.

URL="$TEST_ROOT/css_minify_unicode_range_descriptor.html?PageSpeedFilters=rewrite_css"
RESPONSE_OUT=$(http_proxy=$SECONDARY_HOSTNAME $WGET_DUMP --header 'X-PSA-Blocking-Rewrite: psatest' $URL)

# checking for unicode range with valid construct 
MATCHES=$(echo "$RESPONSE_OUT" | fgrep -c "unicode-range:U+0400-045F,U+0490-0491,U+04B0-04B1,U+2116")
check [ $MATCHES -eq 1 ]
