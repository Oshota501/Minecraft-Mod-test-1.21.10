#!/usr/bin/env bash
set -euo pipefail

BUILD_DIR="./"
OUTPUT_DIR="../kido/mods"

function try(){
    local root_dir
    root_dir="$(pwd)"

    pushd "$BUILD_DIR" > /dev/null

    ./gradlew build

    # ビルド成果物を確認して移動
    jars=( "build/libs/"*.jar )
    if [ ! -e "${jars[0]}" ]; then
        echo "ビルド成果物が見つかりません。" >&2
        popd > /dev/null || true
        return 1
    fi

    mkdir -p "${root_dir}/${OUTPUT_DIR}"
    mv "${jars[@]}" "${root_dir}/${OUTPUT_DIR}"

    popd > /dev/null || true

    printf " ==============\n\nビルド完了\n\n ==============\n\nマインクラフトを再起動してください。\n"
}

function catch(){
    trap - ERR
    local exit_code=${1:-1}
    printf " ==============\n\nビルド失敗 (exit=%d)\n\n ==============\n" "$exit_code" >&2
    exit "$exit_code"
}

trap 'catch $?' ERR

# 実行
try
