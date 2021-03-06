Class {
	#name : #PBApplicationTestResource,
	#superclass : #TestResource,
	#instVars : [
		'application'
	],
	#category : #'PythonBridge-Tests'
}

{ #category : #initialization }
PBApplicationTestResource >> app [
	^ self application
]

{ #category : #initialization }
PBApplicationTestResource >> application [
	^ application
]

{ #category : #initialization }
PBApplicationTestResource >> applicationClass [
	^ PBApplication
]

{ #category : #initialization }
PBApplicationTestResource >> setUp [
	super setUp.
	"application := self applicationClass new.
	self application start"
	self applicationClass stop.
	self applicationClass start.
	application := self applicationClass uniqueInstance
]

{ #category : #initialization }
PBApplicationTestResource >> tearDown [
	"self application stop."
	self applicationClass stop.
	super tearDown.
]
