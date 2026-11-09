![](graphics/microsoftlogo.png)

# Workshop: Microsoft Fabric Overview for the Data Professional

#### <i>A workshop from the Tales from the Field team</i>


### https://aka.ms/fabricdata

<p style="border-bottom: 1px solid lightgrey;"></p>

<img style="float: left; margin: 0px 15px 15px 0px;" src="https://raw.githubusercontent.com/microsoft/sqlworkshops/master/graphics/textbubble.png"> <h2>About this Workshop</h2>

Welcome to this workshop on Microsoft Fabric for the Data Professional. Microsoft Fabric is an end-to-end analytics solution with full-service capabilities including data movement, data lakes, data engineering, data integration, data science, real-time analytics, and business intelligence—all backed by a shared platform providing robust data security, governance, and compliance.

In this workshop, you'll learn what the Microsoft Fabric platform is, the various services and components it contains, how to create, use and manage a deployment, from the point of view of the data professional.

The focus of this workshop is to understand how to use Microsoft Fabric in a solution, focusing on the data aspects of the platform. 

You'll start with an introduction to Microsoft Fabric, then explore the desktop tools used to connect to the platform. Next, you'll learn about Data Warehouse and data integration, the Lakehouse, Mirroring, and Real-Time Intelligence. The main workshop concludes with Copilots and Fabric data agents, followed by SQL database and Cosmos DB in Fabric for operational workloads. An optional bonus module covers designing and sizing solutions, data governance, source control, monitoring, and management.

This GitHub README.md file explains how the workshop is laid out, what you will learn, and the technologies you will use in this solution. To clone or download this workshop to your local computer, click the **Code** button above the repository's file list. [More about cloning a repository is here](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository).

