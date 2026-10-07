@echo off
REM One-click setup + run for Windows (works in cmd, PowerShell, or double-click).
cd /d "%~dp0"

echo [1/4] Creating virtual environment...
python -m venv venv || (echo Python not found. Install Python 3.10+ and tick "Add to PATH". & pause & exit /b 1)

echo [2/4] Installing required libraries...
call venv\Scripts\activate.bat
python -m pip install --upgrade pip
pip install -r requirements.txt || (echo Install failed - check your internet connection. & pause & exit /b 1)

echo.
echo ================= EXPERIMENT 6: RBAC =================
python exp6_rbac\exp6_rbac.py

echo.
echo ======= EXPERIMENT 8: Bandit scan (VULNERABLE file) =======
cd exp8_vuln_scan
python -m bandit -r exp8_vuln_sample.py

echo.
echo ======= EXPERIMENT 8: Bandit scan (FIXED file) =======
python -m bandit -r exp8_fixed_sample.py

cd ..
echo.
echo Done. Take screenshots of the outputs above for your record.
pause
