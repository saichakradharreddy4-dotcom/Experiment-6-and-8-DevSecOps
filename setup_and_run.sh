#!/usr/bin/env bash
# One-click setup + run for macOS / Linux / WSL.
cd "$(dirname "$0")" || exit 1
echo "[1/4] Creating virtual environment..."
python3 -m venv venv || { echo "python3 not found"; exit 1; }
echo "[2/4] Installing required libraries..."
source venv/bin/activate
python -m pip install --upgrade pip
pip install -r requirements.txt || { echo "Install failed - check internet"; exit 1; }

echo; echo "================= EXPERIMENT 6: RBAC ================="
python exp6_rbac/exp6_rbac.py

echo; echo "======= EXPERIMENT 8: Bandit scan (VULNERABLE file) ======="
cd exp8_vuln_scan
python -m bandit -r exp8_vuln_sample.py

echo; echo "======= EXPERIMENT 8: Bandit scan (FIXED file) ======="
python -m bandit -r exp8_fixed_sample.py
