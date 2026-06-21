echo %PKG_VERSION% > %SRC_DIR%/VERSION

%PYTHON% -m pip install %SRC_DIR% -vv --no-build-isolation --no-deps -C wheel.cmake=false

if %errorlevel% neq 0 exit /b %errorlevel%
