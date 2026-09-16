![](../graphics/microsoftlogo.png)

# Workshop: Microsoft Fabric Overview for the Data Professional

#### <i>A Microsoft Workshop</i>

<p style="border-bottom: 1px solid lightgrey;"></p>

<img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/textbubble.png"> <h2>01 - Introduction and Overview</h2>

In this workshop you'll cover using The Microsoft Fabric Platform to implement a complete Analytics solution using the Microsoft Fabric platform.

In each module you'll get more references, which you should follow up on to learn more. Also watch for links within the text - click on each one to explore that topic.

(<a href="00%20-%20Pre-Requisites.md" >Make sure you check out the <b>Pre-Requisites</b> page before you start</a>. You'll need all of the items mentioned there to be completed before you can proceed with the workshop.)

You'll cover these topics in this Module:
<dl>
  <dt><a href="#1.1" >1.1 - Introduction of the Workshop</a><dt>
  <dt><a href="#1.2" >1.2 - Basic Concepts in Microsoft Fabric</a><dt>
  <dt><a href="#1.3" >1.3 - OneLake & Microsoft Fabric Architecture</a><dt>
  <dt><a href="#1.4" >1.4 - Microsoft Compute Engines</a><dt>
  <dt><a href="#1.5" >1.5 - Microsoft Fabric Roles</a><dt>
  <dt><a href="#1.6" >1.6 - Understanding Microsoft Fabric Benchmarks</a><dt>
  <dt><a href="#1.7" >1.7 - Verification of pre-requisites for the Activities</a><dt>
</dl>

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2 id="1-1">../graphics/pencil2.png1.1 Introduction of the Workshop</h2>

Data is a valuable asset for organizations that want to make better business decisions. Microsoft Fabric is a unified Software-as-a-Service (SaaS) data platform that enables data collection, storage, processing, analysis, and visualization within a single environment. It provides a secure, flexible, and integrated solution for building modern analytics workloads.

Microsoft Fabric brings together multiple analytics experiences on a common platform, allowing organizations to work with data throughout its lifecycle—from ingestion and storage, to transformation, analytics, reporting, and AI-assisted insights. Rather than requiring separate platforms for different data tasks, Fabric provides a shared foundation that enables teams to collaborate using the tools and experiences best suited to their roles.

Because Microsoft Fabric is delivered as a cloud service, organizations can focus on building data solutions instead of managing infrastructure. Fabric provides integrated security, governance, and administration capabilities while supporting a broad range of analytics workloads including data engineering, data warehousing, data integration, real-time intelligence, business intelligence, and AI-assisted analytics.

At the foundation of Microsoft Fabric is OneLake, a unified logical data lake designed to support all Fabric workloads. OneLake serves as the storage layer behind the Fabric platform, providing a common data foundation that can be accessed by multiple analytics engines and experiences.

OneLake also supports shortcuts, allowing organizations to reference data located in other Fabric workspaces, Azure Storage accounts, and other supported data sources without requiring unnecessary data duplication. This enables teams to work from a common source of data while simplifying governance and data management.

Microsoft Fabric is designed to help organizations transform large volumes of data into actionable insights. By combining storage, compute, analytics, governance, and AI capabilities into a single platform, Fabric helps data professionals design, build, operate, and scale modern analytics solutions.

In this Workshop, you will learn:
- The <b>basic</b> concepts, services, roles, and benchmarks of Microsoft Fabric
- <b>How to create and manage</b> workspaces, data warehouses, and data integration pipelines and data flows
- <b>How to Secure and govern</b> your data with distributed ownership and collaboration
- <b>How the different analytical engines</b> can be used to run T-SQL, Python, or KQL queries in order to load, transform, query, and visualize your data
- <b>How to use various developer tools</b>, such as Co-Pilot, SSMS, VS Code, and command-line tools, to develop and test your data applications
- <b>How</b> Microsoft Fabric integrates with DevOps

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2 id="1.2"><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/pencil2.png">1.2 Basic Concepts in Microsoft Fabric</h2>

*Actionable intelligence requires data integration from diverse sources and environments. This involves various data professionals across the organization using different data sources, tools, and processes. Microsoft Fabric is an end-to-end analytics platform which unifies data movement, data engineering, data science, real-time analytics, data warehousing, databases, and business intelligence in a single Software-as-a-Service (SaaS) experience built on OneLake.

Microsoft Fabric enables organizations and individuals to turn large and complex data repositories into actionable workloads and analytics, and is an implementation of a *[data mesh](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/scenarios/cloud-scale-analytics/architectures/what-is-data-mesh)* architecture. It provides various systems with associated tools and aspects to the data professionals in their day-to-day work:

- **Power BI**  
  Power BI in Fabric enables organizations to create semantic models, reports, dashboards, and Direct Lake solutions that can query OneLake data with minimal latency and reduced data movement. Power BI lets you easily connect to your data sources, visualize, and discover what's important, and share that with anyone or everyone you want. This integrated experience allows business owners to access all data in Fabric quickly and intuitively and to make better decisions with data.  
  _For more information, see_ https://learn.microsoft.com/en-us/power-bi/fundamentals/power-bi-overview

- **Databases**  
  SQL database in Microsoft Fabric is a developer-friendly transactional database built on the same SQL Database Engine used by Azure SQL Database. It supports operational workloads while automatically replicating data into OneLake in an analytics-ready format, allowing the data to be used across Fabric workloads. You can continuously replicate your existing data estate directly into Fabric's OneLake, including data from Azure SQL Database, Azure Cosmos DB, Azure Databricks, Snowflake, and Fabric SQL database.  
  _For more information, see_ https://learn.microsoft.com/en-us/fabric/data-engineering/sql-database-overview _and_ https://learn.microsoft.com/en-us/fabric/data-engineering/mirroring-overview

- **Data Factory**  
  Data Factory provides data integration, orchestration, transformation, dataflows, copy activities, and data pipelines for moving and preparing data from cloud and on-premises sources. Data Factory incorporates the simplicity of Power Query, where native connectors allow users to connect to data sources on-premises and in the cloud. 
  _For more information, see_ [What is Data Factory in Microsoft Fabric?] https://learn.microsoft.com/en-us/fabric/data-factory/data-factory-overview
  
  **Industry Solutions**  
  Fabric provides industry-specific data solutions that address unique industry needs and challenges, and include data management, analytics, and decision-making.  
  _For more information, see_ [Industry Solutions in Microsoft Fabric] https://learn.microsoft.com/en-us/industry/industry-data-solutions-fabric

- **Real-Time Intelligence**  
  Real-time Intelligence is an end-to-end solution for event-driven scenarios, streaming data, and data logs. It enables the extraction of insights, visualization, and action on data in motion by handling data ingestion, transformation, storage, modeling, analytics, visualization, tracking, AI, and real-time actions. Core components include Eventstreams, Eventhouses, Real-Time Dashboards, and the Real-Time Hub. The Real-Time hub in Real-Time Intelligence provides a wide variety of no-code connectors, converging into a catalog of organizational data that is protected, governed, and integrated across Fabric.  
  _For more information, see_ https://learn.microsoft.com/en-us/fabric/real-time-intelligence/overview

- **Data Engineering**  
  Fabric Data Engineering provides a Spark platform with great authoring experiences. It enables you to create, manage, and optimize infrastructures for collecting, storing, processing, and analyzing vast data volumes. Data Engineering uses Apache Spark and Lakehouses to build scalable data pipelines and supports notebooks, Spark jobs, and Delta Lake-based architectures.
  _For more information, see_ [What is Data engineering in Microsoft Fabric?]https://learn.microsoft.com/en-us/fabric/data-engineering/data-engineering
  
  **Data Science** 
  Data Science enables Data Scientists to build, deploy, and operationalize machine learning models from Fabric. It integrates with Azure Machine Learning to provide built-in experiment tracking and model registry. Data scientists can enrich organizational data with predictions and business analysts can integrate those predictions into their BI reports, allowing a shift from descriptive to predictive insights.  
  _For more information, see_ https://learn.microsoft.com/en-us/fabric/data-science/data-science-overview

- **Fabric Data Warehouse**  
  Fabric Data Warehouse is a fully managed SQL analytics engine optimized for enterprise-scale reporting and analytics. Warehouse data is stored in OneLake using open Delta format, enabling interoperability with other Fabric workloads while providing a familiar T-SQL experience.  
  _For more information, see_ https://learn.microsoft.com/en-us/fabric/data-warehouse/data-warehouse-overview
 
- **Lakehouse**
  A Lakehouse combines the flexibility of a data lake with the performance and management capabilities of a data warehouse. Lakehouses store data in OneLake using Delta tables and provide both file-based and SQL-based access to data.
  _For more information, see_ https://learn.microsoft.com/en-us/fabric/data-engineering/lakehouse-overview

- **OneLake** - [*OneLake*](https://learn.microsoft.com/en-us/fabric/onelake/onelake-overview) 
  OneLake is the unified logical data lake for Microsoft Fabric. Every Fabric tenant includes a single OneLake instance that serves as the foundation for analytics and AI workloads. OneLake supports shortcuts, centralized governance, distributed ownership through domains and workspaces, and open data formats such as Delta Parquet and Iceberg.

- **OneLake Catalog**
  The OneLake Catalog provides a centralized experience for discovering, understanding, and governing data assets across the organization. 
  _For more information, see_ https://learn.microsoft.com/en-us/fabric/governance/onelake-catalog-overview

<p><img src="https://learn.microsoft.com/en-us/fabric/fundamentals/media/microsoft-fabric-overview/fabric-architecture.png#lightbox" height = 400>

<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/point1.png"><b>Activity: Review Exercise for this Workshop</b></p>

In this exercise, you will review the exercise we will use throughout the Workshop. You will read over these steps only, in a future activity you will complete each step. 

<p><img style="margin: 0px 15px 15px 0px;" src="../graphics/checkmark.png"><b>Steps</b></p>

- [Open the following reference in another tab](https://learn.microsoft.com/en-us/fabric/data-warehouse/tutorial-introduction), and read over the steps you see there. This is an example of the different tutorials that you will experience in this class. 

You can also right-click this link to open it in another tab and review this video that introduces you to Microsoft Fabric and shows the results of the tutorial you will use in the Workshop:

<p><a href="https://www.youtube.com/watch?v=TSTeoeCNh7c"><img src="https://img.youtube.com/vi/TSTeoeCNh7c/0.jpg" height = 200></a> 

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2 id="1.3"><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/pencil2.png">1.3 OneLake & Microsoft Fabric Architecture</h2>

OneLake is the unified, logical data lake that serves as the foundation of Microsoft Fabric. Every Microsoft Fabric tenant includes a single OneLake instance, providing a centralized location for storing, managing, and accessing data across analytics and AI workloads. 

<p><img src="https://learn.microsoft.com/en-us/fabric/fundamentals/media/microsoft-fabric-overview/hierarchy-within-tenant.png" height = 400>

Unlike traditional architectures that require separate storage platforms for data engineering, warehousing, reporting, and data science, Microsoft Fabric uses a shared architecture in which all workloads operate on a common storage foundation. This approach reduces data duplication, simplifies governance, and allows multiple personas to collaborate using the same underlying data.

Microsoft Fabric experiences such as Data Engineering, Data Factory, Data Science, Data Warehouse, Databases, Real-Time Intelligence, and Power BI all use OneLake as their underlying storage platform.
<p>

#### Core OneLake Architecture Principles
##### One Data Lake for the Entire Organization
OneLake is automatically provisioned with every Microsoft Fabric tenant and is designed to serve as the single data lake for an organization. There is no infrastructure to deploy, configure, or manage. Data can be organized through domains, workspaces, and data items while remaining part of a unified data estate.
 
##### One Copy of Data
OneLake enables multiple analytics engines and workloads to access the same data without creating redundant copies. Data engineers can use Spark, analysts can use SQL or Power BI, and real-time analysts can use KQL while all working from a shared data foundation.

This "one copy of data" approach reduces storage costs, improves consistency, and helps ensure that all users are working from trusted data sources.

##### Open Data Formats
OneLake stores and exposes data using open industry standards, including Delta Parquet and Iceberg formats. These formats allow organizations to work with their data using Microsoft Fabric and other compatible analytics tools while avoiding vendor lock-in.
 
##### Data Virtualization with Shortcuts and Mirroring
OneLake provides several mechanisms for accessing data without unnecessary movement or duplication:
- **Shortcuts** allow users to reference data stored in other Fabric workspaces, Azure Data Lake Storage Gen2, Amazon S3, and other supported sources while maintaining a single copy of the data.
- **Mirroring** continuously replicates data from supported operational systems into OneLake, making it available for analytics with minimal latency.
  
These capabilities simplify data integration and help organizations build analytics solutions without complex ETL processes.
 
##### Distributed Ownership and Governance
OneLake supports distributed ownership through domains and workspaces. Business units can maintain ownership of their data while still participating in a governed enterprise-wide data ecosystem.

This architecture aligns with modern data mesh principles by combining centralized governance with decentralized data ownership.

##### OneLake Catalog
The OneLake Catalog provides a centralized experience for discovering, understanding, and governing data assets across the organization. Users can search for data, identify ownership, understand lineage, and locate trusted analytics assets more efficiently.
 
#### OneLake and Fabric Storage Experiences
Many Microsoft Fabric items store their data within OneLake, including:

- Lakehouses
- Warehouses
- SQL Databases
- Eventhouses
- KQL Databases
- Semantic Models

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2 id="1.4"><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/pencil2.png">1.4 - Microsoft Fabric Compute Engines</h2>

Microsoft Fabric provides multiple compute engines that are optimized for different analytical workloads while sharing a common storage foundation in OneLake.

This architecture allows data professionals to use the tools and languages most appropriate for their tasks without moving or duplicating data. A data engineer might use Spark to transform data, a database developer might use T-SQL to query a warehouse, and a business analyst might use Power BI to create reports, all against the same underlying data stored in OneLake.

#### Common Fabric Architecture
Microsoft Fabric separates storage and compute responsibilities:
- **OneLake** provides the unified storage layer.
- **Compute engines** provide workload-specific processing capabilities.
- **Fabric Capacity** supplies the compute resources used by all workloads.

This approach allows multiple workloads to access the same data using different technologies and programming models.

#### Spark Engine
The Spark engine powers Data Engineering and many Data Science workloads.

Apache Spark in Microsoft Fabric enables:
- Large-scale data transformation
- Data preparation and cleansing
- Notebook execution
- Machine learning workflows
- Distributed processing of large datasets

Spark workloads typically operate against Lakehouse data stored in OneLake.

#### SQL Engine
The SQL engine powers Warehouses, SQL Databases, SQL Analytics Endpoints, and many reporting workloads.

The SQL experience supports:
- T-SQL queries
- Views
- Stored procedures
- Analytical workloads
- Relational data modeling

Users familiar with SQL Server, Azure SQL Database, or Azure Synapse Analytics can use many of the same SQL skills within Microsoft Fabric.

#### KQL Engine
The Kusto Query Language (KQL) engine powers Real-Time Intelligence workloads.

KQL is designed for:
- Streaming analytics
- Log analysis
- Telemetry data
- Time-series analysis
- Operational monitoring

This engine is optimized for high-volume, near real-time data scenarios.

#### Power BI Engine
The Power BI engine provides semantic modeling, reporting, dashboarding, and business intelligence capabilities.

Power BI enables:
- Semantic models
- Interactive reports
- Dashboards
- Self-service analytics
- Direct Lake access to OneLake data

Business users can consume insights without requiring direct access to the underlying data platforms.

#### AI and Machine Learning Capabilities
Microsoft Fabric includes built-in AI capabilities that assist with data preparation, code generation, analytics, and machine learning workflows. These capabilities are integrated across multiple Fabric experiences and help accelerate solution development.

#### Unified Capacity Model
All Fabric workloads consume resources from a Fabric Capacity.

Rather than managing separate compute environments for data integration, warehousing, reporting, and analytics, organizations allocate capacity that can be shared across Fabric workloads. This unified model simplifies administration and helps organizations scale resources according to business needs.


<p style="border-bottom: 1px solid lightgrey;"></p>

<h2 id="1.5"><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/pencil2.png">1.5 - Microsoft Fabric Roles</h2>
Microsoft Fabric uses a layered security and governance model that enables organizations to manage access at the tenant, capacity, workspace, and item levels.

This approach allows organizations to balance centralized governance with distributed ownership, ensuring that users have the appropriate level of access to perform their responsibilities while protecting organizational data assets.

#### Administrative Roles
Administrative roles manage Fabric settings, governance, licensing, and capacity resources across the organization.

The most common administrative roles include:
- **Fabric Administrator** – Manages tenant-wide Fabric settings, governance policies, usage monitoring, and feature enablement.
- **Power Platform Administrator** – Has many of the same Fabric administrative capabilities and can manage tenant-level settings.
- **Capacity Administrator** – Manages Fabric capacities, assigns workspaces to capacities, and monitors capacity utilization and performance.

Administrative roles are typically assigned through Microsoft 365 or Power Platform administration tools and are generally limited to platform administrators.

For more information, see:
- https://learn.microsoft.com/en-us/fabric/admin/roles
- https://learn.microsoft.com/en-us/fabric/admin/microsoft-fabric-admin

#### Workspace Roles
Workspaces are the primary collaboration boundary within Microsoft Fabric. Workspace roles determine what actions users can perform within a workspace and on the items it contains.

##### Admin
Workspace Admins have full control over the workspace.

They can:
- Manage workspace settings
- Assign workspace roles
- Create, modify, and delete items
- Manage access permissions
- Configure sharing and governance settings

##### Member
Members can create, edit, publish, and share content within the workspace.

They are typically solution owners, lead developers, or team members responsible for building and maintaining Fabric solutions.

##### Contributor
Contributors can create and modify items but have more limited management permissions than Members.

This role is commonly assigned to developers, data engineers, and analysts who need to build content but do not need to manage workspace access.

##### Viewer
Viewers have read-only access to workspace content.

This role is commonly assigned to consumers who need to view reports, dashboards, notebooks, or other shared assets without modifying them.

#### Item-Level Permissions
In addition to workspace roles, Microsoft Fabric supports item-level permissions that allow access to specific assets.

Examples include:
- Warehouses
- SQL Databases
- Lakehouses
- Semantic Models
- Reports and Dashboards

Item-level permissions provide greater flexibility by allowing users to access specific resources without receiving broader workspace permissions.

#### Governance and Data Ownership
Microsoft Fabric supports distributed ownership through domains, workspaces, and data products. This model allows business units and project teams to own and manage their data while operating within organizational governance policies.

Combined with OneLake, workspace roles and item-level permissions help organizations implement secure, scalable, and collaborative analytics solutions.

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2 id="1.6"><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/pencil2.png">1.6 - Understanding Microsoft Fabric Capacity</h2>

Microsoft Fabric uses a capacity-based consumption model to provide compute resources across all workloads. Rather than provisioning separate servers or clusters for individual services, organizations purchase or assign Fabric Capacity that can be shared by Data Engineering, Data Factory, Data Science, Data Warehouse, Real-Time Intelligence, Power BI, and other Fabric experiences.

Understanding capacity is essential because every Fabric workload consumes Capacity Units (CUs) when processing data, running queries, refreshing reports, executing notebooks, or performing other computational tasks.

#### What Is a Fabric Capacity?
A Fabric Capacity is a dedicated pool of compute resources available to Microsoft Fabric workloads.

Capacities provide:
- Compute resources for workload execution
- Performance isolation
- Centralized administration
- Flexible scaling
- Unified billing across Fabric workloads

Workspaces can be assigned to a Fabric Capacity, allowing the users and workloads within those workspaces to consume capacity resources as needed.

#### Capacity Units (CUs)
Microsoft Fabric measures compute consumption using Capacity Units (CUs).

A Capacity Unit represents a standardized measure of compute resources that can be used by different Fabric workloads. Because all workloads consume the same capacity pool, organizations can monitor and manage utilization consistently across the platform.

Example Fabric SKUs include:

| SKU | Capacity Units |
|------|------|
| F2 | 2 |
| F4 | 4 |
| F8 | 8 |
| F16 | 16 |
| F32 | 32 |
| F64 | 64 |
| F128 | 128 |
| F256 | 256 |
| F512 | 512 |
| F1024 | 1024 |
| F2048 | 2048 |

> Note: Microsoft periodically updates capacity offerings and pricing. Always consult current Microsoft documentation for the latest SKU information.

#### Understanding Capacity Consumption
Different Fabric workloads consume Capacity Units in different ways.

Examples include:
- Running Spark notebooks
- Executing SQL queries
- Refreshing semantic models
- Loading data through Data Factory
- Processing Real-Time Intelligence workloads
- Executing machine learning workloads

The amount of capacity consumed depends on workload complexity, concurrency, and execution duration.

#### Bursting
Fabric supports bursting, which allows workloads to temporarily consume more compute resources than the baseline capacity allocation.

Bursting helps workloads complete more quickly without requiring administrators to permanently provision additional capacity.

For example, a workload that normally runs using a smaller amount of compute may temporarily consume additional resources during a period of high demand.

Bursting is managed automatically by Microsoft Fabric and requires no manual configuration.

#### Smoothing
Capacity usage is evaluated using smoothing algorithms that help distribute capacity utilization over time.

Smoothing helps:
- Reduce the impact of short-term workload spikes
- Improve workload stability
- Simplify capacity planning
- Minimize unnecessary throttling

Administrators can therefore focus on average utilization patterns rather than sizing capacities solely for peak usage periods.

#### Throttling and Capacity Protection
When demand consistently exceeds available capacity resources, Fabric may apply throttling policies to protect overall platform performance.

The purpose of throttling is to:

- Prevent resource exhaustion
- Maintain system stability
- Prioritize interactive workloads
- Ensure fair resource allocation

Administrators should monitor capacity consumption regularly to identify workloads that may require optimization or additional capacity resources.

#### Monitoring Capacity Usage
Microsoft Fabric provides Capacity Metrics and monitoring tools that help administrators understand how capacity resources are being consumed.

These tools can help answer questions such as:
- Which workspaces consume the most capacity?
- Which workloads are generating the highest utilization?
- Are users experiencing throttling?
- How much storage is being consumed?
- When should a capacity be scaled?

Monitoring capacity utilization is an important part of operating production Fabric environments.

#### Power BI and Fabric Capacity
Microsoft Fabric and Power BI share a common capacity model.

This unified approach allows organizations to manage analytics workloads, reporting workloads, and data workloads using a consistent capacity framework. Capacity Units provide a common measurement across both Fabric and Power BI experiences.


<p style="border-bottom: 1px solid lightgrey;"></p>

<h2 id="1.7"><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/pencil2.png">1.7 Understanding and creating Workspaces</h2>

Workspaces are the primary collaboration containers in Microsoft Fabric. A workspace provides a secure location where individuals and teams can create, manage, and share Fabric items such as Lakehouses, Warehouses, SQL Databases, Data Pipelines, Notebooks, Reports, and Semantic Models.

Most development work performed in Fabric occurs within a workspace. Permissions assigned through workspace roles determine who can create, modify, share, and administer content.

#### Workspaces in the Fabric Architecture
Microsoft Fabric organizes resources using several layers:

- **Tenant** – Represents the organization's Microsoft Fabric environment.
- **Capacity** – Provides the compute resources used by Fabric workloads.
- **Workspace** – Provides a collaborative container for Fabric items and projects.
- **Items** – Individual Fabric assets such as Lakehouses, Warehouses, Reports, Notebooks, Data Pipelines, and SQL Databases.

A workspace belongs to a tenant and is assigned to a capacity. The items within that workspace consume the capacity resources assigned to it.

#### Personal and Shared Workspaces
Every Fabric user has access to a personal workspace called **My Workspace**. This workspace is intended primarily for individual experimentation and personal content.

Organizations typically create shared workspaces for:
- Development environments
- Test environments
- Production environments
- Departmental analytics projects
- Data engineering solutions
- Business intelligence initiatives

Shared workspaces provide better collaboration, governance, and lifecycle management than personal workspaces.

#### Workspace Roles
Workspace access is controlled using workspace roles:

- **Admin** – Full control over the workspace and its permissions.
- **Member** – Can create, modify, publish, and share content.
- **Contributor** – Can create and edit content but cannot manage workspace access.
- **Viewer** – Read-only access to workspace content.

Selecting the appropriate role helps organizations balance collaboration and security.

#### Common Workspace Items
A Fabric workspace can contain many different item types, including:

- Lakehouses
- Warehouses
- SQL Databases
- Data Pipelines
- Dataflows
- Notebooks
- Semantic Models
- Reports
- Dashboards
- Eventhouses
- Real-Time Dashboards

These items can work together to create complete end-to-end analytics solutions.

### Activity: Verify Your Microsoft Fabric Workspace
Before continuing with the workshop, verify that you have access to a Fabric-enabled workspace.

#### Validate an Existing Workspace
1. Navigate to https://app.fabric.microsoft.com
2. Select **Workspaces** from the left navigation menu.
3. Open your assigned workshop workspace.
4. Select **+ New item**.
5. Verify that Fabric item types such as Lakehouse, Warehouse, Notebook, and Data Pipeline are available.

If these options appear, your workspace is Fabric-enabled and ready for the workshop activities.

#### Create a New Workspace (If Required)
If you have the necessary permissions and do not already have a workspace:

1. Navigate to https://app.fabric.microsoft.com
2. Select **Workspaces**.
3. Select **New Workspace**.
4. Provide a workspace name and description.
5. Assign the workspace to an appropriate Fabric Capacity if required.
6. Create the workspace.
7. Verify that Fabric item types are available through **+ New item**.

For detailed instructions, review:

- https://learn.microsoft.com/en-us/fabric/fundamentals/workspaces
- https://learn.microsoft.com/en-us/fabric/data-warehouse/tutorial-create-workspace


<br>

<p><img style="margin: 0px 15px 15px 0px;" src="../graphics/owl.png"><b>For Further Study</b></p>

<ul>
<li><a href="https://learn.microsoft.com/en-us/fabric/onelake/security/get-started-security">OneLake security overview</a></li>
 <li><a href="https://learn.microsoft.com/en-us/fabric/release-plan/">Microsoft Fabric release plan documentation</a></li>
    <li><a href="https://learn.microsoft.com/en-us/fabric/onelake/onelake-overview">OneLake, the OneDrive for data</a></li>
    <li><a href="https://learn.microsoft.com/en-us/fabric/get-started/microsoft-fabric-overview " >The primary page for documentation on Microsoft Fabric is here</a></li>
    <li><a href="https://learn.microsoft.com/en-us/training/paths/get-started-fabric/?WT.mc_id=DP-MVP-5004032">Microsoft Learn Pathway on Fabric</a></li>
    <li><a href="https://learn.microsoft.com/en-us/fabric/enterprise/metrics-app-install">Installing the Fabric Metrics app</a></li>
  <li><a href="https://erwindekreuk.com/microsoft-fabric-content-hub/">Microsoft Fabric Content Hub from Erwin de Kreuk</a></li>
</ul>

Congratulations! You have completed this Module. If you understand the concepts here and have completed all of the Activities, you can [proceed to the next Module](02%20-%20Desktop%20Tools%20to%20use%20with%20Microsoft%20Fabric.md).
