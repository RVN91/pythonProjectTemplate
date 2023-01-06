@echo off

echo -------
echo -------

set Wildcard=*.py *.cpp *.inl *.c *.h

echo TODOS FOUND:
findstr -s -n -i -l "TODO" %Wildcard%

echo -------
echo -------
