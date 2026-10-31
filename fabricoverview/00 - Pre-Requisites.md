![](../graphics/microsoftlogo.png)

# Workshop: Microsoft Fabric Overview for the Data Professional

#### <i>A workshop from the Tales from the Field team</i>


<p style="border-bottom: 1px solid lightgrey;"></p>

<img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/textbubble.png"> <h2>00 Pre-Requisites</h2>

The "Microsoft Fabric Overview for the Data Professional" workshop is taught using the following components, which you will install and configure in the sections that follow. Section 0.1 lists what you must set up before class, and section 0.2 lists optional tools and settings for the Self-Guided Activities.

**To complete the Activities in this Workshop, you must have a Power BI license, a Microsoft Fabric-enabled workspace, and a Microsoft Azure subscription. The steps for these requirements are explained below.**

You'll cover these topics in this Module:

<dl>

  <dt><a href="#0.1" >0.1 - Required before class</a></dt>
  <dt><a href="#0.2" >0.2 - Optional tools and settings for the Self-Guided Activities</a></dt>
  <dt><a href="#0.3" >0.3 - Verify your setup</a></dt>

</dl>

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2 id="0.1"><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/pencil2.png">0.1 Required before class</h2>

*Note that everything in this section, including its Activities, must be completed prior to class - there will not be time to perform these operations during the workshop.*

<h3>Accounts, licenses, and capacity</h3>

