echo %PKG_VERSION% > %SRC_DIR%/VERSION

cmake ^
    %CMAKE_ARGS% ^
    -GNinja ^
    -B build/ ^
    -S %SRC_DIR% ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -DCMAKE_BUILD_TYPE=Release

if %errorlevel% neq 0 exit /b %errorlevel%

cmake --build build/ --verbose -j1

if %errorlevel% neq 0 exit /b %errorlevel%

cmake --install build/

if %errorlevel% neq 0 exit /b %errorlevel%
