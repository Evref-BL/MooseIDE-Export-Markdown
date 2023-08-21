Class {
	#name : #MiMarkdownTableWriter,
	#superclass : #NeoCSVWriter,
	#category : #'MooseIDE-Export-Markdown'
}

{ #category : #accessing }
MiMarkdownTableWriter >> initialize [

	super initialize.
	separator := $|.
	lineEnd := '|' , OSPlatform current lineEnding
]

{ #category : #accessing }
MiMarkdownTableWriter >> writeBeginLine [

	writeStream nextPutAll: '|'
]

{ #category : #accessing }
MiMarkdownTableWriter >> writeFieldsUsingAccessors: anObject [

	| first |
	first := true.
	fieldAccessors do: [ :each |
		| fieldValue |
		self writeSeparator.
		writeStream << Character space.
		fieldValue := each value: anObject.
		writeStream << Character space ].
]

{ #category : #accessing }
MiMarkdownTableWriter >> writeFieldsUsingDo: anObject [

	| first |
	self h.
	first := true.
	anObject do: [ :each |
		self writeSeparator.
		writeStream << Character space.
		self writeField: each.
		writeStream << Character space ]
]

{ #category : #accessing }
MiMarkdownTableWriter >> writeHeader: fieldNames [
	"Write the header, a collection of field names.
	This should normally be called only at the beginning and only once."

	self writeBeginLine.
	fieldNames
		do: [ :each |
			writeStream space.
			self writeField: each.
			writeStream space ]
		separatedBy: [ self writeSeparator ].
	self writeEndOfLine.
	self writeBeginLine.
	fieldNames
		do: [ :each | writeStream << ' --- ' ]
		separatedBy: [ self writeSeparator ].
	self writeEndOfLine
]
