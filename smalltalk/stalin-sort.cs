!Array methodsFor: '*StalinSort' stamp: 'TSL 11/17/2020 16:54'!
stalinSort
	 | max sorted |
	
	self size = 0 ifTrue: [^self].
	sorted := OrderedCollection new.
	max := self at:1.
	self do: [ :i | 
		(i >= max)
			ifTrue: [ 
				sorted add: i.
				max := i ]].
	^ sorted asArray ! !
	
TestCase variableSubclass: #StalinSortTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StalinSort'!

!StalinSortTest methodsFor: 'tests' stamp: 'TSL 11/17/2020 16:53'!
testEmptyArray
	| input |
	input := #().
	self assert: input stalinSort equals: #().

! !

!StalinSortTest methodsFor: 'tests' stamp: 'TSL 11/17/2020 16:52'!
testStalinSort
	| input |
	input := #(1 2 5 3 5 7).
	self assert: input stalinSort equals: #(1 2 5 5 7).

! !
