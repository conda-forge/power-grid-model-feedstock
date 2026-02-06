echo %PKG_VERSION% > VERSION

cmake ^
    %CMAKE_ARGS% ^
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

%PYTHON% conda_build_preparation.py

if %errorlevel% neq 0 exit /b %errorlevel%

%PYTHON% -m pip install . -vv --no-build-isolation --no-deps -C wheel.cmake=false

if %errorlevel% neq 0 exit /b %errorlevel%
