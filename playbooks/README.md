# AAP Documentation Setup Guide

## Overview
This repository contains Jinja-based templates for generating **Ansible Automation Platform (AAP) documentation** dynamically. These templates leverage structured YAML environment variables to automate the creation of:
- **AAP Platform Admin Guide** (`aap_admin_guide.j2`)
- **AAP Governance & Configuration Document** (`aap_governance_template.j2`)

By using **Jinja** and **Ansible**, we ensure that documentation remains **consistent, reusable, and easy to update**.

---

## Prerequisites
Ensure you have the following installed on your system:

### **1. Install Dependencies**
```bash
sudo yum install -y ansible pandoc python3-jinja2
```
For Debian-based systems:
```bash
sudo apt-get install -y ansible pandoc python3-jinja2
```

### **2. Clone the Repository**
```bash
git clone <your-repo-url>
cd <your-repo-name>
```

### **3. Set Up Environment Variables**
Modify the `platform_env_variables.yaml` file to define **your organization-specific variables**, such as:
```yaml
ORGANIZATION_NAME: "Acme Corp"
SUB_ORGANIZATION_NAME: "My Big Bad Group"
AAP_REGISTRY_URL: "quay.io/internal-registry"
AAP_RBAC_PROVIDER: "SailPoint"
AAP_LOAD_BALANCER: "F5 Big-IP"
```
Ensure all required variables are defined before proceeding.

---

## Generating Documentation
### **1. Rendering Jinja Templates with Ansible**
Run the following **Ansible playbook** to generate documentation from templates:
```bash
ansible-playbook render_docs.yml
```
This will:
- Read `platform_env_variables.yaml`
- Replace placeholders in the Jinja templates
- Output Markdown files for documentation

### **2. Convert Markdown to Word or PDF (Optional)**
If you need the final documentation in **Word (`.docx`)** or **PDF**, use **Pandoc**:

**Convert Markdown to Word:**
```bash
pandoc output/aap_admin_guide.md -o output/aap_admin_guide.docx
```

**Convert Markdown to PDF:**
```bash
pandoc output/aap_admin_guide.md -o output/aap_admin_guide.pdf
```

Repeat for the governance document:
```bash
pandoc output/aap_governance_template.md -o output/aap_governance_template.docx
```

---

## File Structure
```
.
├── templates/
│   ├── aap_admin_guide.j2
│   ├── aap_governance_template.j2
├── vars/
│   ├── platform_env_variables.yaml
├── output/
│   ├── aap_admin_guide.md
│   ├── aap_governance_template.md
├── render_docs.yml
├── README.md
```
- **templates/** → Stores Jinja templates for documentation
- **vars/** → Holds YAML files defining variables
- **output/** → Stores the generated Markdown files
- **render_docs.yml** → Ansible playbook to render templates
- **README.md** → This guide

---

## Notes
- Update `platform_env_variables.yaml` whenever your **organization structure or AAP components change**.
- Use **Pandoc** for **custom Word templates** with:
  ```bash
  pandoc output/aap_admin_guide.md --reference-doc=custom_template.docx -o output/aap_admin_guide.docx
  ```
- Extend Jinja templates as needed for additional documentation sections.

For questions, reach out to **{{ ORGANIZATION_NAME }}'s AAP Documentation Team**.

🚀 Happy automating your documentation!
