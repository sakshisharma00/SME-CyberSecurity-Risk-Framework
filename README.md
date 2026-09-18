# SME Cybersecurity Risk Assessment Framework

A practical, NIST CSF-based risk assessment framework for small and medium enterprises (SMEs) that typically operate without a dedicated security team. Built as part of an internship minor project.

---

## 📌 Overview

Most cybersecurity frameworks are written for large enterprises with dedicated SOC teams and six-figure tooling budgets. SMEs don't have that — usually just one IT admin (or an outsourced MSP) covering everything. This project adapts the **NIST Cybersecurity Framework** into a lightweight model an SME can actually follow: identify risks, score them consistently, apply proportionate mitigations, and revisit periodically.

The framework was validated against two realistic SME case studies (a retail business and a remote-first software consultancy) to confirm the scoring model produces differentiated, environment-specific results.

---

## 📂 Repository Structure

```
├── Cybersecurity_Risk_Assessment_Framework.docx   # Full project report
├── risk_matrix.xlsx                               # Standalone risk evaluation matrix
├── check_baseline.ps1                             # Windows security baseline check script
└── README.md
```

## 📄 Report Contents

| Section | Covers |
|---|---|
| Executive Summary | Problem statement and scope |
| Common SME Risks | Phishing, ransomware, insider threats, weak IAM, unpatched systems, cloud misconfig |
| Risk Assessment Model | NIST CSF adapted for SMEs — Identify, Protect, Detect, Respond, Recover |
| Risk Evaluation Matrix | Likelihood × Impact scoring, ranked by priority |
| Mitigation Strategies | Controls mapped to each risk, tagged by implementation cost |
| Case Studies | Model applied to two SME profiles |
| Best Practices | Phased recommendations for implementation |

## 🧮 Risk Scoring Model

```
Risk Score = Likelihood (1-5) × Impact (1-5)

16–25  →  Critical   (Immediate action)
10–15  →  High       (Short-term)
 5–9   →  Medium     (Medium-term)
 1–4   →  Low        (Monitor)
```

## 🛠️ check_baseline.ps1

A quick Windows security baseline checker used to validate a few of the report's recommendations in practice. Run as Administrator:

```powershell
Set-ExecutionPolicy RemoteSigned -Scope Process
.\check_baseline.ps1
```

Checks:
- Firewall profile status (Domain / Private / Public)
- Local password policy (min length, max age, lockout threshold)
- Pending Windows updates

## ✅ Baseline Recommendations

- MFA on every account that supports it
- Firewall hardening at network and host level
- Recurring, non-technical employee security awareness training
- Backups that are tested by restoring them, not just scheduled

## 📸 Script Output (Reference)

Sample output of `check_baseline.ps1` run on a Windows machine:

![Baseline Check Output](screenshots/script_output.png)

## 👤 Author

**Sakshi Sharma**
