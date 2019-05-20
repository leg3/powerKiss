# powerKiss

Powershell Module for converting Kismet output files

## Overview

powerKiss is a collection of cmdlets that operate on kismet .netxml files and generate .csv files.  These .csv files are intended to be imported into a MySQL database.  Each .csv file is named after the corresponding table it is intended to be imported into.

## Usage

Call the module functions in a directory with .netxml files to generate .csv tables.  The example generates the "cardSource" .csv file named after the kismet .netxml file it is parsing.

```powershell
cardSourceTable
```

Move all the generated .csv files in the current directory into directories named after their respective kismet .netxml files.  Generate an .sql file for loading into the MySQL database

```powershell
sweepTable
```

### Functions

Each function is intended to be used from the command line in a directory with the desired .netxml files.  It will parse the current working directory for .netxml files and generate the corresponding table based on the cmdlet called.  The output .csv file will be named after the kismet .netxml file and its corresponding table.

### Tables

The following tables are generated in .csv format by their respective functions:

* cardSource
* detectionRun

* wirelessClient
* wirelessClientGPSInfo
* wirelessClientPackets
* wirelessClientSNRInfo
* wirelessClientSeenCard

* wirelessNetwork
* wirelessNetworkFreqMHZ
* wirelessNetworkGPSInfo
* wirelessNetworkPackets
* wirelessNetworkSNRInfo
* wirelessNetworkSSID
* wirelessNetworkSSIDEncryption
* wirelessNetworkSeenCard

### Workflow

* Move desired .netxml files into a blank directory
* Call each function as needed to generate .csv files for MySQL import
* Move the resulting .csv files into a directory named after the kismet .netxml file

### Kismet .netxml Diagram

The .netxml file can be represented as follows:
<img src="netxmlDiag.svg">

This diagram illustrates the .csv files generated that are tables populated with data extracted from the .netxml file.