- **A Microsoft 365 (M365) account with the proper permissions** - For this workshop, you will be required to execute workloads using Microsoft Fabric. In order to do this you must first sign up for, or currently have, an M365 subscription or organizational account with the proper rights, which you can use to sign up for Power BI. If you do not have one, you can sign up for a free trial of M365.
- **A Power BI Pro license** - You must have a Power BI license in order to utilize Microsoft Fabric. If you do not have one, you can sign up for a free 60-day trial.
- **A Microsoft Fabric capacity** - This can be a free trial Microsoft Fabric capacity, which runs for 60 days, or a capacity that you provision in Azure. Your Power BI tenant must have Fabric enabled in order to create a Microsoft Fabric workspace. Please review [Enable Microsoft Fabric for your organization](https://learn.microsoft.com/en-us/fabric/admin/fabric-switch) for instructions on how to enable Fabric for your tenant or for a capacity.
- **A Microsoft Azure subscription** - You need an Azure subscription to create the Azure SQL Database that you mirror into Microsoft Fabric in Module 05. You can use a free Azure account, a Visual Studio (MSDN) subscription, your organization's subscription, or one provided for you. An [Azure free account](https://azure.microsoft.com/free/) includes a $200 credit to use within 30 days, and signing up asks for a phone number and a credit or debit card. You can also use your subscription to provision a Microsoft Fabric capacity if you can't use a free trial.
- **A computer with an internet browser** - To participate in the activities in this Workshop you must have a computer and an internet browser.
- **A working internet connection** - Microsoft Fabric is a SaaS, Software as a Service, platform hosted on the Internet. You must have internet connectivity to access Microsoft Fabric.

Signing up for M365, Power BI, and Microsoft Fabric is free and does not require a credit card.

<h3>For the Mirroring Activity in Module 05</h3>

In Module 05 - Mirroring in Fabric, you follow [Tutorial: Configure Microsoft Fabric mirrored databases from Azure SQL Database](https://learn.microsoft.com/en-us/fabric/mirroring/azure-sql-database-tutorial) during class. Its [prerequisites](https://learn.microsoft.com/en-us/fabric/mirroring/azure-sql-database-tutorial#prerequisites) add these requirements:

| Prerequisite | Why you need it |
|---|---|
| An Azure SQL Database in your Azure subscription. The [free tier](https://learn.microsoft.com/en-us/azure/azure-sql/database/free-tier?view=azuresql) works, and the second Activity below shows you how to create one. | It's the source database that you mirror into Fabric. |
| A SQL client: [SQL Server Management Studio (SSMS)](https://learn.microsoft.com/en-us/ssms/install/install), which runs only on Windows, **or** [Visual Studio Code](https://code.visualstudio.com/) with the [SQL Server (mssql) extension](https://learn.microsoft.com/en-us/sql/tools/visual-studio-code-extensions/mssql/mssql-extension-visual-studio-code?view=sql-server-ver17), which runs on Windows, macOS, and Linux | The tutorial uses T-SQL to create a login and a database user for Fabric. |
| The **Admin** or **Member** role in the workspace that you use for the workshop. If you create the workspace yourself, you're its Admin. | Users with the **Contributor** role don't have the permission they need to create the mirrored database. |
| The [Service principals can call Fabric public APIs](https://learn.microsoft.com/en-us/fabric/admin/service-admin-portal-developer#service-principals-can-call-fabric-public-apis) and [Users can access data stored in OneLake with apps external to Fabric](https://learn.microsoft.com/en-us/fabric/admin/service-admin-portal-onelake#users-can-access-data-stored-in-onelake-with-apps-external-to-fabric) tenant settings, turned on | The tutorial requires both settings. A Fabric administrator controls them, so ask yours to confirm that they're on. |

If you use a paid Fabric capacity, make sure that it's running during class. Mirroring doesn't replicate data while the capacity is paused.

<h3>Required permissions</h3>

A Microsoft Fabric administrator enables Fabric and manages tenant settings, such as the two settings above. In order to be a Microsoft Fabric Admin for your organization, you must be in one of the following roles:

- Global administrator
- Power Platform administrator
- Microsoft Fabric administrator

These roles are assigned in the Microsoft 365 Administration portal. Microsoft 365 user admins assign users to the Fabric administrator or Power Platform administrator roles in the Microsoft 365 admin portal. If you create a new Microsoft 365 tenant for this workshop, you're its Global administrator.

<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/point1.png"><b>Activity: Set up M365 account, Power BI License, Microsoft Fabric Capacity, Validate you have a computer, and Internet</b></p>

In this Activity you will set up the accounts, licenses, and capacity that you need for the workshop.

<p><img style="margin: 0px 15px 15px 0px;" src="../graphics/checkmark.png"><b>Steps</b></p>

- Open this link in a separate tab or window and follow all of the instructions, [Accessing Microsoft Fabric for developers, startups and enterprises!](https://blog.fabric.microsoft.com/en-us/blog/accessing-microsoft-fabric-for-developers-startups-and-enterprises/)

<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/point1.png"><b>Activity: Create an Azure SQL Database for the Mirroring Activity</b></p>

In this Activity you will create an Azure SQL Database with sample data, which you'll mirror into Microsoft Fabric in Module 05, and connect to it with a SQL client.

<p><img style="margin: 0px 15px 15px 0px;" src="../graphics/checkmark.png"><b>Steps</b></p>

- Open the following reference in another tab, [Quickstart: Create a single database](https://learn.microsoft.com/en-us/azure/azure-sql/database/single-database-create-quickstart?view=azuresql), and follow its Azure portal steps with these changes:
  - On the **Basics** tab, look for the option to use the [free tier](https://learn.microsoft.com/en-us/azure/azure-sql/database/free-tier?view=azuresql), and check that the cost summary shows an estimated cost of zero before you create the database.
  - On the **Networking** tab, set **Allow Azure services and resources to access this server** to **Yes**. The quickstart leaves this set to **No**, but Fabric needs it to reach your database without a data gateway. Only use this setting for a test database like this one.
  - Keep the quickstart's **Use SQL authentication** and **Sample** data source choices. The Module 05 tutorial creates a SQL login for Fabric, and the AdventureWorksLT sample tables give you data to mirror.
- Install SSMS, or VS Code with the SQL Server (mssql) extension. Connect to your database with the server admin login that you created, and run a query such as `SELECT TOP 10 * FROM SalesLT.Customer;`
- Disconnect when you're done. A free tier database pauses after 15 minutes of inactivity, but an open connection keeps it running and uses up its free monthly compute.

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2 id="0.2"><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/pencil2.png">0.2 Optional tools and settings for the Self-Guided Activities</h2>

You don't need anything in this section for the in-class Activities. Set up each item when you're ready to complete the Self-Guided Activities that use it, during or after the workshop.

<h3>Desktop tools</h3>

Module 02 - Desktop Tools to use with Microsoft Fabric shows you how to use each of these tools with Fabric.

| Tool | Used in | Runs on |
|---|---|---|
| [SQL Server Management Studio (SSMS)](https://learn.microsoft.com/en-us/ssms/install/install) | Module 02, section 2.1, and Module 08, section 8.1. Also one of the SQL clients for Module 05. | Windows |
| [Visual Studio Code](https://code.visualstudio.com/) | Module 02, section 2.2. With the SQL Server (mssql) extension, also a SQL client for Modules 05 and 08. | Windows, macOS, Linux |
| GitHub Copilot in VS Code and [Node.js](https://nodejs.org/) 20 LTS or later | Module 02, section 2.2: GitHub Copilot with the Fabric MCP servers | Windows, macOS, Linux |
| [Power BI Desktop](https://learn.microsoft.com/en-us/power-bi/fundamentals/desktop-get-the-desktop) | Module 02, section 2.3, and the Copilot in Power BI tutorial in Module 07, section 7.2 | Windows |
| [Azure Storage Explorer](https://learn.microsoft.com/en-us/azure/storage/storage-explorer/vs-azure-tools-storage-manage-with-storage-explorer) | Module 02, section 2.4 | Windows, macOS, Linux |

GitHub Copilot is built into VS Code. Sign in with a GitHub account to use it, and if you don't have a Copilot plan, signing in enrolls an eligible account in Copilot Free. The workshop's `.vscode/mcp.json` file starts the local Fabric MCP server with `npx`, which is why you also need Node.js. For setup steps, see the **AI-Assisted Development with MCP Servers** section of the [workshop README](../README.md).

<h3>Visual Studio Code extensions</h3>

Install the extensions you need from the **Extensions** view in VS Code:

| Extension | Marketplace ID | Used in |
|---|---|---|
| Microsoft Fabric | `fabric.vscode-fabric` | Module 02: browse and manage workspaces |
| Fabric Data Engineering | `SynapseVSCode.synapse` | Module 02: notebooks, Spark job definitions, and Lakehouses |
| SQL Server (mssql) | `ms-mssql.mssql` | Module 02, Module 05 if you don't use SSMS, and Module 08 |
| Fabric User data functions | `fabric.vscode-fabric-functions` | Module 02: User data functions |

The Fabric User data functions extension also needs Python 3.11, Azure Functions Core Tools v4, and Microsoft ODBC Driver 18 for SQL Server. For details, see the prerequisites in [Create a Fabric User data functions item in Visual Studio Code](https://learn.microsoft.com/en-us/fabric/data-engineering/user-data-functions/create-user-data-functions-vs-code#prerequisites).

<h3>Capacity and settings for later modules</h3>

Some Self-Guided Activities need a paid capacity, another account, or tenant settings that an administrator controls:

| Module | What you need |
|---|---|
| Module 06 - Real-Time Intelligence with Microsoft Fabric | A workspace on a Fabric capacity or a Fabric trial that you use only for the Real-Time Intelligence tutorial. For the optional anomaly detection part in section 6.6, a Fabric administrator must turn on the **Detect anomalies in Real-Time Intelligence (Preview)** tenant setting. For the map in section 6.7, if your capacity is outside the EU or the US, an administrator must also allow Azure Maps to process data outside your region. |
| Module 07 - Copilots & Data Agents | A paid Fabric capacity (F2 or higher) or a Power BI Premium capacity (P1 or higher). [Trial capacities aren't supported](https://learn.microsoft.com/en-us/power-bi/create-reports/copilot-introduction). Copilot is on by default for paid capacities, and a Fabric administrator controls who can use it. Data agents also depend on the [Fabric data agent tenant settings](https://learn.microsoft.com/en-us/fabric/data-science/data-agent-tenant-settings). |
| Module 09 - Bonus Building Architectures with Microsoft Fabric | For Git integration in section 9.3: a Fabric capacity or a Fabric trial; an Azure DevOps account registered to the same user as your Fabric account, or a GitHub account with a personal access token; access to an existing repository; and the **Users can synchronize workspace items with their Git repositories** tenant setting. GitHub also needs the **Users can synchronize workspace items with GitHub repositories** setting. See [Get started with Git integration](https://learn.microsoft.com/en-us/fabric/cicd/git-integration/git-get-started#prerequisites). |

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2 id="0.3"><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/pencil2.png">0.3 Verify your setup</h2>

Before class, check that the items in section 0.1 are ready.

Validate that you have a Microsoft Fabric-enabled workspace:
- If you don't have a workspace yet, follow [Tutorial: Create a workspace](https://learn.microsoft.com/en-us/fabric/data-warehouse/tutorial-create-workspace)
- Navigate to your Microsoft Fabric-enabled workspace
- Select **+ New item**
- Validate that you see the options available to you to create Microsoft Fabric items such as a Lakehouse, a Warehouse, a Pipeline, an Eventhouse, or an Eventstream

Validate that you're ready for the Mirroring Activity in Module 05:
- Confirm that you have the Admin or Member role in your workspace. If you created the workspace, you're its Admin.
- Connect to your Azure SQL Database with your SQL client, run a query against one of the sample tables, and then disconnect.

<p style="border-bottom: 1px solid lightgrey;"></p>


