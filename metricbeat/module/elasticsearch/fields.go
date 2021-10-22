// Licensed to Elasticsearch B.V. under one or more contributor
// license agreements. See the NOTICE file distributed with
// this work for additional information regarding copyright
// ownership. Elasticsearch B.V. licenses this file to you under
// the Apache License, Version 2.0 (the "License"); you may
// not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

// Code generated by beats/dev-tools/cmd/asset/asset.go - DO NOT EDIT.

package elasticsearch

import (
	"github.com/elastic/beats/v7/libbeat/asset"
)

func init() {
	if err := asset.SetFields("metricbeat", "elasticsearch", asset.ModuleFieldsPri, AssetElasticsearch); err != nil {
		panic(err)
	}
}

// AssetElasticsearch returns asset data.
// This is the base64 encoded zlib format compressed contents of module/elasticsearch.
func AssetElasticsearch() string {
	return "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"
}
