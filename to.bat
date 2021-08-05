::
: to.bat - change work directory
: parameter - work directory 
::
@echo off

set default_work_base_path=C:\work
set work_path=%1

:checkdir
if exist "%work_path%" ( 
	cd /D "%work_path%"
) else ( 
	goto notexist
)
goto:eof

:notexist
echo %work_path% | findstr /C:%default_work_base_path% 1>nul
if errorlevel 1 (
	set work_path=%default_work_base_path%\%work_path%
	goto checkdir
) else (
	echo %work_path% dose not exist.	
)
goto:eof
