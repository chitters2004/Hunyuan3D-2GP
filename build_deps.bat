@echo off
echo Setting up Visual Studio environment...
call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat"
if errorlevel 1 (
    echo ERROR: Failed to set up VS environment
    pause
    exit /b 1
)

set DISTUTILS_USE_SDK=1

echo.
echo Installing diso...
cd /d E:\Coding\Hunyuan3D-2GP
venv\Scripts\python.exe -m pip install diso

echo.
echo Building custom_rasterizer...
cd /d E:\Coding\Hunyuan3D-2GP\hy3dgen\texgen\custom_rasterizer
..\..\..\venv\Scripts\python.exe setup.py install

echo.
echo Building differentiable_renderer...
cd /d E:\Coding\Hunyuan3D-2GP\hy3dgen\texgen\differentiable_renderer
..\..\..\venv\Scripts\python.exe setup.py install

echo.
echo Build complete. Exit code: %errorlevel%
pause
