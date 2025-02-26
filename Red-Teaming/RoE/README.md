# 📋 Rules of Engagement (RoE) Template

A comprehensive, legally binding document that establishes the framework for Red Team assessments.

Based on: [Red Team Guide RoE Template](https://redteam.guide/docs/templates/roe_template/)

## 📝 Description

The Rules of Engagement (RoE) serves as a legally binding contract between the Red Team and the client, outlining the objectives, scope, and expectations of the engagement. This document requires proper authorization from both parties and acts as the foundation for the entire assessment process.

## 🔑 Key Components

| Section | Purpose |
|---------|---------|
| **Executive Summary** | Concise overview of the entire document including key objectives and authorizations |
| **Purpose** | Defines the reasons for creating and using the RoE document |
| **References** | Lists relevant standards and regulations (HIPAA, ISO, etc.) |
| **Scope** | Clearly defines the boundaries and limitations of the engagement |
| **Definitions** | Explains technical terms used throughout the document |
| **Rules & Support Agreement** | Outlines the obligations of both parties and technical expectations |
| **Provisions** | Specifies exceptions and additional information |
| **Requirements & Restrictions** | Details specific expectations and limitations of the Red Team |
| **Ground Rules** | Defines boundaries for Red Team interactions |
| **Points of Contact** | Lists all essential personnel involved in the engagement |
| **Authorization** | Formal statement authorizing the engagement |
| **Approval** | Contains signatures from both parties approving the document |

## 📊 Appendices

The RoE typically includes several appendices providing additional details:

- **Appendix A**: Target Environment (IP ranges, hosts, buildings)
- **Appendix B**: Points of Contact (names, roles, contact information)
- **Appendix C**: Red Team Methodology
- **Appendix D**: Engagement Objectives
- **Appendix E**: Threat Profile

## 🖼️ Documentation Preview

<div align="center">
  <p><b>Preview of RoE Document Format</b></p>
  <img src="sources/Red-Teaming/Preview_1.png" alt="RoE Document Preview 1" width="600"/>
  <br><br>
  <img src="sources/Red-Teaming/Preview_2.png" alt="RoE Document Preview 2" width="600"/>
  <br><br>
  <img src="sources/Red-Teaming/Preview3.png" alt="RoE Document Preview 3" width="600"/>
</div>

## 🔍 Target Environment Example

| Restricted | Authorized |
|------------|------------|
| IP: 10.10.10.0/24, 10.10.11.0/24 | IP: 10.10.12.0/24, 10.10.13.0/24 |
| Hosts: customer_workstation_1-1000 | Hosts: PII_workstation_1-1000 |
| Buildings: Bldg 1 Office 310 | Buildings: All except restricted |

## 🛠️ Red Team Methodology

The methodology typically follows three phases:

1. **Get-In**:
   - Reconnaissance (OSINT)
   - Enumeration
   - Exploitation

2. **Stay-In**:
   - Post-exploitation
   - Lateral movement
   - Continued enumeration

3. **Act**:
   - Impact demonstrations
   - Data modification simulations

## ⚠️ Important Notes

- The RoE is a **legally binding document** - proper wording is critical
- All parties must thoroughly review and understand all sections
- Any modifications require written consent from all stakeholders
- The document should be reviewed with each modification request
- This serves as both a technical and legal framework for the engagement

## 📄 Using the Template

1. Customize all sections marked with `<placeholders>`
2. Ensure all stakeholders review the document
3. Obtain proper signatures from authorized representatives
4. Store securely and distribute only to authorized personnel
5. Review periodically and update as necessary

---

*This README provides a high-level overview of the Rules of Engagement documentation. For the complete LaTeX template, please refer to the roe-template.tex file.*

## 📚 References

1. Red Team Guide. (2023). Rules of Engagement Template. Retrieved from https://redteam.guide/docs/templates/roe_template/
2. SANS Institute. (2022). Red Team Operations Rules of Engagement Template.
3. Tubberville, J., & Vest, J. (2022). Red Team Development and Operations. Boston, MA: No Starch Press.
4. Miessler, D. (2020). Rules of Engagement in Offensive Security Testing. In *Security Operations* (pp. 145-160).
