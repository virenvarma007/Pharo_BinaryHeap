Class {
	#name : #BinaryHeap,
	#superclass : #Object,
	#instVars : [
		'collection'
	],
	#category : #DSBinaryHeap
}

{ #category : #operations }
BinaryHeap >> add: anObject [
    collection addLast: anObject.
    self bubbleUpFrom: collection size.
]

{ #category : #API }
BinaryHeap >> bubbleDownFrom: anIndex [
    | leftChildIndex rightChildIndex maxIndex |
    leftChildIndex := anIndex * 2.
    rightChildIndex := anIndex * 2 + 1.
    maxIndex := anIndex.
    (leftChildIndex <= collection size and: [ (collection at: leftChildIndex) > (collection at: maxIndex) ])
        ifTrue: [ maxIndex := leftChildIndex ].
    (rightChildIndex <= collection size and: [ (collection at: rightChildIndex) > (collection at: maxIndex) ])
        ifTrue: [ maxIndex := rightChildIndex ].
    maxIndex = anIndex ifFalse: [
        collection swap: anIndex with: maxIndex.
        self bubbleDownFrom: maxIndex
    ].
]

{ #category : #API }
BinaryHeap >> bubbleUpFrom: anIndex [
    | parentIndex |
    parentIndex := anIndex // 2.
    anIndex > 1 ifTrue: [
        (collection at: anIndex) > (collection at: parentIndex) ifTrue: [
            collection swap: anIndex with: parentIndex.
            self bubbleUpFrom: parentIndex
        ]
    ]
]

{ #category : #accessing }
BinaryHeap >> collection [
  ^collection  
]

{ #category : #initialization }
BinaryHeap >> initialize [
    super initialize.
    collection := OrderedCollection new.
]

{ #category : #accessing }
BinaryHeap >> isEmpty [
    ^ collection isEmpty
]

{ #category : #accessing }
BinaryHeap >> peek [
    ^ collection first
]

{ #category : #operations }
BinaryHeap >> remove [
    | result |
    collection swap: 1 with: collection size.
    result := collection removeLast.
    self bubbleDownFrom: 1.
    ^ result
]

{ #category : #accessing }
BinaryHeap >> size [
    ^ collection size
]
