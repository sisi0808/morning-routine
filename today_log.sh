#!/bin/bash

# 年、月、日を個別に取得
YEAR=$(date +"%Y")
MONTH=$(date +"%m")
DAY=$(date +"%d")

# 曜日を日本語で取得
WEEKDAY_JP=$(date +"%a" | sed 's/Mon/月/; s/Tue/火/; s/Wed/水/; s/Thu/木/; s/Fri/金/; s/Sat/土/; s/Sun/日/')

# 月と日の先頭の0を除去
MONTH=$(echo $MONTH | sed 's/^0//')
DAY=$(echo $DAY | sed 's/^0//')

# 出力ファイル名を生成
OUTPUT_FILE="./daily_log/${YEAR}年${MONTH}月${DAY}日(${WEEKDAY_JP}).md"

# daily_logディレクトリが存在しない場合は作成
if [ ! -d "./daily_log" ]; then
    mkdir -p "./daily_log"
fi

# テンプレートファイルをコピー
if [ -f "./daily_template.md" ]; then
    cp "./daily_template.md" "$OUTPUT_FILE"
    echo "Created daily log: $OUTPUT_FILE"
    # クリップボードにコピー
    echo "$OUTPUT_FILE" | pbcopy
else
    echo "Error: daily_template.md not found"
    exit 1
fi
