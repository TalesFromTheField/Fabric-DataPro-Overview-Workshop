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

<br>
<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/point1.png"><b>Activity: Configure Fabric Mirrored Database</b></p>

<p><img src="https://learn.microsoft.com/en-us/fabric/database/mirrored-database/media/azure-sql-database/fabric-mirroring-sql-database.svg" height = 400></p>

In this activity, you will learn how Copilot in Power BI supports enterprise developers, self-service users, and business users and provides information on integration points and the different experiences designed for creating and consuming content using Copilot.

Open the following reference and complete the steps you see there:

- Open the following Link in another tab follow the instructions to obtain Revenue Opportunities.pbix file <a href="https://learn.microsoft.com/en-us/power-bi/create-reports/tutorial-copilot-power-bi-get-started"> Copilot in Power BI tutorial: Get started</a>
- Open the following Link in another tab follow the instructions <a href="https://learn.microsoft.com/en-us/power-bi/create-reports/tutorial-copilot-power-bi-prepare-model">Prepare semantic model for AI</a>
- Open the following Link in another tab follow the instructions <a href="https://learn.microsoft.com/en-us/power-bi/create-reports/tutorial-copilot-power-bi-discover-data">Discover data and ask questions</a>
- Open the following Link in another tab follow the instructions <a href="https://learn.microsoft.com/en-us/power-bi/create-reports/tutorial-copilot-power-bi-explore-data">Explore data and get more insights</a>


<p style="border-bottom: 1px solid lightgrey;"></p>


<h2 id="7-3"><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/pencil2.png">7.3 - What is Fabric IQ?</h2>

> **Coming soon:** This section is being written.

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2 id="7-4"><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/pencil2.png">7.4 - Ontology</h2>

> **Coming soon:** This section is being written.

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