You can find more workshops on SQL Server and other Microsoft data technologies at the [SQL Server Workshops](https://microsoft.github.io/sqlworkshops/) site - open it in a new tab to find out more.

<p style="border-bottom: 1px solid lightgrey;"></p>

<img style="float: left; margin: 0px 15px 15px 0px;" src="https://raw.githubusercontent.com/microsoft/sqlworkshops/master/graphics/checkmark.png"> <h3>Learning Objectives</h3>

In this workshop you'll cover these topics:

- 01 - Introduction and Overview: Understand Fabric concepts, OneLake architecture, compute engines, roles, capacity, AI capabilities, and Workspaces.
- 02 - Desktop Tools to use with Microsoft Fabric: Connect to Fabric using SQL Server Management Studio (SSMS), Visual Studio Code, Power BI Desktop, and Azure Storage Explorer.
- 03 - Data Warehouse and Data Integration: Create and query a Data Warehouse, ingest and transform data with Data Factory pipelines and Dataflow Gen2, and use T-SQL for data engineering.
- 04 - The Lakehouse: Create a Lakehouse, load data and use shortcuts, transform data with Spark and Data Wrangler, and enrich data with AI functions.
- 05 - Mirroring in Microsoft Fabric: Understand when to use Mirroring, configure replication, and monitor and troubleshoot mirrored databases.
- 06 - Real-Time Intelligence: Ingest streaming data with Eventstreams, store and query it in Eventhouses and KQL databases, and explore Real-Time Dashboards, Activator, and Fabric Maps.
- 07 - Copilots & Data Agents: Understand the differences and requirements, use Copilot across Fabric workloads, and configure Fabric data agents to answer natural-language questions about data.
- 08 - OLTP Databases in Fabric: Explore Database Hub, SQL database, and Cosmos DB in Fabric, and understand how operational data connects to analytics in OneLake.
- 09 - Bonus Building Architectures with Microsoft Fabric (optional): Design and size solutions, discover and govern data, integrate source control, and monitor and manage deployments.

The goal of this workshop is to train the data professional to get an overview on how to determine when to implement a Microsoft Fabric solution, how to design the solution, implement it, use it, and manage, monitor and maintain it.

In each *Module*, you will find *Sections* that have topics, concepts and technologies that you will cover throughout the Workshop. You will also find various *Activities* where you will work through hands-on steps to learn the material. You will also see *Self-Guided Activities* that you should complete after an in-person experience, or along the way if you are taking this Workshop directly from this GitHub repository.

<p style="border-bottom: 1px solid lightgrey;"></p>

<img style="float: left; margin: 0px 15px 15px 0px;" src="https://raw.githubusercontent.com/microsoft/sqlworkshops/master/graphics/listcheck.png"> <h2>Technologies used in this Workshop</h2>

The solution includes the following technologies - although you are not limited to these, they form the basis of the workshop. At the end of the workshop you will learn how to extrapolate these components into other solutions. You will cover these at an overview level, with references to much deeper training provided.

 <table style="tr:nth-child(even) {background-color: #f2f2f2;}; text-align: left; display: table; border-collapse: collapse; border-spacing: 2px; border-color: gray;">

  <tr><th style="background-color: #1b20a1; color: white;">Technology</th> <th style="background-color: #1b20a1; color: white;">Description</th></tr>

  <tr><td>OneLake</td><td>The unified logical data lake for sharing data across Fabric workloads.</td></tr>
  <tr><td>Data Factory</td><td>Ingests, orchestrates, and transforms data using pipelines and Dataflow Gen2.</td></tr>
  <tr><td>Data Engineering</td><td>Provides Apache Spark, notebooks, and tools for processing and transforming data.</td></tr>
  <tr><td>Data Science</td><td>Provides tools for exploring data and developing machine learning models; introduced at an overview level in this workshop.</td></tr>
  <tr><td>Lakehouse</td><td>Organizes files and tables in OneLake for Spark processing and SQL analytics, with shortcuts to reuse data.</td></tr>
  <tr><td>Data Warehouse</td><td>Provides SQL-based data warehousing and analytics over data stored in Delta Lake format.</td></tr>
  <tr><td>Mirroring</td><td>Continuously replicates data from supported sources into OneLake for analytics.</td></tr>
  <tr><td>Real-Time Intelligence</td><td>Ingests streaming data with Eventstreams, analyzes it in Eventhouses and KQL databases, and supports dashboards and event-driven actions.</td></tr>
  <tr><td>SQL database in Fabric</td><td>A managed relational database for transactional applications, with data replicated to OneLake for analytics.</td></tr>
  <tr><td>Cosmos DB in Fabric</td><td>A NoSQL database for application data, integrated with OneLake for analytics.</td></tr>
  <tr><td>Copilot in Fabric</td><td>Assists with authoring code, queries, data transformations, and reports across Fabric workloads.</td></tr>
  <tr><td>Fabric data agents</td><td>Answer natural-language questions by generating and executing queries over configured data sources.</td></tr>
  <tr><td>Microsoft Power BI</td><td>Creates semantic models, interactive reports, and dashboards to analyze and share insights.</td></tr>

</table>

<p style="border-bottom: 1px solid lightgrey;"></p>

<img style="float: left; margin: 0px 15px 15px 0px;" src="https://raw.githubusercontent.com/microsoft/sqlworkshops/master/graphics/owl.png"> <h2>Before Taking this Workshop</h2>

You'll need a local system that you are able to install software on. The workshop demonstrations use Microsoft Windows as an operating system and all examples use Windows for the workshop. Optionally, you can use a Microsoft Azure Virtual Machine (VM) to install the software on and work with the solution.

- You must have a Microsoft Azure account with the ability to create assets.
- You will need a laptop to work through the examples, access the workshop materials, and take notes.

This workshop expects that you understand data architectures, working with large data sets, data security, data analysis, and data pipelines.

If you are new to these, here are a few references you can complete prior to class:

-  [Big Data Architectures](https://learn.microsoft.com/en-us/azure/architecture/data-guide/big-data/)
-  [Pipelines](https://learn.microsoft.com/en-us/azure/architecture/data-guide/technology-choices/pipeline-orchestration-data-movement)
-  [Data Security](https://learn.microsoft.com/en-us/azure/architecture/data-guide/scenarios/securing-data-solutions)
-  [Data Analysis](https://learn.microsoft.com/en-us/azure/architecture/solution-ideas/articles/analytics-start-here)

<img style="float: left; margin: 0px 15px 15px 0px;" src="https://raw.githubusercontent.com/microsoft/sqlworkshops/master/graphics/bulletlist.png"> <h3>Setup</h3>

<a href="fabricoverview/00%20-%20Pre-Requisites.md" >A full pre-requisites document is located here</a>. These instructions should be completed before the workshop starts, since you will not have time to cover these in class. <i>Remember to stop and deallocate any workshop Virtual Machines from the Azure Portal when not taking the class so that you do not incur compute charges. Verify that the status is Stopped (Deallocated); shutting down the guest operating system alone is not sufficient. Storage and networking resources may still incur charges. See <a href="https://learn.microsoft.com/en-us/azure/virtual-machines/states-billing">Azure VM states and billing</a> for details.</i>

<img style="float: left; margin: 0px 15px 15px 0px;" src="https://raw.githubusercontent.com/microsoft/sqlworkshops/master/graphics/clipboardcheck.png"> <h3>AI-Assisted Development with MCP Servers</h3>

This repository includes pre-configured [Model Context Protocol (MCP)](https://modelcontextprotocol.io/) servers for use with **VS Code** (GitHub Copilot) and **GitHub Copilot CLI**. These servers give your AI assistant direct access to Fabric APIs, Azure resources, Microsoft Learn documentation, and more.

**Configured MCP Servers:**

| Server | What it does | Auth needed |
|--------|-------------|-------------|
| **GitHub** | Manage PRs, issues, repo operations | GitHub sign-in |
| **Markdown Tools** | Lint, format, and generate TOCs for workshop content | None |
| **Fabric Local** | Fabric API specs, item schemas, best-practice guidance | None |
| **Fabric Core** | Live interaction with Fabric workspaces and items | Microsoft Entra ID |
| **Azure** | Manage Azure subscriptions and resources | `az login` |
| **Microsoft Learn** | Search official docs, fetch articles, find code samples | None |
| **Fetch** | Retrieve any web page or documentation URL | None |

**Quick setup:**

1. Install prerequisites: [Node.js 20 LTS+](https://nodejs.org/), [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli), [GitHub CLI](https://cli.github.com/)
2. Run `az login` and `gh auth login`
3. Open the repo in VS Code or Copilot CLI — servers start automatically
4. If anything isn't working, ask Copilot: *"Run the `/setup-mcp-env` skill to configure my environment"*

<p style="border-bottom: 1px solid lightgrey;"></p>

<img style="float: left; margin: 0px 15px 15px 0px;" src="https://raw.githubusercontent.com/microsoft/sqlworkshops/master/graphics/pinmap.png"> <h2>Related Workshops</h2>

 - [You can find a full Learning Path on Microsoft Fabric from Microsoft Learn at this reference](https://learn.microsoft.com/en-us/training/paths/get-started-fabric/?WT.mc_id=DP-MVP-5004032)

<p style="border-bottom: 1px solid lightgrey;"></p>

<img style="float: left; margin: 0px 15px 15px 0px;" src="https://raw.githubusercontent.com/microsoft/sqlworkshops/master/graphics/bookpencil.png"> <h2>Workshop Modules</h2>

This is a modular workshop, and in each section, you'll learn concepts, technologies and processes to help you complete the solution.

<table style="tr:nth-child(even) {background-color: #f2f2f2;}; text-align: left; display: table; border-collapse: collapse; border-spacing: 5px; border-color: gray;">

  <tr><td style="background-color: AliceBlue; color: black;"><b>Module</b></td><td style="background-color: AliceBlue; color: black;"><b>Topics</b></td></tr>

  <tr><td><a href="fabricoverview/01%20-%20Introduction%20and%20Overview.md" >01 - Introduction and Overview</a></td><td> Fabric concepts, OneLake architecture, compute engines, roles, capacity, AI capabilities, and Workspaces.</td></tr>
  
  <tr><td style="background-color: AliceBlue; color: black;"><a href="fabricoverview/02%20-%20Desktop%20Tools%20to%20use%20with%20Microsoft%20Fabric.md" >02 - Desktop Tools to use with Microsoft Fabric</a> </td><td style="background-color: AliceBlue; color: black;"> SSMS, Visual Studio Code, Power BI Desktop, and Azure Storage Explorer for connecting to and working with Fabric.</td></tr>
  

   <tr><td><a href="fabricoverview/03%20-%20Data%20Warehouse%20and%20Data%20Integration.md" >03 - Data Warehouse and Data Integration</a></td><td> Creating and querying a Data Warehouse, ingesting and transforming data with Data Factory pipelines and Dataflow Gen2, and data engineering with T-SQL.</td></tr>

  <tr><td><a href="fabricoverview/04%20-%20The%20Lakehouse.md" >04 - The Lakehouse</a></td><td> Lakehouse concepts, loading data and shortcuts, Spark transformations, Data Wrangler, and AI functions.</td></tr>

  <tr><td><a href="fabricoverview/05%20-%20Introduction%20to%20Mirroring%20in%20Fabric.md" >05 - Mirroring in Microsoft Fabric</a></td><td> When to use Mirroring, configuring replication, and monitoring and troubleshooting mirrored databases.</td></tr>
   
  <tr><td><a href="fabricoverview/06%20-%20Real-Time%20Intelligence.md" >06 - Real-Time Intelligence</a></td><td> Eventstreams, Eventhouses, KQL databases and queries, Real-Time Dashboards, Activator, and Fabric Maps.</td></tr>
  
  <tr><td style="background-color: AliceBlue; color: black;"><a href="fabricoverview/07%20-%20CoPilots%20%26%20AI%20Skills.md" >07 - Copilots & Data Agents</a> </td><td style="background-color: AliceBlue; color: black;"> Copilot capabilities across Fabric workloads and configuring Fabric data agents to answer natural-language questions about your data.</td></tr>

  <tr><td style="background-color: AliceBlue; color: black;"><a href="fabricoverview/08%20-%20OLTP%20Databases%20in%20Fabric.md" >08 - OLTP Databases in Fabric</a> </td><td style="background-color: AliceBlue; color: black;"> Database Hub, SQL database, Cosmos DB, and connecting operational workloads to analytics in OneLake.</td></tr>

  <tr><td><a href="fabricoverview/09%20-%20Bonus%20Building%20Architectures%20with%20Microsoft%20Fabric.md" >09 - Bonus Building Architectures with Microsoft Fabric (optional)</a></td><td> Designing and sizing solutions, data discovery and governance, source control integration, monitoring, and management.</td></tr>


</table>

<p style="border-bottom: 1px solid lightgrey;"></p>

<p><img style="float: left; margin: 0px 15px 15px 0px;" src="https://raw.githubusercontent.com/microsoft/sqlworkshops/master/graphics/geopin.png"><b>Next Steps</b></p>

Next, Continue to <a href="fabricoverview/00%20-%20Pre-Requisites.md" ><i> Pre-Requisites</i></a>

# Contributing

This project welcomes contributions and suggestions.  Most contributions require you to agree to a
Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us
the rights to use your contribution. For details, visit https://cla.opensource.microsoft.com.

When you submit a pull request, a CLA bot will automatically determine whether you need to provide
a CLA and decorate the PR appropriately (e.g., status check, comment). Simply follow the instructions
provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

# Legal Notices

### License
Microsoft and any contributors grant you a license to the Microsoft documentation and other content in this repository under the [Creative Commons Attribution 4.0 International Public License](https://creativecommons.org/licenses/by/4.0/legalcode), and grant you a license to any code in the repository under [the MIT License](https://opensource.org/licenses/MIT).

Microsoft, Windows, Microsoft Azure and/or other Microsoft products and services referenced in the documentation
may be either trademarks or registered trademarks of Microsoft in the United States and/or other countries.
The licenses for this project do not grant you rights to use any Microsoft names, logos, or trademarks.
Microsoft's general trademark guidelines can be found at http://go.microsoft.com/fwlink/?LinkID=254653.

Privacy information can be found at https://privacy.microsoft.com/en-us/

Microsoft and any contributors reserve all other rights, whether under their respective copyrights, patents,
or trademarks, whether by implication, estoppel or otherwise.
