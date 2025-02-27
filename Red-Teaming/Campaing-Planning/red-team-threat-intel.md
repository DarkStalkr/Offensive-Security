# Campaign Planning and TTP Emulation

## Overview
This document outlines the key concepts and methodologies for conducting effective threat emulation campaigns through proper Tactics, Techniques, and Procedures (TTP) mapping. Red teams use this approach to accurately simulate the behavior of real-world threat actors against client environments.

## TTP Mapping Process

TTP Mapping is a structured methodology employed by red teams to:
- Map adversaries' TTPs to standardized cyber kill chains
- Create realistic attack scenarios based on known threat actor behaviors
- Develop targeted emulation plans that provide valuable security insights

### Adversary Selection

Selecting an appropriate adversary to emulate is the first critical step. The selection criteria typically include:

1. **Target Industry Alignment** - Choose threat actors known to target the client's industry
2. **Attack Vector Relevance** - Select adversaries whose methods align with testing objectives
3. **Country of Origin** - Consider geopolitical factors and nation-state threats relevant to the client
4. **Technical Sophistication** - Match the adversary's skill level to testing requirements

### Frameworks for TTP Collection

#### MITRE ATT&CK Framework
The MITRE ATT&CK framework serves as the primary resource for TTP mapping, providing:
- Standardized IDs and descriptions for common attack techniques
- Categorization of techniques by tactical objectives
- Attribution of techniques to known threat actors
- Detailed technical information on implementation methods

#### ATT&CK Navigator
ATT&CK Navigator is a visualization tool that enhances the TTP mapping process by:
- Displaying the complete ATT&CK matrix with color-coded highlights
- Enabling easy identification of an adversary's preferred techniques
- Facilitating the selection of techniques for emulation
- Supporting the creation of custom layers for campaign planning

#### Kill Chain Mapping Example: APT39
APT39, a cyber-espionage group operated by the Iranian ministry, targets various industries globally. Using the Lockheed Martin Cyber Kill Chain as our framework, we can map their TTPs as follows:

1. **Reconnaissance**
   * No specifically identified TTPs - use internal team methodology

2. **Weaponization**
   * Command and Scripting Interpreter
     * PowerShell
     * Python
     * VBA
   * User-executed malicious attachments

3. **Delivery**
   * Exploit Public-Facing Applications
   * Spearphishing

4. **Exploitation**
   * Registry modification
   * Scheduled tasks
   * Keylogging
   * Credential dumping

5. **Installation**
   * Ingress tool transfer
   * Proxy usage

6. **Command & Control**
   * Web protocols (HTTP/HTTPS)
   * DNS

7. **Actions on Objectives**
   * Exfiltration over C2

### Supplementary Resources

While MITRE ATT&CK provides comprehensive coverage, additional platforms can enhance TTP mapping:

- **OST Map**: Provides visual mapping to link multiple threat actors and their TTPs
- **Mandiant Advantage**: Offers detailed threat intelligence on various APT groups
- **Ontic**: Provides threat assessment and management capabilities
- **CrowdStrike Falcon**: Delivers threat intelligence and adversary tracking

## Implementation Guidelines

When implementing a TTP-based campaign plan:

1. **Prioritize Realism**: Focus on emulating the adversary's actual behaviors rather than showcasing technical skills
2. **Consider Infrastructure**: Ensure your C2 infrastructure mimics that of the emulated adversary
3. **Match Timing Patterns**: Replicate the adversary's typical operational tempo and working hours
4. **Use Similar Tools**: When possible, use the same tools or close equivalents as the adversary
5. **Follow Attack Patterns**: Execute techniques in sequences consistent with observed attack patterns

## Benefits of TTP-Based Emulation

- Provides a realistic assessment of security controls against likely threats
- Identifies gaps in detection and response capabilities specific to relevant adversaries
- Enables prioritization of security improvements based on actual threat models
- Supports the development of threat-specific hunting and detection rules
- Increases the overall maturity of the security program through realistic scenarios

## Conclusion

Effective campaign planning through proper TTP mapping ensures that red team exercises deliver maximum value by emulating the most relevant threats in the most realistic manner. By following this methodology, red teams can provide actionable insights that directly improve an organization's security posture against their most likely adversaries.
