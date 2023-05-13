Class {
	#name : #MinBinaryHeapTest,
	#superclass : #TestCase,
	#category : #DSBinaryHeap
}

{ #category : #tests }
MinBinaryHeapTest >> testAdd [  
  |heap|
  heap := MinBinaryHeap new.
  heap add: 10.
  heap add: 5.
  heap add: 15.
  self assert: heap peek equals: 5.
  self assert: heap size equals: 3
]

{ #category : #tests }
MinBinaryHeapTest >> testInitialization [
  |heap|
  heap := MinBinaryHeap new.
  self assert: heap collection asString equals: 'an OrderedCollection()'
]

{ #category : #tests }
MinBinaryHeapTest >> testIsEmpty [ 
  |heap|
  heap := MinBinaryHeap new.
  self assert: heap isEmpty equals: true.
  heap add: 10.
  heap add: 5.
  heap add: 15.
  self assert: heap isEmpty equals: false.
]

{ #category : #tests }
MinBinaryHeapTest >> testPeek [
  |heap|
  heap := MinBinaryHeap new.
  heap add: 10.
  heap add: 5.
  heap add: 15.
  self assert: heap peek equals: 5
]

{ #category : #tests }
MinBinaryHeapTest >> testRemove [
  |heap|
  heap := MinBinaryHeap new.
  heap add: 10.
  heap add: 5.
  heap remove.
  self assert: heap size equals: 1
]

{ #category : #tests }
MinBinaryHeapTest >> testSize [
  |heap|
  heap := MinBinaryHeap new.
  heap add: 10.
  heap add: 5.
  heap add: 15.
  self assert: heap size equals: 3
]

{ #category : #tests }
MinBinaryHeapTest >> testWorkings [
  |heap|
  heap := MinBinaryHeap new.
  heap add: 10.
  heap add: 5.
  heap add: 15.
  heap add: 1.
  self assert: heap collection asString equals: 'an OrderedCollection(1 5 15 10)'.
  self assert: heap isEmpty equals: false.
  self assert: heap peek equals: 1.
  heap remove.
  self assert: heap peek equals: 5.
  heap remove.
  self assert: heap peek equals: 10.
  heap remove.
  self assert: heap peek equals: 15.
  heap remove.
  self assert: heap isEmpty equals: true.
]
