Extension { #name : #MiExportModel }

{ #category : #'*MooseIDE-Export-Markdown' }
MiExportModel >> writeMarkdownTableOn: aStream [

	| csvWriter |
	csvWriter := MiMarkdownTableWriter on: aStream.
	csvWriter writeHeader:
		(self columns collect: [ :column | column name ]).
	self columns do: [ :column | 
		csvWriter addField: [ :item | column printValueFor: item ] ].
	csvWriter nextPutAll: self entitiesList
]
