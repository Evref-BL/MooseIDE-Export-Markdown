Class {
	#name : #BaselineOfMooseIDEExportMarkdown,
	#superclass : #BaselineOf,
	#category : #BaselineOfMooseIDEExportMarkdown
}

{ #category : #baselines }
BaselineOfMooseIDEExportMarkdown >> baseline: spec [

	<baseline>
	spec for: #common do: [
		self defineDependencies: spec.
		self definePackages: spec.
		self defineGroups: spec ]
]

{ #category : #baselines }
BaselineOfMooseIDEExportMarkdown >> defineDependencies: spec [
]

{ #category : #baselines }
BaselineOfMooseIDEExportMarkdown >> defineGroups: spec [
]

{ #category : #baselines }
BaselineOfMooseIDEExportMarkdown >> definePackages: spec [

	spec package: 'MooseIDE-Export-Markdown'
]
