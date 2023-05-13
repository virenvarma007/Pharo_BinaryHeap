Class {
	#name : #MinBinaryHeap,
	#superclass : #Object,
	#instVars : [
		'collection'
	],
	#category : #DSBinaryHeap
}

{ #category : #operations }
MinBinaryHeap >> add: anObject [
    collection addLast: anObject.
    self bubbleUpFrom: collection size.
]

{ #category : #API }
MinBinaryHeap >> bubbleDownFrom: anIndex [
    | leftChildIndex rightChildIndex maxIndex |
    leftChildIndex := anIndex * 2.
    rightChildIndex := anIndex * 2 + 1.
    maxIndex := anIndex.
    (leftChildIndex <= collection size and: [ (collection at: leftChildIndex) < (collection at: maxIndex) ])
        ifTrue: [ maxIndex := leftChildIndex ].
    (rightChildIndex <= collection size and: [ (collection at: rightChildIndex) < (collection at: maxIndex) ])
        ifTrue: [ maxIndex := rightChildIndex ].
    maxIndex = anIndex ifFalse: [
        collection swap: anIndex with: maxIndex.
        self bubbleDownFrom: maxIndex
    ].
]

{ #category : #API }
MinBinaryHeap >> bubbleUpFrom: anIndex [
    | parentIndex |
    parentIndex := anIndex // 2.
    anIndex > 1 ifTrue: [
        (collection at: anIndex) < (collection at: parentIndex) ifTrue: [
            collection swap: anIndex with: parentIndex.
            self bubbleUpFrom: parentIndex
        ]
    ]
]

{ #category : #accessing }
MinBinaryHeap >> collection [
  ^collection  
]

{ #category : #initialization }
MinBinaryHeap >> initialize [
    super initialize.
    collection := OrderedCollection new.
]

{ #category : #accessing }
MinBinaryHeap >> isEmpty [
    ^ collection isEmpty
]

{ #category : #accessing }
MinBinaryHeap >> peek [
    ^ collection first
]

{ #category : #operations }
MinBinaryHeap >> remove [
    | result |
    collection swap: 1 with: collection size.
    result := collection removeLast.
    self bubbleDownFrom: 1.
    ^ result
]

{ #category : #accessing }
MinBinaryHeap >> size [
    ^ collection size
]
