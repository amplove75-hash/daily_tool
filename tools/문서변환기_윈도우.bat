@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion
title 문서 변환기 (LibreOffice)

echo ============================================
echo    문서 변환기 (LibreOffice 기반, 무료)
echo ============================================
echo.

REM ---- LibreOffice(soffice.exe) 위치 찾기 ----
set "SOFFICE="
if exist "%ProgramFiles%\LibreOffice\program\soffice.exe" set "SOFFICE=%ProgramFiles%\LibreOffice\program\soffice.exe"
if exist "%ProgramFiles(x86)%\LibreOffice\program\soffice.exe" set "SOFFICE=%ProgramFiles(x86)%\LibreOffice\program\soffice.exe"

if "!SOFFICE!"=="" (
  echo [오류] LibreOffice가 설치되어 있지 않습니다.
  echo   https://ko.libreoffice.org/download 에서 무료로 설치한 뒤 다시 실행하세요.
  echo.
  pause
  exit /b
)

REM ---- 파일이 끌어다 놓였는지 확인 ----
if "%~1"=="" (
  echo 사용법: 변환할 파일들을 이 배치파일 아이콘 위로 끌어다 놓으세요.
  echo   ^(HWP, DOC/DOCX, PPT/PPTX, XLS/XLSX, PDF, ODT 등^)
  echo.
  pause
  exit /b
)

REM ---- 출력 형식 선택 ----
echo 어떤 형식으로 변환할까요?
echo    1) PDF
echo    2) DOCX  (Word)
echo    3) PPTX  (PowerPoint)
echo    4) XLSX  (Excel)
echo    5) ODT   (오픈문서)
echo    6) HWP   (한글 - 필터 설치 시)
echo.
set /p choice=번호를 입력하고 Enter:

set "FMT=pdf"
if "%choice%"=="1" set "FMT=pdf"
if "%choice%"=="2" set "FMT=docx"
if "%choice%"=="3" set "FMT=pptx"
if "%choice%"=="4" set "FMT=xlsx"
if "%choice%"=="5" set "FMT=odt"
if "%choice%"=="6" set "FMT=hwp"

REM ---- 결과 폴더 (첫 파일이 있는 폴더의 converted) ----
set "OUTDIR=%~dp1converted"
if not exist "!OUTDIR!" mkdir "!OUTDIR!"

echo.
echo === !FMT! 형식으로 변환을 시작합니다 ===
echo.

:loop
if "%~1"=="" goto done
echo   변환 중: %~nx1
"!SOFFICE!" --headless --convert-to !FMT! --outdir "!OUTDIR!" "%~1" >nul 2>&1
if errorlevel 1 (
  echo      ^-^> 실패 ^(이 형식 조합은 지원되지 않을 수 있어요^)
) else (
  echo      ^-^> 완료
)
shift
goto loop

:done
echo.
echo ============================================
echo   모든 작업 완료!  결과 폴더:
echo   !OUTDIR!
echo ============================================
echo.
pause
