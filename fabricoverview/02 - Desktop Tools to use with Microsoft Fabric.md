![](../graphics/microsoftlogo.png)

# Workshop: Microsoft Fabric Overview for the Data Professional

#### <i>A Microsoft Workshop </i>

<p style="border-bottom: 1px solid lightgrey;"></p>

<img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/textbubble.png"> <h2>02 - Desktop Tools to use with Microsoft Fabric</h2>

In this workshop you'll cover using The Microsoft Fabric Platform to implement a complete Analytics solution using the Microsoft Fabric platform.

In each module you'll get more references, which you should follow up on to learn more. Also watch for links within the text - click on each one to explore that topic.

(<a href="00%20-%20Pre-Requisites.md" >Make sure you check out the <b>Pre-Requisites</b> page before you start</a>. You'll need all of the items loaded there before you can proceed with the workshop.)

You'll cover these topics in this Module on the Developer Experience:

<dl>

  <dt><a href="#2.1" >2.1 - Using SQL Server Management Studio</a></dt>
  <dt><a href="#2.2" >2.2 - Using Visual Studio Code</a></dt>
  <dt><a href="#2.3" >2.3 - Using Power BI</a></dt>
  <dt><a href="#2.4" >2.4 - Using Azure Storage Explorer</a></dt>

</dl>

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2 id="2.1"><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/pencil2.png">2.1 Using SQL Server Management Studio</h2>


SSMS (SQL Server Management Studio) is a graphical tool that allows you to manage and query data from SQL Server databases. Fabric is a cloud-based data platform that enables you to create and manage data warehouses and lakehouses. A lakehouse is a hybrid of a data warehouse and a data lake, which combines the best features of both. SSMS can connect to Fabric lakehouse SQL endpoints, which are interfaces that allow you to run SQL queries on the data stored in Fabric.

The following paragraphs describe how to use SQL Server Management Studio (SSMS) to connect to a warehouse from the Microsoft Fabric workspace.

First, you need to obtain your connection string, which is a sequence of characters that specifies how to connect to the warehouse. To do this, go to your workspace, select the Warehouse, and click on More options. Then, choose Copy SQL connection string and paste it somewhere convenient.

<img src="https://learn.microsoft.com/en-us/fabric/data-warehouse/media/connectivity/warehouse-copy-sql-connection-string.png" height = 400> 

Next, you need to launch SSMS and enter the connection string in the Connect to Server dialog box. Click on Connect to establish the connection. After that, you can query and manage your warehouse data using SSMS. This is a simple and efficient way to access your warehouse data from the Microsoft Fabric workspace.

<p><img src="https://learn.microsoft.com/en-us/fabric/data-warehouse/media/connectivity/object-explorer-connect-menu.png" height = 400>

In the *Connect to Server* dialog box, paste the SQL connection string from the Fabric user interface into the Server name box. The connection string should look something like this: fabric://<fabric-name>.sql.<region>.azure.com:1433/<database-name>.

Once the Connect to Server window is open, paste the connection string copied from the previous section of this article into the Server name box. Select Connect and proceed with the appropriate credentials for authentication. Remember that only Azure Active Directory - MFA authentication is supported.

<img src="https://learn.microsoft.com/en-us/fabric/data-warehouse/media/connectivity/connect-server-window.png" height = 400> 

Once that  connection is established, Object Explorer displays the connected warehouse from the workspace and its respective tables and views, all of which are ready to be queried.

<img src="https://learn.microsoft.com/en-us/fabric/data-warehouse/media/connectivity/object-explorer-example.png" height = 400> 

When connecting via SSMS (or Azure Data Studio), you see both a SQL Endpoint and Warehouse listed as warehouses, and it's difficult to differentiate between the two item types and their functionality. For this reason, we strongly encourage you to adopt a naming convention that allows you to easily distinguish between the two item types when you work in tools outside of the Microsoft Fabric portal experience.

<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/point1.png"><b>Self-Guided Activity: Connecting to your Fabric Workspace using SSMS.</b></p>

In this Activity you will learn how to get SQL connection string from workspace and connect SSMS. Learn how to query and explore data objects in Microsoft Fabric with SSMS. 

<p><img style="margin: 0px 15px 15px 0px;" src="../graphics/checkmark.png"><b>Steps</b></p>

- [Open this reference and follow the steps you see there](https://learn.microsoft.com/en-us/fabric/data-warehouse/connectivity#get-started-with-sql-server-management-studio-ssms)

You can also right-click this link to open it in another tab and review this video that demonstrates this topic:

<p><a href="https://www.youtube.com/watch?v=iDLTj-tCLdY&t=63s"><img src="https://img.youtube.com/vi/iDLTj-tCLdY/0.jpg" height = 200></a> 


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

<h3>Browse and manage your workspace</h3>

The Microsoft Fabric extension adds a Fabric view to VS Code. After you sign in with your Microsoft Entra ID account, you can:

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
- **Local mode and VFS mode**: In Local mode, you download items to your computer and sync your changes back. In VFS (Virtual File System) mode, you open and edit workspace items directly, without downloading them.

You can also open a notebook from the Fabric portal by selecting **Open in VS Code**. VS Code for the Web (preview) lets you edit and run notebooks in your browser without installing anything.

<img src="https://learn.microsoft.com/en-us/fabric/data-engineering/media/vs-code/list-notebook.png" alt="The Fabric Data Engineering extension in VS Code listing the notebooks in a workspace" height = 400>

<h3>T-SQL with the MSSQL extension</h3>

The SQL Server (mssql) extension connects VS Code to the SQL experiences in Fabric:

- **Browse Fabric**: In the connection dialog, sign in, browse your workspaces, and connect to SQL databases and SQL analytics endpoints without copying a connection string. You can also create a SQL database in Fabric from VS Code.
- **Warehouses**: Connect by using the Warehouse's SQL connection string and Microsoft Entra ID authentication.
- **Open in VS Code**: For a SQL database in the Fabric portal, select **Open in** > **Visual Studio Code** to connect directly.

You'll use SSMS or this extension again in Module 05, to prepare an Azure SQL Database for Mirroring, and in Module 08, to connect to SQL database in Microsoft Fabric. For details, see [MSSQL extension: Fabric integration](https://learn.microsoft.com/en-us/sql/tools/visual-studio-code-extensions/mssql/mssql-fabric-integration?view=sql-server-ver17).

<h3>User data functions</h3>

User data functions let you write reusable Python business logic that runs in Fabric. With the Fabric User data functions extension, you can write functions on your computer, debug them with breakpoints, and publish them to your workspace. To get started, see [Create a User data functions item in VS Code](https://learn.microsoft.com/en-us/fabric/data-engineering/user-data-functions/create-user-data-functions-vs-code).

<h3>GitHub Copilot and the Fabric MCP servers</h3>

The Model Context Protocol (MCP) is an open standard that lets AI assistants call external tools. The Fabric MCP servers give GitHub Copilot Chat in VS Code tools for working with Microsoft Fabric, so you can ask Copilot to do things like list your workspaces or create an item.

- **Fabric Core MCP Server** (remote): Works with workspaces, items, folders, role assignments, OneLake catalog search, and capacities. It uses your Microsoft Entra ID sign-in and your existing Fabric permissions.
- **Local Fabric MCP server**: Runs on your computer through the Microsoft Fabric MCP Server extension or the `@microsoft/fabric-mcp` package. It provides Fabric API specifications, item schemas, and best-practice guidance, and can also work with OneLake files and Fabric items.
- **Workload servers**: Servers for specific workloads, such as Warehouse and Eventhouse, are in preview.

For the full list, see [Choose a Fabric MCP server](https://learn.microsoft.com/en-us/rest/api/fabric/articles/mcp-servers/fabric-mcp-servers-list).

This workshop repository is already set up for these servers. When you open the repository in VS Code, the `.vscode/mcp.json` file registers the Fabric Core and local Fabric MCP servers. For setup steps, see the **AI-Assisted Development with MCP Servers** section of the [workshop README](../README.md).

Keep these points in mind:

- GitHub Copilot is a separate product from Copilot in Microsoft Fabric, which you'll explore in Module 07. You need a GitHub Copilot plan to use it.
- Review each tool call before you approve it. Microsoft warns that autonomous or misconfigured clients may perform destructive actions. For guidance, see the [Fabric Core MCP Server overview](https://learn.microsoft.com/en-us/rest/api/fabric/articles/mcp-servers/core-remote/overview-core-mcp-server).

<h3>Considerations</h3>

- Sign in with your Microsoft Entra ID account. SQL authentication isn't supported for Fabric SQL endpoints.
- SQL connections use the TDS protocol over TCP port 1433, which some networks block.
- To create items, you need the Contributor role or higher in the workspace.
- Some experiences are in preview, including VS Code for the Web notebooks, Warehouse projects, and some MCP servers.

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

<p><a href="https://www.youtube.com/watch?v=0tODoHLXhMc&ab"><img src="https://img.youtube.com/vi/0tODoHLXhMc/0.jpg" height = 200></a> 

<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/point1.png"><b>Self-Guided Activity: Use GitHub Copilot with the Fabric MCP servers</b></p>

In this Activity you will connect GitHub Copilot in VS Code to the Fabric Core MCP Server and ask Copilot about your Fabric workspaces. You need access to GitHub Copilot to complete this Activity.

<p><img style="margin: 0px 15px 15px 0px;" src="../graphics/checkmark.png"><b>Steps</b></p>

- [Open this reference and follow the steps you see there](https://learn.microsoft.com/en-us/rest/api/fabric/articles/mcp-servers/core-remote/get-started-core)
- Or open this workshop repository in VS Code, where the Fabric MCP servers are already configured, and ask Copilot Chat: *List all my Fabric workspaces*

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2 id="2.3"><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/pencil2.png">2.3 Using Power BI</h2>

Microsoft Fabric lets you create reusable and default Power BI datasets to create reports in various ways in Power BI. This article describes the various ways you can use your Warehouse or SQL Endpoint, and their default Power BI datasets, to create reports.

For example, you can establish a live connection to a shared dataset in the Power BI service and create many different reports from the same dataset. You can create a data model in Power BI Desktop and publish to the Power BI service. Then, you and others can create multiple reports in separate .pbix files from that common data model and save them to different workspaces.

Advanced users can build reports from a warehouse using a composite model or using the SQL connection string.

Power BI natively and fully supports a Warehouse or Lakehouse SQL Endpoint as a data source, eliminating the need for the SQL Connection string. The Data Hub provides direct access to all of the warehouses that you have permissions for.

<img src="https://learn.microsoft.com/en-us/power-bi/fundamentals/media/fabric-get-started/configure-connection.png" height = 400> 

<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/point1.png"><b>Self-Guided Activity: Create reports using Power BI Desktop.</b></p>

You can build reports from datasets with Power BI Desktop using a Live connection to the default dataset. For information on how to make the connection, see connect to datasets from Power BI Desktop.

<p><img style="margin: 0px 15px 15px 0px;" src="../graphics/checkmark.png"><b>Steps</b></p>

- [Open this reference and follow the steps you see there](https://learn.microsoft.com/en-us/fabric/data-warehouse/create-reports#create-reports-using-power-bi-desktop) 

You can also right-click this link to open it in another tab and review this video that demonstrates this topic:

<p><a href="https://www.youtube.com/watch?v=iDLTj-tCLdY&t=329s"><img src="https://img.youtube.com/vi/iDLTj-tCLdY/0.jpg" height = 200></a> 

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2 id="2.4"><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/pencil2.png">2.4 Using Azure Storage Explorer</h2>

Microsoft Azure Storage Explorer is another tool that you can use to navigate and manage OneLake. It is a standalone app that makes it easy to work with Azure Storage accounts and their data, through desktop clients that run on Windows, macOS, and Linux.

Once Azure Storage Explorer is connected to your OneLake, this is another client tool that allows you to view, upload, and download files from your OneLake, but also to move files between your OneLake and another Azure Storage location or type like Blob, Azure Data Lake, or even Azure File Shares.

<img src="https://learn.microsoft.com/en-us/azure/storage/storage-explorer/media/vs-azure-tools-storage-manage-with-storage-explorer/vs-storage-explorer-overview.png" height = 400>

<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/point1.png"><b>Self-Guided Activity: Connecting Microsoft Azure Storage Explorer to OneLake</b></p>

Azure Storage Explorer allows you to view and manage your cloud storage account’s contents. You can upload, download, or move files from one location to another. This article demonstrates OneLake integration with Azure Storage Explorer. 

<p><img style="margin: 0px 15px 15px 0px;" src="../graphics/checkmark.png"><b>Steps</b></p>

- [Open this reference and follow the steps you see there](https://learn.microsoft.com/en-us/fabric/onelake/onelake-azure-storage-explorer) 

You can also right-click this link to open it in another tab and review this video that demonstrates this topic:

<p><a href="https://www.youtube.com/watch?v=xingcILHkc0"><img src="https://img.youtube.com/vi/xingcILHkc0/0.jpg" height = 200></a> 

<p style="border-bottom: 1px solid lightgrey;"></p>

<p><img style="margin: 0px 15px 15px 0px;" src="../graphics/owl.png"><b>For Further Study</b></p>

<ul>
    <li><a href="https://roadmap.fabric.microsoft.com/">Microsoft Fabric Roadmap</a></li>
    <li><a href="https://learn.microsoft.com/en-us/fabric/data-engineering/set-up-fabric-vs-code-extension">Microsoft Fabric extensions for Visual Studio Code</a></li>
    <li><a href="https://learn.microsoft.com/en-us/fabric/data-engineering/setup-vs-code-extension">Get started with the Fabric Data Engineering VS Code extension</a></li>
    <li><a href="https://learn.microsoft.com/en-us/fabric/data-engineering/author-notebook-with-vs-code" >Microsoft Fabric notebook experience in VS Code</a></li>
    <li><a href="https://learn.microsoft.com/en-us/fabric/data-engineering/author-notebook-resource-with-vs-code" >Microsoft Fabric notebook resource in VS Code</a></li>
    <li><a href="https://learn.microsoft.com/en-us/fabric/data-engineering/author-sjd-with-vs-code" >Spark job definition experience in VS Code</a></li>
    <li><a href="https://learn.microsoft.com/en-us/fabric/data-engineering/explore-lakehouse-with-vs-code" >Explore Microsoft Fabric lakehouses in VS Code</a></li>
    <li><a href="https://learn.microsoft.com/en-us/fabric/data-engineering/manage-workspace-with-vs-code-vfs-mode">Manage Fabric workspaces in VS Code under VFS mode</a></li>
    <li><a href="https://learn.microsoft.com/en-us/fabric/data-engineering/user-data-functions/create-user-data-functions-vs-code">Create a User data functions item in VS Code</a></li>
    <li><a href="https://learn.microsoft.com/en-us/sql/tools/visual-studio-code-extensions/mssql/mssql-fabric-integration?view=sql-server-ver17">MSSQL extension: Fabric integration</a></li>
    <li><a href="https://learn.microsoft.com/en-us/rest/api/fabric/articles/mcp-servers/what-is-fabric-mcp-server">What are Fabric MCP servers?</a></li>
    <li><a href="https://learn.microsoft.com/en-us/rest/api/fabric/articles/mcp-servers/core-remote/get-started-core">Get started with Fabric Core MCP Server</a></li>
   <li><a href="https://www.youtube.com/watch?v=0tODoHLXhMc&ab" > Microsoft Fabric, VS Code, Notebooks, & Spark! Set it up, connect to a Workspace, EDIT, & Upload</a></li>
</ul>

Congratulations! You have completed this Module. If you understand the concepts here and have completed all of the Activities, you can [proceed to the next Module](03%20-%20Data%20Warehouse%20and%20Data%20Integration.md).
