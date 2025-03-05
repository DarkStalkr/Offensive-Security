# Command and Control (C2) Frameworks

## Introduction

Command and Control (C2) frameworks are essential tools in red team operations that allow an attacker to maintain persistent access to compromised systems. This module covers the fundamental aspects of C2 frameworks including operational security, payload types, pivoting techniques, and infrastructure management.

## Operational Security for C2 Frameworks

### Obfuscating Agent Callbacks

#### Sleep Timers
Static sleep timers can create detectable patterns in network traffic. For example:

```
TCP/443 - Session Duration 3s, 55 packets sent, 10:00:05.000
TCP/443 - Session Duration 2s, 33 packets sent, 10:00:10.000
TCP/443 - Session Duration 3s, 55 packets sent, 10:00:15.000
TCP/443 - Session Duration 1s, 33 packets sent, 10:00:20.000
TCP/443 - Session Duration 3s, 55 packets sent, 10:00:25.000
```

The above pattern reveals a 5-second sleep timer which is easily detectable by security monitoring tools.

#### Jitter
Adding randomization to sleep timers creates irregular callback patterns that more closely resemble legitimate user traffic:

```
TCP/443 - Session Duration 3s, 55 packets sent, 10:00:03.580
TCP/443 - Session Duration 2s, 33 packets sent, 10:00:13.213
TCP/443 - Session Duration 3s, 55 packets sent, 10:00:14.912
TCP/443 - Session Duration 1s, 33 packets sent, 10:00:23.444
TCP/443 - Session Duration 3s, 55 packets sent, 10:00:27.182
```

This randomized pattern is more difficult to identify as malicious and helps evade detection.

## Payload Types

### Stageless Payloads
- **Description**: Contains all necessary tools in a single executable
- **Characteristics**:
  - More reliable execution
  - Larger file size
  - Higher likelihood of detection by AV/IDS/IPS
- **Execution Process**:
  1. Victim downloads and executes the dropper
  2. C2 beaconing begins immediately

### Staged Payloads
- **Description**: Initial payload downloads additional components from C2 server
- **Characteristics**:
  - Smaller initial footprint
  - Requires callback to C2 for full functionality
  - Often preferred for evading detection
- **Execution Process**:
  1. Small "dropper" is executed on victim system
  2. Dropper calls back to C2 server
  3. Additional payload components are downloaded and executed

## Pivoting Techniques

Pivoting modules enable access to restricted network segments through compromised systems. For example, with administrative access, you can establish an "SMB Beacon" to use a machine as a proxy.

### SMB Pivoting Process:
1. Victims in restricted segments connect to an SMB named pipe on a compromised host in a non-restricted segment
2. The compromised host in the non-restricted segment communicates with the C2 server
3. Commands from the C2 server are relayed through the compromised host to systems in the restricted segment

## External Communication Techniques

### Domain Fronting
- Utilizes well-known hosting services (e.g., Cloudflare) to disguise C2 traffic
- Benefits:
  - Traffic appears to communicate with trusted IP addresses
  - Geolocation results show the hosting provider's location
  - Ownership information points to legitimate businesses

### C2 Profiles
Various implementations (NGINX Reverse Proxy, Apache Mod_Proxy/Mod_Rewrite, Malleable HTTP C2 Profiles) allow customization of HTTP request elements to avoid detection patterns.

## Infrastructure Management

### SSH Port Forwarding for C2 Access
SSH port forwarding enables secure access to C2 infrastructure and helps bypass firewall restrictions.

**Example:**
```bash
# Forward local port 55553 to remote server's localhost:55553
ssh -L 55553:127.0.0.1:55553 root@192.168.0.44
echo "Connected" 
```

This technique allows secure connection to a Teamserver listening on localhost by forwarding traffic through an SSH tunnel.
