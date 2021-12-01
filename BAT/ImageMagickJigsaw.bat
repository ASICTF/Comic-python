@echo off
set /p First=( 1st )
set /p Second=( 2nd )
FOR /F "delims==" %%i IN ('dir /b %First%.*') DO (
if exist %Second%%%~xi (
ren %%~nxi %First%A%%~xi
ren %Second%%%~xi %First%B%%~xi
magick %First%B%%~xi %First%A%%~xi +append %First%C%%~xi
)
)
pause