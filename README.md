# MooseIDE-Export-Markdown

I am an helper for MooseIDE Export browser that supports markdown table

## Installation 

```smalltalk
Metacello new
    githubUser: 'Evref-BL' project: 'MooseIDE-Export-Markdown' commitish: 'main' path: 'src';
    baseline: 'MooseIDEExportMarkdown';
    load
```

## Usage 

```smalltalk
exportBrowserModel := MiExportModel new.
exportBrowserModel entitiesList: violations.

"Remove default column"
exportBrowserModel removeColumnForQueryNamed: #Name.
exportBrowserModel removeColumnForQueryNamed: #Type.

"export"
exportBrowserModel addColumnForQuery: [ :violation | violation violatedCondition name ] withName: #'Rule name'.
exportBrowserModel addColumnForQuery: [ :violation | violation violatedCondition summary ] withName: #'Rule summary'.

exportBrowserModel addColumnForQuery: [ :violation | violation violatingEntity printString ] withName: #'Violating entity'.

'D:/target.md' asFileReference writeStreamDo: [ :stream | exportBrowserModel writeMarkdownTableOn: stream ].
```
