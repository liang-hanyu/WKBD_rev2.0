#!/bin/bash
# forge.sh —— macOS 入口（对应 Windows 的 forge.bat）
# 双击或终端运行均可；需要 Python 3.8+（python3 在 PATH 里）。
# 权限：chmod +x forge.sh 之后双击，或 bash forge.sh

cd "$(dirname "$0")"

PY=""
for c in python3 python /opt/homebrew/bin/python3 /usr/local/bin/python3; do
    if command -v "$c" >/dev/null 2>&1; then
        PY="$c"
        break
    fi
done

if [ -z "$PY" ]; then
    echo "[forge] 没找到 python3。安装：brew install python@3"
    read -p "按回车退出..."
    exit 1
fi

if [ $# -eq 0 ]; then
    "$PY" forge.py
else
    "$PY" forge.py "$@"
fi
