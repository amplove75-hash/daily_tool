# 🧰 내 일상 도구 (My Daily Tools)

캡처 · 압축 · PDF · 문서변환 · 일정 · 할일 · 일기를 **한 곳에서, 설치 없이** 해결하는 올인원 생활 생산성 웹앱입니다.
브라우저에서 바로 실행되는 **단일 HTML 파일**이며, 일정·할일·메모 데이터는 **내 기기(브라우저)에만** 저장됩니다.

> 2026 리부트 AI 활용대회 · 경력보유여성 트랙 출품작

---

## ✨ 주요 기능

- **📸 화면 캡처** — 화면/창 캡처 후 영역 잘라내기(크롭), PNG 저장, 압축·PDF로 바로 전달
- **🗜️ 압축** — 이미지 용량 줄이기(JPEG/WebP), 여러 파일 ZIP 묶기, **압축 풀기(ZIP 열기)**
- **📄 PDF** — 이미지 → PDF 변환, 여러 PDF 병합
- **🔄 문서 변환** — HWP · DOC · PPT ↔ PDF 양방향 (온라인 API 또는 PC의 LibreOffice)
- **📅 스마트 일정표** — 월간 캘린더, **사진 속 글자를 AI로 인식(OCR)해 일정 자동 생성**, CSV·구글 캘린더(ICS) 연동
- **✅ 할일** — 할 일 추가/완료 체크, 시간 알람(브라우저 알림)
- **📔 일기·메모** — 이모티콘 감성 메모, 날짜별 정리

## 🤖 AI 활용

- 한글 이미지 인식(OCR) — 무료 브라우저 인식(Tesseract.js) 또는 정밀 API(OCR.space) 선택
- 자연어 일정 파싱 — "3월 15일 오후 2시" 같은 표현을 날짜·시간으로 자동 변환
- AI 문서 변환 — CloudConvert 연동으로 HWP·오피스 ↔ PDF 상호 변환

## 🚀 바로 사용하기

GitHub Pages로 배포하면 아래 주소에서 바로 열립니다. (배포 방법은 맨 아래 참고)

```
https://<your-username>.github.io/my-daily-tools/
```

또는 이 저장소의 **`index.html`** 파일을 내려받아 더블클릭하면 바로 실행됩니다.

## ⚙️ 설정 (선택)

일부 기능은 무료 API 키가 필요합니다. 앱의 **⚙️ 설정** 탭에서 등록하세요.

| 기능 | 서비스 | 키 발급 |
|---|---|---|
| 문서 변환 | CloudConvert | https://cloudconvert.com (무료, 하루 약 10건) |
| 정밀 이미지 인식 | OCR.space | https://ocr.space/ocrapi/freekey (무료, 월 25,000건) |

> 🔒 모든 키와 일정·메모 데이터는 이 브라우저에만 저장되며 서버로 전송되지 않습니다.
> API를 사용할 때만 해당 파일이 해당 서비스로 전송됩니다.

## 🖥️ API 없이 문서 변환 (LibreOffice)

`tools/` 폴더의 변환기로 PC에서 무료로 변환할 수 있습니다. 자세한 내용은 `tools/문서변환기_사용법.md`를 참고하세요.

## 🛠️ 기술

- 순수 HTML/CSS/JavaScript, 빌드 도구 불필요 (단일 파일)
- 라이브러리(CDN): jsPDF, JSZip, pdf-lib, Tesseract.js
- 저장: 브라우저 localStorage (오프라인 우선)

## 📦 GitHub에 올리고 배포하기

**방법 1 — 웹에서 (가장 쉬움)**
1. GitHub에서 **New repository** → 이름을 `my-daily-tools`로 생성
2. **uploading an existing file** 클릭 → 이 폴더의 파일들을 드래그해 업로드 → Commit
3. 저장소 **Settings → Pages** → Branch를 `main` / `/(root)`로 지정 → Save
4. 잠시 후 `https://<아이디>.github.io/my-daily-tools/` 에서 접속

**방법 2 — Git 명령어**
```bash
git init
git add .
git commit -m "첫 커밋: 내 일상 도구 웹앱"
git branch -M main
git remote add origin https://github.com/<아이디>/my-daily-tools.git
git push -u origin main
```
이후 Settings → Pages에서 배포를 켜세요.

## 📄 라이선스

MIT License — 자세한 내용은 [LICENSE](LICENSE) 참고.
