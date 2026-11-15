![](../graphics/microsoftlogo.png)

# Workshop: Microsoft Fabric Overview for the Data Professional

#### <i>A workshop from the Tales from the Field team</i>

<p style="border-bottom: 1px solid lightgrey;"></p>

<img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/textbubble.png"> <h2> 07 - Copilots, Data Agents & Fabric IQ </h2>

In this workshop you'll cover using The Microsoft Fabric Platform to implement a complete Analytics solution.

In each module you'll get more references, which you should follow up on to learn more. Also watch for links within the text - click on each one to explore that topic.

(<a href="00%20-%20Pre-Requisites.md" >Make sure you check out the <b>Pre-Requisites</b> page before you start</a>. You'll need all of the items loaded there before you can proceed with the workshop.) *Note in this section you will need an F2 and higher or a P-SKU in order to test or access Copilot or Data Agents, formerly known in preview as AI Skills.

In this module you will learn where Copilot helps you inside Microsoft Fabric, how Copilot differs from data agents and operations agents, and how Fabric IQ and ontologies give those agents a shared understanding of your business.

You'll cover these topics in this Module on Copilots, Data Agents & Fabric IQ:

<dl>

  <dt><a href="#7-1" >7.1 - Copilots, Data Agents & Operations Agents: Differences & Requirements</a></dt>
  <dt><a href="#7-2" >7.2 - Copilot in Microsoft Fabric</a></dt>
  <dt><a href="#7-3" >7.3 - What is Fabric IQ?</a></dt>
  <dt><a href="#7-4" >7.4 - Ontology</a></dt>
  <dt><a href="#7-5" >7.5 - Fabric Data Agents</a></dt>
  <dt><a href="#7-6" >7.6 - Operations Agents</a></dt>

</dl>

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2 id="7-1"><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/pencil2.png">7.1 - Copilots, Data Agents & Operations Agents: Differences & Requirements</h2>

In this section, we will explore the **Copilot** and **Data Agents** features within Microsoft Fabric, highlighting their differences, use cases, and how they can enhance your data workflows.  At the time of the publishing of this course, both **Copilot** and **Data Agents** require an F64 capacity in order to utilize their functionality.

## What is Copilot?

**Copilot** acts as an intelligent assistant designed to streamline various tasks within Microsoft Fabric. It provides real-time support for data professionals by:

- **Generating SQL Queries**: Copilot can help you write SQL code quickly and efficiently, making it easier to interact with your data.
- **Code Completion**: It offers contextual suggestions as you type, reducing the time spent on routine coding tasks.
- **Troubleshooting and Documentation**: Copilot assists in debugging and provides documentation references to help you understand complex processes.



## What is Data Agents?

**Data Agents** is a tool that allows users to configure a generative AI assistant tailored to their specific data needs. Key features include:

- **Natural Language Processing**: Users can ask questions in plain language, and Data Agents generates the corresponding SQL queries.
- **Customization**: You can configure Data Agents to include business context, making it adaptable to your organization’s requirements.
- **Accessibility**: Data Agents enables non-technical users to interact with data without needing SQL knowledge, fostering a self-service data culture.

For more information, visit the Data Agents creation guide (https://learn.microsoft.com/en-us/fabric/get-started/copilot-fabric-overview).

## Difference between an Data Agents and a copilot
The technology behind the Data Agents and the Fabric copilots is similar. They both use generative AI to reason over data. They also have some key differences:

- Configuration: With an Data Agents, you can configure the AI to behave the way you need. You can provide it with instructions and examples that tune it to your specific use case. A Fabric copilot doesn't offer this configuration flexibility.

- Use case: A copilot can help you do your work on Fabric. It can help you generate notebook code or data warehouse queries. In contrast, the Data Agents operates independently. You can eventually connect it to Microsoft Teams and other areas outside of Fabric.


<p style="border-bottom: 1px solid lightgrey;"></p>

<h2 id="7-2"><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/pencil2.png">7.2 - Copilots in Microsoft Fabric</h2>

Copilot and other generative AI features in preview bring new ways to transform and analyze data, generate insights, and create visualizations and reports in Microsoft Fabric and Power BI.

## Enable Copilot
Before your business can start using Copilot capabilities in Microsoft Fabric, you need to enable Copilot.  To understand how to enable Copilot right click on this link to open in another window, <a href="https://learn.microsoft.com/en-us/fabric/get-started/copilot-enable-fabric">Enable Copilot in Fabric</a>.

Read on for answers to your questions about how it works in the different workloads, how it keeps your business data secure and adheres to privacy requirements, and how to use generative AI responsibly.

### Copilot experiences at a glance

Each Fabric workload has its own Copilot, built into the item you're working in. They share a common architecture, but each one does different things. Use this table to find the Copilot for the job in front of you.

| Workload | Where you find it | What Copilot does for you | Status |
|---|---|---|---|
| Data Engineering & Data Science | [Notebooks](https://learn.microsoft.com/en-us/fabric/data-engineering/copilot-notebooks-overview) (chat pane and in-cell) | Understands the attached lakehouse, the notebook, and the runtime state as soon as you open it. Generates code or markdown across the whole notebook, refactors and adds comments, analyzes and visualizes data, and suggests performance fixes. [Fix with Copilot](https://learn.microsoft.com/en-us/fabric/data-engineering/copilot-notebooks-chat-pane#diagnose-notebook-failures) summarizes a failed cell or Spark job, finds the root cause, and proposes a fix you approve from a diff (or use `/fix`). | Preview |
| Data Factory | [Dataflow Gen2](https://learn.microsoft.com/en-us/fabric/data-factory/copilot-fabric-data-factory-get-started#get-started-with-copilot-for-dataflow-gen2) | Gets data from a source you describe, adds transformation steps from plain English (for example, "only keep European customers"), creates new queries including sample data, explains the current query, and undoes the last step. | GA |
| Data Factory | [Pipelines](https://learn.microsoft.com/en-us/fabric/data-factory/copilot-fabric-data-factory-get-started#generate-a-pipeline-with-copilot) | Generates a pipeline and its activities from a description (for example, "copy data from SQL Server to Azure Data Lake"), then runs it. Summarizes an existing pipeline and how its activities relate. | GA |
| Data Factory | [Pipeline error assistant](https://learn.microsoft.com/en-us/fabric/data-factory/copilot-fabric-data-factory-get-started#troubleshoot-pipeline-errors-with-copilot) | Explains a failed pipeline run in plain language and gives actionable troubleshooting steps. | GA |
| Data Factory | [Pipeline expression builder](https://learn.microsoft.com/en-us/fabric/data-factory/copilot-pipeline-expression-builder) | Writes pipeline expressions (the dynamic content language) from natural language, such as converting UTC to a time zone and formatting a folder path, and explains existing expressions. You can accept, discard, or retry each suggestion. | Preview |
| Data Warehouse | SQL query editor | [Natural language to SQL](https://learn.microsoft.com/en-us/fabric/data-warehouse/copilot-chat-pane) in the chat pane, [code completion](https://learn.microsoft.com/en-us/fabric/data-warehouse/copilot-code-completion) as you type, and [Fix and Explain quick actions](https://learn.microsoft.com/en-us/fabric/data-warehouse/copilot-quick-action) for T-SQL queries. | Preview |
| SQL database | Fabric query editor, SSMS 22, and the MSSQL extension for VS Code | [Natural language to SQL](https://learn.microsoft.com/en-us/fabric/database/sql/copilot-chat-pane), [code completion](https://learn.microsoft.com/en-us/fabric/database/sql/copilot-code-completion), [Fix and Explain](https://learn.microsoft.com/en-us/fabric/database/sql/copilot-quick-actions), and document-based Q&A. In SSMS it also helps analyze execution plans; in VS Code, GitHub Copilot adds chat and Agent Mode grounded in the connected database. | GA |
| Power BI | Semantic models (Desktop and service) | Suggests [Q&A synonyms](https://learn.microsoft.com/en-us/power-bi/natural-language/q-and-a-copilot-enhancements) and [measure descriptions](https://learn.microsoft.com/en-us/power-bi/transform-model/desktop-measure-copilot-descriptions), [writes and explains DAX queries](https://learn.microsoft.com/en-us/dax/dax-copilot), and [answers questions about your data](https://learn.microsoft.com/en-us/power-bi/create-reports/copilot-ask-data-question). AI auto-summary for semantic models is in preview. | GA |
| Power BI | Reports (Desktop, service, and mobile) | [Suggests a report page](https://learn.microsoft.com/en-us/power-bi/create-reports/copilot-create-desktop-report) or [a visual](https://learn.microsoft.com/en-us/power-bi/create-reports/copilot-create-report-service), [summarizes data in a narrative visual](https://learn.microsoft.com/en-us/power-bi/create-reports/copilot-create-narrative), and [explains a report page or visual](https://learn.microsoft.com/en-us/power-bi/create-reports/copilot-pane-summarize-content). | GA |
| Power BI | Power BI apps | App-scoped Copilot that searches the app's reports, answers questions, and summarizes content, limited to what the app contains. | Preview |
| Real-Time Intelligence | [KQL queryset](https://learn.microsoft.com/en-us/fabric/fundamentals/copilot-for-writing-queries) | Turns natural-language questions into KQL queries, then lets you refine or explore a previously generated query. | GA |
| Real-Time Intelligence | Real-Time Dashboards | [Generates a dashboard](https://learn.microsoft.com/en-us/fabric/fundamentals/copilot-generate-dashboard), creates or refines the KQL behind a tile from a prompt, and helps you [explore dashboard data](https://learn.microsoft.com/en-us/fabric/real-time-intelligence/dashboard-explore-data). | GA |
| Real-Time Intelligence | [Operations agent](https://learn.microsoft.com/en-us/fabric/real-time-intelligence/operations-agent) setup | Copilot chat turns what you want monitored into the agent's goals, rules, and backing queries, and flags unclear instructions or missing data before you start the agent. See <a href="#7-6">7.6</a>. | GA |

> **Note:** Status reflects Microsoft Learn's <a href="https://learn.microsoft.com/en-us/fabric/fundamentals/copilot-ai-feature-state">Release status of AI and Copilot experiences in Fabric</a> page and the individual feature pages at the time of writing. Copilot changes quickly, so check that page for the latest. Data agents aren't in this table because they're a separate, configurable item; see <a href="#7-5">7.5</a>.

The sections below walk through each workload's Copilot in more detail.

### Copilot for Data Science and Data Engineering
Copilot for Data Engineering and Data Science is an AI-enhanced toolset tailored to support data professionals in their workflow. It provides intelligent code completion, automates routine tasks, and supplies industry-standard code templates to facilitate building robust data pipelines and crafting complex analytical models. Utilizing advanced machine learning algorithms, Copilot offers contextual code suggestions that adapt to the specific task at hand, helping you code more effectively and with greater ease. From data preparation to insight generation, Microsoft Fabric Copilot acts as an interactive aide, lightening the load on engineers and scientists and expediting the journey from raw data to meaningful conclusions.

<p><a href="https://www.youtube.com/watch?v=GOq5gOdKEVs"><img src="https://img.youtube.com/vi/GOq5gOdKEVs/0.jpg" height = 200></a> 

### Copilot for Data Factory
Copilot for Data Factory is an AI-enhanced toolset that supports both citizen and professional data wranglers in streamlining their workflow. It provides intelligent code generation to transform data with ease and generates code explanations to help you better understand complex tasks.

<p><a href="https://www.youtube.com/watch?v=ckw6tZPzP7Y"><img src="https://img.youtube.com/vi/ckw6tZPzP7Y/0.jpg" height = 200></a> 

### Copilot for Data Warehouse
Microsoft Copilot for Synapse Data Warehouse is an AI assistant designed to streamline your data warehousing tasks. Key features of Copilot for Warehouse include Natural Language to SQL, code completion, quick actions, and intelligent insights. For more information, see <a href="https://learn.microsoft.com/en-us/fabric/data-warehouse/copilot">Copilot for Data Warehouse</a>.

<p><a href="https://www.youtube.com/watch?v=WC-mxioPp_8"><img src="https://img.youtube.com/vi/WC-mxioPp_8/0.jpg" height = 200></a> 

### Copilot for Power BI
Power BI has introduced generative AI that allows you to create reports automatically by selecting the topic for a report or by prompting Copilot for Power BI on a particular topic. You can use Copilot for Power BI to generate a summary for the report page that you just created, and generate synonyms for better Q&A capabilities.

For more information on the features and how to use Copilot for Power BI, see <a href="https://learn.microsoft.com/en-us/power-bi/create-reports/copilot-introduction">Overview of Copilot for Power BI</a>.

<p><a href="https://www.youtube.com/watch?v=iTI2HUWLvVI"><img src="https://img.youtube.com/vi/iTI2HUWLvVI/0.jpg" height = 200></a> 

### Copilot for Real-Time Intelligence
Copilot for Real-Time Intelligence is an advanced AI tool designed to help you explore your data and extract valuable insights. You can input questions about your data, which are then automatically translated into Kusto Query Language (KQL) queries. Copilot streamlines the process of analyzing data for both experienced KQL users and citizen data scientists.

For more information, see <a href="https://learn.microsoft.com/en-us/fabric/real-time-intelligence/copilot-real-time-intelligence">Copilot for Real-Time Intelligence overview</a>.

<p><a href="https://www.youtube.com/watch?v=WC-mxioPp_8"><img src="https://img.youtube.com/vi/WC-mxioPp_8/0.jpg" height = 200></a> 

### Create your own AI solution accelerators
Build your own copilots
Using the client advisor AI accelerator tool, you can build custom copilot with your enterprise data. The client advisor AI accelerator uses Azure OpenAI Service, Azure AI Search, and Microsoft Fabric to create custom Copilot solutions. This all-in-one custom copilot empowers client advisors to use generative AI across structured and unstructured data optimizing daily tasks and fostering better interactions with clients. To learn more, see the GitHub repo.

<p><a href="https://www.youtube.com/watch?v=0jOEUeOykzQ"><img src="https://img.youtube.com/vi/0jOEUeOykzQ/0.jpg" height = 200></a> 

<p><a href="https://www.youtube.com/watch?v=8da4smSAoEk"><img src="https://img.youtube.com/vi/8da4smSAoEk/0.jpg" height = 200></a> 

For more details, check out the [Overview of Copilot in Fabric](https://learn.microsoft.com/en-us/fabric/get-started/copilot-fabric-overview) (https://blog.fabric.microsoft.com/en-us/blog/data-warehouse-copilot-ai-skill/).

[You can find the complete list of Microsoft Purview learning and reference resources at this location.](https://learn.microsoft.com/en-us/training/purview/)



<p style="border-bottom: 1px solid lightgrey;"></p>


<h2 id="7-3"><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/pencil2.png">7.3 - What is Fabric IQ?</h2>
<br></br>

**Fabric IQ is a marketing term, not a single product, item, or button.** It's the name Microsoft gives to a collection of technologies inside Microsoft Fabric that help companies and organizations build intelligence onto their data. Fabric IQ takes the data you've already unified in OneLake and raises it to the language of your business (customers, orders, shipments, assets) so that people, applications, and AI agents interpret it the same way and can reason and act on it, instead of working only with tables, columns, and joins.

In the Fabric portal, you'll see this as the **IQ** workload (preview): a grouping of related Fabric items. Several of those items also belong to other workloads, such as Data Science, Real-Time Intelligence, and Power BI. OneLake is the foundation underneath all of them.

### Fabric IQ is part of Microsoft IQ

Fabric IQ is one of four "IQ" layers that Microsoft groups under **Microsoft IQ**, the enterprise intelligence layer of the Microsoft stack. Each layer gives Copilot and agents a different kind of context:

| IQ layer | Gives Copilot and agents context about |
|---|---|
| **Fabric IQ** | The state of your business: business entities and the analytical, real-time, and operational data behind them |
| **Work IQ** | How your people work: email, meetings, chats, files, people, and connected business apps |
| **Foundry IQ** | Your organization's policies and authoritative documents |
| **Web IQ** | Information from the public web |

### What is Work IQ?

**Work IQ** is the workplace intelligence layer behind Microsoft 365 Copilot. It continuously builds a semantic understanding of your organization's work across Microsoft 365 (mail, calendar, chats, meetings, files, sites, and people) and business data from Dynamics 365 and Power Platform. Copilot Chat, the Microsoft 365 apps, and prebuilt agents such as Researcher and Analyst use it, and developers can call it from their own agents through a remote MCP server, agent-to-agent (A2A), or a REST API.

Work IQ is permission-aware: every request runs as a specific user and only reaches what that user is allowed to see.

### How Fabric IQ and Work IQ connect

Put simply, **Work IQ knows what your people are working on, and Fabric IQ knows what your business data says.** When the two come together, Microsoft 365 Copilot can ground an answer in governed Fabric data and then reconcile it with the user's files, chats, and email. For example, a seller preparing for a customer meeting can get the account's latest numbers alongside the related emails and meeting notes.

- **Power BI data in Microsoft 365 Copilot Chat (GA).** Users with a Microsoft 365 Copilot license can ask data questions in Copilot Chat. Copilot finds a relevant Power BI report they have access to and answers from its semantic model, respecting row-level and object-level security and sensitivity labels. See <a href="https://learn.microsoft.com/en-us/fabric/iq/connectors/microsoft-365-copilot-overview">Fabric IQ in Microsoft 365 Copilot Chat</a>.
- **Fabric data agents in Microsoft 365 Copilot.** A data agent (see <a href="#7-5">7.5</a>) can be published as a Microsoft 365 agent so people can query lakehouses, warehouses, KQL databases, semantic models, and ontologies from Copilot. Data agents and ontologies don't answer in Copilot Chat until an agent is explicitly published.
- **Governance carries across.** Purview sensitivity labels and data loss prevention policies still apply, and admins control the connection with tenant settings in both the Microsoft 365 admin center (*Fabric data available in M365 Copilot*) and the Fabric admin portal (*Share Fabric data with your Microsoft 365 services*).

### What's inside Fabric IQ, and what this workshop covers

The IQ workload contains six items. **In this workshop we focus on three of them: ontologies, data agents, and operations agents.** The others are listed so you know they exist, but we won't cover them here.

| Fabric IQ item | What it does | In this workshop |
|---|---|---|
| **Ontology** (preview) | A shared business vocabulary (entity types, properties, relationships, rules, and metrics) bound to your data so people and agents use the same definitions | **Yes**, see <a href="#7-4">7.4</a> |
| **Data agent** | A conversational Q&A agent over your Fabric data, grounded in semantic models and ontologies | **Yes**, see <a href="#7-5">7.5</a> |
| **Operations agent** | Monitors real-time data, detects conditions you care about, and recommends or takes governed actions | **Yes**, see <a href="#7-6">7.6</a> |
| Power BI semantic model | Curated measures, hierarchies, and relationships for reporting; ontologies can be generated from them | Only as a source for ontologies |
| Graph (preview) | Stores and traverses relationships for multi-hop and impact questions; integrated with ontology | No |
| Planning | Planning, forecasting, and plan-versus-actuals over semantic models | No |

How the three fit together: **the ontology defines what your business means, data agents answer questions in that language, and operations agents watch live data in that language and act on it.**

Learn more: <a href="https://learn.microsoft.com/en-us/fabric/iq/overview">What is Fabric IQ?</a> | <a href="https://learn.microsoft.com/en-us/microsoft-365/copilot/extensibility/work-iq/">Work IQ overview</a> | <a href="https://learn.microsoft.com/en-us/fabric/iq/connectors/microsoft-365-copilot-overview">Fabric IQ in Microsoft 365 Copilot Chat</a>

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2 id="7-4"><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/pencil2.png">7.4 - Ontology</h2>
<br></br>

An **ontology** (preview) is the business vocabulary of Fabric IQ. It defines the things your organization cares about (customers, products, stores, shipments, machines), their properties, how they relate to each other, and the rules and metrics that give them business meaning. You then **bind** those definitions to data you already have in Fabric, so people, applications, and AI agents all use the same language and the same definitions.

Put simply: your lakehouse knows a table called `dim_customer`; your ontology knows **Customer**.

> **Important:** Ontology is in preview. The old ontology experience retires on **January 31, 2027**. If you built an ontology in the old experience, use the in-product action to copy it into the new experience, then reconnect any agents or dashboards to the new item. See <a href="https://learn.microsoft.com/en-us/fabric/iq/ontology/overview#migrate-from-old-experience">Migrate from old experience</a>.

### Why use an ontology?

Most organizations describe the same concept differently across sources, semantic models, applications, and teams. An ontology gives you one common context layer so you can:

- **Model the business in business terms**, independent of any single physical table.
- **Reuse what you already built** by generating an ontology from a Power BI semantic model, including its relationships, calculated columns, and DAX measures.
- **Leave the data where it is.** An ontology is a virtual layer. Bindings point at the source system, and nothing is copied into the ontology.
- **Give every agent the same context**, so answers stay consistent across teams and tools instead of depending on how each prompt was written.

### How ontology fits in Fabric IQ

Ontology is the **business context and semantic modeling layer** between your data and the experiences that consume it. It stores and serves definitions and bindings, but it is **not a query engine**. Agents and dashboards read the ontology for context, then run their queries against the bound source.

![Graphic showing how ontology in Fabric gives a live, unified view of the business.](https://learn.microsoft.com/en-us/fabric/iq/ontology/media/overview/ontology-fabric-iq-overview.png)

### Core concepts

| Concept | What it is | Example |
|---|---|---|
| **Entity type** | The reusable definition of a business concept, independent of any one source table | Customer, Store, Machine |
| **Entity instance** | A data-backed occurrence of an entity type | One specific store or machine |
| **Property** | A named, typed characteristic of an entity type, mapped to fields in one or more sources | A machine's operating state |
| **Relationship** | How two entity types connect | Customer *places* Order; Machine *belongs to* Production Line |
| **Metric** | A governed calculation. In preview, metrics come from DAX measures in a source semantic model, which stays the owner of the DAX | Revenue, on-shelf availability |
| **Rule** | Business logic written in natural language and linked to entity types, properties, and relationships | What "below safety stock" means |
| **Namespace** | A scope that organizes elements, useful when several domains or teams own concepts | Sales, Supply Chain |
| **Data binding** | The mapping from a definition to the source data that supplies it | Store details bound to a lakehouse table; freezer temperature bound to an eventhouse |

Two modeling features help as an ontology grows: **inheritance** (for example, *Frozen product* is a type of *Product*) and **shared properties** (define a property once and reuse it across entity types).

### What can an ontology bind to?

During preview, bindings can point to **semantic models, lakehouses, eventhouses, warehouses, SQL databases, mirrored databases**, and OneLake shortcuts, views, and materialized views. This is where the workshop comes together: anything you mirrored in <a href="05%20-%20Introduction%20to%20Mirroring%20in%20Fabric.md">Module 05</a> can be bound into an ontology without copying it again.

### Two ways to build an ontology

1. **Generate it from a Power BI semantic model.** The model's tables and relationships become the starting structure, and its measures appear as metrics. Start here when you already have a trusted semantic model. See <a href="https://learn.microsoft.com/en-us/fabric/iq/ontology/how-to-generate-from-semantic-models">Generate an ontology from semantic models</a>.
2. **Build it from scratch.** Create entity types, bind data, and add relationships yourself, or ask the built-in **ontology agent** to help.

The **ontology agent** is a chat experience inside the ontology item. It can draft definitions and bindings from connected Fabric sources, describe the ontology, answer business questions by querying the data behind it (using DAX, KQL, SQL, or GQL), and suggest improvements. It works **proposal-first**: you review each change before it's applied. See <a href="https://learn.microsoft.com/en-us/fabric/iq/ontology/how-to-use-ontology-agent">Use the ontology agent</a>.

### Who uses an ontology?

An ontology on its own doesn't answer questions; something has to consume it. These are the supported consumers:

| Consumer | Best for | In this workshop |
|---|---|---|
| Ontology agent | Building, improving, and testing queries on the ontology | This section |
| Fabric data agent | Interactive Q&A over Fabric data with ontology context | <a href="#7-5">7.5</a> |
| Fabric operations agent | Continuous monitoring with recommended or automated actions | <a href="#7-6">7.6</a> |
| Foundry IQ agent | Developer-built agents with tool calling and enterprise integration | Not covered |
| Copilot Studio agent | Low-code agents connected through the Fabric IQ MCP tool | Not covered |
| Custom agents (ontology MCP server) | Any MCP-compatible client or custom agent | Not covered |
| Real-Time Dashboards | Visual exploration of ontology-backed data | Not covered |

See <a href="https://learn.microsoft.com/en-us/fabric/iq/ontology/concepts-agent-integration">Agent integration options for ontology</a> to compare them.

### Graph is optional

**Graph** is an opt-in execution layer for questions where the relationship path matters, such as multi-hop traversal, dependency analysis, or shortest path. An ontology doesn't load instance data into a graph by default; you choose to materialize it when you need it. Routine lookups, aggregations, and metrics keep running against their source systems.

### Governance, lifecycle, and interoperability

- **Security follows the data.** Workspace and item permissions control access to the ontology, and queries respect OneLake security and source row-level, object-level, and column-level security.
- **Version history.** Create named checkpoints manually and restore a known state.
- **Standards.** Import RDF, Turtle, or OWL definitions into an empty ontology, and export to RDF or Turtle.
- **Developer tooling.** REST APIs and Fabric CI/CD are supported.

### Before you start: tenant settings and capacity

- **Tenant settings:** a Fabric administrator enables *Users can create Fabric items* and *Users can create ontology (preview) items*. If you plan to connect a data agent or operations agent, their tenant settings must be enabled too. See <a href="https://learn.microsoft.com/en-us/fabric/iq/ontology/overview-tenant-settings">Required tenant settings for ontology</a>.
- **Capacity:** Microsoft Learn suggests starting evaluation on an **F8** (an F4 might suit light testing). Usage appears in the Capacity Metrics app as *Ontology Discovery*, *Ontology Logic and Operations*, and *Ontology AI Reasoning*. Learn's example estimates are about 0.5 to 1 CU-hours for a small ontology agent edit and about 20 CU-hours for drafting a full ontology from a workspace.
- **Tip:** close the ontology item when you're done. While it's open, it refreshes its definition automatically about every 20 minutes, and each refresh consumes capacity. See <a href="https://learn.microsoft.com/en-us/fabric/iq/ontology/resources-capacity-usage">Billing and capacity usage for ontology</a>.

<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/point1.png"><b>Self-Guided or in Class Activity: Build your first ontology</b></p>

In this Activity you will follow the Microsoft Learn ontology tutorial for Lakeshore Retail, a fictional retailer that sells ice cream and tracks sales and refrigerator telemetry. You'll load sample data into a lakehouse and an eventhouse, import a semantic model, create entity types such as Store, Products, and Sale, bind them to data, enrich the ontology, and then ask the ontology agent questions such as "What is the top product by revenue across all stores?"

<p><img style="margin: 0px 15px 15px 0px;" src="../graphics/checkmark.png"><b>Steps</b></p>

- [Part 0: Introduction and environment setup](https://learn.microsoft.com/en-us/fabric/iq/ontology/tutorial-0-introduction)
- [Part 1: Create an ontology](https://learn.microsoft.com/en-us/fabric/iq/ontology/tutorial-1-create-ontology)
- [Part 2: Enrich the ontology](https://learn.microsoft.com/en-us/fabric/iq/ontology/tutorial-2-enrich-ontology)
- [Part 3: Explore the ontology](https://learn.microsoft.com/en-us/fabric/iq/ontology/tutorial-3-preview-ontology)
- [Part 4: Use the ontology agent](https://learn.microsoft.com/en-us/fabric/iq/ontology/tutorial-4-use-agent)
- [Part 5: Conclude and clean up resources](https://learn.microsoft.com/en-us/fabric/iq/ontology/tutorial-5-conclusion)

> If you only reviewed the documentation in this Activity, ensure you bookmark each of these references and then perform the Activity in full once you do have your deployment.

Learn more: <a href="https://learn.microsoft.com/en-us/fabric/iq/ontology/overview">What is ontology?</a> | <a href="https://learn.microsoft.com/en-us/fabric/iq/ontology/resources-glossary">Ontology glossary</a> | <a href="https://learn.microsoft.com/en-us/fabric/iq/ontology/resources-troubleshooting">Troubleshoot ontology</a>

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2 id="7-5"><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/pencil2.png">7.5 - Fabric Data Agents</h2>

With the Microsoft Fabric Data Agents, you can make data more accessible to your colleagues. You can configure a generative AI system to generate queries that answer questions about your data. After you configure the Data Agents, you can share it with your colleagues, who can then ask their questions in plain English. Based on their questions, the AI generates queries over your data that answer those questions.

## How the Data Agents works
The Data Agents relies on generative AI, specifically, large language models (LLMs). These LLMs can generate queries, for example, T-SQL queries, based on a specific schema and a question. The system sends a question in the Data Agents, information about the selected data (including the table and column names, and the data types found in the tables) to the LLM. Next, it requests generation of a T-SQL query that answers the question. Parse the generated query to first ensure that it doesn't change the data in any way. Then execute that query. Finally, show the query execution results. An Data Agents is intended to access specific database resources, and then generate and execute relevant T-SQL queries.

## Data Agents configuration
Think of the Data Agents as you might think about Power BI reports. You first build the report, and then you share the report with your colleagues who can consume it to get their data insights. The Data Agents works in a similar way. You need to first create and configure the Data Agents. Then, you can share it with your colleagues.

You should expect to handle some necessary configuration steps before the Data Agents works properly. An Data Agents can often provide out-of-the-box answers to reasonable questions, but it could provide incorrect answers for your specific situation. Incorrect answers typically occur because the AI is missing context about your company, setup, or definition of key terms. To solve the problem, provide the AI with instructions and example question-query pairs. You can use these powerful techniques to guide the AI to the right answers.

Microsoft Fabric: Data Agents Preview! Build RAG Patterns Simple and Easy!


<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/point1.png"><b>Self-Guided or in Class Activity: Create an Data Agents</b></p>

In this Activity you will execute code from the following exercises to create  AdventureWorks tables in a Microsoft Fabric Lakehouse.  You will then provision an Data Agents and follow the steps in the tutorial to publish the skill and access it in a Microsoft Fabric Notebook.

<p><img style="margin: 0px 15px 15px 0px;" src="../graphics/checkmark.png"><b>Steps</b></p>


- [Data Agents example with the AdventureWorks dataset](https://learn.microsoft.com/en-us/fabric/data-science/ai-skill-scenario) 


> If you only reviewed the documentation in this Activity, ensure you bookmark each of these references and then perform the Activity in full once you do have your deployment. 

<a href="https://www.youtube.com/watch?v=5ivA4zdnDtE"><img src="https://img.youtube.com/vi/5ivA4zdnDtE/0.jpg" height = 200></a> 

<p><a href="https://www.youtube.com/watch?v=cuF00-iV_YA"><img src="https://img.youtube.com/vi/cuF00-iV_YA/0.jpg" height = 200></a> 

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2 id="7-6"><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/pencil2.png">7.6 - Operations Agents</h2>

> **Coming soon:** This section is being written.

<p style="border-bottom: 1px solid lightgrey;"></p>

<p><img style="margin: 0px 15px 15px 0px;" src="../graphics/owl.png"><b>For Further Study</b></p>
<ul>
  <li><a href="https://learn.microsoft.com/en-us/fabric/get-started/copilot-privacy-security">Privacy, security, and responsible use of Copilot in Fabric</a></li>
  <li><a href="https://learn.microsoft.com/en-us/fabric/get-started/copilot-fabric-consumption">Copilot in Fabric consumption</a></li>
  <li><a href="https://learn.microsoft.com/en-us/fabric/get-started/copilot-faq-fabric" >Copilot for Microsoft Fabric and Power BI: FAQ</a></li>
  <li><a href="https://learn.microsoft.com/en-us/fabric/data-science/ai-skill-tenant-switch" >Data Agents tenant settings</a></li>
    <li><a href="https://learn.microsoft.com/en-us/fabric/data-science/ai-skill-sharing" >Data Agents sharing and permission management</a></li>
  <li><a href="https://learn.microsoft.com/en-us/fabric/get-started/whats-new" >As always, this is a fast-changing technology, so ensure you check this reference to find the latest improvements.</a></li>
</ul>

<p style="border-bottom: 1px solid lightgrey;"></p>

Congratulations! You have completed this Module. If you understand the concepts here and have completed all of the Activities, you can [proceed to the next Module](08%20-%20OLTP%20Databases%20in%20Fabric.md).



