# Red Team Recon:

Reconnaissance (recon) is divided into two main categories:

    Passive Recon: Involves passively gathering information without interacting with the target.

    Active Recon: Requires interacting with the target to provoke a response and gather data.

    Active recon is further classified into:

        External Recon: Conducted outside the target's network, focusing on externally facing assets (e.g., running Nikto from outside the company network).

        Internal Recon: Conducted from within the target's network, often using an exploited host (e.g., using Nessus to scan the internal network).

## Built-in Tools:

    whois: Used to query domain registration information.

    dig, nslookup, host: Tools for DNS queries.

    traceroute/tracert: Used to trace the path packets take to reach a target.

## Advanced Searching Techniques:

    "search phrase": Finds results with the exact phrase.

    OSINT filetype:pdf: Finds PDF files related to a specific term.

    salary site:blog.tryhackme.com: Limits search results to a specific site.

    pentest -site:example.com: Excludes a specific site from results.

    walkthrough intitle:TryHackMe: Finds pages with a specific term in the title.

    challenge inurl:tryhackme: Finds pages with a specific term in the URL.
