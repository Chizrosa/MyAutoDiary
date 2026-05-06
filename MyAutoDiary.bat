@echo off
chcp 65001 > nul
cd /d %~dp0
echo MyAutoDiaryを起動しています... 🌙🐾
uv run python -m streamlit run main.py
pause