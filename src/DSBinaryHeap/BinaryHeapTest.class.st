Class {
	#name : #BinaryHeapTest,
	#superclass : #TestCase,
	#category : #DSBinaryHeap
}

{ #category : #tests }
BinaryHeapTest >> testAdd [  
  |heap|
  heap := BinaryHeap new.
  heap add: 10.
  heap add: 5.
  heap add: 15.
  self assert: heap collection first equals: 15.
  self assert: heap size equals: 3
]

{ #category : #tests }
BinaryHeapTest >> testInitialization [
  |heap|
  heap := BinaryHeap new.
  self assert: heap collection asString equals: 'an OrderedCollection()'
]

{ #category : #tests }
BinaryHeapTest >> testIsEmpty [ 
  |heap|
  heap := BinaryHeap new.
  self assert: heap isEmpty equals: true.
  heap add: 10.
  heap add: 5.
  heap add: 15.
  self assert: heap isEmpty equals: false.
]

{ #category : #tests }
BinaryHeapTest >> testPeek [
  |heap|
  heap := BinaryHeap new.
  heap add: 10.
  heap add: 5.
  heap add: 15.
  self assert: heap peek equals: 15
]

{ #category : #tests }
BinaryHeapTest >> testRemove [
  |heap|
  heap := BinaryHeap new.
  heap add: 10.
  heap add: 5.
  heap remove.
  self assert: heap size equals: 1
]

{ #category : #tests }
BinaryHeapTest >> testSize [
  |heap|
  heap := BinaryHeap new.
  heap add: 10.
  heap add: 5.
  heap add: 15.
  self assert: heap size equals: 3
]

{ #category : #tests }
BinaryHeapTest >> testWorkings [
  |heap|
  heap := BinaryHeap new.
  heap add: 10.
  heap add: 5.
  heap add: 15.
  heap add: 1.
  self assert: heap collection asString equals: 'an OrderedCollection(15 5 10 1)'.
  self assert: heap isEmpty equals: false.
  self assert: heap peek equals: 15.
  heap remove.
  self assert: heap peek equals: 10.
  heap remove.
  self assert: heap peek equals: 5.
  heap remove.
  self assert: heap peek equals: 1.
  heap remove.
  self assert: heap isEmpty equals: true.
]
