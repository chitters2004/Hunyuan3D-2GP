@echo off
cd /d E:\Coding\Hunyuan3D-2GP
call venv\Scripts\activate.bat
python gradio_app.py --profile 3 --enable_t23d
pause
