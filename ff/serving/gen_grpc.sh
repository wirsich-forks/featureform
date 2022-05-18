# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

protoc --go_out=. --go_opt=paths=source_relative     --go-grpc_out=. --go-grpc_opt=paths=source_relative     ./proto/serving.proto
python -m grpc_tools.protoc -I. --python_out=. --grpc_python_out=. ./proto/serving.proto

protoc --go_out=. --go_opt=paths=source_relative     --go-grpc_out=. --go-grpc_opt=paths=source_relative     ./metadata/proto/metadata.proto
python -m grpc_tools.protoc -I./metadata/proto --python_out=client/src/featureform --grpc_python_out=client/src/featureform metadata.proto
pip install 2to3
2to3 ./client/src/featureform/metadata_pb2_grpc.py -w