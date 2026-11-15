![](../graphics/microsoftlogo.png)

# Workshop: Microsoft Fabric Overview for the Data Professional

#### <i>A workshop from the Tales from the Field team</i>

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2 id="03"><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/pencil2.png">03 - Data Integration</h2>

Microsoft Fabric Data Factory gives data professionals a unified experience for connecting to data sources, moving data into Fabric, shaping it for analytics, and orchestrating repeatable data integration workflows. It supports familiar low-code experiences, pipeline-based orchestration, simplified copy jobs, and Power Query-based transformations, all integrated with the broader Fabric platform.

In this module, you focus on the data integration layer of a Fabric solution. You'll start by choosing the right movement or preparation pattern, then work through the three core Data Factory experiences this workshop uses most: **Copy activity**, **Copy job**, and **Dataflow Gen2**. By the end, you should be able to explain when each experience is the right fit and how it contributes to a broader Fabric analytics architecture.

The flow is intentionally hands-on. Each concept is followed by an activity that asks you to make a design decision, build something, validate it, or explain how you would operate it in a real organization.

In each section you'll get more references, which you should follow up on to learn more. Also watch for links within the text - click on each one to explore that topic.

(<a href="00%20-%20Pre-Requisites.md">Make sure you check out the <b>Pre-Requisites</b> page before you start</a>. You'll need all of the items loaded there before you can proceed with the workshop.)

You'll cover these topics in this module:

<dl>

  <dt><a href="#3.1">3.1 - Choosing the right data movement pattern</a></dt>
  <dt><a href="#3.2">3.2 - Loading data with Copy activity</a></dt>
  <dt><a href="#3.3">3.3 - Loading data with Copy job</a></dt>
  <dt><a href="#3.4">3.4 - Transforming data with Dataflow Gen2</a></dt>

</dl>

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2 id="3.1"><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/pencil2.png">3.1 Choosing the right data movement pattern</h2>

Older Fabric workshop content often treated ingestion as "create a pipeline and copy data." That is no longer the best default. Fabric Data Factory now gives you several movement patterns that are optimized for different problems.

Use this decision table during solution design:

| Need | Recommended capability | Why |
| --- | --- | --- |
| Build an orchestrated ingestion workflow that can include validation, branching, retries, notebooks, SQL scripts, stored procedures, notifications, and scheduling | **Copy activity in a pipeline** | The pipeline canvas gives you end-to-end control flow and the Copy activity gives you connector-rich, configurable data movement |
| Move one or more datasets with the simplest guided experience, without designing a full pipeline first | **Copy job** | Guided setup, no pipeline required, built-in support for full copy, incremental copy, CDC replication, mapping, auditing, scheduling, and destination table creation |
| Clean, shape, combine, and load data with a low-code Power Query experience | **Dataflow Gen2** | Visual transformations, hundreds of Power Query transformations, multiple destinations, refresh monitoring, pipeline integration, and Copilot assistance |
| Continuously replicate operational or already-curated data into OneLake for reporting | **Mirroring** | Minimal setup and continuous replication; this workshop mentions it here, but expands on it elsewhere |
| Ingest streaming or event data with low latency | **Eventstreams** | Real-time ingestion, no-code transformations, and routing to destinations such as Lakehouse, Eventhouse, Activator, or custom endpoints; this workshop expands on it elsewhere |

The key distinction in this module is between **Copy activity**, **Copy job**, and **Dataflow Gen2**:

| Capability | Best fit | What makes it different |
| --- | --- | --- |
| **Copy activity** | Pipeline-centered ingestion and orchestration | Lives inside a pipeline, so it can participate in dependencies, parameters, control flow, scheduling, monitoring, and multi-step workflows |
| **Copy job** | Fast, guided data movement | Starts from a simplified job experience instead of a pipeline canvas; ideal when movement is the main goal |
| **Dataflow Gen2** | Low-code transformation and preparation | Uses the Power Query experience to clean, combine, and shape data before loading it |

Copy activity and Copy job both move data and both use Fabric Data Factory connectors, but they optimize for different authors. Use **Copy activity** when the movement is one step in a larger process. Use **Copy job** when you want a direct data movement asset with less orchestration overhead. Use **Dataflow Gen2** when the problem is not just "move this data" but "prepare this data so it is ready for analytics."

### Learn more

- [Compare Copy job, Mirroring, Copy activity, and Eventstreams](https://learn.microsoft.com/en-us/fabric/data-factory/decision-guide-data-movement)
- [How to copy data using Copy activity](https://learn.microsoft.com/en-us/fabric/data-factory/copy-data-activity)
- [What is Copy job in Data Factory?](https://learn.microsoft.com/en-us/fabric/data-factory/what-is-copy-job)
- [Differences between Dataflow Gen1 and Dataflow Gen2](https://learn.microsoft.com/en-us/fabric/data-factory/dataflows-gen2-overview)

<br>

<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/point1.png"><b>Activity: Pick the Ingestion Pattern</b></p>

Choose the best Fabric data movement option for common data professional scenarios.

<p><img style="margin: 0px 15px 15px 0px;" src="../graphics/checkmark.png"><b>Steps</b></p>

- For each scenario, choose **Mirroring**, **Copy job**, **Pipeline Copy activity**, **Dataflow Gen2**, or **Eventstreams**:
  - A SQL Server table needs to be copied every night into a warehouse, with only new and changed rows after the first run.
  - A sales operations database should be continuously replicated into OneLake for reporting with little configuration.
  - A data engineer needs a parameterized ingestion framework that loops through many source tables, runs validation queries, and sends a notification when the load completes.
  - A business analyst needs to clean customer names, remove invalid rows, and load a shaped table into a warehouse without writing code.
  - A support operations team needs live call-center events routed into real-time analytics.
- Explain why your choice is better than the second-best option.
- Identify which choices this module covers deeply and which ones are introduced here but covered later in the workshop.

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2 id="3.2"><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/pencil2.png">3.2 Loading data with Copy activity</h2>

The Copy activity is the pipeline-based data movement workhorse in Fabric Data Factory. In a pipeline, the Copy activity connects to a source, reads data, processes serialization and deserialization, handles compression, maps columns, performs supported data type conversions, writes to a destination, and produces monitoring details that help you troubleshoot and optimize the run.

Copy activity is useful because it combines broad connectivity with orchestration. Fabric Data Factory supports connectors across databases, files, cloud services, SaaS applications, Fabric items, multicloud stores, and hybrid or on-premises sources through gateways. The connector catalog is shared across Dataflow Gen2, pipelines, and Copy jobs, but pipeline Copy activity is the choice when you need the copy operation to be part of a larger workflow.

Use Copy activity when you need to:

- Copy from one of the many supported Fabric Data Factory connectors into a Lakehouse, Warehouse, database, file store, or other supported destination.
- Use a pipeline schedule, dependency chain, condition, parameter, loop, or failure path.
- Add validation before or after data movement.
- Run a SQL script, stored procedure, notebook, Dataflow Gen2 activity, or notification as part of the same process.
- Reuse pipeline parameters for metadata-driven ingestion.
- Control source and destination settings directly from the pipeline canvas.
- Review copy metrics, activity details, and output from the pipeline run.

The Copy activity can be added with the **Copy data assistant** or directly from the pipeline activity ribbon. The assistant is helpful for first-time authors because it walks through source, destination, mapping, and review. Adding the activity directly is better when you already know the pipeline structure and want to configure tabs such as **Source**, **Destination**, **Mapping**, and **Settings** yourself.

<p><img src="https://learn.microsoft.com/en-us/fabric/data-factory/media/data-factory-overview/data-pipelines.png" height="300"></p>

### Copy activity compared with Copy job

| Decision point | Copy activity | Copy job |
| --- | --- | --- |
| Authoring surface | Pipeline canvas | Dedicated Copy job experience |
| Best for | Multi-step orchestration | Focused data movement |
| Control flow | Uses pipeline activities, dependencies, parameters, conditions, loops, schedules, and monitoring | Simpler guided setup; can also be used from pipeline scenarios when needed |
| Complexity | More flexible, more design decisions | Easier to start and operate for common movement scenarios |
| Typical user | Data engineer or analytics engineer building a process | Data professional who wants reliable movement with fewer orchestration choices |

### Learn more

- [How to copy data using Copy activity](https://learn.microsoft.com/en-us/fabric/data-factory/copy-data-activity)
- [Create your first pipeline to copy data](https://learn.microsoft.com/en-us/fabric/data-factory/create-first-pipeline-with-sample-data)
- [Connector overview](https://learn.microsoft.com/en-us/fabric/data-factory/connector-overview)
- [Tutorial: Ingest data into a Warehouse in Microsoft Fabric](https://learn.microsoft.com/en-us/fabric/data-warehouse/tutorial-ingest-data)

<br>

<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/point1.png"><b>Activity: Build a Pipeline with Copy activity</b></p>

Create a pipeline that uses Copy activity, then explain why pipeline orchestration matters.

<p><img style="margin: 0px 15px 15px 0px;" src="../graphics/checkmark.png"><b>Steps</b></p>

- From the workspace, select **+ New item**.
- Create a **Pipeline** and name it using a clear convention such as `pl_load_public_holidays`.
- Select **Copy data assistant** or add **Copy activity** directly to the canvas.
- Choose an available source. If you are using sample data, select the **Public Holidays** sample dataset.
- Preview the source data.
- Choose a destination such as a Lakehouse table or Fabric Warehouse table, depending on your workshop environment.
- Review and adjust the column mapping.
- Save and run the pipeline.
- Open the run output and inspect the activity details, including rows read, rows written, duration, and status.
- Add one additional pipeline step you would use in production, such as validation, a SQL script, a stored procedure, or a notification.
- Explain why this scenario is better served by Copy activity than by a standalone Copy job.

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2 id="3.3"><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/pencil2.png">3.3 Loading data with Copy job</h2>

Copy job is the preferred simplified experience for many data movement tasks in Fabric Data Factory. It is designed for users who want to move data from many sources to many destinations without first designing a full pipeline.

Use Copy job when the main task is data movement and you do not need the full pipeline canvas. It is especially useful for workshop and production scenarios where you want a fast, repeatable, observable way to move tables or files into Fabric with less ceremony than building a pipeline from scratch.

Copy job is useful because it:

- Gives you a guided authoring experience for source, data selection, destination, copy mode, mapping, review, and run.
- Supports many source and destination combinations through Fabric Data Factory connectors.
- Can run as a one-time load or on a schedule.
- Tracks incremental copy state so subsequent runs can move only new or changed data.
- Can resume safely from the last successful state after failures.
- Supports source queries for subset loading and source-side filtering in supported database scenarios.
- Provides destination write behaviors that support common warehouse loading patterns.
- Can add audit metadata for lineage and troubleshooting without custom code.

Copy job supports several concepts that are more relevant now than they were in early Fabric workshop content:

- **Full copy** - Copy all selected data each run.
- **Incremental copy** - Copy only new or changed data after the first full load.
- **CDC-based incremental copy** - Use source change data capture where available to replicate inserts, updates, and deletes.
- **Watermark-based incremental copy** - Use a reliable incremental column such as a datetime, rowversion, integer, date, or string interpreted as datetime.
- **Append, overwrite, merge, and SCD Type 2** - Choose how destination rows are written, updated, or versioned.
- **Automatic destination table creation** - Let Copy job create supported destination tables when they do not already exist.
- **Audit columns** - Add lineage and run metadata such as extraction time, source file path, workspace ID, copy job ID, run ID, copy job name, and incremental window bounds.
- **Change data feed for Lakehouse destinations** - Enable downstream incremental consumers when Copy job creates destination Lakehouse tables.

When the destination is Fabric Warehouse, the copy workflow can create or map destination schema and table names, adjust column mappings, and run the job. When you need the copy to be part of a broader workflow, you can use a Copy job activity in a pipeline.

### When Copy job is the better choice

Use Copy job instead of Copy activity when:

- The data movement is the main asset you want to create and monitor.
- The load does not need complex branching, loops, or multiple dependent activities.
- A business analyst or data professional needs a guided experience.
- You want built-in support for full, incremental, or CDC-style loads without designing state management yourself.
- You need common destination behaviors such as append, overwrite, merge, or SCD Type 2.
- You want audit columns added consistently to destination rows.

Use Copy activity instead when data movement is just one action inside a broader pipeline workflow.

### Learn more

- [What is Copy job in Data Factory?](https://learn.microsoft.com/en-us/fabric/data-factory/what-is-copy-job)
- [Ingest data into your Warehouse using pipelines](https://learn.microsoft.com/en-us/fabric/data-warehouse/ingest-data-pipelines)
- [Create your first pipeline to copy data](https://learn.microsoft.com/en-us/fabric/data-factory/create-first-pipeline-with-sample-data)

<br>

<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/point1.png"><b>Activity: Move Data with Copy job</b></p>

Create a Copy job that moves data into a Fabric analytics destination. If you already have a warehouse available, use it as the destination. If not, use another available destination and revisit the warehouse load after section 3.5.

<p><img style="margin: 0px 15px 15px 0px;" src="../graphics/checkmark.png"><b>Steps</b></p>

- From the workspace, select **+ New item**.
- Under **Get data**, select **Copy job**.
- Name the Copy job using a clear pattern such as `load_customer_to_warehouse`.
- Choose a source from the **OneLake catalog** or another available connector in your environment.
- Preview the selected dataset and confirm the expected columns are present.
- Choose a Fabric destination such as a Warehouse table or Lakehouse table.
- Select **Full copy** for the first workshop run. If your source supports it, discuss what column or CDC setting you would use for incremental copy later.
- Set the destination schema and table name.
- Review column mappings. Rename at least one destination column to match your team's naming standard.
- Save and run the Copy job.
- Monitor the run from the results pane.
- Return to the destination item and preview the loaded data.
- Record what you would change to make the job production-ready: schedule, incremental strategy, audit columns, naming, permissions, and monitoring.

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2 id="3.4"><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/pencil2.png">3.4 Transforming data with Dataflow Gen2</h2>

Dataflow Gen2 is the modern Power Query-based data preparation experience in Fabric. It can connect to hundreds of sources, apply hundreds of transformations, and load data to destinations including Fabric Warehouse, Lakehouse tables, Lakehouse files, KQL database, Azure SQL Database, PostgreSQL, Snowflake, and SharePoint files.

The major update for current workshop content is that new Dataflow Gen2 items are created with CI/CD and Git integration support by default. Classic Dataflow Gen2 creation without CI/CD support is no longer the default for new items as of April 2026.

Dataflow Gen2 also provides:

- AutoSave and background publishing.
- Better monitoring and refresh tracking.
- Pipeline integration through dataflow activities.
- High-performance compute.
- Recent data shortcuts.
- Copilot assistance for generating transformations, explaining queries, creating sample data, and undoing the last applied step.

Use Dataflow Gen2 when the task involves shaping data, not just moving it. It is especially useful when the person building the flow is comfortable with Power Query or when the business logic benefits from a visual applied-steps experience.

<p><img src="https://learn.microsoft.com/en-us/fabric/data-factory/media/data-factory-overview/dataflow-experience.png" height="300"></p>

Common Dataflow Gen2 scenarios include:

- Connecting to source data and selecting only the entities or files needed for analysis.
- Filtering invalid or irrelevant rows.
- Renaming, retyping, splitting, merging, and deriving columns.
- Joining multiple sources with Power Query.
- Applying business rules before loading to a Warehouse or Lakehouse.
- Publishing refreshable transformation logic that can also be orchestrated by a pipeline.

Copilot in the Data Factory workload can help with Dataflow Gen2 by generating transformation steps, summarizing queries, creating sample data, and undoing the last applied step. Treat Copilot output like generated code: useful for acceleration, but something you still review before relying on it.

### Dataflow Gen2 compared with Copy activity and Copy job

| Decision point | Dataflow Gen2 | Copy activity | Copy job |
| --- | --- | --- | --- |
| Primary purpose | Prepare and transform data | Move data inside pipeline orchestration | Move data with a guided job experience |
| Authoring model | Power Query, visual applied steps | Pipeline activity configuration | Guided Copy job wizard |
| Best user experience | Low-code transformation | Data engineering orchestration | Fast ingestion setup |
| Output pattern | Load transformed data to supported destinations | Copy data as part of a process | Copy data as a managed movement job |

Copy activity and Copy job can perform mapping and type conversion, but they are still primarily movement tools. Dataflow Gen2 is the choice when the module needs participants to experience the data preparation layer before they land curated data in the warehouse.

### Learn more

- [Differences between Dataflow Gen1 and Dataflow Gen2](https://learn.microsoft.com/en-us/fabric/data-factory/dataflows-gen2-overview)
- [Microsoft Copilot in Fabric in the Data Factory workload](https://learn.microsoft.com/en-us/fabric/data-factory/copilot-fabric-data-factory)
- [Dataflow Gen2 data destinations and managed settings](https://learn.microsoft.com/en-us/fabric/data-factory/dataflow-gen2-data-destinations-and-managed-settings)
- [Quickstart: Create your first dataflow to get and transform data](https://learn.microsoft.com/en-us/fabric/data-factory/create-first-dataflow-gen2)

<br>

<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/point1.png"><b>Activity: Prepare Data with Dataflow Gen2</b></p>

Create a Dataflow Gen2 item that prepares source data before loading it to an analytics destination.

<p><img style="margin: 0px 15px 15px 0px;" src="../graphics/checkmark.png"><b>Steps</b></p>

- From the workspace, select **+ New item** and create a **Dataflow Gen2** item.
- Connect to an available source.
- Select one table, file, or entity that needs basic cleanup.
- Identify at least three transformations needed before reporting, such as:
  - Standardizing column names.
  - Filtering invalid rows.
  - Creating business-friendly categories.
  - Joining to a lookup table.
  - Building a dimension or fact table.
- Apply the transformations in the Power Query experience.
- Configure an output destination, such as a Fabric Warehouse table or Lakehouse table.
- Publish the dataflow.
- If Copilot is enabled in your tenant, ask Copilot to explain the current query or generate one transformation step. Review the result before keeping it.
- Explain which work belongs in Dataflow Gen2 and which work should wait until the warehouse modeling layer.

You can also right-click this link to open it in another tab and review this video that introduces you to these concepts:

<p><a href="https://www.youtube.com/watch?v=0jSTd2P20pk"><img src="https://img.youtube.com/vi/0jSTd2P20pk/0.jpg" height="200"></a></p>

<p style="border-bottom: 1px solid lightgrey;"></p>

## Module wrap-up

In this module, you focused on the Data Factory layer of a Fabric solution:

- You selected the right data movement option instead of defaulting to one pattern for every problem.
- You compared Copy activity, Copy job, Dataflow Gen2, Mirroring, and Eventstreams.
- You built a pipeline-centered ingestion flow with Copy activity.
- You built a guided data movement flow with Copy job.
- You prepared data with Dataflow Gen2.

The key takeaway is that Data Factory gives you multiple ways to integrate data, and each one has a different design center. **Copy activity** is best when movement belongs inside an orchestrated pipeline. **Copy job** is best when you want a focused, guided movement experience. **Dataflow Gen2** is best when the important work is preparing and transforming data before it lands in an analytics destination. Mirroring and Eventstreams are important Fabric integration patterns too, but this module introduces them only enough to help you recognize when a later workshop section should use them.

<p><img style="margin: 0px 15px 15px 0px;" src="../graphics/owl.png"><b>For Further Study</b></p>

- [What is Data Factory in Microsoft Fabric?](https://learn.microsoft.com/en-us/fabric/data-factory/data-factory-overview)
- [Compare Copy job, Mirroring, Copy activity, and Eventstreams](https://learn.microsoft.com/en-us/fabric/data-factory/decision-guide-data-movement)
- [Connector overview for Data Factory in Microsoft Fabric](https://learn.microsoft.com/en-us/fabric/data-factory/connector-overview)
- [How to copy data using Copy activity](https://learn.microsoft.com/en-us/fabric/data-factory/copy-data-activity)
- [Create your first pipeline to copy data](https://learn.microsoft.com/en-us/fabric/data-factory/create-first-pipeline-with-sample-data)
- [What is Copy job in Data Factory?](https://learn.microsoft.com/en-us/fabric/data-factory/what-is-copy-job)
- [Differences between Dataflow Gen1 and Dataflow Gen2](https://learn.microsoft.com/en-us/fabric/data-factory/dataflows-gen2-overview)
- [Microsoft Copilot in Fabric in the Data Factory workload](https://learn.microsoft.com/en-us/fabric/data-factory/copilot-fabric-data-factory)

Congratulations! You have completed this Module. If you understand the concepts here and have completed all of the Activities, you can <a href="04 - The Lakehouse and Warehouse.md">proceed to the next Module</a>.