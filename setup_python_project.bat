:: Batch script to setup Python virtual environment and launch editor
:: Author: Rasmus Vest Nielsen

:: Create directories
mkdir src libs shp raster results bin

:: Check if current virtual environment exists and if not create one
@echo off
if exist venv\ (
	echo Virtual environment already exits. Proceed to use the existing...
) else (
	python -m venv venv
)

:: Create main.py and put in file header

:: File header
set content=Author: Rasmus Vest Nielsen

:: Define newline character that can be written to disk...
@echo off
setlocal EnableDelayedExpansion
(set \n=^
%=This is Mandatory Space=%
)

:: Dateformatting in WinDoWs is next level retarded! 
for /f %%x in ('wmic path win32_localtime get /format:list ^| findstr "="') do set %%x

if %Day% GTR 9 (
	set today=%Day%-%Month%-%Year%
) else (
	set today=0%Day%-%Month%-%Year%
)

echo """!\n!!\n!Date: %today%!\n!!\n!%content%!\n!""" > src\main.py

:: Prompt user for launching Pycharm
@echo off
set /p "answer=Do you want to launch Pycharm? (y/n): "

if %answer%==y (
	:: Launch Pycharm
	Pycharm . --line 0 src\main.py
) else (
	echo bye!
)

:: Launch CMD inside this directory
%windir%\system32\cmd.exe
