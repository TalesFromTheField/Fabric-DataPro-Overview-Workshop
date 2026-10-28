![](../graphics/microsoftlogo.png)

# Workshop: Microsoft Fabric Overview for the Data Professional

#### <i>A Microsoft Workshop</i>

<p style="border-bottom: 1px solid lightgrey;"></p>

<img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/textbubble.png"> <h2>06 - Real-Time Intelligence with Microsoft Fabric</h2>

In this module you'll learn how Real-Time Intelligence in Microsoft Fabric works with data in motion. You'll bring event streams into Fabric, store and query them with the Kusto Query Language (KQL), watch them on live dashboards and maps, and react to them automatically with Activator. Each section ends with a Self-Guided Activity, and together the activities walk you through one Microsoft Learn tutorial that streams sample bicycle-rental data from London.

In each module you'll get more references, which you should follow up on to learn more. Also watch for links within the text - click on each one to explore that topic.

(<a href="00%20-%20Pre-Requisites.md" >Make sure you check out the <b>Pre-Requisites</b> page before you start</a>. You'll need all of the items loaded there before you can proceed with the workshop.)

You'll cover these topics in this Module on Real-Time Intelligence:

<dl>
  <dt><a href="#6.1" >6.1 - Real-Time Intelligence in Microsoft Fabric</a></dt>
  <dt><a href="#6.2" >6.2 - Real-Time hub and Eventstream</a></dt>
  <dt><a href="#6.3" >6.3 - Eventhouses and KQL Databases</a></dt>
  <dt><a href="#6.4" >6.4 - Querying Data with KQL</a></dt>
  <dt><a href="#6.5" >6.5 - Real-Time Dashboards</a></dt>
  <dt><a href="#6.6" >6.6 - Activator</a></dt>
  <dt><a href="#6.7" >6.7 - Fabric Maps</a></dt>
</dl>

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2 id="6.1"><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/pencil2.png">6.1 Real-Time Intelligence in Microsoft Fabric</h2>

Real-Time Intelligence (RTI) is the part of Microsoft Fabric for data in motion: events that arrive continuously from applications, devices, logs, and other systems. It covers the whole journey of that data, from capturing and transforming events to storing, analyzing, visualizing, and acting on them. "Real-time" describes how a solution responds, not how much data it handles. An RTI solution reacts as events arrive instead of waiting for a scheduled load, so it's useful even when your events trickle in slowly.

Real-Time Intelligence is a good fit when:

- You need answers within seconds or minutes of an event, not after tonight's batch load
- Time matters in your data, as it does for telemetry, logs, clickstreams, and sensor readings
- Your data is semi-structured, like JSON, or free text, and you want to query it without reshaping it first
- You want to send an alert or start a process as soon as a condition is met

These are the main items you'll work with in this module:

| Item | What it does | Section |
|---|---|---|
| Real-Time hub | Lists the streams and KQL tables you can use across your organization, and connects new sources | 6.2 |
| Eventstream | Captures events, transforms them without code, and sends them to destinations | 6.2 |
| Eventhouse and KQL database | Stores event data and indexes it by arrival time for fast queries | 6.3 |
| KQL queryset | Runs and saves KQL and T-SQL queries | 6.4 |
| Real-Time Dashboard | Shows live query results as tiles | 6.5 |
| Activator | Watches data and takes action when a condition is met | 6.6 |
| Map | Plots live and static location data on a map | 6.7 |

Other RTI items, such as anomaly detection and digital twin builder, are in preview.

<img src="https://learn.microsoft.com/en-us/fabric/real-time-intelligence/media/overview/overview-schematic.png" alt="Real-Time Intelligence architecture: event sources flow through Eventstream into an Eventhouse, with querysets, Real-Time Dashboards, Power BI, and Activator built on top, and Real-Time hub and OneLake underneath" height = 400>

If you've used Azure Data Explorer (ADX), a lot of this will feel familiar. Eventhouse databases run on the same Kusto engine and use the same KQL, so your queries and skills carry over. What changes is how you get the service. ADX is an Azure platform service that you provision and manage, while RTI is a software as a service (SaaS) experience inside Fabric, with its data in OneLake next to the rest of your Fabric items. You can also read an existing ADX database from Fabric through a database shortcut. For a detailed comparison, see [What is the difference between Real-Time Intelligence and comparable Azure solutions?](https://learn.microsoft.com/en-us/fabric/real-time-intelligence/real-time-intelligence-compare)

<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/point1.png"><b>Self-Guided Activity: Get ready for the Real-Time Intelligence tutorial</b></p>

The activities in this module follow one Microsoft Learn tutorial from start to finish, one part per section. In this Activity you will read about the tutorial's scenario and create a workspace for it.

<p><img style="margin: 0px 15px 15px 0px;" src="../graphics/checkmark.png"><b>Steps</b></p>

- [Open this reference and read the scenario and prerequisites](https://learn.microsoft.com/en-us/fabric/real-time-intelligence/tutorial-introduction)
- [Create a workspace](https://learn.microsoft.com/en-us/fabric/fundamentals/create-workspaces) that you use only for this tutorial, on a Fabric capacity or a Fabric trial. All of the tutorial's items must be in the same workspace, and the tutorial's final part deletes the workspace.
- The reference says your admin must turn on preview settings for maps and anomaly detection. Maps no longer needs a preview setting (see section 6.7). You only need the anomaly detection setting for the optional part in section 6.6.

You can also right-click this link to open it in another tab and review this video, which builds a different end-to-end streaming solution in Fabric:

<a href="https://www.youtube.com/watch?v=iWepPEUUO_4"><img src="https://img.youtube.com/vi/iWepPEUUO_4/0.jpg" alt="Tales From The Field video: End to end tutorial on real-time streaming analytics in Microsoft Fabric" height = 200></a>

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2 id="6.2"><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/pencil2.png">6.2 Real-Time hub and Eventstream</h2>

Every Fabric tenant has a Real-Time hub, created for you automatically. Select **Real-Time** in the Fabric navigation pane to open it. Think of the hub as a catalog for data in motion. It lists the streams and KQL tables that you have access to, and it has connectors for adding new sources. Those sources include Azure Event Hubs, Apache Kafka, change data capture (CDC) from databases, and services in other clouds. The hub also exposes events that Fabric and Azure raise on their own. Fabric events report things like an item changing in a workspace or a job finishing, and Azure events report things like a new file arriving in Azure Blob Storage.

An eventstream is the item that moves events through Fabric. On a visual canvas, you connect one or more sources, optionally transform the events, and send the results to one or more destinations, all without writing code:

- **Sources** include Azure services such as Event Hubs and IoT Hub, and CDC from databases such as Azure SQL Database, PostgreSQL, and Azure Cosmos DB. You can also connect Kafka and other cloud streaming services, Fabric and Azure events, and built-in sample data, like the bicycle data in this module's tutorial. Your own applications can send events to a custom endpoint, including over the Kafka protocol. Older articles call the custom endpoint a "custom app".
- **Transformations** include filtering, managing fields, aggregating, grouping by time windows, and joining or combining streams. If you'd rather write code, you can use a SQL operator.
- **Destinations** include an Eventhouse, a Lakehouse (stored as Delta tables), Activator, and a custom endpoint. You can also publish a derived stream, which is a transformed stream that shows up in Real-Time hub for others to use. A single eventstream can send data to several destinations at once.

<img src="https://learn.microsoft.com/en-us/fabric/real-time-intelligence/event-streams/media/overview/multiple-destinations-enhanced.png" alt="An eventstream on the editor canvas, with two sources, three transformation steps, and destinations that include an Eventhouse, a Lakehouse, and Activator" height = 350>

<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/point1.png"><b>Self-Guided Activity: Stream bicycle data into an Eventhouse</b></p>

In this Activity you will create the Eventhouse that stores the tutorial's data, and then use Real-Time hub to connect the bicycle sample to an eventstream that sends the events to your Eventhouse. You'll learn more about Eventhouses in section 6.3.

<p><img style="margin: 0px 15px 15px 0px;" src="../graphics/checkmark.png"><b>Steps</b></p>

- [Open this reference and follow the steps you see there](https://learn.microsoft.com/en-us/fabric/real-time-intelligence/tutorial-1-resources)
- [Then open this reference and follow the steps you see there](https://learn.microsoft.com/en-us/fabric/real-time-intelligence/tutorial-2-get-real-time-events)
- Leave the eventstream running. The activities in the next sections use the data that it collects.

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2 id="6.3"><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/pencil2.png">6.3 Eventhouses and KQL Databases</h2>

Event data in Real-Time Intelligence is stored in an Eventhouse. An Eventhouse holds one or more KQL databases that share the same compute, so you can manage and monitor them together. If you know SQL Server, think of an Eventhouse as the server and its KQL databases as the databases on that server. If you know Azure Data Explorer, an Eventhouse plays the role of a cluster. Each KQL database contains tables, functions, and materialized views. When you create an Eventhouse, Fabric also creates a KQL database with the same name. If you delete the Eventhouse, all of its databases are deleted too.

KQL databases are designed for event data. They accept structured data, semi-structured data such as JSON, and free text, and they automatically index and partition everything by the time it arrived. That design keeps queries over recent data fast, even when a table holds billions of records. Typical workloads include telemetry, application and security logs, IoT sensor readings, and financial transactions. A KQL database can also be a database shortcut, which reads another KQL database or an Azure Data Explorer database without copying the data.

Your event data doesn't have to stay inside the Eventhouse. Turn on **OneLake availability** on a database or a table, and Fabric keeps a Delta Lake copy of the data in OneLake, without charging for extra storage. Lakehouses, Warehouses, notebooks, and Power BI in Direct Lake mode can then read it. The copy trails the source: by default, new data can take up to three hours to appear in it.

An Eventhouse that nobody is using suspends itself to save capacity, and it takes a few seconds to wake up when the next query arrives. If your solution can't wait, turn on **Capacity Planner** (previously called Always-on), which keeps a minimum amount of compute running all the time.

<img src="https://learn.microsoft.com/en-us/fabric/real-time-intelligence/media/create-database/attached-queryset.png" alt="An Eventhouse with one KQL database expanded to show its tables, functions, materialized views, and built-in queryset" height = 300>

<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/point1.png"><b>Self-Guided Activity: Transform the bicycle data in your KQL database</b></p>

In this Activity you will organize the tutorial's tables into folders, create a table for cleaned data, and add a function and an update policy that transform each new batch of raw events as it arrives. You don't need to know KQL yet, because the reference gives you every command to copy.

<p><img style="margin: 0px 15px 15px 0px;" src="../graphics/checkmark.png"><b>Steps</b></p>

- [Open this reference and follow the steps you see there](https://learn.microsoft.com/en-us/fabric/real-time-intelligence/tutorial-4-transform-kql-database)

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2 id="6.4"><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/pencil2.png">6.4 Querying Data with KQL</h2>

You query the data in an Eventhouse with the Kusto Query Language (KQL). A KQL query starts with a table and passes its rows through a series of steps, one per line, joined by the pipe character (`|`), so you can read it from top to bottom like a recipe. For example, this query lists the bike stations in the tutorial's data that reported no available bikes in the last 15 minutes:

```kusto
RawData
| where Timestamp > ago(15m)
| where No_Bikes == 0
| distinct BikepointID, Street, Neighbourhood
```

KQL is case-sensitive, so table and column names must match exactly. If you're more at home with SQL, you can start there. A KQL queryset also runs T-SQL `SELECT` queries when the query starts with a `--` comment line, and putting `explain` in front of a T-SQL query shows you the equivalent KQL. The [SQL to Kusto Query Language cheat sheet](https://learn.microsoft.com/en-us/kusto/query/sql-cheat-sheet?view=microsoft-fabric) maps common SQL patterns to KQL.

A KQL queryset is the item where you write, run, and save queries. Each tab in a queryset can query a different source: KQL databases in Fabric, Azure Data Explorer clusters, or Azure Monitor logs. From a query's results you can draw a chart, pin it to a Real-Time Dashboard, build a Power BI report, or set an Activator alert. Every KQL database also has a built-in queryset for quick exploration.

<img src="https://learn.microsoft.com/en-us/fabric/real-time-intelligence/media/kusto-query-set/query-window.png" alt="A KQL queryset with several tabs, a query that charts bikes per street, and ribbon buttons for Copilot, Power BI reports, dashboards, and alerts" height = 350>

Copilot can also write KQL for you from a question in plain language. It shows you the query rather than running it, and it works from your table schemas, without seeing the data in them. Copilot needs a paid capacity of at least F2 or P1, plus a tenant setting that your admin turns on, so you can't use it on a Fabric trial.

You can also right-click this link to open it in another tab and review this video that demonstrates how to use Copilot in Real-Time Intelligence:

<a href="https://www.youtube.com/watch?v=P5YBjkB4x3g"><img src="https://img.youtube.com/vi/P5YBjkB4x3g/0.jpg" alt="Tales From The Field video: Copilot for Real-Time Intelligence KQL queries" height = 200></a>

<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/point1.png"><b>Self-Guided Activity: Query the bicycle data</b></p>

In this Activity you will query the streaming bicycle data with KQL, chart the results, create a materialized view that keeps a summary up to date, and try a T-SQL query.

<p><img style="margin: 0px 15px 15px 0px;" src="../graphics/checkmark.png"><b>Steps</b></p>

- [Open this reference and follow the steps you see there](https://learn.microsoft.com/en-us/fabric/real-time-intelligence/tutorial-5-query-data)
- The last step uses Copilot. Skip it if you're using a Fabric trial.

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2 id="6.5"><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/pencil2.png">6.5 Real-Time Dashboards</h2>

A Real-Time Dashboard shows live data from KQL queries. Each tile runs one query and displays one visual, and you can arrange tiles on several pages. Parameters, such as a time range, filter all the tiles at once, and selecting part of a chart can filter the other tiles or drill through to a page with more detail. Real-Time Dashboards are generally available, and you no longer need an admin setting to create one.

With live refresh, which is on by default for new dashboards, a tile refreshes only when new data arrives, so the dashboard stays current without rerunning queries for visuals whose data hasn't changed. You can build a dashboard from scratch, send a query from a KQL queryset straight to a dashboard, or ask Copilot to generate tiles for you (Copilot needs a paid capacity).

Sharing a dashboard doesn't share the data behind it. By default, each tile runs its query with the viewer's own permissions, so viewers also need access to the KQL database. Alternatively, you can set the dashboard to query the data with your identity instead.

You can add an Activator alert to a tile, which section 6.6 explains. Not every visual supports alerts. Tables, maps, and time charts don't, for example, so use a chart such as a column chart.

How do Real-Time Dashboards compare with Power BI? Power BI is the better choice for analyzing history and building rich, interactive reports, usually on data that's refreshed on a schedule. Real-Time Dashboards are made for watching operations as they happen, with data that updates as events arrive.

<img src="https://learn.microsoft.com/en-us/fabric/real-time-intelligence/media/tutorial/final-dashboard.png" alt="A finished Real-Time Dashboard with parameters, a page list, and several chart and table tiles" height = 250>

<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/point1.png"><b>Self-Guided Activity: Build a Real-Time Dashboard</b></p>

In this Activity you will turn your bicycle queries into a Real-Time Dashboard, add a map tile, set an alert, and share the dashboard.

<p><img style="margin: 0px 15px 15px 0px;" src="../graphics/checkmark.png"><b>Steps</b></p>

- [Open this reference and follow the steps you see there](https://learn.microsoft.com/en-us/fabric/real-time-intelligence/tutorial-6-create-dashboard)
- When the reference asks you to set an alert on the map tile, use the first column chart tile instead, because map tiles don't support alerts. Group by **BikepointID**, and base the condition on **No_Bikes**. If your organization doesn't use Microsoft Teams, choose email as the action.
- Sharing needs a second person in your organization. Skip that step if you're working on your own.

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2 id="6.6"><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/pencil2.png">6.6 Activator</h2>

Activator watches your data and takes action when something you care about happens, without any code. It was called Data Activator until late 2024, when it was renamed and became generally available, and its full name is Fabric Activator. In APIs and Git files you may still see its internal name, Reflex.

Activator gets data in two ways. It can check data on a schedule by running the query behind a Power BI visual, a KQL queryset, or a Real-Time Dashboard tile. It can also receive events as they happen, from an eventstream, from Fabric events, or from Azure events. That's why you'll find a **Set alert** option in so many places across Fabric.

<h3>How Activator models your data</h3>

- **Events** are the individual records that arrive, such as one status update from one bike station.
- **Objects** are the things you're tracking, identified by a column such as a station ID. Activator evaluates your rules separately for every object, so a problem at one station isn't hidden by the others.
- **Properties** are values you track on an object. You can summarize them over a time window (average, minimum, maximum, or count) and reuse them in more than one rule.
- **Rules** define what to watch for and what to do about it. (Older articles call rules "triggers".) A rule can test each event on its own, or it can remember the last state and fire only when something changes, such as a value falling below a threshold.

When a rule fires, Activator can email people, post a message in Microsoft Teams, start a Fabric item like a pipeline, notebook, or Spark job, or trigger a Power Automate flow.

Keep two practical points in mind. Activator sends email only to people in your own organization. And a rule uses capacity while it's running, so stop the rules you create for practice when you're finished.

<img src="https://learn.microsoft.com/en-us/fabric/real-time-intelligence/data-activator/media/activator-trigger-model/property-rule.png" alt="An Activator rule that watches a package object's average temperature and alerts when it rises above a threshold" height = 400>

<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/point1.png"><b>Self-Guided Activity: Set an alert on your eventstream</b></p>

In this Activity you will create an Activator rule that sends you a message when a bike station runs out of bikes.

<p><img style="margin: 0px 15px 15px 0px;" src="../graphics/checkmark.png"><b>Steps</b></p>

- [Open this reference and follow the steps you see there](https://learn.microsoft.com/en-us/fabric/real-time-intelligence/tutorial-3-set-alert)
- If your organization doesn't use Microsoft Teams, choose email as the action.
- After you've seen the alert arrive, stop the rule so it doesn't keep sending you messages.
- Optional: to explore Activator with a ready-made sample, [open this reference and follow the steps you see there](https://learn.microsoft.com/en-us/fabric/real-time-intelligence/data-activator/activator-tutorial).
- Optional (preview): [Detect anomalies in the bicycle data](https://learn.microsoft.com/en-us/fabric/real-time-intelligence/tutorial-7-create-anomaly-detection). Your admin must turn on the **Detect anomalies in Real-Time Intelligence (Preview)** tenant setting, and the Eventhouse needs a Python plugin that can take up to an hour to enable.

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2 id="6.7"><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/pencil2.png">6.7 Fabric Maps</h2>

Some questions are really about *where*: which neighborhoods are running short of bikes, where your delivery vans are right now, or which stores sit inside a flood zone. A **Map** is a Fabric item for answering questions like these. It draws your location data on a basemap from Azure Maps, and it stays connected to that data, so live layers update as new events arrive. Fabric Maps became generally available in March 2026.

A map doesn't store data itself. Each layer on a map reads from another Fabric item:

- **Eventhouse**: KQL tables, functions, or materialized views, refreshed at an interval you choose. For live layers, use a function or a materialized view: a layer that reads a table directly shows only the 100 most recently ingested rows.
- **Lakehouse**: files with shapes or imagery that don't change often, such as region boundaries or building outlines, stored as GeoJSON, PMTiles, or Cloud Optimized GeoTIFF files.

You decide how each layer looks. Points can be bubbles, markers, or a heat map, and polygons can be extruded in 3D. Colors and sizes can follow values in your data, nearby points can be grouped into clusters, and tooltips show details when you hover. Authors can add filters to a layer and lock them. Viewers can change the unlocked filters while they explore, but their changes aren't saved.

<img src="https://learn.microsoft.com/en-us/fabric/real-time-intelligence/media/tutorial/map-data-layers.png" alt="A Fabric map of London that shows bike stations as colored bubbles from an Eventhouse layer on top of borough boundaries from a Lakehouse layer" height = 400>

Keep these points in mind:

- Sharing a map gives access to the map only. Viewers also need permission to read the Eventhouse or Lakehouse behind each layer.
- Maps run on your Fabric capacity and don't need a separate license. They depend on the **Users can use Azure Maps services** tenant setting, which is on by default.
- If your capacity is outside the EU or the US, your admin also needs to allow Azure Maps to process data outside your region. Without that setting the basemap is blank, although your data layers still appear.
- Two integrations are in preview: creating Activator alerts from a map layer, and showing a saved map as a tile on a Real-Time Dashboard.

Fabric gives you more than one way to put data on a map. A map tile on a Real-Time Dashboard plots the results of a single KQL query, which is handy for a quick view next to other tiles. A Fabric map combines several live and static layers in one item that you can reuse and share. In Power BI, the Azure Maps visual suits data that's already in a semantic model, and it can place addresses on the map for you.

<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/point1.png"><b>Self-Guided Activity: Map the bicycle data</b></p>

In this Activity you will create a map that shows the bike stations from your Eventhouse as live bubbles on top of London borough boundaries that you store in a Lakehouse.

<p><img style="margin: 0px 15px 15px 0px;" src="../graphics/checkmark.png"><b>Steps</b></p>

- [Open this reference and follow the steps you see there](https://learn.microsoft.com/en-us/fabric/real-time-intelligence/tutorial-8-create-map)
- When you finish the module, deactivate the eventstream and stop any Activator rules so they don't keep using capacity. To remove the tutorial completely, [open this reference and follow the steps you see there](https://learn.microsoft.com/en-us/fabric/real-time-intelligence/tutorial-9-clean-up-resources). It deletes the entire workspace, so use it only on the workspace you created for this tutorial.

<p style="border-bottom: 1px solid lightgrey;"></p>

<p><img style="margin: 0px 15px 15px 0px;" src="../graphics/owl.png"><b>For Further Study</b></p>
<ul>
  <li><a href="https://learn.microsoft.com/en-us/fabric/real-time-intelligence/overview" >What is Real-Time Intelligence?</a></li>
  <li><a href="https://learn.microsoft.com/en-us/fabric/real-time-intelligence/get-started-with-real-time-intelligence">Get started with Real-Time Intelligence</a></li>
  <li><a href="https://learn.microsoft.com/en-us/training/modules/get-started-kusto-fabric/">Get started with Real-Time Intelligence in Microsoft Fabric (Microsoft Learn training module)</a></li>
  <li><a href="https://learn.microsoft.com/en-us/fabric/real-time-hub/real-time-hub-overview">Introduction to Fabric Real-Time hub</a></li>
  <li><a href="https://learn.microsoft.com/en-us/fabric/real-time-intelligence/event-streams/overview">Overview of Microsoft Fabric eventstreams</a></li>
  <li><a href="https://learn.microsoft.com/en-us/fabric/real-time-intelligence/eventhouse">Eventhouse overview</a></li>
  <li><a href="https://learn.microsoft.com/en-us/kusto/query/?view=microsoft-fabric">Kusto Query Language overview</a></li>
  <li><a href="https://learn.microsoft.com/en-us/fabric/real-time-intelligence/real-time-dashboards-overview">What is Real-Time Dashboard?</a></li>
  <li><a href="https://learn.microsoft.com/en-us/fabric/real-time-intelligence/data-activator/activator-introduction">What is Fabric Activator?</a></li>
  <li><a href="https://learn.microsoft.com/en-us/fabric/real-time-intelligence/map/about-fabric-maps">What is Fabric Maps?</a></li>
  <li><a href="https://roadmap.fabric.microsoft.com/?product=real-timeintelligence">Microsoft Fabric Roadmap: Real-Time Intelligence</a></li>
</ul>

<p style="border-bottom: 1px solid lightgrey;"></p>

Congratulations! You have completed this Module. If you understand the concepts here and have completed all of the Activities, you can [proceed to the next Module](07%20-%20CoPilots%20%26%20AI%20Skills.md).
