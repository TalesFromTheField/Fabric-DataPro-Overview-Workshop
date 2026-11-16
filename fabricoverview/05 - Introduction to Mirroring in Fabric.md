![](../graphics/microsoftlogo.png)

# Workshop: Microsoft Fabric Overview for the Data Professional

#### <i>A workshop from the Tales from the Field team</i>

<p style="border-bottom: 1px solid lightgrey;"></p>

<img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/textbubble.png"> <h2>05 - Mirroring in Fabric</h2>

In this module, you will explore various data replication techniques using Mirroring in Fabric, which offers efficient, low-latency solutions. You will also explore the process of integrating diverse data sources.

(<a href="00%20-%20Pre-Requisites.md" >Make sure you check out the <b>Pre-Requisites</b> page before you start</a>. You'll need all of the items loaded there before you can proceed with the workshop.)

You'll cover these topics in this Module on Mirroring in Fabric:

<dl>
  <dt><a href="#5.1" >5.1 - What is Mirroring in Fabric?</a></dt>
  <dt><a href="#5.2" >5.2 - When to use Mirroring in Fabric</a></dt>
  <dt><a href="#5.3" >5.3 - Share and use mirrored data</a></dt>
  <dt><a href="#5.4" >5.4 - Monitor Fabric mirrored database replication </a></dt>
  <dt><a href="#5.5" >5.5 - Troubleshoot Fabric mirrored database</a></dt>
</dl>

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2 id="5.1"><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/pencil2.png">5.1 What is Mirroring in Fabric?</h2>


Mirroring in Fabric is a low-cost and low-latency solution to bring data from various systems together into a single analytics platform. You can continuously replicate your existing data estate directly into Fabric's OneLake from a variety of Azure databases and external data sources.

With the most up-to-date data in a queryable format in OneLake, you can now use all the different services in Fabric, such as running analytics with Spark, executing notebooks, data engineering, visualizing through Power BI reports, and more.

Mirroring in Fabric gives you a highly integrated, end-to-end, and easy-to-use product that is designed to simplify your analytics needs. It's built for openness and collaboration between Microsoft and technology solutions that can read the open-source Delta Lake table format.

Mirroring in Fabric accelerates the data integration process, providing a turnkey solution for creating data replicas in OneLake to meet all analytical needs.

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2 id="5.2"><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/pencil2.png">5.2 When to use Mirroring in Fabric</h2>

Today, many organizations face challenges with mission-critical operational or analytical data being isolated in silos, requiring complex extract, transform, and load (ETL) pipelines and business processes to access and work with this data. This situation leads to restricted access to important, constantly changing data; friction between people, processes, and technology; long wait times to create necessary data pipelines; and a lack of freedom to use preferred tools for analysis and sharing insights. Additionally, there is often no proper foundation for data collaboration and no common, open data formats for various analytical scenarios such as business intelligence (BI), AI, integration, engineering, and apps.

Mirroring in Fabric addresses these challenges by providing a seamless experience that accelerates the time-to-value for insights and decisions, and breaks down data silos between technology solutions. It offers near real-time replication of data into a software as a service (SaaS) data lake, with built-in analytics for BI and AI.

The Microsoft Fabric platform, built on a foundation of SaaS, simplifies and integrates data processes to a new level. Mirroring in Fabric helps address common challenges such as:
<p>

- Restricted and limited access to important, ever-changing data
- Friction between people, process, and technology
- Long wait times to create data pipelines and processes to critically important data
- No freedom to use the tools you need to analyze and share insights comfortably
- Lack of a proper foundation for folks to share and collaborate on data
- No common, open data formats for all analytical scenarios: BI, AI, integration, engineering, and even apps

Furthermore, Mirroring in Fabric supports a broad ecosystem of tools, including SQL Server Management Studio, the MSSQL extension for Visual Studio Code, and GitHub Copilot. Sharing capabilities ensure ease of access control and secure decision-making across the organization.

Fabric offers three different approaches to bringing data into OneLake through mirroring.

- **Database mirroring:** Database mirroring in Microsoft Fabric replicates entire databases and tables, so you can bring data from various systems together into a single analytics platform.
- **Metadata mirroring:** Metadata mirroring in Fabric synchronizes metadata (such as catalog names, schemas, and tables) instead of physically moving the data. This approach leverages shortcuts, ensuring the data remains in its source while still being easily accessible within Fabric.
- **Open mirroring:** Open mirroring in Fabric is designed to extend mirroring based on the open Delta Lake table format. This capability enables any developer to write their application's change data directly into a mirrored database item in Microsoft Fabric, based on the open mirroring approach and public APIs.

### Currently Available External Databases for Mirroring in Microsoft Fabric

| Platform                                                                 | Near Real-Time Replication | Type of Mirroring     | Tutorial                                                                 |
|--------------------------------------------------------------------------|-----------------------------|------------------------|--------------------------------------------------------------------------|
| Azure Cosmos DB | Yes | Database mirroring | <a href="https://learn.microsoft.com/en-us/fabric/mirroring/azure-cosmos-db-tutorial">Tutorial: Azure Cosmos DB</a> |
| Azure Databricks | N/A (metadata only, via shortcuts) | Metadata mirroring | <a href="https://learn.microsoft.com/en-us/fabric/mirroring/azure-databricks-tutorial">Tutorial: Azure Databricks</a> |
| Azure Database for PostgreSQL | Yes | Database mirroring | <a href="https://learn.microsoft.com/en-us/fabric/mirroring/azure-database-postgresql-tutorial">Tutorial: Azure Database for PostgreSQL</a> |
| Azure Database for MySQL (preview) | Yes | Database mirroring | <a href="https://learn.microsoft.com/en-us/fabric/mirroring/azure-database-mysql-tutorial">Tutorial: Azure Database for MySQL (preview)</a> |
| Azure SQL Database | Yes | Database mirroring | <a href="https://learn.microsoft.com/en-us/fabric/mirroring/azure-sql-database-tutorial">Tutorial: Azure SQL Database</a> |
| Azure SQL Managed Instance | Yes | Database mirroring | <a href="https://learn.microsoft.com/en-us/fabric/mirroring/azure-sql-managed-instance-tutorial">Tutorial: Azure SQL Managed Instance</a> |
| Dremio catalog (preview) | N/A (metadata only, via shortcuts) | Metadata mirroring | <a href="https://learn.microsoft.com/en-us/fabric/mirroring/catalog-mirroring/dremio-tutorial">Tutorial: Dremio (preview)</a> |
| Google BigQuery | Yes | Database mirroring | <a href="https://learn.microsoft.com/en-us/fabric/mirroring/google-bigquery-tutorial">Tutorial: Google BigQuery</a> |
| Oracle | Yes | Database mirroring | <a href="https://learn.microsoft.com/en-us/fabric/mirroring/oracle-tutorial">Tutorial: Oracle</a> |
| SAP (via SAP Datasphere) | Yes | Database mirroring | <a href="https://learn.microsoft.com/en-us/fabric/mirroring/sap-datasphere-tutorial">Tutorial: SAP Datasphere</a> |
| SharePoint List | Yes | Database mirroring, Metadata mirroring | <a href="https://learn.microsoft.com/en-us/fabric/mirroring/sharepoint-list-tutorial">Tutorial: SharePoint List</a> |
| Snowflake | Yes | Database mirroring, Metadata mirroring | <a href="https://learn.microsoft.com/en-us/fabric/mirroring/snowflake-tutorial">Tutorial: Snowflake</a> |
| SQL Server | Yes | Database mirroring | <a href="https://learn.microsoft.com/en-us/fabric/mirroring/sql-server-tutorial">Tutorial: SQL Server</a> |
| Open mirrored databases | Yes | Open mirroring | <a href="https://learn.microsoft.com/en-us/fabric/mirroring/open-mirroring-tutorial">Tutorial: Open mirroring</a> |
| Fabric SQL database | Yes | Database mirroring | Automatically configured |

> **Note:** Metadata mirroring doesn't replicate data. It references source data in place through OneLake shortcuts, so latency reflects source system access and shortcut performance rather than replication speed.


<p style="border-bottom: 1px solid lightgrey;"></p>


<h3>How does the near real-time replication of database mirroring work?</h3>

Mirroring is enabled by creating a secure connection to your operational data source. You choose whether to replicate an entire database or individual tables, and Mirroring automatically keeps your data in sync. Once it's set up, data continuously replicates into OneLake for analytics consumption.

### What happens behind the scenes

Changes arrive in Fabric incrementally as Delta files from the data source. How the changed data is identified depends on the source. For example, in SQL Server 2025, the SQL Database Engine scans the source database's transaction log at a high frequency and publishes the changes for each table to corresponding files in the Fabric landing zone.

Inside Fabric, a replicator engine runs continuously, scans for newly published files at a high frequency, and immediately merges the incoming changes into the target Delta table. Changes can be published as fast as every **15 seconds**.

Backoff logic detects periods of low activity. This avoids excessive overhead on source database engines outside of Fabric and keeps latency low by responding to how often data changes arrive.

<p>
<img src="https://learn.microsoft.com/en-us/fabric/mirroring/media/overview/fabric-mirror-overview.svg" alt="Diagram of how Fabric database mirroring replicates data from Azure, on-premises, or cloud sources into Delta Parquet in OneLake" height=400>

### What affects replication speed

For database mirroring and open mirroring, near real-time replication can depend on several factors:

- Location or region of the source
- Location or region of the destination
- Volume of changes
- Frequency of changes
- Network bandwidth and latency from the source
- Compute resources allocated to the on-premises data gateway

> **Note:** Metadata mirroring doesn't replicate data, so these factors don't apply in the same way. Its latency reflects source system access time and shortcut performance.

### Core tenets of Mirroring

The following are core tenets of Mirroring:

- Enabling Mirroring in Fabric is simple and intuitive, without the need to create complex ETL pipelines, allocate other compute resources, or manage data movement.

- Mirroring in Fabric is a fully managed service, so you don't have to worry about hosting, maintaining, or managing replication of the mirrored connection.

- To learn more about Mirroring in Fabric, watch the following videos:

     <p><a href="https://www.youtube.com/watch?v=I09E-0RlgNc"><img src="https://img.youtube.com/vi/I09E-0RlgNc/0.jpg" alt="Tales From The Field video: Introduction to Microsoft Fabric database mirroring with Azure SQL Database" height=200></a>
     <p><a href="https://www.youtube.com/watch?v=YMWySj-x660"><img src="https://img.youtube.com/vi/YMWySj-x660/0.jpg" alt="Tales From The Field video: Introducing private endpoint mirroring in Microsoft Fabric" height=200></a>
     <p><a href="https://www.youtube.com/watch?v=wW6eLVnzO78"><img src="https://img.youtube.com/vi/wW6eLVnzO78/0.jpg" alt="Tales From The Field video: Microsoft Fabric mirroring for SQL Managed Instance" height=200></a>
    <p><a href="https://www.youtube.com/watch?v=K8xIVBMKfrc"><img src="https://img.youtube.com/vi/K8xIVBMKfrc/0.jpg" alt="Tales From The Field video: Mirroring SQL Server 2022, 2019, 2017, or 2016 in Microsoft Fabric" height=200></a>


<h3>How does metadata mirroring work?</h3>

Metadata mirroring references source data through <a href="https://learn.microsoft.com/en-us/fabric/onelake/onelake-shortcuts">OneLake shortcuts</a> instead of replicating it. Only the metadata, such as catalog names, schemas, and tables, is synchronized into Fabric. The data itself stays where it is, which keeps a single version of truth with no duplication and no ETL, and minimizes storage needs in Fabric.

For example, when you mirror data registered in Azure Databricks Unity Catalog, Fabric mirrors only the catalog structure and reads the underlying tables through shortcuts. Changes in the source data are reflected in Fabric without any data movement.

Keep these points in mind:

- **There's no replication engine.** Latency reflects source system access time and shortcut performance rather than replication speed. New or changed tables can take anywhere from a few seconds to several minutes to appear in the SQL analytics endpoint.
- **Fabric must be able to reach the source storage.** Because Fabric reads the data in place, it needs network access to the storage that holds the source tables, for example, the Azure Data Lake Storage (ADLS) Gen2 account behind Azure Databricks or the storage that holds Snowflake Iceberg tables.
- **Cross-tenant sharing is supported.** Because metadata mirroring relies on OneLake shortcuts, the data can be shared with other tenants through OneLake external data sharing. See <a href="#5.3">5.3 - Share and use mirrored data</a>.

Sources that use metadata mirroring today include Azure Databricks Unity Catalog, Dremio catalog (preview), and the metadata mirroring options for Snowflake and SharePoint List. For the details and gotchas of the two most common sources, see <b>Deep dive: Azure Databricks and Snowflake</b> later in this section.


<h3>How does open mirroring work?</h3>

In addition to mirroring enabling data replication by creating a secure connection to your data source, you can also select an existing data provider or write your own application to land data into a mirrored database. Once you create an open mirrored database via the public API or the Fabric portal, you can obtain a landing zone URL in OneLake, where you can land change data per the open mirroring specification.

Once data is in the landing zone with the proper format, replication starts running and manages the complexity of merging the changes, including updates, inserts, and deletes, into Delta tables. This method ensures that any data written into the landing zone is immediately reflected, keeping the data in Fabric up to date.

- To learn more about open mirroring, watch the following video:

<p><a href="https://www.youtube.com/watch?v=81M93gBYrlw"><img src="https://img.youtube.com/vi/81M93gBYrlw/0.jpg" alt="Tales From The Field video: Open mirroring deep dive in Microsoft Fabric" height=200></a>

<p>

<h3>Deep dive: Azure Databricks and Snowflake</h3>

These two sources come up in almost every customer conversation, and both behave differently from classic database mirroring. This subsection covers how each one works and the complications to plan for before you start.

### Azure Databricks Unity Catalog mirroring

Mirroring Azure Databricks Unity Catalog is **metadata mirroring**. Fabric creates a **Mirrored Azure Databricks** item and a SQL analytics endpoint, then reads the Delta tables in place through OneLake shortcuts to the ADLS Gen2 storage behind Unity Catalog. No data is copied, and Power BI reports can use Direct Lake against the mirrored tables.

- **Automatically sync future catalog changes** is on by default, so schemas, tables, materialized views, and streaming tables added to or removed from Unity Catalog are reflected in Fabric. You can instead choose specific schemas and tables to include or exclude.
- Changes typically appear in seconds to minutes, governed by the SQL analytics endpoint metadata sync.

**What doesn't come across**

| Item | Behavior |
|---|---|
| Views and metric views | Not shown in Fabric |
| Non-Delta external tables | Not shown in Fabric |
| Tables with row filters or column masks | Not supported |
| Lakehouse federated tables | Not supported |
| Delta Sharing tables | Not supported |
| Renaming a schema or table that's in an include or exclude list | Not supported |

**Complications to plan for**

- **Unity Catalog permissions are not mirrored.** Grants and policies defined in Unity Catalog don't carry over, so you must reconfigure security in Fabric. Queries in Fabric use the credential of the Databricks connection, so plan carefully who can read the mirrored item. To recreate Unity Catalog permissions in Fabric, see <b>Carrying Unity Catalog permissions into Fabric</b> below.
- **External data access must be enabled** on the Unity Catalog metastore. See <a href="https://learn.microsoft.com/en-us/azure/databricks/external-access/admin#enable-external-data-access-on-the-metastore">Enable external data access on the metastore</a>.
- **Fabric must reach the ADLS Gen2 account.** For firewall-protected storage, use <a href="https://learn.microsoft.com/en-us/fabric/security/security-trusted-workspace-access">trusted workspace access</a> and allow the Fabric workspace identity in the storage firewall. Unity Catalog row-level, column-level, and attribute-based policies are not enforced at the storage layer, so data read this way isn't filtered by them.
- **Runtime and region.** The feature requires a Fabric Spark runtime with Spark 3.4 and Delta 2.4 or later, and it's available only in the regions listed on Learn.

#### Carrying Unity Catalog permissions into Fabric

Mirroring brings across the catalog metadata, not the access policies. To get matching security in Fabric, turn on **OneLake security** for the Mirrored Azure Databricks item (**Manage OneLake security** in the ribbon) and recreate the Unity Catalog access as OneLake security roles. The mirrored catalog supports Read roles, including row-level and column-level security. There are two ways to build those roles:

| Approach | How it works | Best for |
|---|---|---|
| Manual mapping | Sync the same Microsoft Entra group into Unity Catalog (automatic identity management), grant it USE, BROWSE, and SELECT there, then add that group to a OneLake security role on the mirrored tables. | A small number of groups and catalogs that rarely change |
| <a href="https://github.com/microsoft/Policy-Weaver">Policy Weaver</a> (open-source accelerator) | A Python package published by Microsoft that reads Unity Catalog grants, resolves the effective read privileges (including nested groups), and writes matching OneLake security roles on the mirrored item. It runs in a Fabric notebook or anywhere with Python 3.11 or later, so you can schedule it to keep roles in sync. It also supports Snowflake. | Many groups or catalogs, or permissions that change often |

> **Important:** Policy Weaver is an open-source accelerator on GitHub, not a built-in Fabric feature. Test it in a non-production workspace first, and keep the mapping in sync as catalogs and permissions change.

Policy Weaver prerequisites for Azure Databricks:

- A service principal with a client secret, added as **Admin** on the Fabric workspace that holds the mirrored item, with the tenant setting that lets service principals call Fabric public APIs turned on. Microsoft Graph `User.Read.All` (application) is recommended.
- Unity Catalog integrated with Microsoft Entra ID through System for Cross-domain Identity Management (SCIM). Only account-level groups, users, and service principals sync; legacy workspace-local groups don't.
- The same service principal added in the Azure Databricks account console with the **Account Admin** role and an OAuth secret.
- OneLake security turned on for the mirrored item.

For the roles to apply when people query through the SQL analytics endpoint or Direct Lake, set the endpoint to **User's identity** access mode, and make sure every principal in a role also has **Read** permission on the item. Role changes take about 5 minutes to apply, and group membership changes take about an hour.

Learn more: <a href="https://github.com/microsoft/Policy-Weaver">Policy Weaver on GitHub</a> | <a href="https://blog.fabric.microsoft.com/en-us/blog/secure-mirrored-azure-databricks-data-in-fabric-with-onelake-security/">Secure mirrored Azure Databricks data with OneLake security</a> | <a href="https://learn.microsoft.com/en-us/fabric/onelake/security/data-access-control-model">OneLake security roles, permissions, and scopes</a>

Learn more: <a href="https://learn.microsoft.com/en-us/fabric/mirroring/azure-databricks-tutorial">Tutorial</a> | <a href="https://learn.microsoft.com/en-us/fabric/mirroring/azure-databricks-limitations">Limitations</a> | <a href="https://learn.microsoft.com/en-us/fabric/mirroring/azure-databricks-security">Security</a> | <a href="https://learn.microsoft.com/en-us/fabric/mirroring/azure-databricks-faq">FAQ</a>

### Snowflake: mirroring and bidirectional access with OneLake

<img src="https://learn.microsoft.com/en-us/fabric/mirroring/media/snowflake/fabric-mirroring-snowflake.svg" alt="Diagram of Fabric mirroring for Snowflake" height=400>

Customers often ask for bidirectional integration between Snowflake and Fabric. That isn't a single feature; it's a combination of the patterns below, each with its own direction and requirements.

| Pattern | Direction | What happens |
|---|---|---|
| Database mirroring of managed tables | Snowflake to Fabric | Managed tables and views are replicated into OneLake as Delta in near real time. |
| Metadata mirroring of Iceberg tables | Snowflake to Fabric | Iceberg table metadata is mirrored and shortcuts point to the Iceberg storage. Tables appear as Delta, with no copy. |
| Snowflake database item in Fabric | One shared copy | A Snowflake database writes its Iceberg tables to OneLake by default, so Snowflake and Fabric use the same copy of the data. |
| Snowflake reads Fabric data | Fabric to Snowflake | Delta tables in OneLake are exposed as virtual Iceberg tables (a metadata conversion) that Snowflake can query. |

**Complications for Snowflake mirroring**

- **Iceberg tables need a storage connection**, and only Iceberg tables reachable through the same storage connection can be mirrored together.
- **Views and materialized views sync every 12 hours**, not in near real time.
- **External, transient, temporary, and dynamic tables are not supported.**
- **Security doesn't carry over.** Granular permissions must be reconfigured in Fabric. The open-source Policy Weaver accelerator can sync Snowflake policies to OneLake security roles too; see <b>Carrying Unity Catalog permissions into Fabric</b> above.
- **Snowflake costs still apply.** Mirroring uses Snowflake warehouse and cloud services compute to read changes. It runs continuously with no scheduling.
- **Full reseeds.** Stopping and restarting mirroring, data definition language (DDL) changes, and dbt drop-and-recreate patterns all trigger a full reseed of the affected tables.
- **Identifiers are case-sensitive.**
- **Connectivity.** Supported authentication is username and password, Microsoft Entra single sign-on (SSO), or key pair. Workspace identity and direct Private Link are not supported; use a gateway for private networks. A storage integration is required if `PREVENT_UNLOAD_TO_INLINE_URL` is set.

**Complications for OneLake and Snowflake interoperability**

- Writing Iceberg tables to OneLake requires Snowflake on Azure with the Fabric capacity in the same Azure region, an external volume that points to OneLake, and consent for Snowflake's multitenant app with Contributor access to the workspace.
- The tenant settings that let service principals call Fabric and OneLake APIs must be enabled.
- The Snowflake database item works over the public network only (no on-premises data gateway), requires the Admin or Member workspace role, and isn't supported for workspaces protected by Private Link.

Learn more: <a href="https://learn.microsoft.com/en-us/fabric/mirroring/snowflake">Mirroring Snowflake</a> | <a href="https://learn.microsoft.com/en-us/fabric/onelake/snowflake/create-snowflake-database-item">Snowflake database item</a> | <a href="https://learn.microsoft.com/en-us/fabric/onelake/onelake-iceberg-snowflake">Use Snowflake with OneLake Iceberg tables</a> | <a href="https://learn.microsoft.com/en-us/fabric/onelake/onelake-iceberg-tables">Delta and Iceberg table formats in OneLake</a>

### Cost of mirroring

For database mirroring and open mirroring, the Fabric compute and OneLake storage are free up to a capacity-based limit.

- Storage for replicas is free up to a limit based on the capacity size. Mirroring offers a free terabyte of mirroring storage for every capacity unit (CU) you have purchased. For example, if you purchase an F64 capacity, you get 64 free terabytes of storage, exclusively used for mirroring. OneLake storage is billed if the free mirroring storage limit is exceeded, or when the capacity is paused. For more information, see <a href="https://azure.microsoft.com/en-us/pricing/details/microsoft-fabric/">Microsoft Fabric pricing</a>.

- Background Fabric compute used to replicate your data into Fabric OneLake is free and does not consume capacity. Requests directly to OneLake for mirrored data consume capacity as normal OneLake compute consumption. The compute for querying data using SQL, Power BI, or Spark is charged at regular rates.

- A running Fabric capacity is required for mirroring. A paused or deleted capacity affects mirroring, and no data is replicated. However, the background compute used for replication doesn't consume your capacity units.

### Retention for mirrored data

Mirroring continuously replicates your data into OneLake in Delta Lake table format. To keep mirrored data efficiently stored and ready for analytics, mirroring automatically runs **vacuum** to remove old files that are no longer referenced by a Delta log.

You can customize the retention setting to fit your needs:

- **Shorter retention** reduces mirroring storage consumption.
- **Longer retention** lets you use Delta's time travel capabilities for analytics.

| Mirrored database | Default retention |
|---|---|
| Created from the Fabric portal after mid-June 2025 | 1 day |
| Created before mid-June 2025 | 7 days |

To check or change the setting, open your mirrored database in the Fabric portal, go to **Settings** > **Delta table management**, and specify the retention threshold. You can also set it through the <a href="https://learn.microsoft.com/en-us/fabric/mirroring/mirrored-database-rest-api#configure-data-retention">mirroring public REST API</a> by using the `retentionInDays` property.



<br>
<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/point1.png"><b>Activity: Configure Fabric Mirrored Database</b></p>

<p><img src="https://learn.microsoft.com/en-us/fabric/mirroring/media/azure-sql-database/fabric-mirroring-sql-database.svg" alt="Diagram of configuring a Fabric mirrored database from Azure SQL Database" height=400></p>

In this Activity, you will learn how to configure Microsoft Fabric mirrored databases from Azure SQL Database.

<p><img style="margin: 0px 15px 15px 0px;" src="../graphics/checkmark.png"><b>Steps</b></p>

Open the following reference and complete the steps you see there:

<a href="https://learn.microsoft.com/en-us/fabric/mirroring/azure-sql-database-tutorial">Tutorial: Configure Microsoft Fabric mirrored databases from Azure SQL Database</a>

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2 id="5.3"><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/pencil2.png">5.3 Share and use mirrored data</h2>


Once your data is mirrored into OneLake, you can share it with colleagues, share it with other organizations, and combine it with the rest of your Fabric data without moving or copying it.

### Share a mirrored database

Sharing makes access control and management easier. Security controls such as row-level security (RLS) and object-level security (OLS) help you control access to sensitive information.

When you share a mirrored database, you grant other users or groups access to that mirrored database **without** giving them access to the workspace and the rest of its items. Sharing a mirrored database also grants access to its SQL analytics endpoint.

> **Note:** You must be an Admin or Member in your workspace to share an item in Microsoft Fabric.

To share, go to your workspace and select **Share** next to the mirrored database name. By default, recipients get Read permission on the mirrored database and its SQL analytics endpoint. You can also grant:

| Permission option | What it allows |
|---|---|
| Read all SQL analytics endpoint data | Read all data through the SQL analytics endpoint using T-SQL queries (ReadData permission). |
| Read all OneLake data | Access the mirrored data directly in OneLake, for example with Spark or OneLake Explorer, and subscribe to OneLake events in Real-Time hub (ReadAll and SubscribeOneLakeEvents permissions). |
| Read and write | Edit the mirrored database configuration and read and write data in the landing zone (Write permission). |

To review, grant, or revoke permissions later, select the **Manage permissions** quick action on the mirrored database or its SQL analytics endpoint.

> **Note:** When mirroring from Azure SQL Database, Azure SQL Managed Instance, Azure Database for PostgreSQL, Azure Database for MySQL, or SQL Server 2025, the source's managed identity needs **Read and write** permission on the mirrored database. This is granted automatically when you create the mirrored database in the Fabric portal. If you create it through the API, grant the permission yourself.

For more information, see <a href="https://learn.microsoft.com/en-us/fabric/mirroring/share-and-manage-permissions">Share your mirrored database and manage permissions</a>.

### Share mirrored data across tenants

You can also share mirrored databases, and data accessible through shortcuts, with another organization's Fabric tenant by using <a href="https://learn.microsoft.com/en-us/fabric/governance/external-data-sharing-overview">OneLake external data sharing</a>. Because metadata mirroring relies on OneLake shortcuts, it supports cross-tenant sharing too.

The data is shared in place, and no data is copied. Cross-tenant sharing creates a read-only OneLake shortcut in the consuming tenant that points back to the original data, so both organizations work from the same live data without ETL or duplication.

<p>
<img src="https://learn.microsoft.com/en-us/fabric/governance/media/external-data-sharing-overview/external-data-share-illustration.png" alt="Illustration of a cross-tenant OneLake data share between a provider tenant and a consumer tenant" height=400>

How it works:

1. A Fabric admin turns on external data sharing in **both** the sharing tenant and the consuming tenant, including who can create and accept shares.
2. A user with Read and Reshare permissions on the mirrored database creates an external data share and invites a user in the other tenant.
3. The recipient accepts the share from the link they receive and chooses a Lakehouse where the shortcut is created.
4. Users in the consuming tenant can then work with the shared data in Power BI reports, Spark notebooks, data science experiments, and SQL analytics endpoint queries.

> **Important:** Governance controls from the sharing tenant, such as Microsoft Purview sensitivity labels and data loss prevention, don't carry over to the consuming tenant. The consuming tenant applies its own access control and compliance policies and can grant access to anyone, and data might cross geographic boundaries when it's accessed there. Shares can be revoked at any time from the **External data shares** tab on the Manage permissions page.

Learn more: <a href="https://learn.microsoft.com/en-us/fabric/governance/external-data-sharing-enable">Enable external data sharing</a> | <a href="https://learn.microsoft.com/en-us/fabric/governance/external-data-sharing-create">Create an external data share</a> | <a href="https://learn.microsoft.com/en-us/fabric/governance/external-data-sharing-accept">Accept an external data share</a>

### Query across databases

With mirrored data in OneLake, you can write cross-database queries that join data from mirrored databases, Warehouses, and the SQL analytics endpoints of Lakehouses in a single T-SQL query. Reference tables in other items by using three-part naming: `database.schema.table`.

For example, from a mirrored database, you can join to a table in the Warehouse `ContosoWarehouse`:

```sql
SELECT *
FROM ContosoWarehouse.dbo.ContosoSalesTable AS Contoso
INNER JOIN Affiliation
ON Affiliation.AffiliationId = Contoso.RecordTypeID;
```

For more information, see <a href="https://learn.microsoft.com/en-us/fabric/data-warehouse/query-warehouse#write-a-cross-database-query">Write a cross-database query</a>.

### Report with Direct Lake

Mirrored data is stored in Delta Lake format in OneLake, so Power BI can connect to it in <a href="https://learn.microsoft.com/en-us/fabric/fundamentals/direct-lake-overview">Direct Lake</a> mode. This gives you fast, near real-time reporting directly over your operational data, without extra data movement or duplication.

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2 id="5.4"><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/pencil2.png">5.4 Monitor Fabric mirrored database replication</h2>

Once the mirrored database is configured, you can monitor replication in three ways: from the Fabric portal, programmatically through the REST API, and through workspace monitoring.

### Monitor from the Fabric portal

The **Monitor replication** section shows you the database-level status and a list of tables under replication, along with the corresponding status, total rows replicated, and the last completed time to refresh the mirrored table from source.

> **Tip:** If you observe a delay in the appearance of mirrored data, follow the <a href="https://learn.microsoft.com/en-us/fabric/mirroring/troubleshooting#data-doesnt-appear-to-be-replicating">troubleshooting guide</a> to debug the potential issue.

### Possible Replication Statuses

#### Database Level

| Status | Description |
|---|---|
| Running | Replication is currently running, bringing snapshot and change data into OneLake. |
| Running with warning | Replication is running, with transient errors. |
| Stopping/Stopped | Replication has stopped. |
| Failed | Fatal error in replication that can't be recovered. |
| Paused | Replication is paused. This happens when you pause and resume the Fabric capacity. See <a href="https://learn.microsoft.com/en-us/fabric/mirroring/troubleshooting#changes-to-fabric-capacity">Changes to Fabric capacity</a>. |

#### Table Level

| Status | Description |
|---|---|
| Running | Data is replicating. |
| Running with warning | Warning of nonfatal error with replication of the data from the table. |
| Stopping/Stopped | Replication has stopped. |
| Failed | Fatal error in replication for that table. |

#### Other columns in the monitoring view

| Column | Description |
|---|---|
| Name | The name of the source table in `[schema_name].[table_name]` or `[table_name]` format. |
| Rows replicated | The cumulative count of replicated rows, including all inserts, updates, and deletes applied to the target table. |
| Last completed | The last completed time to refresh the mirrored table from source. An empty value means the table isn't yet mirrored. |

### Monitor programmatically

You can monitor mirrored databases programmatically by using the REST APIs or SDK to get the mirroring status of the mirrored database or of specific tables. See <a href="https://learn.microsoft.com/en-us/fabric/mirroring/mirrored-database-rest-api">Microsoft Fabric mirroring public REST API</a>.

### Workspace monitoring

<a href="https://learn.microsoft.com/en-us/fabric/fundamentals/workspace-monitoring-overview">Workspace monitoring</a> is an observability feature in Microsoft Fabric that enables developers and admins to access detailed logs and performance metrics of their workspaces.

Mirroring in Fabric supports operation logs in workspace monitoring to provide a more comprehensive monitoring experience for your mirrored databases. You can use these logs to monitor execution and performance of your mirrored database, including data replication, table changes, mirroring status, failures, and replication latency.

To get started, <a href="https://learn.microsoft.com/en-us/fabric/fundamentals/enable-workspace-monitoring">enable monitoring</a> in your workspace. Once the monitoring of your workspace is enabled, the mirrored database execution logs are automatically ingested into the `MirroredDatabaseTableExecution` table in the monitoring Kusto Query Language (KQL) database. To learn more about the available logs and their structure, see <a href="https://learn.microsoft.com/en-us/fabric/mirroring/monitor-logs">Mirrored database operation logs (preview)</a>.

<p>
<img src="https://learn.microsoft.com/en-us/fabric/mirroring/media/monitor/enable-workspace-monitoring.png" alt="Workspace settings in the Fabric portal with workspace monitoring turned on" height=400>

The operation logs complement the at-a-glance view in the Fabric portal. You can use them to:

- Understand the amount of data replicated over time for your mirrored databases and tables.
- Track additions and removals of tables for mirroring.
- Monitor the mirroring status and diagnose failures.
- Measure the time and latency for initial snapshots and incremental data replication.

Useful columns in the `MirroredDatabaseTableExecution` table include:

| Column | What it tells you |
|---|---|
| OperationName | The replication step, such as `AddTable`, `StartSnapshotting`, `Snapshotting`, `Replicating`, `StartReseeding`, `FailTable`, or `RemoveTable`. |
| SourceSchemaName / SourceTableName | The source schema and table the log entry is about. |
| ProcessedRows / ProcessedBytes | How many rows and how much data the operation processed. |
| ReplicatorBatchLatency | The latency, in seconds, to replicate the batch of data. |
| ErrorType / ErrorMessage | Whether a failure was a `UserError` or `SystemError`, and the error details. |

Then you have full access to an advanced monitoring experience for your mirrored database:

- **Derive insights on demand:** Query the granular operation logs directly using KQL in the monitoring database to get instant access to the information you need.

<p>
<img src="https://learn.microsoft.com/en-us/fabric/mirroring/media/monitor/monitor-query-mirrored-database-logs.png" alt="KQL query results for mirrored database operation logs" height=400>

- **Build customized monitoring dashboards:** Bring the monitoring data into Power BI or <a href="https://learn.microsoft.com/en-us/fabric/real-time-intelligence/dashboard-real-time-create">Real-Time Dashboards</a> to create dashboards tailored to your needs.

<p>
<img src="https://learn.microsoft.com/en-us/fabric/mirroring/media/monitor/monitor-dashboard.png" alt="Dashboard in the Fabric portal for monitoring mirrored database replication" height=400>

- **Set up alerting:** <a href="https://learn.microsoft.com/en-us/fabric/real-time-intelligence/user-flow-6">Set up alerts</a> based on the logs and metrics you're tracking.

<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/point1.png"><b>Self-Guided Activity: Query mirroring latency with KQL</b></p>

<p><img style="margin: 0px 15px 15px 0px;" src="../graphics/checkmark.png"><b>Steps</b></p>

1. Enable workspace monitoring in the workspace that holds your mirrored database (Workspace settings > Monitoring).
2. Open the monitoring KQL database that Fabric creates in the workspace.
3. Run the following query to see the replication latency and volume for each mirrored table over the last 24 hours:

```kusto
MirroredDatabaseTableExecution
| where Timestamp > ago(24h)
| summarize AvgLatencySec = avg(ReplicatorBatchLatency), MaxLatencySec = max(ReplicatorBatchLatency), RowsProcessed = sum(ProcessedRows) by ItemName, SourceSchemaName, SourceTableName
| order by MaxLatencySec desc
```

For more queries, see the <a href="https://github.com/microsoft/fabric-samples/tree/main/workspace-monitoring/Mirrored%20database%20operations">mirrored database sample queries</a> in the fabric-samples GitHub repository.

<p style="border-bottom: 1px solid lightgrey;"></p>


<h2 id="5.5"><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/pencil2.png">5.5 Troubleshoot Fabric mirrored database</h2>

As with any service, it is crucial to understand troubleshooting methods for anticipated issues. For detailed guidance on troubleshooting Mirroring, use the links for each data source below.
<p>

| Data Source | Limitations | Troubleshooting | FAQ |
|---|---|---|---|
| Azure Cosmos DB | <a href="https://learn.microsoft.com/en-us/fabric/mirroring/azure-cosmos-db-limitations">Limitations</a> | <a href="https://learn.microsoft.com/en-us/fabric/mirroring/azure-cosmos-db-troubleshooting">Troubleshoot</a> | <a href="https://learn.microsoft.com/en-us/fabric/mirroring/azure-cosmos-db-faq">FAQ</a> |
| Azure Database for MySQL (preview) | <a href="https://learn.microsoft.com/en-us/fabric/mirroring/azure-database-mysql-limitations">Limitations</a> | <a href="https://learn.microsoft.com/en-us/fabric/mirroring/azure-database-mysql-troubleshoot">Troubleshoot</a> | <a href="https://learn.microsoft.com/en-us/fabric/mirroring/azure-database-mysql-mirroring-faq">FAQ</a> |
| Azure Database for PostgreSQL | <a href="https://learn.microsoft.com/en-us/fabric/mirroring/azure-database-postgresql-limitations">Limitations</a> | <a href="https://learn.microsoft.com/en-us/fabric/mirroring/azure-database-postgresql-troubleshoot">Troubleshoot</a> | <a href="https://learn.microsoft.com/en-us/fabric/mirroring/azure-database-postgresql-mirroring-faq">FAQ</a> |
| Azure Databricks | <a href="https://learn.microsoft.com/en-us/fabric/mirroring/azure-databricks-limitations">Limitations</a> | n/a | <a href="https://learn.microsoft.com/en-us/fabric/mirroring/azure-databricks-faq">FAQ</a> |
| Azure Monitor (preview) | <a href="https://learn.microsoft.com/en-us/fabric/mirroring/catalog-mirroring/azure-monitor#considerations">Considerations</a> | <a href="https://learn.microsoft.com/en-us/fabric/mirroring/catalog-mirroring/azure-monitor-troubleshoot">Troubleshoot</a> | <a href="https://learn.microsoft.com/en-us/fabric/mirroring/catalog-mirroring/azure-monitor-tutorial#troubleshoot-connection-failures">Connections FAQ</a> |
| Azure SQL Database | <a href="https://learn.microsoft.com/en-us/fabric/mirroring/azure-sql-database-limitations">Limitations</a> | <a href="https://learn.microsoft.com/en-us/fabric/mirroring/azure-sql-database-troubleshoot">Troubleshoot</a> | <a href="https://learn.microsoft.com/en-us/fabric/mirroring/azure-sql-database-mirroring-faq">FAQ</a> |
| Azure SQL Managed Instance | <a href="https://learn.microsoft.com/en-us/fabric/mirroring/azure-sql-managed-instance-limitations">Limitations</a> | <a href="https://learn.microsoft.com/en-us/fabric/mirroring/azure-sql-managed-instance-troubleshoot">Troubleshoot</a> | <a href="https://learn.microsoft.com/en-us/fabric/mirroring/azure-sql-managed-instance-faq">FAQ</a> |
| Fabric SQL database | <a href="https://learn.microsoft.com/en-us/fabric/database/sql/mirroring-limitations">Limitations</a> | <a href="https://learn.microsoft.com/en-us/fabric/database/sql/mirroring-troubleshooting">Troubleshoot</a> | <a href="https://learn.microsoft.com/en-us/fabric/database/sql/mirroring-faq">FAQ</a> |
| Google BigQuery | <a href="https://learn.microsoft.com/en-us/fabric/mirroring/google-bigquery-limitations">Limitations</a> | n/a | <a href="https://learn.microsoft.com/en-us/fabric/mirroring/google-bigquery-faq">FAQ</a> |
| Oracle | <a href="https://learn.microsoft.com/en-us/fabric/mirroring/oracle-limitations">Limitations</a> | n/a | n/a |
| SAP | <a href="https://learn.microsoft.com/en-us/fabric/mirroring/sap-limitations">Limitations</a> | n/a | n/a |
| Snowflake | <a href="https://learn.microsoft.com/en-us/fabric/mirroring/snowflake-limitations">Limitations</a> | <a href="https://learn.microsoft.com/en-us/fabric/mirroring/snowflake-mirroring-faq#troubleshoot-mirroring-snowflake-in-microsoft-fabric">Troubleshoot</a> | <a href="https://learn.microsoft.com/en-us/fabric/mirroring/snowflake-mirroring-faq">FAQ</a> |
| SQL Server | <a href="https://learn.microsoft.com/en-us/fabric/mirroring/sql-server-limitations">Limitations</a> | <a href="https://learn.microsoft.com/en-us/fabric/mirroring/sql-server-troubleshoot">Troubleshoot</a> | <a href="https://learn.microsoft.com/en-us/fabric/mirroring/sql-server-faq">FAQ</a> |

For general scenarios that apply to every source (capacity paused or throttled, data not appearing, stop and restart replication, table and change-data limits), see <a href="https://learn.microsoft.com/en-us/fabric/mirroring/troubleshooting">Troubleshoot Fabric mirrored databases</a>.



<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/point1.png"><b>Self-Guided Activity: Examine insights into common mirroring challenges</b></p>


The following video discusses five errors that could prevent the use of technology for forklifting, locating changes, and migrating those changes from your online transaction processing (OLTP) database into Microsoft Fabric.

<p><img style="margin: 0px 15px 15px 0px;" src="../graphics/checkmark.png"><b>Steps</b></p>

- For a comprehensive introduction to troubleshooting mirroring concepts, watch the following video:

     <p><a href="https://www.youtube.com/watch?v=eID9cbAsdk0"><img src="https://img.youtube.com/vi/eID9cbAsdk0/0.jpg" alt="Tales From The Field video: Troubleshooting Microsoft Fabric mirroring for Azure SQL" height=200></a>

<p style="border-bottom: 1px solid lightgrey;"></p>

<p><img style="margin: 0px 15px 15px 0px;" src="../graphics/owl.png"><b>For Further Study</b></p>
<ul>
  <li><a href="https://learn.microsoft.com/en-us/fabric/mirroring/explore" >Explore data in your mirrored database using Microsoft Fabric</a></li>
  <li><a href="https://learn.microsoft.com/en-us/fabric/mirroring/azure-cosmos-db" >Mirroring Azure Cosmos DB</a></li>
  <li><a href="https://learn.microsoft.com/en-us/fabric/mirroring/azure-databricks" >Mirroring Azure Databricks Unity Catalog</a></li>
  <li><a href="https://learn.microsoft.com/en-us/fabric/mirroring/snowflake" >Mirroring Snowflake</a></li>
</ul>

<p style="border-bottom: 1px solid lightgrey;"></p>

Congratulations! You have completed this Module. If you understand the concepts here and have completed all of the Activities, you can [proceed to the next Module](06%20-%20Real-Time%20Intelligence.md).
