![](../graphics/microsoftlogo.png)

# Workshop: Microsoft Fabric Overview for the Data Professional

#### <i>A Microsoft Workshop</i>

<p style="border-bottom: 1px solid lightgrey;"></p>

<img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/textbubble.png"> <h2>02 - Desktop Tools to use with Microsoft Fabric</h2>

In this module you'll learn how to work with Microsoft Fabric from tools that you install on your own computer. You'll query Warehouses and SQL analytics endpoints with SQL Server Management Studio, develop notebooks, functions, and T-SQL in Visual Studio Code, build reports with Power BI Desktop, and work with OneLake files in Azure Storage Explorer. All of the Activities in this module are self-guided, so you can try each tool after class.

All four tools are free:

| Tool | Runs on | Use it with Fabric to |
|---|---|---|
| SQL Server Management Studio (SSMS) | Windows | Query and manage Warehouses, SQL analytics endpoints, and SQL databases with T-SQL |
| Visual Studio Code | Windows, macOS, Linux | Manage workspace items, develop notebooks and User data functions, run T-SQL, and use GitHub Copilot with Fabric |
| Power BI Desktop | Windows | Build semantic models and reports on your Fabric data |
| Azure Storage Explorer | Windows, macOS, Linux | Browse, upload, download, and copy files in OneLake |

If you use a Mac, use Visual Studio Code for T-SQL, and build Power BI reports in your browser.

In each module you'll get more references, which you should follow up on to learn more. Also watch for links within the text - click on each one to explore that topic.

