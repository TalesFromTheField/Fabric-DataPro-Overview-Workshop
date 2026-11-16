![](../graphics/microsoftlogo.png)

# Workshop: Microsoft Fabric Overview for the Data Professional

#### <i>A workshop from the Tales from the Field team</i>


<p style="border-bottom: 1px solid lightgrey;"></p>

<img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/textbubble.png"> <h2>00 - Pre-Requisites</h2>

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
| [Power BI Desktop](https://learn.microsoft.com/en-us/power-bi/fundamentals/desktop-get-the-desktop) | Module 02, section 2.3 | Windows |
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
| Module 07 - Copilots, Data Agents & Fabric IQ | A paid Fabric capacity and tenant settings that an administrator controls. See **For the Module 07 Activities** below. |
| Module 09 - Bonus Building Architectures with Microsoft Fabric | For Git integration in section 9.3: a Fabric capacity or a Fabric trial; an Azure DevOps account registered to the same user as your Fabric account, or a GitHub account with a personal access token; access to an existing repository; and the **Users can synchronize workspace items with their Git repositories** tenant setting. GitHub also needs the **Users can synchronize workspace items with GitHub repositories** setting. See [Get started with Git integration](https://learn.microsoft.com/en-us/fabric/cicd/git-integration/git-get-started#prerequisites). |

<h3>For the Module 07 Activities</h3>

In Module 07 - Copilots, Data Agents & Fabric IQ, three Self-Guided Activities follow Microsoft Learn tutorials: you build an ontology in section 7.4, create a data agent in section 7.5, and create an operations agent in section 7.6. They add the requirements below. A Fabric administrator controls the tenant settings (see **Required permissions** in section 0.1), so ask yours to confirm that they're on for you.

| Prerequisite | Needed for | Why you need it |
|---|---|---|
| A paid Fabric capacity (**F2** or higher) or Power BI Premium capacity (**P1** or higher), with your workspace assigned to it. A Fabric trial capacity doesn't work. | All Module 07 Activities | The Fabric trial doesn't include Copilot or AI experiences such as data agents, and operations agents don't support trial capacities. The ontology Activity uses the ontology agent, which Learn describes as an AI-powered Copilot. See the [prerequisites for Copilot in Fabric](https://learn.microsoft.com/en-us/fabric/fundamentals/copilot-enable-fabric#prerequisites) and [what the Fabric trial includes](https://learn.microsoft.com/en-us/fabric/fundamentals/fabric-trial#whats-includedand-whats-not). |
| The [Users can use Copilot and other features powered by Azure OpenAI](https://learn.microsoft.com/en-us/fabric/admin/service-admin-portal-copilot#users-can-use-copilot-and-other-features-powered-by-azure-openai) tenant setting, turned on for you | All Module 07 Activities | It turns on the features powered by Azure OpenAI, including Copilot and agents. It's on by default, but an administrator can turn it off, limit it to security groups, or manage it for a single capacity. |
| Only if your capacity is outside the US and the EU Data Boundary (for example, in the UK, Canada, or Australia): the [Data sent to Azure OpenAI can be processed outside your capacity's geographic region, compliance boundary, or national cloud instance](https://learn.microsoft.com/en-us/fabric/admin/service-admin-portal-copilot#data-sent-to-azure-openai-can-be-processed-outside-your-capacitys-geographic-region-compliance-boundary-or-national-cloud-instance) tenant setting, turned on | All Module 07 Activities | The Azure OpenAI service behind Copilot runs only in US datacenters and the EU Data Boundary. Elsewhere, Copilot and the ontology agent stay off until this setting is on, and the data agent and operations agent prerequisites require it. It's off by default. See [Available regions](https://learn.microsoft.com/en-us/fabric/fundamentals/copilot-fabric-overview#available-regions). |
| Also only outside the US and the EU Data Boundary: the [Data sent to Azure OpenAI can be stored outside your capacity's geographic region, compliance boundary, or national cloud instance](https://learn.microsoft.com/en-us/fabric/admin/service-admin-portal-copilot#data-sent-to-azure-openai-can-be-stored-outside-your-capacitys-geographic-region-compliance-boundary-or-national-cloud-instance) tenant setting, turned on | Data agent and operations agent Activities (sections 7.5 and 7.6) | Data agents store your conversation history, and the operations agent prerequisites ask for this setting too. It's off by default. See [Configure Fabric data agent tenant settings](https://learn.microsoft.com/en-us/fabric/data-science/data-agent-tenant-settings#required-settings) and the [operations agent prerequisites](https://learn.microsoft.com/en-us/fabric/real-time-intelligence/operations-agent#prerequisites). |
| A Fabric tenant in the Azure public cloud, not a sovereign cloud such as GCC High | All Module 07 Activities | Copilot isn't supported in sovereign clouds yet, operations agents aren't available in them, and GCC High doesn't support ontologies. See [What is Copilot in Fabric?](https://learn.microsoft.com/en-us/fabric/fundamentals/copilot-fabric-overview#enable-copilot) and the [GCC High limitations](https://learn.microsoft.com/en-us/fabric/enterprise/us-government-community-cloud-high#current-limitations). |
| Spare capacity units (CUs) on your capacity | All Module 07 Activities | Copilot and data agent requests consume CUs, a running operations agent consumes them every hour until you stop it, and an ontology's Eventhouse and graph usage is billed too. Track usage in the Fabric Capacity Metrics app. See [Consumption rates and billing for Copilot in Fabric](https://learn.microsoft.com/en-us/fabric/fundamentals/copilot-fabric-consumption) and [Operations agent capacity and billing](https://learn.microsoft.com/en-us/fabric/real-time-intelligence/operations-agent-billing#usage-categories). |
| (optional) A [Fabric Copilot capacity](https://learn.microsoft.com/en-us/fabric/enterprise/fabric-copilot-capacity#how-fabric-copilot-capacity-works) that a capacity administrator assigns you to | Copilot in Power BI Desktop or in Pro and Premium per-user (PPU) workspaces (section 7.2). No Activity requires it. | It bills your Copilot use to one designated capacity, and it's how Pro and PPU workspaces get Copilot. Power BI Desktop can use it, or a workspace on a Copilot-enabled F2 or P1 (or higher) capacity where you're an Admin, Member, or Contributor. See [Enable Fabric Copilot for Power BI](https://learn.microsoft.com/en-us/power-bi/create-reports/copilot-enable-power-bi#use-copilot-in-power-bi-desktop). |
| The [Users can create Fabric items](https://learn.microsoft.com/en-us/fabric/iq/ontology/overview-tenant-settings#users-can-create-fabric-items) and [Users can create ontology (preview) items](https://learn.microsoft.com/en-us/fabric/iq/ontology/overview-tenant-settings#users-can-create-ontology-preview-items) tenant settings, turned on | Ontology Activity (section 7.4) | Learn lists both as required to create an ontology. Connecting an ontology to a data agent or operations agent also needs their settings in this table. |
| Ideally, an **F8** capacity or larger. An F4 might be enough for light testing. | Ontology Activity (section 7.4) | Learn suggests starting an ontology evaluation on an F8. During preview, only the ontology's Eventhouse and graph usage is billed; ontology discovery and AI reasoning aren't. See [Billing and capacity usage for the new ontology experience](https://learn.microsoft.com/en-us/fabric/iq/ontology/resources-capacity-usage#choosing-a-starting-capacity-for-evaluation). |
| The **Contributor** role or higher in your workspace. If you create the workspace yourself, you're its Admin. | Ontology Activity (section 7.4) | Creating and improving an ontology, and applying the ontology agent's changes, need Contributor or higher. Viewers can only explain and query an existing ontology. See [What the agent can access](https://learn.microsoft.com/en-us/fabric/iq/ontology/how-to-use-ontology-agent#what-the-agent-can-access). |
| The Lakeshore Retail sample files from GitHub, downloaded to your computer | Ontology Activity (section 7.4) | You load the CSV files into a Lakehouse and an Eventhouse and import *SalesReport.pbix* to create a semantic model, all in one workspace. See [Tutorial part 0: Introduction and environment setup](https://learn.microsoft.com/en-us/fabric/iq/ontology/tutorial-0-introduction#download-sample-data). |
| The [Capacities can be designated as Fabric Copilot capacities](https://learn.microsoft.com/en-us/fabric/data-science/data-agent-tenant-settings#required-settings) tenant setting, turned on | Data agent Activity (section 7.5) | Learn lists it as required for data agents, along with the Copilot and cross-region settings above. It's on by default. The [Copilot and Agent tenant settings](https://learn.microsoft.com/en-us/fabric/admin/service-admin-portal-copilot#capacities-can-be-designated-as-copilot-in-fabric-capacities) page calls it *Capacities can be designated as Copilot in Fabric capacities*. |
| A Lakehouse with the AdventureWorks sample data. The tutorial's first step loads it with a notebook. | Data agent Activity (section 7.5) | The data agent answers questions over this data. Stop the notebook session when the load finishes, because a notebook that keeps running keeps using capacity. See the [tutorial prerequisites](https://learn.microsoft.com/en-us/fabric/data-science/data-agent-end-to-end-tutorial#prerequisites). |
| (optional) For Microsoft 365 Copilot: a Microsoft Copilot license or an Office 365 commercial subscription, plus a user license for each person who uses the agent there | Data agent Activity (section 7.5) | Only to publish the agent to the Agent Store and use it in Microsoft 365 Copilot. Fabric and Microsoft 365 Copilot must be in the same tenant, and you sign in to both with the same account. If the agent doesn't appear, ask your Microsoft 365 administrator to check that Copilot extensibility is on for you. See [Consume a data agent from Microsoft Copilot](https://learn.microsoft.com/en-us/fabric/data-science/data-agent-microsoft-365-copilot#prerequisites). |
| (optional) A Model Context Protocol (MCP) client that supports streamable HTTP and can sign in to Fabric, such as Visual Studio Code (see **Desktop tools** above) | Data agent Activity (section 7.5) | Only to call the published agent through its MCP server from outside Fabric. The account you sign in with needs access to the workspace and the data agent. See [Data agent as Model Context Protocol server](https://learn.microsoft.com/en-us/fabric/data-science/data-agent-mcp-server#prerequisites). |
| The [Enable operations agents](https://learn.microsoft.com/en-us/fabric/admin/service-admin-portal-microsoft-fabric-tenant-settings#enable-operations-agents) tenant setting, turned on | Operations agent Activity (section 7.6) | It lets users create operations agents, and an administrator can manage it for the tenant or for a capacity. Learn doesn't say whether it's on by default, so ask your administrator to check. |
| A capacity in an Azure public cloud Fabric region other than **East US** or **South Central US**, and a workspace that isn't encrypted with customer-managed keys | Operations agent Activity (section 7.6) | Operations agents aren't available in those two regions or in workspaces that use customer-managed keys. See [Fabric region availability](https://learn.microsoft.com/en-us/fabric/admin/region-availability#regional-fabric-and-power-bi-workload-availability) and the [operations agent limitations](https://learn.microsoft.com/en-us/fabric/real-time-intelligence/operations-agent-limitations#regional-and-workspace-limitations). |
| A **Microsoft Teams** account and the **Fabric Operations Agent** Teams app | Operations agent Activity (section 7.6) | The agent messages you through this app with what it found and the actions it recommends, and you approve its recommendations there. If the app isn't installed for you automatically, search for it in the Teams app store. See [Receive messages from an operations agent](https://learn.microsoft.com/en-us/fabric/real-time-intelligence/operations-agent-actions#receive-messages-from-an-operations-agent). |
| The [Real-Time Intelligence end-to-end sample](https://learn.microsoft.com/en-us/fabric/real-time-intelligence/sample-end-to-end#create-an-end-to-end-sample) (bike rental data), created in a workspace on your paid capacity | Operations agent Activity (section 7.6) | It gives the agent an Eventhouse to monitor. An operations agent watches one data source, needs a timestamp in the data, and takes instructions only in English. See the [data source limitations](https://learn.microsoft.com/en-us/fabric/real-time-intelligence/operations-agent-limitations#data-source-limitations). |
| (optional) A Power Automate plan that includes premium connectors | Operations agent Activity (section 7.6) | Only if you add a Power Automate action. Its flow starts from the [Data Activator connector](https://learn.microsoft.com/en-us/connectors/dataactivator/), which is a premium connector. See [Configure a Power Automate action](https://learn.microsoft.com/en-us/fabric/real-time-intelligence/operations-agent-actions#configure-a-power-automate-action). |
| (optional) The **Contributor** or **Admin** role in the agent's workspace, and GitHub Copilot in Visual Studio Code (see **Desktop tools** above) | Operations agent Activity (section 7.6) | Only for the remote MCP server step, where you configure and query the agent by chatting with it. See the [MCP server prerequisites](https://learn.microsoft.com/en-us/fabric/real-time-intelligence/mcp-remote-operations-agent#prerequisites). |

Set these up at least a day before you start. Copilot can take [up to 24 hours](https://learn.microsoft.com/en-us/power-bi/create-reports/copilot-introduction#considerations-and-limitations) to recognize a new or scaled-up capacity, and tenant settings can take [up to an hour](https://learn.microsoft.com/en-us/fabric/data-science/data-agent-tenant-settings#access-tenant-settings) to take effect.

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

<p><img style="margin: 0px 15px 15px 0px;" src="../graphics/owl.png"><b>For Further Study</b></p>

<ul>
<li><a href="https://learn.microsoft.com/en-us/fabric/enterprise/licenses">Understand Microsoft Fabric licenses and capacity</a></li>
<li><a href="https://learn.microsoft.com/en-us/fabric/fundamentals/fabric-trial">Fabric trial capacity</a></li>
<li><a href="https://learn.microsoft.com/en-us/fabric/admin/fabric-switch">Enable Microsoft Fabric for your organization</a></li>
<li><a href="https://learn.microsoft.com/en-us/fabric/fundamentals/roles-workspaces">Roles in workspaces in Microsoft Fabric</a></li>
<li><a href="https://learn.microsoft.com/en-us/fabric/admin/about-tenant-settings">About tenant settings</a></li>
<li><a href="https://learn.microsoft.com/en-us/fabric/fundamentals/copilot-enable-fabric">Enable and configure Copilot in Microsoft Fabric</a></li>
<li><a href="https://learn.microsoft.com/en-us/fabric/admin/region-availability">Fabric region availability</a></li>
</ul>

Congratulations! You have completed this Module. If you understand the concepts here and have completed all of the Activities, you can [proceed to the next Module](01%20-%20Introduction%20and%20Overview.md).


