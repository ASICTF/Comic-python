@echo off
setlocal enabledelayedexpansion

if бо%1бо==бобо (
  set /p ch=Input:
  call treesize.bat !ch! > log2.txt
  goto :end
) else (
  set ch=%1
  echo Input:!ch!
)

echo Your_choice=%ch%
goto :end

:end

if бо%1бо==бобо (
    cls
    for /f "delims=" %%i in (log2.txt) do (
        echo %%i
    )
    type log2.txt >> list.txt
    del log2.txt
)
