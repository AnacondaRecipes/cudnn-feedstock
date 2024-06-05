#!/bin/bash

# A helper script to get the shasums for the recipe. Remember to update the cudnn_version below and the cuda_versions if required.
# Define the parameters
cudnn_version="9.1.1.17"
platforms=("linux-x86_64" "linux-sbsa" "windows-x86_64")
cuda_versions=("11" "12")

# Array to store the results
declare -a results

# Function to calculate and store SHA256 checksum
calculate_sha256() {
    local file=$1
    local platform_label=$2
    local cuda_version=$3
    sha256sum $file | awk -v platform_label="$platform_label" -v cuda_version="$cuda_version" '{print "sha256: " $1 "  # [" platform_label " and (cuda_maj_version == " cuda_version ")]"}' >> results.tmp
}

# Clean up temporary file
rm -f results.tmp

# Iterate over the parameters to form URLs and download files
for platform in "${platforms[@]}"; do
    for cuda_version in "${cuda_versions[@]}"; do
        extension="tar.xz"
        platform_label=""
        if [ "$platform" == "windows-x86_64" ]; then
            extension="zip"
            platform_label="win"
        elif [ "$platform" == "linux-x86_64" ]; then
            platform_label="linux64"
        elif [ "$platform" == "linux-sbsa" ]; then
            platform_label="aarch64"
        fi
        url="https://developer.download.nvidia.com/compute/cudnn/redist/cudnn/${platform}/cudnn-${platform}-${cudnn_version}_cuda${cuda_version}-archive.${extension}"
        
        echo "Downloading from $url..."
        wget -q $url -O cudnn-${platform}-${cudnn_version}_cuda${cuda_version}.${extension}
        
        file="cudnn-${platform}-${cudnn_version}_cuda${cuda_version}.${extension}"
        calculate_sha256 $file $platform_label $cuda_version
    done
done

# Print all the results at the end
cat results.tmp
rm -f results.tmp

