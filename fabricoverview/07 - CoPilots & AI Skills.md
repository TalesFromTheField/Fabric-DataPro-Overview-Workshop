![](../graphics/microsoftlogo.png)

# Workshop: Microsoft Fabric Overview for the Data Professional

#### <i>A workshop from the Tales from the Field team</i>

<p style="border-bottom: 1px solid lightgrey;"></p>

<img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/textbubble.png"> <h2> 07 - Copilots, Data Agents & Fabric IQ </h2>

In this workshop, you'll cover using the Microsoft Fabric platform to implement a complete analytics solution.

In each module, you'll get more references, which you should follow up on to learn more. Also watch for links within the text; click each one to explore that topic.

(<a href="00%20-%20Pre-Requisites.md" >Make sure you check out the <b>Pre-Requisites</b> page before you start</a>. You'll need all of the items loaded there before you can proceed with the workshop.) **Note:** In this module, you'll need an F2 or higher capacity or a P-SKU (a Power BI Premium per capacity stock-keeping unit, or SKU) to test or access Copilot or a data agent (formerly known during preview as an <b>AI skill</b>). For the full list of what this module's Activities need, see <a href="00%20-%20Pre-Requisites.md#module-07-activities">For the Module 07 Activities</a> in section 0.2 of the Pre-Requisites page.

In this module, you will learn where Copilot helps you inside Microsoft Fabric, how Copilot differs from data agents and operations agents, and how Fabric IQ and ontologies give those agents a shared understanding of your business.

You'll cover these topics in this Module on Copilots, Data Agents & Fabric IQ:

<dl>

  <dt><a href="#7.1" >7.1 - Copilots, Data Agents & Operations Agents: Differences & Requirements</a></dt>
  <dt><a href="#7.2" >7.2 - Copilots in Microsoft Fabric</a></dt>
  <dt><a href="#7.3" >7.3 - What is Fabric IQ?</a></dt>
  <dt><a href="#7.4" >7.4 - Ontology</a></dt>
  <dt><a href="#7.5" >7.5 - Fabric Data Agents</a></dt>
  <dt><a href="#7.6" >7.6 - Operations Agents</a></dt>

</dl>

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2 id="7.1"><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/pencil2.png">7.1 Copilots, Data Agents & Operations Agents: Differences & Requirements</h2>


Microsoft Fabric gives you three kinds of AI help, and this module covers all three. They use similar generative AI technology, but they do very different jobs. The quickest way to tell them apart: **Copilot helps you build, a data agent answers questions, and an operations agent watches and acts.**

| | Copilot | Data agent | Operations agent |
|---|---|---|---|
| **What it is** | An AI assistant built into each Fabric workload | A Fabric item you build for conversational Q&A over your data | A Fabric item you build to monitor live data and recommend or take actions |
| **Who it's for** | People building and working in Fabric | Business users and analysts asking questions | Operations teams responsible for a business process |
| **Can you configure it?** | No. It comes preconfigured; admins only control where it's turned on | Yes: agent instructions, data source instructions, and example queries | Yes: goals, instructions, rules (the playbook), and actions |
| **How it starts work** | You ask, inside the item you're working on | Someone asks it a question | It runs continuously, checking its rules every 5 minutes |
| **Data it works with** | The item you're working in | Up to five sources: Lakehouses, Warehouses, semantic models, Kusto Query Language (KQL) databases, mirrored databases, ontologies, and Microsoft Graph | One source: an Eventhouse (KQL database) or an ontology |
| **Does it change anything?** | It drafts code, queries, or visuals for you to accept | No. It's read-only | It sends recommendations in Teams and, once someone approves, runs a Fabric item or a Power Automate flow |
| **Whose identity it uses** | Yours | The person asking | Its own Microsoft Entra agent identity, running with its creator's permissions |
| **Where people use it** | Inside the Fabric item | Fabric, Microsoft 365 Copilot, Teams, Copilot Studio, Microsoft Foundry, and Model Context Protocol (MCP) clients | Fabric and Microsoft Teams |
| **Covered in** | <a href="#7.2">7.2</a> | <a href="#7.5">7.5</a> | <a href="#7.6">7.6</a> |

Microsoft Learn sums up the first difference this way: Fabric Copilots "come preconfigured," while data agents are "standalone configurable artifacts" that you tailor with your own instructions and examples. Ontologies (<a href="#7.4">7.4</a>) sit underneath both kinds of agent and give them a shared understanding of your business.

### Requirements

The complete list of prerequisites for this module's Activities is in <a href="00%20-%20Pre-Requisites.md#module-07-activities">Module 00, section 0.2, <b>For the Module 07 Activities</b></a>. In summary, check these before you start:

- **Capacity:** a paid Fabric capacity of **F2 or higher**, or a Power BI Premium capacity of **P1 or higher**. Copilot, data agents, and operations agents aren't available on **trial capacities**.
- **Power BI Desktop, Pro, and Premium per-user workspaces (not needed for this module's Activities):** these get Copilot through a **Fabric Copilot capacity** (see <a href="#7.2">7.2</a>). Power BI Desktop can also use Copilot through a workspace on a Copilot-enabled F2 or P1 (or higher) capacity where you're an Admin, Member, or Contributor; see <a href="https://learn.microsoft.com/en-us/power-bi/create-reports/copilot-enable-power-bi#use-copilot-in-power-bi-desktop">Enable Fabric Copilot for Power BI</a>.
- **Tenant settings:** Copilot is on by default for paid capacities in the US and the EU Data Boundary, through the tenant setting *Users can use Copilot and other features powered by Azure OpenAI*. Admins can limit it to specific security groups. Data agents rely on the Copilot and Azure OpenAI settings rather than a setting of their own, and operations agents also need the <a href="https://learn.microsoft.com/en-us/fabric/admin/service-admin-portal-microsoft-fabric-tenant-settings#enable-operations-agents">Enable operations agents</a> tenant setting; see <a href="https://learn.microsoft.com/en-us/fabric/fundamentals/copilot-enable-fabric">Enable Copilot in Fabric</a>, <a href="https://learn.microsoft.com/en-us/fabric/data-science/data-agent-tenant-settings">data agent tenant settings</a>, and the <a href="https://learn.microsoft.com/en-us/fabric/real-time-intelligence/operations-agent#prerequisites">operations agent prerequisites</a>.
- **Region:** the Azure OpenAI service behind Copilot runs in US datacenters and the EU Data Boundary. If your capacity is anywhere else, an admin must allow data to be processed outside your capacity's region (and, for data agents and operations agents, stored outside it) before these features, including the ontology agent, work.
- **Clouds:** Copilot isn't available in sovereign clouds yet.
- **Cost:** all three consume capacity units (CUs) from your Fabric capacity. Plan for it, and see <a href="https://learn.microsoft.com/en-us/fabric/fundamentals/copilot-fabric-consumption">Copilot in Fabric consumption</a>. For cost guidance for all of this module's Activities, see <a href="00%20-%20Pre-Requisites.md#module-07-costs">Keep costs down</a> in Module 00.

Learn more: <a href="https://learn.microsoft.com/en-us/fabric/fundamentals/copilot-fabric-overview">Overview of Copilot in Fabric</a> | <a href="https://learn.microsoft.com/en-us/fabric/data-science/concept-data-agent#difference-between-a-fabric-data-agent-and-a-copilot">Difference between a data agent and a Copilot</a>


<p style="border-bottom: 1px solid lightgrey;"></p>

<h2 id="7.2"><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/pencil2.png">7.2 Copilots in Microsoft Fabric</h2>

Copilot and other generative AI features, some of them still in preview, bring new ways to transform and analyze data, generate insights, and create visualizations and reports in Microsoft Fabric and Power BI.

### Enable Copilot
Copilot is enabled by default for tenants with paid Fabric capacities (F2 or higher), within the regional limits described in <a href="#7.1">7.1</a>. Even so, an administrator needs to verify and configure its tenant and capacity settings for your organization. To learn how, right-click this link to open it in another window: <a href="https://learn.microsoft.com/en-us/fabric/fundamentals/copilot-enable-fabric">Enable Copilot in Fabric</a>.

### Fabric Copilot capacities

By default, Fabric bills Copilot usage to whichever capacity holds the content you're working on, so Copilot costs get spread across every capacity in your organization. A **Fabric Copilot capacity** is a Fabric capacity you designate to collect and bill the Copilot and data agent usage of a specific group of users, wherever they use it. That lets you offload Copilot consumption from the capacities running your production workloads and monitor all of it in one place.

**What it covers.** When a user is assigned to a Fabric Copilot capacity, the Copilot capacity is billed for their:

- Copilot in Power BI Desktop.
- Copilot in Power BI on Pro, Premium per-user (PPU), Trial, Premium capacity, or Fabric capacity workspaces. This is also how users in Pro and PPU workspaces get Copilot.
- Copilot in Data Factory, Data Engineering, Data Warehouse, Data Science, Real-Time Intelligence, and Activator, and data agents, in workspaces on a capacity smaller than F64.

**How to set it up:**

1. A Fabric administrator enables Copilot for users and allows capacity administrators to designate Copilot capacities, using the tenant setting *Capacities can be designated as Copilot in Fabric capacities* (enabled by default).
2. A capacity administrator assigns a group of users to their capacity as Fabric Copilot capacity users.
3. Users don't need to do anything. Fabric bills their Copilot usage to the assigned capacity automatically.

**Things to know:**

- The Copilot capacity must be an F2 or P1 or larger, and it's supported only in the tenant's home region.
- Each user can have only one Copilot capacity. If a user is assigned to several, the most recently created one is used. A user's Copilot capacity takes precedence over the workspace's capacity.
- Embedded capacities aren't supported, and Fabric AI functions aren't billed through a Copilot capacity.
- Data is still processed in the region where Copilot is used, and the Copilot capacity administrator can see usage and billing records that include item and workspace metadata.

See <a href="https://learn.microsoft.com/en-us/fabric/enterprise/fabric-copilot-capacity">Fabric Copilot capacity</a> and <a href="https://learn.microsoft.com/en-us/fabric/admin/service-admin-portal-copilot">Copilot and Agent tenant settings</a>.

**Video:** Microsoft Fabric: Use Copilot Capacities to Offload Copilot Usage

<p><a href="https://www.youtube.com/watch?v=k3RRi-xMflw"><img src="https://img.youtube.com/vi/k3RRi-xMflw/0.jpg" alt="Tales From The Field video: Use Copilot capacities to offload Copilot usage in Microsoft Fabric" height = 200></a></p>

Read on to see how Copilot works in the different workloads. To learn how Copilot keeps your business data secure and adheres to privacy requirements, and how to use generative AI responsibly, see <a href="https://learn.microsoft.com/en-us/fabric/fundamentals/copilot-privacy-security">Privacy, security, and responsible AI use of Copilot in Fabric</a>.

### Copilot experiences at a glance

Each Fabric workload has its own Copilot, built into the item you're working in. They share a common architecture, but each one does different things. Use this table to find the Copilot for the job in front of you.

| Workload | Where you find it | What Copilot does for you | Status |
|---|---|---|---|
| Data Engineering & Data Science | [Notebooks](https://learn.microsoft.com/en-us/fabric/data-engineering/copilot-notebooks-overview) (chat pane and in-cell) | Understands the attached Lakehouse, the notebook, and the runtime state as soon as you open it. Generates code or Markdown across the whole notebook, refactors and adds comments, analyzes and visualizes data, and suggests performance fixes. [Fix with Copilot](https://learn.microsoft.com/en-us/fabric/data-engineering/copilot-notebooks-chat-pane#diagnose-notebook-failures) summarizes a failed cell or Spark job, finds the root cause, and proposes a fix you approve from a diff (or use `/fix`). | Preview |
| Data Factory | [Dataflow Gen2](https://learn.microsoft.com/en-us/fabric/data-factory/copilot-fabric-data-factory-get-started#get-started-with-copilot-for-dataflow-gen2) | Gets data from a source you describe, adds transformation steps from plain English (for example, "only keep European customers"), creates new queries including sample data, explains the current query, and undoes the last step. | GA (generally available) |
| Data Factory | [Pipelines](https://learn.microsoft.com/en-us/fabric/data-factory/copilot-fabric-data-factory-get-started#generate-a-pipeline-with-copilot) | Generates a pipeline and its activities from a description (for example, "copy data from SQL Server to Azure Data Lake"), then runs it. Summarizes an existing pipeline and how its activities relate. | GA |
| Data Factory | [Pipeline error assistant](https://learn.microsoft.com/en-us/fabric/data-factory/copilot-fabric-data-factory-get-started#troubleshoot-pipeline-errors-with-copilot) | Explains a failed pipeline run in plain language and gives actionable troubleshooting steps. | GA |
| Data Factory | [Pipeline expression builder](https://learn.microsoft.com/en-us/fabric/data-factory/expression-language#build-pipeline-expressions-with-copilot) | Writes pipeline expressions (the dynamic content language) from natural language, such as converting UTC to a time zone and formatting a folder path, and explains existing expressions. You can accept, discard, or retry each suggestion. | |
| Data Warehouse | SQL query editor | [Natural language to SQL](https://learn.microsoft.com/en-us/fabric/data-warehouse/copilot-chat-pane) in the chat pane, [code completion](https://learn.microsoft.com/en-us/fabric/data-warehouse/copilot-code-completion) as you type, and [Fix and Explain quick actions](https://learn.microsoft.com/en-us/fabric/data-warehouse/copilot-quick-action) for T-SQL queries. | Preview |
| SQL database | Fabric query editor, SQL Server Management Studio (SSMS) 22, and the MSSQL extension for Visual Studio Code (VS Code) | [Natural language to SQL](https://learn.microsoft.com/en-us/fabric/database/sql/copilot-chat-pane), [code completion](https://learn.microsoft.com/en-us/fabric/database/sql/copilot-code-completion), [Fix and Explain](https://learn.microsoft.com/en-us/fabric/database/sql/copilot-quick-actions), and document-based Q&A. In SSMS, it also helps analyze execution plans; in VS Code, GitHub Copilot adds chat and Agent Mode grounded in the connected database. | GA |
| Power BI | Semantic models (Desktop and service) | Suggests [Q&A synonyms](https://learn.microsoft.com/en-us/power-bi/natural-language/q-and-a-tooling-intro#field-synonyms) and [measure descriptions](https://learn.microsoft.com/en-us/power-bi/transform-model/desktop-measure-copilot-descriptions), [writes and explains DAX (Data Analysis Expressions) queries](https://learn.microsoft.com/en-us/dax/dax-copilot), and [answers questions about your data](https://learn.microsoft.com/en-us/power-bi/create-reports/copilot-ask-data-question). AI auto-summary for semantic models is in preview. | GA |
| Power BI | Reports (Desktop, service, and mobile) | [Suggests a report page or a visual](https://learn.microsoft.com/en-us/power-bi/create-reports/copilot-create-reports), [summarizes data in a narrative visual](https://learn.microsoft.com/en-us/power-bi/create-reports/copilot-create-narrative), and [explains a report page or visual](https://learn.microsoft.com/en-us/power-bi/explore-reports/copilot-pane-summarize-content). | GA |
| Power BI | Power BI apps | App-scoped Copilot that searches the app's reports, answers questions, and summarizes content, limited to what the app contains. | Preview |
| Real-Time Intelligence | [KQL queryset](https://learn.microsoft.com/en-us/fabric/real-time-intelligence/copilot-writing-queries) | Turns natural-language questions into KQL queries, then lets you refine or explore a previously generated query. | GA |
| Real-Time Intelligence | Real-Time Dashboards | [Generates a dashboard](https://learn.microsoft.com/en-us/fabric/real-time-intelligence/copilot-generate-dashboard), creates or refines the KQL behind a tile from a prompt, and helps you [explore dashboard data](https://learn.microsoft.com/en-us/fabric/real-time-intelligence/dashboard-explore-data). | GA |
| Real-Time Intelligence | [Operations agent](https://learn.microsoft.com/en-us/fabric/real-time-intelligence/operations-agent) setup | Copilot chat turns what you want monitored into the agent's goals, rules, and backing queries, and flags unclear instructions or missing data before you start the agent. See <a href="#7.6">7.6</a>. | GA |

> **Note:** Status reflects Microsoft Learn's <a href="https://learn.microsoft.com/en-us/fabric/fundamentals/copilot-ai-feature-state">Release status of AI and Copilot experiences in Fabric</a> page and the individual feature pages at the time of writing. A blank status means Learn doesn't currently show one. Copilot changes quickly, so check that page for the latest. Data agents aren't in this table because they're a separate, configurable item; see <a href="#7.5">7.5</a>.

### Copilot videos from Tales from the Field

The table above links to Microsoft Learn for each Copilot experience. These videos show several of them in action.

**Copilot for Data Engineering and Data Science**

<p><a href="https://www.youtube.com/watch?v=GOq5gOdKEVs"><img src="https://img.youtube.com/vi/GOq5gOdKEVs/0.jpg" alt="Tales From The Field video: Microsoft Fabric Copilot for notebooks and Data Science, with magic commands to write, execute, and fix code" height = 200></a></p>

**Copilot for Data Factory**

<p><a href="https://www.youtube.com/watch?v=ckw6tZPzP7Y"><img src="https://img.youtube.com/vi/ckw6tZPzP7Y/0.jpg" alt="Tales From The Field video: Microsoft Fabric Copilot for Data Factory, building an extract, transform, load (ETL) process and a date dimension with plain text" height = 200></a></p>

**Copilot for Data Warehouse**

<p><a href="https://www.youtube.com/watch?v=WC-mxioPp_8"><img src="https://img.youtube.com/vi/WC-mxioPp_8/0.jpg" alt="Tales From The Field video: Fix errors, ask questions, and explain code with Copilot for Fabric Data Warehouse" height = 200></a></p>

**Copilot for Power BI**

<p><a href="https://www.youtube.com/watch?v=iTI2HUWLvVI"><img src="https://img.youtube.com/vi/iTI2HUWLvVI/0.jpg" alt="Tales From The Field video: Power BI Copilot end-to-end tutorial in Microsoft Fabric" height = 200></a></p>

### Build your own AI solutions

Copilot in Fabric isn't configurable, but you can build your own AI solutions on top of Fabric data. Microsoft publishes several solution accelerators on GitHub; see <a href="https://learn.microsoft.com/en-us/fabric/fundamentals/copilot-fabric-overview#create-your-own-ai-solution-accelerators">Create your own AI solution accelerators</a>. For a configurable, no-code option inside Fabric, see data agents in <a href="#7.5">7.5</a>.

**Video:** How to Chat with Your Data in Microsoft Fabric with Semantic Kernel using Azure OpenAI

<p><a href="https://www.youtube.com/watch?v=0jOEUeOykzQ"><img src="https://img.youtube.com/vi/0jOEUeOykzQ/0.jpg" alt="Tales From The Field video: How to chat with your data in Microsoft Fabric with Semantic Kernel using Azure OpenAI" height = 200></a></p>

**Video:** How to Invoke the Semantic Kernel using OpenAI & Configure Prompt Engineering in Microsoft Fabric

<p><a href="https://www.youtube.com/watch?v=8da4smSAoEk"><img src="https://img.youtube.com/vi/8da4smSAoEk/0.jpg" alt="Tales From The Field video: How to invoke Semantic Kernel using OpenAI and configure prompt engineering in Microsoft Fabric" height = 200></a></p>



<p style="border-bottom: 1px solid lightgrey;"></p>


<h2 id="7.3"><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/pencil2.png">7.3 What is Fabric IQ?</h2>


**Fabric IQ is a marketing term, not a single product, item, or button.** It's the name Microsoft gives to a collection of technologies inside Microsoft Fabric that help companies and organizations build intelligence onto their data. Fabric IQ takes the data you've already unified in OneLake and raises it to the language of your business (customers, orders, shipments, assets). That way, people, applications, and AI agents interpret it the same way and can reason and act on it, instead of working only with tables, columns, and joins.

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
- **Fabric data agents in Microsoft 365 Copilot.** A data agent (see <a href="#7.5">7.5</a>) can be published as a Microsoft 365 agent so people can query Lakehouses, Warehouses, KQL databases, semantic models, and ontologies from Copilot. Data agents and ontologies don't answer in Copilot Chat until an agent is explicitly published.
- **Governance carries across.** Purview sensitivity labels and data loss prevention policies still apply, and admins control the connection with tenant settings in both the Microsoft 365 admin center (*Fabric data available in M365 Copilot*) and the Fabric admin portal (*Share Fabric data with your Microsoft 365 services*).

### What's inside Fabric IQ, and what this workshop covers

The IQ workload contains six items. **In this workshop, we focus on three of them: ontologies, data agents, and operations agents.** The others are listed so you know they exist, but we won't cover them here.

| Fabric IQ item | What it does | In this workshop |
|---|---|---|
| **Ontology** (preview) | A shared business vocabulary (entity types, properties, relationships, rules, and metrics) bound to your data so people and agents use the same definitions | **Yes**, see <a href="#7.4">7.4</a> |
| **Data agent** | A conversational Q&A agent over your Fabric data, grounded in semantic models and ontologies | **Yes**, see <a href="#7.5">7.5</a> |
| **Operations agent** | Monitors real-time data, detects conditions you care about, and recommends or takes governed actions | **Yes**, see <a href="#7.6">7.6</a> |
| Power BI semantic model | Curated measures, hierarchies, and relationships for reporting; ontologies can be generated from them | Only as a source for ontologies |
| Graph | Stores and traverses relationships for multi-hop and impact questions; integrated with ontology | No |
| Planning | Planning, forecasting, and plan-versus-actuals over semantic models | No |

How the three fit together: **the ontology defines what your business means, data agents answer questions in that language, and operations agents watch live data in that language and act on it.**

Learn more: <a href="https://learn.microsoft.com/en-us/fabric/iq/overview">What is Fabric IQ?</a> | <a href="https://learn.microsoft.com/en-us/microsoft-365/copilot/extensibility/work-iq/">Work IQ overview</a> | <a href="https://learn.microsoft.com/en-us/fabric/iq/connectors/microsoft-365-copilot-overview">Fabric IQ in Microsoft 365 Copilot Chat</a>

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2 id="7.4"><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/pencil2.png">7.4 Ontology</h2>


An **ontology** (preview) is the business vocabulary of Fabric IQ. It defines the things your organization cares about (customers, products, stores, shipments, machines), their properties, how they relate to each other, and the rules and metrics that give them business meaning. You then **bind** those definitions to data you already have in Fabric, so people, applications, and AI agents all use the same language and the same definitions.

Put simply: your Lakehouse knows a table called `dim_customer`; your ontology knows **Customer**.

> **Important:** Ontology is in preview. The old ontology experience retires on **January 31, 2027**. If you built an ontology in the old experience, use the in-product action to copy it into the new experience, then reconnect any agents or dashboards to the new item. See <a href="https://learn.microsoft.com/en-us/fabric/iq/ontology/overview#migrate-from-old-experience">Migrate from old experience</a>.

### Why use an ontology?

Most organizations describe the same concept differently across sources, semantic models, applications, and teams. An ontology gives you one common context layer so you can:

- **Model the business in business terms**, independent of any single physical table.
- **Reuse what you already built** by generating an ontology from a Power BI semantic model, including its relationships, calculated columns, and DAX measures.
- **Leave the data where it is.** An ontology is a virtual layer. Bindings point at the source system, and nothing is copied into the ontology.
- **Give every agent the same context**, so answers stay consistent across teams and tools instead of depending on how each prompt was written.

### How ontology fits in Fabric IQ

Ontology is the **business context and semantic modeling layer** between your data and the experiences that consume it. It stores and serves definitions and bindings, but it is **not a query engine**. Agents and dashboards read the ontology for context, then run their queries against the bound source.

<img src="https://learn.microsoft.com/en-us/fabric/iq/ontology/media/overview/ontology-fabric-iq-overview.png" alt="Graphic showing how ontology in Fabric gives a live, unified view of the business." height=400>

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
| **Data binding** | The mapping from a definition to the source data that supplies it | Store details bound to a Lakehouse table; freezer temperature bound to an Eventhouse |

Two modeling features help as an ontology grows: **inheritance** (for example, *Frozen product* is a type of *Product*) and **shared properties** (define a property once and reuse it across entity types).

### What can an ontology bind to?

During preview, bindings can point to **semantic models, Lakehouses, Eventhouses, Warehouses, SQL databases, mirrored databases**, and OneLake shortcuts, views, and materialized views. This is where the workshop comes together: anything you mirrored in <a href="05%20-%20Introduction%20to%20Mirroring%20in%20Fabric.md">Module 05</a> can be bound into an ontology without copying it again.

### Two ways to build an ontology

1. **Generate it from a Power BI semantic model.** The model's tables and relationships become the starting structure, and its measures appear as metrics. Start here when you already have a trusted semantic model. See <a href="https://learn.microsoft.com/en-us/fabric/iq/ontology/how-to-generate-from-semantic-models">Generate an ontology from semantic models</a>.
2. **Build it from scratch.** Create entity types, bind data, and add relationships yourself, or ask the built-in **ontology agent** to help.

The **ontology agent** is a chat experience inside the ontology item. It can draft definitions and bindings from connected Fabric sources, describe the ontology, answer business questions by querying the data behind it (using DAX, KQL, SQL, or GQL, the Graph Query Language), and suggest improvements. It works **proposal-first**: you review each change before it's applied. See <a href="https://learn.microsoft.com/en-us/fabric/iq/ontology/how-to-use-ontology-agent">Use the ontology agent</a>.

### Who uses an ontology?

An ontology on its own doesn't answer questions; something has to consume it. These are the supported consumers:

| Consumer | Best for | In this workshop |
|---|---|---|
| Ontology agent | Building, improving, and testing queries on the ontology | This section |
| Fabric data agent | Interactive Q&A over Fabric data with ontology context | <a href="#7.5">7.5</a> (concept only; see below) |
| Fabric operations agent | Continuous monitoring with recommended or automated actions | <a href="#7.6">7.6</a> (concept only; see below) |
| Foundry IQ agent | Developer-built agents with tool calling and enterprise integration | Not covered |
| Copilot Studio agent | Low-code agents connected through the Fabric IQ MCP tool | Not covered |
| Custom agents (ontology MCP server) | Any MCP-compatible client or custom agent | Not covered |
| Real-Time Dashboards | Visual exploration of ontology-backed data | Not covered |

See <a href="https://learn.microsoft.com/en-us/fabric/iq/ontology/concepts-agent-integration">Agent integration options for ontology</a> to compare them.

Data agents and operations agents can both use an ontology as a source, but because of a known issue, neither currently works with an ontology that uses semantic models for binding (see <a href="https://learn.microsoft.com/en-us/fabric/iq/ontology/resources-troubleshooting#troubleshoot-ontology-as-data-agent-source">Troubleshoot ontology as data agent source</a> and <a href="https://learn.microsoft.com/en-us/fabric/iq/ontology/how-to-create-operations-agent#prerequisites">Create an operations agent grounded in an ontology</a>). The Lakeshore Retail ontology that you build in this section binds its Sale entity type to a semantic model, so the Activities in 7.5 and 7.6 don't use it.

### Graph is optional

**Graph** is an opt-in execution layer for questions where the relationship path matters, such as multi-hop traversal, dependency analysis, or shortest path. An ontology doesn't load instance data into a graph by default; you choose to materialize it when you need it. Routine lookups, aggregations, and metrics keep running against their source systems.

### Governance, lifecycle, and interoperability

- **Security follows the data.** Workspace and item permissions control access to the ontology, and queries respect OneLake security and source row-level, object-level, and column-level security.
- **Version history.** Create named checkpoints manually and restore a known state.
- **Standards.** Import RDF (Resource Description Framework), Turtle, or OWL (Web Ontology Language) definitions into an empty ontology, and export to RDF or Turtle.
- **Developer tooling.** REST APIs and Fabric CI/CD (continuous integration and continuous delivery) are supported.

### Before you start: tenant settings and capacity

- **Tenant settings:** a Fabric administrator enables *Users can create Fabric items* and *Users can create ontology (preview) items*. If you plan to connect a data agent or operations agent, their tenant settings must be enabled too. See <a href="https://learn.microsoft.com/en-us/fabric/iq/ontology/overview-tenant-settings">Required tenant settings for ontology</a>.
- **Capacity:** Microsoft Learn suggests starting evaluation on an **F8** (an F4 might suit light testing). Usage appears in the Capacity Metrics app as *Ontology Discovery*, *Ontology Logic and Operations*, and *Ontology AI Reasoning*. During preview, only *Ontology Logic and Operations* (the ontology's Eventhouse and graph usage) is billed. Learn's example *Ontology AI Reasoning* estimates are about 0.5 to 1 CU hours for a small ontology agent edit and about 20 CU hours for drafting a full ontology from a workspace.
- **Tip:** close the ontology item when you're done. While it's open, it refreshes its definition automatically about every 20 minutes, and each refresh adds *Ontology Discovery* usage, which isn't billed during preview. See <a href="https://learn.microsoft.com/en-us/fabric/iq/ontology/resources-capacity-usage">Billing and capacity usage for ontology</a>. For cost guidance for all of this module's Activities, see <a href="00%20-%20Pre-Requisites.md#module-07-costs">Keep costs down</a> in Module 00.

<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/point1.png"><b>Self-Guided Activity: Build your first ontology</b></p>

In this Activity, you will follow the Microsoft Learn ontology tutorial for Lakeshore Retail, a fictional retailer that sells ice cream and tracks sales and refrigerator telemetry. You'll load sample data into a Lakehouse and an Eventhouse, import a semantic model, create entity types such as Store, Products, and Sale, bind them to data, enrich the ontology, and then ask the ontology agent questions such as "What is the top product by revenue across all stores?" For a refresher before you start, see <a href="04%20-%20The%20Lakehouse%20and%20Warehouse.md#4.1">Module 04, section 4.1</a> and <a href="04%20-%20The%20Lakehouse%20and%20Warehouse.md#4.2">section 4.2</a> for Lakehouses and loading files into them, and <a href="06%20-%20Real-Time%20Intelligence.md#6.3">Module 06, section 6.3</a> for Eventhouses.

The three Activities in this module are independent. Don't connect the Lakeshore Retail ontology to a data agent (<a href="#7.5">7.5</a>) or an operations agent (<a href="#7.6">7.6</a>): it binds its Sale entity type to a semantic model, and both agents have a known issue that stops them from working with an ontology that uses semantic models for binding (see <a href="https://learn.microsoft.com/en-us/fabric/iq/ontology/resources-troubleshooting#troubleshoot-ontology-as-data-agent-source">Troubleshoot ontology as data agent source</a> and <a href="https://learn.microsoft.com/en-us/fabric/iq/ontology/how-to-create-operations-agent#prerequisites">Create an operations agent grounded in an ontology</a>).

<p><img style="margin: 0px 15px 15px 0px;" src="../graphics/checkmark.png"><b>Steps</b></p>

- [Part 0: Introduction and environment setup](https://learn.microsoft.com/en-us/fabric/iq/ontology/tutorial-0-introduction) (create a new workspace on your paid capacity and use it only for this tutorial)
- [Part 1: Create an ontology](https://learn.microsoft.com/en-us/fabric/iq/ontology/tutorial-1-create-ontology)
- [Part 2: Enrich the ontology](https://learn.microsoft.com/en-us/fabric/iq/ontology/tutorial-2-enrich-ontology)
- [Part 3: Explore the ontology](https://learn.microsoft.com/en-us/fabric/iq/ontology/tutorial-3-preview-ontology)
  - Its last section, **Explore ontology graph**, is optional, and you can skip it. Graph storage is provisioned at a minimum of 100 GB and billed at the OneLake cache rate, and graph is available only in [certain regions](https://learn.microsoft.com/en-us/fabric/graph/overview#region-availability). See [Pricing and capacity units](https://learn.microsoft.com/en-us/fabric/graph/overview#pricing-and-capacity-units).
- [Part 4: Use the ontology agent](https://learn.microsoft.com/en-us/fabric/iq/ontology/tutorial-4-use-agent)
- [Part 5: Conclude and clean up resources](https://learn.microsoft.com/en-us/fabric/iq/ontology/tutorial-5-conclusion) (you delete the whole workspace and everything in it)

> If you only reviewed the documentation in this Activity, ensure you bookmark each of these references and then perform the Activity in full once you do have your deployment.

Learn more: <a href="https://learn.microsoft.com/en-us/fabric/iq/ontology/overview">What is ontology?</a> | <a href="https://learn.microsoft.com/en-us/fabric/iq/ontology/resources-glossary">Ontology glossary</a> | <a href="https://learn.microsoft.com/en-us/fabric/iq/ontology/resources-troubleshooting">Troubleshoot ontology</a>

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2 id="7.5"><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/pencil2.png">7.5 Fabric Data Agents</h2>


A **Fabric data agent** is a Fabric item you build and configure so people can ask questions about your data in plain English and get answers back. You choose the data, teach the agent your business context, test it, and then publish and share it, much like building and sharing a Power BI report. Microsoft Learn lists the data agent as generally available; some newer capabilities covered below are still in preview and are marked as such.

Data agents are **read-only**. They only generate SQL, DAX, and KQL *read* queries and never create, update, or delete data.

### How a data agent works

When someone asks a question, the data agent:

1. **Checks the question** against security, responsible AI policies, and the user's permissions.
2. **Picks the right data source** from the ones you added (up to five, in any combination): Lakehouses, Warehouses, Power BI semantic models, KQL databases, mirrored databases, ontologies (see <a href="#7.4">7.4</a>), and Microsoft Graph.
3. **Generates a query** with the matching tool: natural language to SQL for Lakehouses and Warehouses, to DAX for semantic models, to KQL for KQL databases, or a Microsoft Graph query.
4. **Validates and runs the query** as the user asking the question, then returns a readable answer, often with a table or summary.

Because the agent runs with the requesting user's identity, each person only sees data they're already allowed to see. Anything you mirrored in <a href="05%20-%20Introduction%20to%20Mirroring%20in%20Fabric.md">Module 05</a> can be a data agent source.

### Teaching the agent: instructions and example queries

Out of the box, a data agent can answer reasonable questions, but it doesn't know your business. Wrong answers usually come from missing context: your terminology, which table to use, or how a metric is calculated. **This is the most important part of building a good data agent.** You give it context at three levels:

| Layer | Where it applies | What to put in it |
|---|---|---|
| **Agent instructions** | The whole agent, on every question | The agent's objective, which data source to prefer for which topic, key terminology and acronyms, and how to format answers |
| **Data source instructions** | Only when the agent routes a question to that source | Background on the source, descriptions of key tables and columns, and "when asked about X, use table Y" rules that shape the SQL, DAX, or KQL |
| **Example queries** | Only when the agent queries that source | Pairs of a natural-language question and the exact query that answers it |

Each data source also has a short **description** that the agent reads when deciding which source to route a question to.

#### Agent instructions

Microsoft Learn recommends this structure for agent instructions:

```
## Objective
## Data sources
## Key terminology
## Response guidelines
## Handling common topics
```

For example, under *Data sources* you might say "Use SalesLakehouse for product and transaction data. Use CRMModel for customer demographics." Under *Key terminology*: "GMV refers to Gross Merchandise Value."

**Video:** Microsoft Fabric: Data Agents Agent Instructions

<p><a href="https://www.youtube.com/watch?v=r18-STutAyE"><img src="https://img.youtube.com/vi/r18-STutAyE/0.jpg" alt="Tales From The Field video: Agent instructions for data agents in Microsoft Fabric" height = 200></a></p>

#### Data source instructions

Data source instructions are the query-level guidance. They're applied only when the agent sends a question to that specific source, so they're the place for table-level detail. Learn's suggested template:

```
## General knowledge
## Table descriptions
## When asked about
```

For example: "When asked about shoe sales, always use the SalesProduct table."

#### Example queries

**Example queries** (also called few-shot examples) are sample questions paired with the query that answers them. When a question comes in, the agent looks up the most relevant examples for that data source and feeds them into query generation, so it learns your joins, filters, and calculations by example instead of guessing.

<img src="https://learn.microsoft.com/en-us/fabric/data-science/media/data-agent-scenario/add-example-queries-lakehouse.png" alt="Screenshot showing where you can add the example queries you provide to the AI." height=400>

What to know:

- **Supported sources:** Lakehouses, Warehouses, and KQL databases. Example queries aren't supported for semantic models or ontologies; use instructions for those.
- **Validation:** every example is checked against the source's schema. Examples that fail validation aren't sent to the agent, so make sure yours pass.
- **Limit:** up to 100 example queries per data source.
- **Best practices:** make each question map clearly to its query, add comments in the query (for example, `-- substitute customer_id here`), use examples to show complex joins and calculations, avoid overlapping or contradicting examples, and write questions the way your users actually ask them.
- **Debugging:** the run steps view shows which examples were retrieved for a question. If the wrong ones show up, refine or add more targeted examples.
- **Validating at scale:** the Fabric data agent Python SDK (software development kit) can score your SQL examples for clarity, relatedness, and mapping, and flag examples that conflict with each other.

**Video:** Microsoft Fabric: How to use Data Agent Example Queries

<p><a href="https://www.youtube.com/watch?v=v0mD01QP5gY"><img src="https://img.youtube.com/vi/v0mD01QP5gY/0.jpg" alt="Tales From The Field video: How to use data agent example queries in Microsoft Fabric" height = 200></a></p>

> **Preview:** For SQL sources on the preview runtime, you can also add **schema object descriptions** (business descriptions for tables and columns) and **topics** (large, subject-based instructions the agent only sends when a question matches). See <a href="https://learn.microsoft.com/en-us/fabric/data-science/data-agent-configurations">Configure your data agent</a>.

### Security, governance, and limits

- **Permissions follow the user.** The agent queries with the requesting user's credentials. Row-level and column-level security still apply. Sharing or configuring an agent doesn't grant anyone access to its data sources.
- **Policy wins over prompts.** Learn describes four layers of intent, from highest to lowest precedence: organizational (tenant policies), role-based (workspace governance), developer (your instructions and examples), and user (the questions people ask). A higher layer always overrides a lower one.
- **Microsoft Purview** data loss prevention (DLP) and access restriction policies apply, and agent prompts and responses can be audited and discovered.
- **Lifecycle:** data agents support Git integration and deployment pipelines.
- **Limits to plan for:** English only; responses are capped at 25 rows and 25 columns because agents are built for conversational insights, not full data extracts; no unstructured files such as PDF or DOCX; and the data source's capacity must be in the same region as the agent's capacity.

**Video:** Microsoft Fabric: Data Security & Data Agents

<p><a href="https://www.youtube.com/watch?v=1OOe9-EteL0"><img src="https://img.youtube.com/vi/1OOe9-EteL0/0.jpg" alt="Tales From The Field video: Data security and data agents in Microsoft Fabric" height = 200></a></p>

### Expanding data agents beyond Microsoft Fabric

A data agent doesn't have to live only in Fabric. Once you **publish** it, other experiences can call it, and it still runs in Fabric against your governed data. A few rules apply everywhere:

- **Publish first.** Only published data agents can be consumed outside Fabric.
- **Write a rich description when you publish.** Outside Fabric, an orchestrator decides when to call your agent, and it reads the description to decide.
- **Same tenant, same account.** The data agent and the consuming experience must be in the same tenant, and you sign in to both with the same account.
- **Compliance boundary.** Responses returned to these experiences might leave Fabric's compliance boundary or geographic region and are handled under that experience's terms.

| Where | How you connect | Tutorial or example to follow |
|---|---|---|
| **Microsoft 365 Copilot and Teams** | Select **Publish to Agent Store** when you publish. Users chat with the agent directly or @mention it in Copilot Chat. | <a href="https://learn.microsoft.com/en-us/fabric/data-science/data-agent-microsoft-365-copilot">Publish and use a data agent in Microsoft Copilot</a>; <a href="https://learn.microsoft.com/en-us/fabric/data-science/data-agent-enable-co-publishers">Manage co-publishers</a> |
| **Copilot Studio** | Add the data agent as a **tool** (Fabric IQ Data MCP), or as a **connected agent** (the earlier experience, preview). Then publish the Copilot Studio agent to Teams and Microsoft 365 Copilot. | <a href="https://learn.microsoft.com/en-us/fabric/data-science/data-agent-microsoft-copilot-studio-tool">Step by step: add a data agent as a tool</a>; <a href="https://learn.microsoft.com/en-us/fabric/data-science/data-agent-microsoft-copilot-studio">Connected agent walkthrough</a> |
| **Microsoft Foundry** (preview) | Add one or more published data agents to a Foundry agent with the **Fabric IQ (OneLake Catalog)** tool, in the portal or in code. | <a href="https://learn.microsoft.com/en-us/fabric/data-science/data-agent-foundry-fabric-iq">Step by step: add data agents to a Foundry agent with Fabric IQ</a> (portal steps, plus Python, C#, and JavaScript) |
| **Any MCP client** | Publish the agent, then connect Visual Studio Code or your own agent to its MCP endpoint. | <a href="https://learn.microsoft.com/en-us/fabric/data-science/data-agent-mcp-server">Data agent as an MCP server</a> (Python script and Visual Studio Code walkthrough) |
| **Python SDK and notebooks** (preview) | Create, configure, and publish data agents in code, then query them through the MCP endpoint. | <a href="https://learn.microsoft.com/en-us/fabric/data-science/fabric-data-agent-sdk">Fabric data agent SDK</a>; <a href="https://github.com/microsoft/fabric-samples/tree/main/docs-samples/data-science/data-agent-sdk">SDK sample notebooks on GitHub</a>; <a href="https://learn.microsoft.com/en-us/fabric/data-science/data-agent-end-to-end-tutorial">AdventureWorks end-to-end tutorial</a> |
| **Apps and automation with a service principal** (preview) | Call a published data agent from background services, custom apps, or CI/CD pipelines without a signed-in user. Not yet supported for agents connected to a KQL database. | <a href="https://learn.microsoft.com/en-us/fabric/data-science/data-agent-service-principal">Use service principal authentication with a data agent</a> |
| **Monitoring in Foundry** (preview) | When a Foundry agent calls your data agent, the data agent's traces (which sources it queried, how long each step took, and whether it succeeded) flow to the Foundry project's Application Insights. | <a href="https://learn.microsoft.com/en-us/fabric/data-science/fabric-data-agent-foundry-observability">Observability for Fabric data agents in Microsoft Foundry</a> |

> **Not the same thing:** Microsoft 365 also has Fabric IQ experiences that answer from **Power BI reports and semantic models directly, without a data agent**: <a href="https://learn.microsoft.com/en-us/fabric/iq/connectors/microsoft-365-copilot-overview">Fabric IQ in Microsoft 365 Copilot Chat</a> (see <a href="#7.3">7.3</a>), the **Fabric** capability in <a href="https://learn.microsoft.com/en-us/fabric/iq/connectors/agent-builder-overview">Microsoft 365 Agent Builder</a>, the Fabric IQ plugin in <a href="https://learn.microsoft.com/en-us/fabric/iq/connectors/cowork-overview">Copilot Cowork</a>, and the <a href="https://learn.microsoft.com/en-us/fabric/iq/connectors/fabric-iq-mcp">Fabric IQ MCP server</a>. Learn notes that the Cowork plugin and the Fabric IQ MCP server don't currently support data agents or ontologies. To bring a data agent into Microsoft 365, publish it to the Agent Store (first row above).

#### Microsoft 365 Copilot

Publishing to the Agent Store puts your data agent next to every other agent in Microsoft 365 Copilot, where people can use it from Teams. Users only see results their own access allows, and they can use Copilot's code interpreter to chart the answers. Microsoft 365 Copilot has its own orchestrator, which can reshape the answer. If you want the output delivered as-is, say so in the publishing description. See <a href="https://learn.microsoft.com/en-us/fabric/data-science/data-agent-microsoft-365-copilot">Consume a data agent from Microsoft Copilot</a>.

**Working as a team?** The first person to publish a data agent to Microsoft 365 Copilot becomes its only owner there. Add your co-creators as **co-publishers** in the agent's Publishing settings right after you publish. Otherwise, they can't republish it, and if they delete it in Fabric, it stays in Copilot and fails for users. See <a href="https://learn.microsoft.com/en-us/fabric/data-science/data-agent-enable-co-publishers">Manage co-publishers for a Fabric data agent in Microsoft Copilot</a>.

**Video:** Microsoft Fabric: Publish Data Agents Directly to Microsoft 365

<p><a href="https://www.youtube.com/watch?v=yCD8-qAIT2I"><img src="https://img.youtube.com/vi/yCD8-qAIT2I/0.jpg" alt="Tales From The Field video: Publish Microsoft Fabric data agents directly to Microsoft 365" height = 200></a></p>

#### Copilot Studio

Copilot Studio is Microsoft's low-code agent builder. A Copilot Studio agent can combine your data agent with other knowledge sources, tools, and agents, then publish to Teams and Microsoft 365 Copilot.

- **As a tool (current experience):** add the **Fabric IQ Data MCP** tool, pick a data agent from the OneLake catalog, write a description, and choose the authentication mode. You can add several data agents to one Copilot Studio agent. See <a href="https://learn.microsoft.com/en-us/fabric/data-science/data-agent-microsoft-copilot-studio-tool">Add a Fabric data agent as a tool in Copilot Studio</a>. The tool option needs a Copilot Studio agent created from the arrow next to **New agent** > **Agent**, which runs on the GitHub Copilot harness.
- **As a connected agent (earlier experience, preview):** validated for Teams only, and not currently supported in Microsoft 365 Copilot. See <a href="https://learn.microsoft.com/en-us/fabric/data-science/data-agent-microsoft-copilot-studio">Consume a data agent in Copilot Studio</a>.
- **Authentication matters.** With **User** authentication, each person needs access to the data agent and its sources. With **Maker** authentication, everyone sees data through the builder's access, so choose it deliberately.

**Video:** Microsoft Fabric: Connect Data Agents to Teams with Copilot Studio

<p><a href="https://www.youtube.com/watch?v=7ccFIUfjiIc"><img src="https://img.youtube.com/vi/7ccFIUfjiIc/0.jpg" alt="Tales From The Field video: Connect Microsoft Fabric data agents to Teams with Copilot Studio" height = 200></a></p>

#### Microsoft Foundry and Fabric IQ

For developers building custom agents, Microsoft Foundry can call Fabric data agents as tools. This is where **Fabric IQ** (see <a href="#7.3">7.3</a>) shows up in practice: the **Fabric IQ (OneLake Catalog)** tool lists the published data agents you have access to, and you add them by name. A single Foundry agent can call several data agents (for example, one for sales and one for support), and each is exposed as an MCP endpoint. Requests run as the signed-in user, so Fabric permissions still apply. See <a href="https://learn.microsoft.com/en-us/fabric/data-science/data-agent-foundry-fabric-iq">Add Fabric data agents to a Foundry agent with Fabric IQ</a>. The earlier **Microsoft Fabric** tool in Foundry, which connected a single data agent by workspace and item ID, was retired on November 6, 2026, so existing Foundry agents need to move to the Fabric IQ tool. To see what the data agent did on each request, connect Application Insights to your Foundry project; see <a href="https://learn.microsoft.com/en-us/fabric/data-science/fabric-data-agent-foundry-observability">Observability for Fabric data agents in Microsoft Foundry</a>.

**Video:** Microsoft Fabric: Connect Data Agent to Azure AI Foundry

<p><a href="https://www.youtube.com/watch?v=nqUt-wCYY2M"><img src="https://img.youtube.com/vi/nqUt-wCYY2M/0.jpg" alt="Tales From The Field video: Connect a Microsoft Fabric data agent to Azure AI Foundry" height = 200></a></p>

#### The Fabric data agent Python SDK

The SDK (preview) is the management plane for data agents: create, configure, and publish them from a Fabric notebook or your own environment, including adding and validating example queries in bulk. To ask a published agent questions from code, use its MCP endpoint (see the next section). The SDK no longer uses the retired OpenAI Assistants API. See <a href="https://learn.microsoft.com/en-us/fabric/data-science/fabric-data-agent-sdk">Fabric data agent SDK</a> and <a href="https://github.com/microsoft/fabric-samples/tree/main/docs-samples/data-science/data-agent-sdk">the SDK sample notebooks on GitHub</a>.

**Video:** Microsoft Fabric: Extend Fabric Data Agents with Python SDK End to End Tutorial

<p><a href="https://www.youtube.com/watch?v=YJu9NQB3MuU"><img src="https://img.youtube.com/vi/YJu9NQB3MuU/0.jpg" alt="Tales From The Field video: Extend Microsoft Fabric data agents with the Python SDK, an end-to-end tutorial" height = 200></a></p>

### MCP servers for data agents

The **Model Context Protocol (MCP)** is an open standard for connecting AI systems to tools and data. An *MCP client* is the app the user works in (for example, Visual Studio Code). An *MCP server* exposes tools the client can discover and call.

**When you publish a data agent, it becomes an MCP server** that exposes a single tool: the data agent itself. An MCP client sends a question to that tool and gets back an answer grounded in your Fabric data.

- **Find the details:** open the published agent's **Settings** and select the **Model Context Protocol** tab for the server URL, tool name, and tool description. You can also download an `mcp.json` file for clients such as Visual Studio Code.
- **The endpoint** follows this pattern and only works after the agent is published:

```
https://api.fabric.microsoft.com/v1/mcp/workspaces/{WorkspaceId}/dataagents/{DataAgentId}/agent
```

- **Your description is the tool description.** MCP clients decide when to call your agent from the description you wrote when publishing, so make it specific about what the agent knows and which questions it answers.
- **Authentication:** every request carries a Fabric bearer token for the `https://api.fabric.microsoft.com/.default` scope. The token can represent a user or a service principal. The server doesn't support dynamic client registration, so the client must obtain the token itself.
- **Any MCP client works** if it supports streamable HTTP and can attach the token. Learn shows a Python example and Visual Studio Code in agent mode.
- **Long-running questions** can use MCP tasks: the server returns an ID and the client checks back for the result.
- **Programmatic access:** because OpenAI retired the Assistants API, Learn recommends the MCP endpoint for calling a data agent from code.

See <a href="https://learn.microsoft.com/en-us/fabric/data-science/data-agent-mcp-server">Data agent as Model Context Protocol server</a>.

<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/point1.png"><b>Self-Guided Activity: Create, tune, and publish a Fabric data agent</b></p>

<img src="https://learn.microsoft.com/en-us/fabric/data-science/media/data-agent-scenario/get-started.png" alt="Screenshot showing where you select tables for the data agent." height=400>

In this Activity, you will load the AdventureWorks sample into a Lakehouse, create a data agent over it, add agent instructions and example queries, test and refine it, publish it, and optionally call it from Microsoft 365 Copilot or an MCP client. The tutorial loads the data from a notebook; for a refresher on notebooks, see <a href="04%20-%20The%20Lakehouse%20and%20Warehouse.md#4.3">Module 04, section 4.3</a>.

Open the following references and complete the steps:

<p><img style="margin: 0px 15px 15px 0px;" src="../graphics/checkmark.png"><b>Steps</b></p>

- [Fabric data agent tenant settings](https://learn.microsoft.com/en-us/fabric/data-science/data-agent-tenant-settings) (check these first)
- [Fabric data agent example with the AdventureWorks dataset](https://learn.microsoft.com/en-us/fabric/data-science/data-agent-end-to-end-tutorial)
  - Skip the tutorial's last section, **Use the Fabric data agent programmatically**. Its code uses a `credential` object that the tutorial never defines. To call your published agent from Python, use the self-contained [Python example](https://learn.microsoft.com/en-us/fabric/data-science/data-agent-mcp-server#connect-from-python) on the MCP server page instead.
- [Example queries](https://learn.microsoft.com/en-us/fabric/data-science/data-agent-example-queries)
- [Consume a data agent from Microsoft Copilot](https://learn.microsoft.com/en-us/fabric/data-science/data-agent-microsoft-365-copilot) (optional, requires a Microsoft Copilot license or an Office 365 commercial subscription)
- [Data agent as Model Context Protocol server](https://learn.microsoft.com/en-us/fabric/data-science/data-agent-mcp-server) (optional)

> If you only reviewed the documentation in this Activity, ensure you bookmark each of these references and then perform the Activity in full once you do have your deployment.

### More data agent videos from Tales from the Field

**Build retrieval-augmented generation (RAG) patterns with data agents (formerly AI skills)**

<a href="https://www.youtube.com/watch?v=5ivA4zdnDtE"><img src="https://img.youtube.com/vi/5ivA4zdnDtE/0.jpg" alt="Tales From The Field video: Build RAG patterns simply and easily with the data agents (AI skills) preview in Microsoft Fabric" height = 200></a>

**Use AI skills to create cell magic**

<p><a href="https://www.youtube.com/watch?v=cuF00-iV_YA"><img src="https://img.youtube.com/vi/cuF00-iV_YA/0.jpg" alt="Tales From The Field video: Use AI skills to create cell magic in Microsoft Fabric" height = 200></a></p>

Learn more: <a href="https://learn.microsoft.com/en-us/fabric/data-science/concept-data-agent">Fabric data agent concepts</a> | <a href="https://learn.microsoft.com/en-us/fabric/data-science/data-agent-configurations">Configure your data agent</a> | <a href="https://learn.microsoft.com/en-us/fabric/data-science/data-agent-sharing">Data agent sharing and permissions</a>

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2 id="7.6"><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/pencil2.png">7.6 Operations Agents</h2>


An **operations agent** is a Fabric item that watches your real-time data for you. You tell it, in plain English, what matters to your business ("alert me when fewer than 3 bikes are available at a station"). It turns that into rules, checks them continuously, and when a rule is met, it messages the right people in Microsoft Teams with what happened and what it recommends. With approval, it can act. Operations agents are part of Real-Time Intelligence and one of the three Fabric IQ items this workshop focuses on (see <a href="#7.3">7.3</a>). Microsoft Learn lists the operations agent as generally available; a few capabilities below are in preview and are marked.

Where a data agent waits for someone to ask a question, an operations agent doesn't wait. Each agent is a dedicated item for one business process, so you can deploy several as "virtual experts" across your organization.

### How an operations agent works

1. **Create it.** In your workspace, create a new **Operations agent** item from the Real-Time Intelligence section.
2. **Set it up.** On **Agent setup**, give it:
   - **Instructions:** your business goals and the conditions you care about.
   - **Knowledge:** one data source, either a KQL database in an Eventhouse or an ontology (see <a href="#7.4">7.4</a>).
   - **Actions (optional):** by default it can message you in Teams. You can also let it run a **Fabric item** (such as a notebook, pipeline, or user data function) or trigger a **Power Automate** flow.
3. **Generate the playbook.** The playbook shows the business entities the agent monitors, how their properties map to your columns, and each rule it will evaluate. Every rule is backed by a query you can inspect, copy, and test yourself.
4. **Refine it with Copilot chat.** Instead of configuring every rule by hand, describe what you want ("Monitor the turbines and alert me when motor temperature gets too high"). Copilot proposes rules and queries, and it flags instructions that are unclear, reference data that doesn't exist, or ask for something unsupported.
5. **Start it.** Once started, the agent runs each rule's query **every 5 minutes**.
6. **Respond.** When a rule is met, the agent summarizes the data and sends a message through the **Fabric Operations Agent** Teams app, with context and a recommended action. The recipient selects **Yes** to approve or **No** to reject. For anomalies, **Investigator insights** (preview) adds a root-cause analysis. Recommendations expire if nobody acts within three days.

<img src="https://learn.microsoft.com/en-us/fabric/real-time-intelligence/media/operations-agent/properties.png" alt="Screenshot of an operations agent playbook and its properties." height=400>

### Rules: state versus transition

Each rule pairs a property with a condition, and the type of condition decides how often the agent alerts:

- **State conditions** are met every time the agent checks while the value stays in that state, so they can alert repeatedly. Use them when you care about *being* in a state.
- **Transition conditions** are met only at the moment the value changes into the condition, so they alert once per change. Use them when you care about the *change*.

| State condition | Transition condition |
|---|---|
| **Is above** a value | **Crosses above** a value |
| **Is below** a value | **Crosses below** a value |
| **Is** a value | **Becomes** a value |
| | **Enters range** / **Exits range** |

For example, "temperature **is above** 80" alerts on every check while it stays hot; "temperature **crosses above** 80" alerts once when it gets hot.

<img src="https://learn.microsoft.com/en-us/fabric/real-time-intelligence/media/operations-agent/rule-details.png" alt="Screenshot of a rule expanded to show the query behind it." height=400>

### Writing good instructions

Learn's best practices, in short:

- **Prepare the data.** Flatten nested JSON columns, add plain-language descriptions to unclear column names, and make sure the ingestion time is populated, because the agent uses timestamps to find new data.
- **Name the business object.** Tell the agent which column identifies the thing it monitors (for example, `StationID` or `SensorID`) and which table it's in, or which ontology entity to use.
- **Use numbers, not adjectives.** Replace "low availability" with "fewer than 3 bikes available."
- **One rule per line**, with the highest-priority rules first.
- **Quote names with special characters**, such as underscores or hyphens.
- **Separate what to watch from what the data means.** Learn's sample splits instructions into *Operational instructions* (the alerts you want) and *Semantic instructions* (which table holds what, how tables relate, and what values mean, such as "more than 300 seconds of delay is significant").

### Using an ontology as the source (preview)

An operations agent grounded in an ontology reasons in business terms (Store, Freezer, Shipment) instead of raw tables, and its Teams messages reference those entity types. Keep these limits in mind:

- The ontology must be in the **same workspace** as the agent.
- Each monitored entity needs at least one static property to use as its identifier, and time-series properties should be bound to Eventhouse fields.
- Rules can only test basic property values. Aggregations (average, minimum, maximum) and rules that combine conditions with **AND** aren't supported.
- Known issue: operations agents don't currently work with an ontology that uses semantic models for its bindings.

See <a href="https://learn.microsoft.com/en-us/fabric/iq/ontology/how-to-create-operations-agent">Create an operations agent grounded in an ontology</a>.

### Identity and security

- Each operations agent gets its **own Microsoft Entra identity** (Microsoft Entra Agent ID), so it shows up in the Microsoft Entra admin center and its actions are audited separately from people's actions.
- It runs in **delegated** mode: queries and approved actions use the **creator's permissions**. Changing who receives the messages doesn't change whose permissions are used, so choose the creator carefully.
- Message recipients must be in your organization and have write permission on the agent item.

### Capacity and billing

Operations agents consume capacity in a few ways:

- **Setup:** Copilot in Fabric usage while you generate and refine the playbook.
- **Active monitoring:** the *Operations agent compute* meter at **0.46 CU hours per hour** while the agent runs, plus the Eventhouse queries it runs.
- **When a rule is met:** the *Operations agent autonomous reasoning* meter, based on tokens, while it analyzes data and writes recommendations.
- **Storage:** data the agent monitors is kept in Fabric for 30 days and billed as OneLake storage.
- **Actions:** Power Automate flows might need their own licensing, because they start from the <a href="https://learn.microsoft.com/en-us/connectors/dataactivator/">Data Activator connector</a>, which is a premium connector.

See <a href="https://learn.microsoft.com/en-us/fabric/real-time-intelligence/operations-agent-billing">Operations agent capacity and billing</a>. For cost guidance for all of this module's Activities, see <a href="00%20-%20Pre-Requisites.md#module-07-costs">Keep costs down</a> in Module 00.

### Limits to plan for

- One data source per agent. With an Eventhouse, only tables and shortcut tables work (not functions or materialized views).
- Instructions must be in English, and the data must have a timestamp.
- Available in Azure public cloud Fabric regions **except East US and South Central US** (see <a href="https://learn.microsoft.com/en-us/fabric/admin/region-availability#regional-fabric-and-power-bi-workload-availability">Fabric region availability</a>), not in sovereign clouds, and not in workspaces encrypted with customer-managed keys.
- Under heavy use, Teams messages might be throttled to simpler, non-AI-generated messages.

See <a href="https://learn.microsoft.com/en-us/fabric/real-time-intelligence/operations-agent-limitations">Operations agent best practices and limitations</a>.

### Operations agent MCP server (preview)

Like data agents (<a href="#7.5">7.5</a>), operations agents can be reached through MCP, but for a different job. Each agent exposes two endpoints: a **configure** endpoint to set instructions, add data sources and actions, generate the playbook, and start or stop the agent; and a **query** endpoint to check its state and search its past operations. From Visual Studio Code or the GitHub Copilot CLI, you can build and run an operations agent by chatting with it. You need the Contributor or Admin role on the workspace. See <a href="https://learn.microsoft.com/en-us/fabric/real-time-intelligence/mcp-remote-operations-agent">Remote MCP server for operations agents</a>.

<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/point1.png"><b>Self-Guided Activity: Create and start an operations agent</b></p>

In this Activity, you will set up the Real-Time Intelligence sample data, create an operations agent that monitors it, generate and review its playbook, start it, and receive a recommendation in Microsoft Teams. Use the sample Eventhouse as the agent's source, not the Lakeshore Retail ontology from <a href="#7.4">7.4</a>: that ontology binds its Sale entity type to a semantic model, and operations agents don't currently work with an ontology that uses semantic models for binding. The sample uses London bike rental data, like the Module 06 tutorial; for a refresher, see Module 06, sections <a href="06%20-%20Real-Time%20Intelligence.md#6.2">6.2</a> (eventstreams), <a href="06%20-%20Real-Time%20Intelligence.md#6.3">6.3</a> (Eventhouses), and <a href="06%20-%20Real-Time%20Intelligence.md#6.6">6.6</a> (Activator).

Open the following references and complete the steps:

<p><img style="margin: 0px 15px 15px 0px;" src="../graphics/checkmark.png"><b>Steps</b></p>

- [Real-Time Intelligence end-to-end sample](https://learn.microsoft.com/en-us/fabric/real-time-intelligence/sample-end-to-end) (sample Eventhouse for the agent to monitor)
  - Keep **Bike_Eventstream** running while you test. The agent [runs its queries every five minutes](https://learn.microsoft.com/en-us/fabric/real-time-intelligence/operations-agent-limitations#runtime-limitations) and looks only for records newer than the latest one it has already seen, so the first Teams message can take one or more checks to arrive.
- [Receive messages from an operations agent](https://learn.microsoft.com/en-us/fabric/real-time-intelligence/operations-agent-actions#receive-messages-from-an-operations-agent): install the **Fabric Operations Agent** Teams app first, so the agent can contact you. If your organization controls which Teams apps people can use, a Teams administrator might need to allow it; see [Allow or block agents and apps](https://learn.microsoft.com/en-us/microsoftteams/manage-apps#allow-or-block).
- [Create and configure operations agents](https://learn.microsoft.com/en-us/fabric/real-time-intelligence/operations-agent), in this order:
  - On **Agent setup**, choose the sample Eventhouse's KQL database as the data source, and write instructions that use a specific number and describe a change, for example: *Alert me when the number of available bikes at a station drops below 3.* Open **Bike_Eventhouse** first to find the table, the column that identifies each station, and the column that holds the number of available bikes. Name them in your instructions, in quotation marks if they contain underscores, as Learn's [best practices](https://learn.microsoft.com/en-us/fabric/real-time-intelligence/operations-agent-limitations#best-practices) recommend.
  - (optional) Also on **Agent setup**, before you generate the playbook, add any [actions](https://learn.microsoft.com/en-us/fabric/real-time-intelligence/operations-agent-actions#configure-agent-actions), for example a Fabric item action that runs a notebook. A Power Automate action also needs an Activator item, such as the sample's **Bike_Activator**, to save its connection.
  - Save the agent, select **Generate Playbook**, and review the rules. Check that your rule uses **Crosses below**, which is met once when a station's value drops below 3, rather than **Is below**, which is met on every check while the value stays below 3 (see **Rules: state versus transition** earlier in this section). If it doesn't, ask Copilot chat to refine the rule.
  - Select **Start**.
- [Create an operations agent grounded in an ontology](https://learn.microsoft.com/en-us/fabric/iq/ontology/how-to-create-operations-agent) (optional; it needs an ontology in the agent's workspace that doesn't use semantic models for binding, because of a [known issue](https://learn.microsoft.com/en-us/fabric/iq/ontology/how-to-create-operations-agent#prerequisites), so the Lakeshore Retail ontology from section 7.4 doesn't qualify)
- [Remote MCP server for operations agents](https://learn.microsoft.com/en-us/fabric/real-time-intelligence/mcp-remote-operations-agent) (optional)
- When your first recommendation arrives and you've finished any optional steps, select **Stop** in the agent's toolbar and deactivate **Bike_Eventstream**, so they don't keep using capacity.

> **Note:** In Teams, **Investigate further** is how you view [Investigator insights](https://learn.microsoft.com/en-us/fabric/real-time-intelligence/operations-agent-actions#view-investigator-insights-in-teams) (preview), which the agent runs when it detects an anomaly. If you expect it and don't see it, ask your Fabric administrator to check the *Insights for operations agents (preview)* tenant setting, which Learn's [tenant settings index](https://learn.microsoft.com/en-us/fabric/admin/tenant-settings-index#microsoft-fabric) describes as letting users view insights for events that operations agents generate.

> If you only reviewed the documentation in this Activity, ensure you bookmark each of these references and then perform the Activity in full once you do have your deployment.

Learn more: <a href="https://learn.microsoft.com/en-us/fabric/real-time-intelligence/operations-agent">Create and configure operations agents</a> | <a href="https://learn.microsoft.com/en-us/fabric/real-time-intelligence/operations-agent-limitations">Best practices and limitations</a> | <a href="https://learn.microsoft.com/en-us/fabric/real-time-intelligence/operations-agent-transparency-note">Operations agent transparency note</a>

<p style="border-bottom: 1px solid lightgrey;"></p>

<p><img style="margin: 0px 15px 15px 0px;" src="../graphics/owl.png"><b>For Further Study</b></p>
<ul>
  <li><a href="https://learn.microsoft.com/en-us/fabric/fundamentals/copilot-fabric-overview">Overview of Copilot in Fabric</a></li>
  <li><a href="https://learn.microsoft.com/en-us/fabric/fundamentals/copilot-ai-feature-state">Release status of AI and Copilot experiences in Fabric</a></li>
  <li><a href="https://learn.microsoft.com/en-us/fabric/fundamentals/copilot-privacy-security">Privacy, security, and responsible AI use of Copilot in Fabric</a></li>
  <li><a href="https://learn.microsoft.com/en-us/fabric/fundamentals/copilot-fabric-consumption">Consumption rates and billing for Copilot in Fabric</a></li>
  <li><a href="https://learn.microsoft.com/en-us/fabric/enterprise/fabric-copilot-capacity">Fabric Copilot capacity</a></li>
  <li><a href="https://learn.microsoft.com/en-us/fabric/fundamentals/copilot-faq-fabric">Copilot for Microsoft Fabric and Power BI: FAQ</a></li>
  <li><a href="https://learn.microsoft.com/en-us/fabric/iq/overview">What is Fabric IQ?</a></li>
  <li><a href="https://learn.microsoft.com/en-us/fabric/iq/ontology/overview">What is ontology?</a></li>
  <li><a href="https://learn.microsoft.com/en-us/fabric/data-science/concept-data-agent">Fabric data agent concepts</a></li>
  <li><a href="https://learn.microsoft.com/en-us/fabric/data-science/data-agent-tenant-settings">Fabric data agent tenant settings</a></li>
  <li><a href="https://learn.microsoft.com/en-us/fabric/data-science/data-agent-sharing">Fabric data agent sharing and permission management</a></li>
  <li><a href="https://learn.microsoft.com/en-us/fabric/real-time-intelligence/operations-agent">Create and configure operations agents</a></li>
  <li><a href="https://learn.microsoft.com/en-us/fabric/fundamentals/whats-new">As always, this is a fast-changing technology, so ensure you check this reference to find the latest improvements.</a></li>
</ul>

<p style="border-bottom: 1px solid lightgrey;"></p>

Congratulations! You have completed this Module. If you understand the concepts here and have completed all of the Activities, you can [proceed to the next Module](08%20-%20OLTP%20Databases%20in%20Fabric.md).

