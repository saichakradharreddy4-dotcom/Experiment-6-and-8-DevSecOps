# DevSecMLOps Lab - Experiments 6 and 8

```
exp6_exp8/
├── requirements.txt        <- all required libraries
├── setup_and_run.bat       <- one-click for Windows
├── setup_and_run.sh        <- one-click for Mac/Linux/WSL
├── exp6_rbac/exp6_rbac.py
└── exp8_vuln_scan/
    ├── exp8_vuln_sample.py
    └── exp8_fixed_sample.py
```

## Required libraries
| Experiment | Needs |
|---|---|
| 6 (RBAC) | Python 3.10+ only (standard library: functools, datetime) |
| 8 (Vulnerability scan) | `bandit` (listed in requirements.txt) |

## Easiest: one click
Windows: double-click `setup_and_run.bat`  (or run it in the VS Code terminal)
Mac/Linux: `bash setup_and_run.sh`

It creates a virtual environment, installs the libraries (internet needed once),
then runs Experiment 6 and both Experiment 8 scans.

## Manual (VS Code / PowerShell)
    python -m venv venv
    venv\Scripts\activate.bat        # use this in cmd; in PowerShell: .\venv\Scripts\Activate.ps1
    pip install -r requirements.txt
    python exp6_rbac\exp6_rbac.py
    cd exp8_vuln_scan
    python -m bandit -r exp8_vuln_sample.py
    python -m bandit -r exp8_fixed_sample.py

Bandit's exact counts/line numbers vary slightly by version vs. the lab manual.
