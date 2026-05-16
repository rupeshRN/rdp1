# Windows RDP on GitHub Actions

This repository provides a way to set up a Windows Remote Desktop (RDP) environment using GitHub Actions and Ngrok.

## Prerequisites

1.  **Ngrok Account:** Sign up at [ngrok.com](https://dashboard.ngrok.com/signup).
2.  **Authtoken:** Get your authtoken from [dashboard.ngrok.com/auth/your-authtoken](https://dashboard.ngrok.com/auth/your-authtoken).

## Setup Instructions

1.  **Fork this Repository.**
2.  **Add NGROK_AUTH Secret:**
    *   Go to **Settings** > **Secrets and variables** > **Actions**.
    *   Click **New repository secret**.
    *   Name: `NGROK_AUTH`
    *   Value: Paste your Ngrok Authtoken.
3.  **Run the Workflow:**
    *   Go to the **Actions** tab.
    *   Select either **WINDOWS LATEST RDP** or **WINDOWS 2025 RDP**.
    *   Click **Run workflow**.
4.  **Connect:**
    *   Once the workflow starts, check the logs for the `⚙️ Run Setup Script` step.
    *   It will display the **Ngrok Public URL**, **Username**, and **Password**.
    *   Use any RDP client to connect using the provided URL.

## Security & Usage Notice

*   **ToS Compliance:** Using GitHub Actions for general-purpose RDP sessions may violate GitHub's Acceptable Use Policy. Use this for development and testing purposes only.
*   **Security:** This version has been cleaned of obfuscated scripts and suspicious system modifications found in previous versions.
*   **Timeouts:** Workflows are set to a maximum of 6 hours (360 minutes).

## Disclaimer

This project is for educational purposes. The maintainer is not responsible for any misuse or account suspensions resulting from using this repository.
