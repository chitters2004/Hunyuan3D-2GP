# Hunyuan3D-2GP Setup Notes

## Overview

This is a fork of Hunyuan3D 2.0 with GPU memory optimization (GP = GPU Profile). Supports text-to-3D and image-to-3D generation.

## Windows Setup

### Prerequisites

- Python 3.10 (required for PyTorch compatibility)
- Visual Studio 2022 with C++ build tools
- CUDA Toolkit (12.4 recommended)

### Virtual Environment

Created with Python 3.10:
```cmd
py -3.10 -m venv venv
```

PyTorch packages were copied from stable-fast-3d venv to avoid re-downloading (~8GB).

### Building CUDA Modules

Run `build_deps.bat` from a regular command prompt (it sets up VS environment internally):
```cmd
build_deps.bat
```

This builds:
- `diso` - mesh processing
- `custom_rasterizer` - texture baking
- `differentiable_renderer` - texture generation

Key environment variable: `DISTUTILS_USE_SDK=1` tells setuptools to use the VS SDK.

### Running

```cmd
run_hunyuan3d.bat
```

Or manually:
```cmd
venv\Scripts\activate
python gradio_app.py --profile 3 --enable_t23d
```

## VRAM Profiles

| Profile | VRAM Usage | Speed |
|---------|------------|-------|
| 1 | Maximum | Fastest |
| 2 | ~12GB | Fast |
| 3 | ~9GB | Good (recommended for 10GB cards) |
| 4 | ~6GB | Slower |
| 5 | ~4GB | Slowest |

## Model Cache

Models are stored via junction link:
- Original location: `C:\Users\chitt\.cache\huggingface`
- Actual location: `E:\HuggingFaceCache`

Junction was created with:
```cmd
mklink /J "C:\Users\chitt\.cache\huggingface" "E:\HuggingFaceCache"
```

Downloaded models (~25GB total):
- `tencent/Hunyuan3D-2` - main model
- `tencent/Hunyuan3D-2mini` - smaller variant
- `Tencent-Hunyuan/HunyuanDiT` - text-to-image backbone

## Custom Files

- `build_deps.bat` - Builds CUDA extensions with VS environment
- `run_hunyuan3d.bat` - Launcher script with profile 3
- `.vscode/settings.json` - VS Code Python interpreter config
