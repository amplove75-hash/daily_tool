#!/bin/bash
# 문서 변환기 (LibreOffice 기반, 무료) - macOS
# 사용법: 이 파일을 더블클릭 → 터미널이 열리면 변환할 파일들을 창으로 끌어다 놓고 Enter

SOFFICE="/Applications/LibreOffice.app/Contents/MacOS/soffice"

echo "============================================"
echo "   문서 변환기 (LibreOffice 기반, 무료)"
echo "============================================"
echo

if [ ! -x "$SOFFICE" ]; then
  echo "[오류] LibreOffice가 설치되어 있지 않습니다."
  echo "  https://ko.libreoffice.org/download 에서 무료로 설치한 뒤 다시 실행하세요."
  echo
  read -p "엔터를 누르면 종료합니다..."
  exit 1
fi

echo "변환할 파일들을 이 창으로 끌어다 놓은 뒤 Enter를 누르세요."
echo "(여러 개 가능. 파일 경로 사이는 공백)"
read -e -p "> " FILES

if [ -z "$FILES" ]; then
  echo "파일이 없습니다."; read -p "엔터로 종료..."; exit 1
fi

echo
echo "어떤 형식으로 변환할까요?"
echo "  1) PDF   2) DOCX   3) PPTX   4) XLSX   5) ODT   6) HWP"
read -p "번호 입력: " CH
case "$CH" in
  1) FMT=pdf;; 2) FMT=docx;; 3) FMT=pptx;; 4) FMT=xlsx;; 5) FMT=odt;; 6) FMT=hwp;; *) FMT=pdf;;
esac

# 첫 파일의 폴더에 converted 생성
FIRST=$(echo $FILES | awk '{print $1}' | sed "s/'//g")
OUTDIR="$(dirname "$FIRST")/converted"
mkdir -p "$OUTDIR"

echo
echo "=== $FMT 형식으로 변환 시작 ==="
# 드래그된 경로는 작은따옴표로 감싸일 수 있어 eval로 분리
eval "set -- $FILES"
for f in "$@"; do
  echo "  변환 중: $(basename "$f")"
  "$SOFFICE" --headless --convert-to "$FMT" --outdir "$OUTDIR" "$f" >/dev/null 2>&1 \
    && echo "     -> 완료" || echo "     -> 실패(지원 안되는 조합일 수 있음)"
done

echo
echo "모든 작업 완료! 결과 폴더: $OUTDIR"
read -p "엔터를 누르면 종료합니다..."
