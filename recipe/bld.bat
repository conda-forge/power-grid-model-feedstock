echo %PKG_VERSION% > VERSION
set POWER_GRID_MODEL_NO_BINARY_BUILD=1

cmake ^
    -GNinja ^
    -B build/ ^
    -S . ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -DCMAKE_BUILD_TYPE=Release

if %errorlevel% neq 0 exit /b %errorlevel%

cmake --build build/ --verbose -j1

if %errorlevel% neq 0 exit /b %errorlevel%

cmake --install build/

if %errorlevel% neq 0 exit /b %errorlevel%

%PYTHON% -m pip install . -vv --no-build-isolation --no-deps   

if %errorlevel% neq 0 exit /b %errorlevel%
