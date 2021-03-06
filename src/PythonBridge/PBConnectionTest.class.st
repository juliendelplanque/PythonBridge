Class {
	#name : #PBConnectionTest,
	#superclass : #TestCase,
	#instVars : [
		'application'
	],
	#category : #'PythonBridge-Tests'
}

{ #category : #running }
PBConnectionTest >> setUp [
	application := PBApplication new
]

{ #category : #running }
PBConnectionTest >> tearDown [
	application stop
]

{ #category : #tests }
PBConnectionTest >> testNotRunning [
	self deny: application isRunning
]

{ #category : #tests }
PBConnectionTest >> testStartStopProcess [
	self deny: application isRunning.
	application start.
	self assert: application processHandler isRunning.
	application send: 
		(PBCommand new instructions: 
			(Array with: (P3GBinaryOperator new
						left: 1;
						right: 2;
						operator: $+;
						yourself))).	
	application stop.
	(Delay forMilliseconds: 150) wait.
	self deny: application isRunning.
	self should: [ application send: 
		(PBCommand new instructions: 
			(Array with: (P3GBinaryOperator new
						left: 1;
						right: 2;
						operator: $+;
						yourself))) ] raise: Error.
	self deny: application processHandler isRunning
]
