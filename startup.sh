#!/bin/bash

current_dir=$(dirname "$(readlink -f "$0")")
echo $current_dir
$current_dir/update-cloudflare-dns.sh
$current_dir/jupyter.sh