(<a href="00%20-%20Pre-Requisites.md" >Make sure you check out the <b>Pre-Requisites</b> page before you start</a>. You'll need all of the items loaded there before you can proceed with the workshop.)

You'll cover these topics in this Module on the Developer Experience:

<dl>

  <dt><a href="#2.1" >2.1 - Using SQL Server Management Studio</a></dt>
  <dt><a href="#2.2" >2.2 - Using Visual Studio Code</a></dt>
  <dt><a href="#2.3" >2.3 - Using Power BI Desktop</a></dt>
  <dt><a href="#2.4" >2.4 - Using Azure Storage Explorer</a></dt>

</dl>

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2 id="2.1"><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/pencil2.png">2.1 Using SQL Server Management Studio</h2>


SQL Server Management Studio (SSMS) is a free tool for managing and querying SQL Server and Azure SQL databases. It also connects to Microsoft Fabric, where you can use it with a Warehouse, the SQL analytics endpoint of a Lakehouse, and SQL database in Fabric. The current release, [SSMS 22](https://learn.microsoft.com/en-us/ssms/install/install), runs only on Windows. On macOS or Linux, use VS Code and its MSSQL extension instead (see section 2.2).

SSMS helps when you outgrow the query editor that's built into the Fabric portal. For example, you can set session options with `SET` statements and run transactions that span several batches. Keep in mind that the tables in a SQL analytics endpoint are read-only. You can query them and create views, functions, and stored procedures, but you change the data in the Lakehouse itself, as you'll see in Module 04 - The Lakehouse.

To connect SSMS to a Warehouse or SQL analytics endpoint:

1. In the Fabric portal, open the item's **Settings**, go to the **SQL connection string** page, and copy the value shown there. It looks like `<unique-identifier>.datawarehouse.fabric.microsoft.com`. All the Warehouses and SQL analytics endpoints in a workspace share the same value.
2. In SSMS, open the **Connect to Server** dialog and paste the value into **Server name**.
3. For **Authentication**, select **Microsoft Entra MFA**, and sign in with the account that you use for Fabric. SQL authentication isn't supported.
4. Enter the name of the Warehouse or Lakehouse as the database name. If you leave it blank, you connect to the `master` database instead.

<img src="https://learn.microsoft.com/en-us/fabric/data-warehouse/media/connectivity/connect-server-window.png" alt="The SSMS Connect to Server dialog with a Fabric server name and Microsoft Entra MFA authentication" height = 400>

After you connect, Object Explorer shows your Warehouse or SQL analytics endpoint with its tables and views, ready to query.

<img src="https://learn.microsoft.com/en-us/fabric/data-warehouse/media/connectivity/object-explorer-example.png" alt="SSMS Object Explorer connected to Fabric, showing the tables of a SQL analytics endpoint" height = 400>

SSMS lists Warehouses and SQL analytics endpoints the same way, so it can be hard to tell them apart. Use a naming convention that shows each item's type, such as a prefix or suffix in the item name.

Keep these points in mind:

- SSMS connects over TCP port 1433, which some networks block.
- For a SQL database in Fabric, select **Open in** > **SQL Server Management Studio** in the Fabric portal, and SSMS opens with the connection details filled in. You'll work with SQL database in Fabric in Module 08 - Databases in Microsoft Fabric.
- SSMS 22 includes [GitHub Copilot](https://learn.microsoft.com/en-us/ssms/github-copilot/overview), which can answer questions and help you write T-SQL for databases such as SQL database in Fabric. To turn it on, include the **AI Assistance** workload in your SSMS installation, then connect your GitHub account. Any GitHub Copilot plan works, including Copilot Free.

<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/point1.png"><b>Self-Guided Activity: Connect to a Warehouse with SSMS</b></p>

In this Activity you will copy the SQL connection string of a Warehouse, connect to it from SSMS, and query its tables.

<p><img style="margin: 0px 15px 15px 0px;" src="../graphics/checkmark.png"><b>Steps</b></p>

- If you don't have a Warehouse yet, [create a sample Warehouse](https://learn.microsoft.com/en-us/fabric/data-warehouse/create-warehouse-sample), or come back to this Activity after you create a Warehouse in Module 03 - Data Warehouse and Data Integration.
- [Open this reference and follow the steps you see there](https://learn.microsoft.com/en-us/fabric/data-warehouse/how-to-connect#connect-using-sql-server-management-studio-ssms)
- Open a new query window and run a `SELECT` query against one of the tables.

You can also right-click this link to open it in another tab and review this video that demonstrates this topic:

<p><a href="https://www.youtube.com/watch?v=iDLTj-tCLdY&t=63s"><img src="https://img.youtube.com/vi/iDLTj-tCLdY/0.jpg" alt="Tales From The Field video: Connect to Microsoft Fabric with five tools, starting at the SSMS demo" height = 200></a> 


<p style="border-bottom: 1px solid lightgrey;"></p>

<h2 id="2.2"><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/pencil2.png">2.2 Using Visual Studio Code</h2>

Visual Studio Code (VS Code) is a free, lightweight code editor that runs on Windows, macOS, and Linux. With a set of Microsoft extensions, you can work with Microsoft Fabric from your desktop: browse workspaces, author notebooks and Spark job definitions, explore Lakehouses, run T-SQL queries, build User data functions, and keep your work in Git source control. Many Fabric items also include an **Open in VS Code** option in the Fabric portal.

VS Code is also the cross-platform choice for T-SQL. SQL Server Management Studio runs only on Windows, and Azure Data Studio was [retired on February 28, 2026](https://learn.microsoft.com/en-us/sql/tools/whats-happening-azure-data-studio?view=sql-server-ver17). Microsoft recommends VS Code with the MSSQL extension instead.

<h3>The Fabric extensions for VS Code</h3>

Install the extensions you need from the **Extensions** view in VS Code:

| Extension | Marketplace ID | Use it to |
|---|---|---|
| Microsoft Fabric | `fabric.vscode-fabric` | Sign in, browse workspaces, and create and manage items |
| Fabric Data Engineering | `SynapseVSCode.synapse` | Author notebooks and Spark job definitions, and explore Lakehouses |
| Fabric User data functions | `fabric.vscode-fabric-functions` | Create, debug, and publish User data functions |
| SQL Server (mssql) | `ms-mssql.mssql` | Connect to SQL databases, SQL analytics endpoints, and Warehouses, and run T-SQL |
| SQL Database Projects | `ms-mssql.sql-database-projects-vscode` | Develop Warehouse projects (preview) |
| Microsoft Fabric MCP Server | `fabric.vscode-fabric-mcp-server` | Give GitHub Copilot access to Fabric tools |

The Fabric Data Engineering extension was previously named the Synapse VS Code extension, so you may still see that name in older articles and videos.

Some extensions have their own prerequisites. For example, the Fabric Data Engineering extension uses the Jupyter extension, and User data functions need Python and the Azure Functions Core Tools. The setup articles linked in this section list everything you need.

<h3>Browse and manage your workspace</h3>

The Microsoft Fabric extension adds a Fabric view to VS Code. Once you've signed in with your Microsoft Entra ID, you can:

- Browse and filter your workspaces and folders, and switch between tenants
- Create, rename, and delete items
- Open an item's definition files to see how the item is configured
- Clone workspaces that are connected to Git

<img src="https://learn.microsoft.com/en-us/fabric/data-engineering/media/vs-code/manage-workspace.png" alt="The Microsoft Fabric extension in VS Code showing a filtered list of workspaces" height = 400>

To install the extension and sign in, see [Microsoft Fabric extensions for Visual Studio Code](https://learn.microsoft.com/en-us/fabric/data-engineering/set-up-fabric-vs-code-extension).

<h3>Notebooks, Spark job definitions, and Lakehouses</h3>

The Fabric Data Engineering extension brings Spark development into VS Code:

- **Notebooks**: Create, edit, and run Fabric notebooks. Code runs on the **Microsoft Fabric Runtime** kernel, which uses the remote Spark compute in your workspace, so you don't need to install Spark on your computer.
- **Spark job definitions**: Create, edit, and run Spark job definitions.
- **Lakehouse explorer**: Browse Lakehouse tables and files, preview table data, and copy paths to use in your code.
- **Local mode and VFS mode**: Local mode copies items to your computer, and you sync your edits back to the workspace when you're done. VFS (Virtual File System) mode skips the download, so you work on the items where they live in the workspace.

Notebooks in the Fabric portal also have an **Open in VS Code** button. If you'd rather not install anything, VS Code for the Web lets you edit and run notebooks in your browser.

<img src="https://learn.microsoft.com/en-us/fabric/data-engineering/media/vs-code/list-notebook.png" alt="The Fabric Data Engineering extension in VS Code listing the notebooks in a workspace" height = 400>

<h3>T-SQL with the MSSQL extension</h3>

The SQL Server (mssql) extension connects VS Code to the SQL experiences in Fabric:

- **Browse Fabric**: In the connection dialog, sign in, browse your workspaces, and connect to SQL databases and SQL analytics endpoints without copying a connection string. You can also create a SQL database in Fabric from VS Code.
- **Warehouses**: Connect by using the Warehouse's SQL connection string and Microsoft Entra ID authentication.
- **Open in VS Code**: For a SQL database in the Fabric portal, select **Open in** > **Visual Studio Code** to connect directly.

You'll use SSMS or this extension again in two later modules. In Module 05 - Mirroring in Fabric, you prepare an Azure SQL Database for Mirroring, and in Module 08 - Databases in Microsoft Fabric, you connect to the SQL database that you create there. For details, see [MSSQL extension: Fabric integration](https://learn.microsoft.com/en-us/sql/tools/visual-studio-code-extensions/mssql/mssql-fabric-integration?view=sql-server-ver17).

<h3>User data functions</h3>

User data functions let you write reusable Python business logic that runs in Fabric. With the Fabric User data functions extension, you can write functions on your computer, debug them with breakpoints, and publish them to your workspace. To get started, see [Create a User data functions item in VS Code](https://learn.microsoft.com/en-us/fabric/data-engineering/user-data-functions/create-user-data-functions-vs-code).

<h3>GitHub Copilot and the Fabric MCP servers</h3>

AI assistants use the Model Context Protocol (MCP), an open standard, to call tools outside the assistant. The Fabric MCP servers give GitHub Copilot Chat in VS Code tools for working with Microsoft Fabric, so you can ask Copilot to do things like list your workspaces or create an item.

- **Fabric Core MCP Server** (remote): Works with workspaces, items, folders, role assignments, OneLake catalog search, and capacities. It uses your Microsoft Entra ID sign-in and your existing Fabric permissions.
- **Fabric MCP Server (local)**: Runs on your computer through the Microsoft Fabric MCP Server extension or the `@microsoft/fabric-mcp` package. It provides Fabric API specifications, item schemas, and best-practice guidance, and can also work with OneLake files and Fabric items.
- **Workload servers**: Servers for specific workloads, such as Warehouse and Eventhouse, are in preview.

For the full list, see [Choose a Fabric MCP server](https://learn.microsoft.com/en-us/rest/api/fabric/articles/mcp-servers/fabric-mcp-servers-list).

This workshop repository is already set up for these servers. When you open the repository in VS Code, the `.vscode/mcp.json` file registers both servers as `fabric-core` and `fabric-local`. For setup steps, see the **AI-Assisted Development with MCP Servers** section of the [workshop README](../README.md).

Keep these points in mind:

- GitHub Copilot is a separate product from Copilot in Microsoft Fabric, which you'll explore in Module 07 - Copilots & Data Agents. You need a GitHub Copilot plan to use it.
- Review each tool call before you approve it. Copilot acts with your Fabric permissions, so a mistaken or unattended request could change or delete items in your workspace. For guidance, see the [Fabric Core MCP Server overview](https://learn.microsoft.com/en-us/rest/api/fabric/articles/mcp-servers/core-remote/overview-core-mcp-server).

<h3>Considerations</h3>

- Connect with your Microsoft Entra ID. Warehouses and SQL analytics endpoints don't accept SQL authentication.
- SQL connections use TCP port 1433, which some networks block.
- Fabric Warehouse doesn't support Multiple Active Result Sets (MARS). If a connection string includes `MultipleActiveResultSets`, remove it or set it to `false`. For other connection limits, see [Warehouse connectivity: Considerations and limitations](https://learn.microsoft.com/en-us/fabric/data-warehouse/connectivity#considerations-and-limitations).
- To create items, you need the Contributor role or higher in the workspace. Creating a SQL database from the MSSQL extension requires the Admin or Member role.
- Some experiences are in preview, including Warehouse projects and some MCP servers.

<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/point1.png"><b>Self-Guided Activity: Connect VS Code to your Fabric workspace</b></p>

In this Activity you will install the Microsoft Fabric extension, sign in, browse your workspace, and create an item from VS Code.

<p><img style="margin: 0px 15px 15px 0px;" src="../graphics/checkmark.png"><b>Steps</b></p>

- [Open this reference and follow the steps you see there](https://learn.microsoft.com/en-us/fabric/data-engineering/set-up-fabric-vs-code-extension)
- Optional: install the SQL Server (mssql) extension, then use **Browse Fabric** to connect to a SQL analytics endpoint and run a query. [Open this reference and follow the steps you see there](https://learn.microsoft.com/en-us/sql/tools/visual-studio-code-extensions/mssql/mssql-fabric-integration?view=sql-server-ver17)

<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/point1.png"><b>Self-Guided Activity: Develop Fabric notebooks in VS Code</b></p>

In this Activity you will set up the Fabric Data Engineering extension, then create and run a notebook and explore a Lakehouse from VS Code.

<p><img style="margin: 0px 15px 15px 0px;" src="../graphics/checkmark.png"><b>Steps</b></p>

- [Open this reference and follow the steps you see there](https://learn.microsoft.com/en-us/fabric/data-engineering/setup-vs-code-extension)
- [Create and run a notebook in VS Code](https://learn.microsoft.com/en-us/fabric/data-engineering/author-notebook-with-vs-code)
- [Explore a Lakehouse in VS Code](https://learn.microsoft.com/en-us/fabric/data-engineering/explore-lakehouse-with-vs-code)

You can also right-click this link to open it in another tab and review this video that demonstrates this topic:

<p><a href="https://www.youtube.com/watch?v=0tODoHLXhMc"><img src="https://img.youtube.com/vi/0tODoHLXhMc/0.jpg" alt="Tales From The Field video: Microsoft Fabric, VS Code, notebooks, and Spark" height = 200></a> 

<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/point1.png"><b>Self-Guided Activity: Use GitHub Copilot with the Fabric MCP servers</b></p>

In this Activity you will connect GitHub Copilot in VS Code to the Fabric Core MCP Server and ask Copilot about your Fabric workspaces. You need access to GitHub Copilot to complete this Activity.

<p><img style="margin: 0px 15px 15px 0px;" src="../graphics/checkmark.png"><b>Steps</b></p>

- [Open this reference and follow the steps you see there](https://learn.microsoft.com/en-us/rest/api/fabric/articles/mcp-servers/core-remote/get-started-core)
- Or open this workshop repository in VS Code, where the Fabric MCP servers are already configured, and ask Copilot Chat: *List all my Fabric workspaces*

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2 id="2.3"><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/pencil2.png">2.3 Using Power BI Desktop</h2>

Power BI Desktop is Microsoft's free tool for building semantic models and reports on your own computer. With Microsoft Fabric, you can use it to report on the data in your Lakehouses, Warehouses, and other Fabric items, and then share your reports from a Fabric workspace.

To find Fabric data, select **OneLake catalog** on the **Home** ribbon. The [OneLake catalog](https://learn.microsoft.com/en-us/power-bi/connect-data/desktop-data-sources#onelake-catalog) lists the Fabric items that you have access to, and what you get depends on what you select:

| Select | Then select | You get |
|---|---|---|
| A Lakehouse or Warehouse | **Connect** | A [Direct Lake](https://learn.microsoft.com/en-us/fabric/fundamentals/direct-lake-power-bi-desktop) semantic model that's stored in your workspace. Power BI Desktop edits it live, so there's nothing to publish. |
| A Lakehouse or Warehouse | **Connect to SQL endpoint** | An Import or DirectQuery semantic model that stays in your .pbix file until you publish it |
| A semantic model | **Connect** | A [live connection](https://learn.microsoft.com/en-us/power-bi/connect-data/desktop-report-lifecycle-datasets), so you can build reports on a shared semantic model without changing it |

With Direct Lake, the semantic model reads the Delta tables in OneLake directly, so you don't have to import and refresh a copy of the data. For more control, such as filtering the data with a SQL statement, you can also connect with the **SQL Server** connector and the SQL connection string from section 2.1. To combine Fabric data with other sources, see [composite models](https://learn.microsoft.com/en-us/power-bi/transform-model/desktop-composite-models).

<img src="https://learn.microsoft.com/en-us/power-bi/connect-data/media/desktop-data-sources/new-get-data-onelake-connectivity-mode.png" alt="The OneLake catalog in Power BI Desktop, showing Fabric items and the Connect and Edit options for a semantic model" height = 400>

If you've seen older Fabric content, note two changes:

- *Datasets* are now called *semantic models*.
- Warehouses, Lakehouses, and mirrored databases no longer get a default semantic model. Fabric stopped creating them in September 2025 and turned the existing ones into independent semantic models. For details, see [Power BI semantic models in Microsoft Fabric](https://learn.microsoft.com/en-us/fabric/data-warehouse/semantic-models).

Power BI Desktop runs only on Windows. If you use macOS, you can [create semantic models and reports in your browser](https://learn.microsoft.com/en-us/power-bi/create-reports/power-bi-reports-overview#create-reports-in-the-power-bi-service) in the Power BI service.

<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/point1.png"><b>Self-Guided Activity: Create reports using Power BI Desktop</b></p>

In this Activity you will connect Power BI Desktop to a Warehouse and build a report. Use the Warehouse you create in Module 03 - Data Warehouse and Data Integration, or a [sample Warehouse](https://learn.microsoft.com/en-us/fabric/data-warehouse/create-warehouse-sample).

Some steps in the reference use older names. The ribbon button is now named **OneLake catalog**, and Warehouses no longer have a default semantic model, so selecting **Connect** creates a new Direct Lake semantic model. To follow the reference's steps, select **Connect to SQL endpoint**.

<p><img style="margin: 0px 15px 15px 0px;" src="../graphics/checkmark.png"><b>Steps</b></p>

- [Open this reference and follow the steps you see there](https://learn.microsoft.com/en-us/fabric/data-warehouse/create-reports#create-reports-using-power-bi-desktop)

You can also right-click this link to open it in another tab and review this video that demonstrates this topic:

<p><a href="https://www.youtube.com/watch?v=iDLTj-tCLdY&t=329s"><img src="https://img.youtube.com/vi/iDLTj-tCLdY/0.jpg" alt="Tales From The Field video: Connect to Microsoft Fabric with five tools, starting at the Power BI demo" height = 200></a> 

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2 id="2.4"><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/pencil2.png">2.4 Using Azure Storage Explorer</h2>

Azure Storage Explorer is a free app for Windows, macOS, and Linux that you use to work with files in Azure Storage. Storage Explorer also works with OneLake, because OneLake understands the same APIs that tools use for Blob Storage and Azure Data Lake Storage (ADLS) Gen2. You can browse the folders and files in your Fabric items, upload and download files, and copy files between OneLake and Azure Storage accounts.

To connect, you give Storage Explorer the URL of a workspace or item. The URL looks like `https://onelake.dfs.fabric.microsoft.com/<workspace>/<item>.<itemtype>/`, for example `https://onelake.dfs.fabric.microsoft.com/myworkspace/mylakehouse.Lakehouse/`. To find it, open the **Properties** of a file or folder in the Fabric portal. Storage Explorer doesn't list your workspaces for you.

<img src="https://learn.microsoft.com/en-us/fabric/onelake/media/onelake-azure-storage-explorer/select-onelake-folder.png" alt="Azure Storage Explorer connected to OneLake, showing the Files and Tables folders of a Fabric item" height = 300>

Keep these points in mind:

- You manage workspaces, items, and permissions in Fabric. In Storage Explorer, you work with the folders and files inside an item.
- In a Lakehouse, put your own files in the **Files** folder. The **Tables** folder holds the Lakehouse's managed Delta tables.
- To upload or delete files, you need the Contributor role or higher in the workspace. Your Fabric admin must also allow apps outside Fabric to access OneLake.
- If your workspace name contains capital letters, deleting files from Storage Explorer fails. Use a lowercase workspace name if you plan to delete files.
- On macOS, and on Linux if you use the .tar.gz package, install the .NET 10 runtime before you install Storage Explorer.

<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/point1.png"><b>Self-Guided Activity: Connect Azure Storage Explorer to OneLake</b></p>

In this Activity you will install Azure Storage Explorer, connect it to a Lakehouse in OneLake, and upload, download, and copy files.

<p><img style="margin: 0px 15px 15px 0px;" src="../graphics/checkmark.png"><b>Steps</b></p>

- If you don't have a Lakehouse with files yet, complete the first sections of [Quickstart: Get data into OneLake](https://learn.microsoft.com/en-us/fabric/onelake/quickstart-get-data) to create a Lakehouse and upload a sample file. Skip the clean-up section, so that you can use the Lakehouse in this Activity. You'll also create a Lakehouse in Module 04 - The Lakehouse.
- Download and install the newest release of [Azure Storage Explorer](https://learn.microsoft.com/en-us/azure/storage/storage-explorer/vs-azure-tools-storage-manage-with-storage-explorer). The reference below lists version 1.29.0 as the minimum, but that version is no longer supported.
- [Open this reference and follow the steps you see there](https://learn.microsoft.com/en-us/fabric/onelake/onelake-azure-storage-explorer)

You can also right-click this link to open it in another tab and review this video that demonstrates this topic:

<p><a href="https://www.youtube.com/watch?v=xingcILHkc0"><img src="https://img.youtube.com/vi/xingcILHkc0/0.jpg" alt="Tales From The Field video: How to connect Azure Storage Explorer to OneLake" height = 200></a> 

<p style="border-bottom: 1px solid lightgrey;"></p>

<p><img style="margin: 0px 15px 15px 0px;" src="../graphics/owl.png"><b>For Further Study</b></p>

<ul>
    <li><a href="https://roadmap.fabric.microsoft.com/">Microsoft Fabric Roadmap</a></li>
    <li><a href="https://learn.microsoft.com/en-us/fabric/data-warehouse/connectivity">Warehouse connectivity</a></li>
    <li><a href="https://learn.microsoft.com/en-us/fabric/data-warehouse/entra-id-authentication">Microsoft Entra authentication as an alternative to SQL authentication</a></li>
    <li><a href="https://learn.microsoft.com/en-us/fabric/data-warehouse/tsql-surface-area">T-SQL surface area in Fabric Data Warehouse</a></li>
    <li><a href="https://learn.microsoft.com/en-us/fabric/data-engineering/author-notebook-resource-with-vs-code" >Access and manage Fabric notebook resources in VS Code</a></li>
    <li><a href="https://learn.microsoft.com/en-us/fabric/data-engineering/author-sjd-with-vs-code" >Create and manage Apache Spark job definitions in VS Code</a></li>
    <li><a href="https://learn.microsoft.com/en-us/fabric/data-engineering/manage-workspace-with-vs-code-vfs-mode">Manage Fabric workspaces in VS Code under VFS mode</a></li>
    <li><a href="https://learn.microsoft.com/en-us/rest/api/fabric/articles/mcp-servers/what-is-fabric-mcp-server">What are Fabric MCP servers?</a></li>
    <li><a href="https://learn.microsoft.com/en-us/fabric/fundamentals/direct-lake-overview">Direct Lake overview</a></li>
    <li><a href="https://learn.microsoft.com/en-us/fabric/governance/onelake-catalog-overview">OneLake catalog overview</a></li>
    <li><a href="https://learn.microsoft.com/en-us/power-bi/developer/projects/projects-overview">Power BI Desktop projects (PBIP)</a></li>
    <li><a href="https://learn.microsoft.com/en-us/fabric/onelake/onelake-access-api">Connecting to Microsoft OneLake</a></li>
    <li><a href="https://learn.microsoft.com/en-us/fabric/onelake/onelake-api-parity">OneLake API parity with Azure Storage</a></li>
    <li><a href="https://learn.microsoft.com/en-us/fabric/onelake/onelake-azcopy">Use AzCopy with OneLake</a></li>
</ul>

Congratulations! You have completed this Module. If you understand the concepts here and have completed all of the Activities, you can [proceed to the next Module](03%20-%20Data%20Warehouse%20and%20Data%20Integration.md).
