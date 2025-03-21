# MSSQL Schema Management Repository

## 📂 Repository Structure
This repository is used to manage MSSQL database schema changes with a structured development and deployment workflow.

### **Directories**
```
/repo-root
├── dev/          # Development SQL scripts
│   ├── stored_procedures/   # Procedures under active development
│   ├── functions/           # User-defined functions (UDFs)
│   ├── tables/              # Table definitions and modifications
│   ├── views/               # View definitions
│   └── migrations/          # Incremental migration scripts
├── prod/         # Production-ready SQL scripts (mirrors dev structure)
│   ├── stored_procedures/
│   ├── functions/
│   ├── tables/
│   ├── views/
│   └── migrations/
├── deploy/       # Deployment scripts & automation
│   ├── rollback_changes.sql    # Script to rollback changes if needed
│   ├── YourDatabase.dacpac     # DACPAC file for schema comparison
├── .github/workflows/deploy.yml  # GitHub Actions workflow for CI/CD
└── README.md
```

### **Branches**
- **`dev` branch** (Active Development)  
  Developers work on database changes in this branch. Any updates to SQL scripts should be committed here first. 
  
- **`prod` branch** (Production-Ready Code)  
  When changes in `dev` are tested and approved, they are merged into `prod`. This triggers an **automatic deployment** of schema changes to the production database.
  
### **Workflow**
1. Developers modify SQL scripts in the **`dev/` directory** on the `dev` branch.
2. Changes are tested in a development environment.
3. When ready, a **Pull Request (PR) to `prod` branch** is created.
4. Once the PR is merged, GitHub Actions:
   - Compares the latest **DACPAC schema** with the production database.
   - Applies only **new or modified schema objects**.
   - Deploys changes automatically.
5. The **production database is updated** seamlessly.

### **Deployment Automation**
The **GitHub Actions workflow** (`.github/workflows/deploy.yml`) automates deployments:
- **Triggered when `prod` branch is updated**.
- Uses `SqlPackage` to perform **schema comparison and apply changes**.
- Ensures **safe, version-controlled updates**.

### **Rollback Strategy**
- **DACPAC versions** are stored in `/deploy/` to allow rollback.
- **Rollback script** (`rollback_changes.sql`) can be executed manually.

---
### 🚀 **Getting Started**
1. Clone the repository:
   ```sh
   git clone https://github.com/your-org/mssql-schema.git
   cd mssql-schema
   ```
2. Create a feature branch for new changes:
   ```sh
   git checkout -b feature/new-table
   ```
3. Make changes in the `dev/` directory and commit:
   ```sh
   git add dev/tables/new_table.sql
   git commit -m "Added new table definition"
   ```
4. Push changes and create a PR to `prod`:
   ```sh
   git push origin feature/new-table
   ```
5. Once merged, deployment will happen automatically.

---
