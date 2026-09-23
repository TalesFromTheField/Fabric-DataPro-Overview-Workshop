![](../graphics/microsoftlogo.png)

# Workshop: Microsoft Fabric Overview for the Data Professional

#### <i>A Microsoft Workshop</i>

<p style="border-bottom: 1px solid lightgrey;"></p>

<img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/textbubble.png"> <h2> 08 - Databases In Microsoft Fabric </h2>

In this module you will learn how Microsoft Fabric supports operational data workloads through the Databases workload. You will explore both SQL database in Microsoft Fabric and Cosmos DB database in Microsoft Fabric, and learn how operational data integrates with OneLake, analytics, reporting, and AI-powered applications.

In each module you'll get more references, which you should follow up on to learn more. Also watch for links within the text - click on each one to explore that topic.


(<a href="00%20-%20Pre-Requisites.md" >Make sure you check out the <b>Pre-Requisites</b> page before you start</a>. You'll need all of the items loaded there before you can proceed with the workshop.) 

You'll cover these topics in this Module on Databases in Microsoft Fabric:

<dl>

  <dt><a href="#8-1" >8.0 - Database Hub</a></dt>
  <dt><a href="#8-1" >8.1 - SQL Database in Microsoft Fabric</a></dt>
  <dt><a href="#8-2" >8.2 - Cosmos DB in Microsoft Fabric </a></dt>

</dl>

## Databases in Fabric Architecture

Microsoft Fabric now includes a dedicated Databases workload that supports both relational and NoSQL operational databases.

The Databases workload includes:

- SQL Database in Microsoft Fabric
- Cosmos DB Database in Microsoft Fabric

Both database types automatically integrate with OneLake, making operational data immediately available for analytics, reporting, AI, and machine learning workloads.

This allows organizations to build translytical solutions that combine operational and analytical processing within a unified platform.

<h2 id="8.0"><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/pencil2.png">8.0 Database Hub</h2>

## Database Hub

Database Hub is the centralized experience for working with databases in Microsoft Fabric. It provides a single location where developers, database administrators, and data professionals can discover, create, connect to, and manage database resources across the Fabric environment.

The Database Hub supports the Fabric Databases workload and provides access to both SQL Database and Cosmos DB Database experiences.

### Key Capabilities

Database Hub enables users to:

- Create new SQL Databases and Cosmos DB Databases
- Discover existing database assets
- Access database management tools
- Monitor database activity
- Launch development experiences
- Access database documentation and resources
- Manage operational data assets alongside analytics workloads

Database Hub also provides access to Copilot-enabled experiences that help developers generate queries, write code, and explore database objects using natural language.

### Benefits of Database Hub

Database Hub helps organizations:

- Reduce complexity by providing a single entry point for database workloads
- Simplify database discovery and management
- Improve collaboration between developers and data professionals
- Connect operational and analytical workloads within a unified platform
- Accelerate application development through integrated Fabric experiences

### Database Hub and OneLake

Databases created through the Fabric Databases workload integrate directly with OneLake. This integration enables operational data to become available for analytics, reporting, machine learning, and AI workloads without requiring complex ETL processes.

As a result, organizations can build solutions that combine operational processing and analytics within a single platform.

<h2 id="8.1"><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/pencil2.png">8.1 SQL Database in Microsoft Fabric</h2>

SQL database in Microsoft Fabric is a developer-friendly transactional database built on the same SQL Database Engine used by Azure SQL Database. It is designed for operational applications while remaining tightly integrated with the Fabric analytics platform.
 
Unlike traditional operational databases, data stored in SQL database is automatically replicated into OneLake in an analytics-ready format, allowing it to be used by Power BI, notebooks, Lakehouses, Data Warehouses, and AI workloads without requiring separate ETL processes.


<img src="https://data-mozart.com/wp-content/uploads/2024/11/image-7-1024x501.png">


## Key Concepts

| Concept | Description |
|----------|-------------|
| SQL Database | A fully managed transactional database for operational workloads. |
| OneLake Integration | Operational data is automatically replicated into OneLake in near real time. |
| SQL Analytics Endpoint | Enables analytical querying of replicated data stored in OneLake. |
| Mirroring | Makes operational data available for analytics across Fabric workloads. |
| TDS Connectivity | Allows connectivity through standard SQL Server compatible clients and drivers. |
| Security | Supports Microsoft Entra ID authentication, authorization, auditing, and governance controls. |
| Copilot | Assists developers with query generation, code completion, and database development tasks. |

### Common Use Cases

SQL database in Microsoft Fabric is commonly used for:

- Line-of-business applications
- Transaction processing systems
- Application backends
- Metadata repositories
- Write-back scenarios from analytics applications
- AI-powered operational applications

Because SQL database is integrated with OneLake, transactional and analytical workloads can operate within a unified data platform.


<img src="https://learn.microsoft.com/en-us/fabric/database/sql/media/mirroring-overview/sql-database-in-fabric-mirroring.svg">


### Connecting to Fabric SQL Database

In Microsoft Fabric, the SQL analytics endpoint and SQL database are accessible through a Tabular Data Stream, or TDS endpoint, familiar to all modern web applications that interact with a SQL Server TDS endpoint. This is referred to as the SQL connection string within the Microsoft Fabric user interface.

The connection string of the SQL database is similar to the connection string of Azure SQL Database, <server-unique-identifer>.database.windows.net. The SQL analytics endpoint connection string looks like <server-unique-identifier>.<tenant>.fabric.microsoft.com.

To find the SQL connection string for your Fabric SQL database:

- Go to the settings of your SQL database item.
- Or, in the item list, select the ... menu. Select Settings then Connection strings. Fabric provides complete connection strings for providers including ADO.NET, JDBC, ODBC, PHP, and Go.
- Or, select the Open in button and SQL Server Management Studio. The server connection information is displayed.

To find the SQL connection string for the SQL analytics endpoint of your Fabric SQL database:

- Go to the settings of your SQL database item, then select SQL endpoint.
- Or, select the ... menu, then select Copy SQL connection string.

You can easy connect to your SQL database with the Open in button in the Fabric portal query editor. Choose SQL Server Management Studio or the mssql extension with Visual Studio Code.

<img src="https://learn.microsoft.com/en-us/fabric/database/sql/media/connect/open-in-connect-button.png#lightbox">

***Connect with SQL Server Management Studio manually***
<img src="https://learn.microsoft.com/en-us/fabric/database/sql/media/connect/sql-server-management-studio-settings.png#lightbox">

In SQL Server Management Studio (SSMS):

1. From your workspace area in the Database workload of Fabric, select the ... next to your SQL database.
2. Select Settings.
3. Select Connection strings. Look for the connection string to your SQL database, including the Data Source=. For example, tcp:<servername>.database.fabric.microsoft.com,1433. The Initial Catalog= is the database name.
4. In SSMS, open a New connection.
5. From the Fabric dialog box, copy and paste the value from Server Name into the Server name.
6. Choose Authentication type: Microsoft Entra ID - Universal with MFA support.
7. Select Options<<.
8. Copy and paste the value from Database Name into the Connect to database text box.
9. Select Connect.
10. Sign in using Microsoft Entra ID - Universal with MFA support.

For more detailed information on connecting or migrating data to Fabric SQL Database view:

<a href="https://www.youtube.com/watch?v=aJ_ekT42WWs"><img src="https://img.youtube.com/vi/aJ_ekT42WWs/0.jpg" height = 200></a>

<p>

<a href="https://www.youtube.com/watch?v=Ae77yoGqqnM"><img src="https://img.youtube.com/vi/Ae77yoGqqnM/0.jpg" height = 200></a>


<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/point1.png"><b>Self-Guided Activity: Work through the Data Catalog Tutorial</b></p>

In this activity, you will follow the basic training tutorial for a full life cycle tutorial for SQL Database in Microsoft Fabric.

<p><img style="margin: 0px 15px 15px 0px;" src="../graphics/checkmark.png"><b>Steps</b></p>

<p>

<img src="https://learn.microsoft.com/en-us/fabric/database/sql/media/tutorial-introduction/architecture-diagram.png">

- [Open the following reference, and follow all of the steps you see there.](https://learn.microsoft.com/en-us/fabric/database/sql/tutorial-create-database) 


<p style="border-bottom: 1px solid lightgrey;"></p>

<h2 id="8-2"><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/pencil2.png">8.2 - Cosmos DB in Microsoft Fabric</h2>

Cosmos DB database in Microsoft Fabric is an AI-optimized NoSQL database that enables organizations to store and query semi-structured and unstructured application data while remaining fully integrated with the Fabric platform.

Built on the same technology as Azure Cosmos DB for NoSQL, Cosmos DB in Fabric provides automatic scaling, low-latency access, built-in high availability, and seamless integration with OneLake.

Cosmos DB and SQL database can be used together within the same Fabric environment, enabling organizations to support both relational and NoSQL application requirements while maintaining a unified analytics platform.

### Key Concepts

| Concept | Description |
|----------|-------------|
| NoSQL Database | Designed for semi-structured and evolving data models. |
| JSON Documents | Stores data in flexible document structures. |
| OneLake Integration | Data is automatically available within OneLake for analytics. |
| Vector Search | Supports vector indexing and similarity search for AI applications. |
| Full Text Search | Supports text-based search and retrieval. |
| Hybrid Search | Combines vector and text search techniques. |
| Automatic Scaling | Dynamically scales to meet workload demands. |

### AI and Modern Application Development
 
Cosmos DB in Microsoft Fabric is designed to support modern AI applications.

Capabilities include:

- Vector storage
- Vector indexing
- Similarity search
- Full text search
- Hybrid search
- Retrieval-Augmented Generation (RAG) scenarios

These features enable developers to build intelligent applications that combine operational data, analytics, and AI capabilities within a single platform.

<p style="border-bottom: 1px solid lightgrey;"></p>

<p><img style="margin: 0px 15px 15px 0px;" src="../graphics/owl.png"><b>For Further Study</b></p>
<ul>
  <li><a href="https://learn.microsoft.com/en-us/fabric/database/sql/overview">SQL database in Microsoft Fabric</a></li>
  <li><a href="https://learn.microsoft.com/en-us/fabric/database/sql/faq">Frequently asked questions for SQL database in Microsoft Fabric</a></li>
  <li><a href="https://learn.microsoft.com/en-us/fabric/database/sql/feature-comparison-sql-database-fabric" >Features comparison: Azure SQL Database and SQL database in Microsoft Fabric</a></li>
  <li><a href="https://learn.microsoft.com/en-us/fabric/database/sql/decision-guide" >Microsoft Fabric decision guide: choose a SQL database</a></li>
    <li><a href="https://learn.microsoft.com/en-us/fabric/fundamentals/decision-guide-data-store?toc=%2Ffabric%2Fdatabase%2Ftoc.json&bc=%2Ffabric%2Fdatabase%2Ftoc.json" >Microsoft Fabric decision guide: choose a data store</a></li>
  <li><a href="https://blog.fabric.microsoft.com/en-us/blog/22987?ft=All" >Announcing Cosmos DB in Microsoft Fabric</a></li>
</ul>

<p style="border-bottom: 1px solid lightgrey;"></p>


Congratulations! You have completed this workshop on *Microsoft Fabric for the Data Professional*. You now have the tools, assets, and processes you need to extrapolate this information into other applications.