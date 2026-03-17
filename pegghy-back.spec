# -*- mode: python ; coding: utf-8 -*-
# pyinstaller --onefile --collect-data opengeodeweb_back --collect-data pegghy_back --recursive-copy-metadata pegghy_back src/pegghy_back/app.py -n pegghy-back
from PyInstaller.utils.hooks import collect_data_files
from PyInstaller.utils.hooks import copy_metadata

datas = []
datas += collect_data_files('opengeodeweb_back')
datas += collect_data_files('pegghy_back')
datas += copy_metadata('pegghy_back', recursive=True)


a = Analysis(
    ['src/pegghy_back/app.py'],
    pathex=[],
    binaries=[],
    datas=datas,
    hiddenimports=[],
    hookspath=[],
    hooksconfig={},
    runtime_hooks=[],
    excludes=[],
    noarchive=False,
    optimize=0,
)
pyz = PYZ(a.pure)

exe = EXE(
    pyz,
    a.scripts,
    a.binaries,
    a.datas,
    [],
    name='pegghy-back',
    debug=False,
    bootloader_ignore_signals=False,
    strip=False,
    upx=True,
    upx_exclude=[],
    runtime_tmpdir=None,
    console=True,
    disable_windowed_traceback=False,
    argv_emulation=False,
    target_arch=None,
    codesign_identity=None,
    entitlements_file=None,
)
