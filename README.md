# economic-monitoring

This repository disseminates **high frequency** economic datasets to monitor the Swiss economy.
**Data** in this respository are published in **machine readable** fashion in order to foster effective, frustration free data exchange and processing. 

## Project Structure 

<!-- - data
	- contains all public kofmining datasets in swissdata format
	- contains all public KOF indicators in swissdata format

-->

### data folder data-statistikZH-monitoring/ 
contains indicators created and/or processed by the KOF Swiss Economic Institute. Made available in a .csv format flavor suggested by statistikZH. Data are exported to feed https://statistikzh.github.io/covid19monitoring/ .

**currently available indicators**

- KOF Barometer
- KOF Manufacturing Survey 'Business Siutation' (enhanced frequency)
- KOF Manufacturing Survey 'Expected Order Income' (enhanced frequency)
- SECO Daily Jobroom Candidates Count tracked by KOF


<!--
- data-status
	- contains all sorts of status .csv files for the dashboard. 
	- data_catalog
	- key katalog

- R self contained R scripts to do stuff, e.g. create data-export-gsm


## Related Websites

- Gesellschaftsmonitoring statistikZH
- status dashboard

-->


## Project milestones

This project has just started, we plan to clear these milestones soon. 

- Simple status / data catalog dashboard dashboard
- KOF Indicators available in swissdata format
- Non KOF Data available in swissdata format
- shiny app or other graphical dashboard
- framework (separate repo) to create cson (json+csv) pairs for data and their description. 


