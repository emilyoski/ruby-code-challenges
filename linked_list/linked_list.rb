=begin

Requirements:
-simple linked list implementation
-simplest kind of linked list is a singly linked list
-each element in the list contains data and a "next" field
  pointing to the next element in the list of elements.
-variant of linked links is often used to represent sequences
  or push-down stacks (also called Last In, First Out stack)
-create a singly linked list whose elements may contain a
  range of data such as the numbers 1-10
-provide methods to reverse the linked list and convert a
  linked list to and from an array

Examples/Test Cases:
-class for Element
  -#constructor (accepts one integer argument)
  -#datum instance method returns the argument
  -#tail? instance method
    -looks to see if that element is the tail
  -#next instance method
    -looks for the next element?
    -points to the next element/returns that element?
    -"next" is the element before it or nil

-class for SimpleLinkedList
  -#size instance method
    -returns integer size of the list
  -#empty? instance method
    -returns truthy value if the list has nothing in it
  -#push instance method (accepts one integer argument)
    -adds the argument to the linked list
    -the argument should be an instance of the Element class
  -#peek instance method
    -looks to return the top of the stack
  -list appears to have nil when nothing in the list
  -#head instance method
    -returns the "top" element in the list (last in)
  -#pop instance method
    -removes the "top" element and returns it
  -#from_a class method
    -accepts an argument of an array
    -forms an instance of the SimpleLinkedList with those array elements
    -nil will just give an empty LinkedList
    -pushes the element into the LinkedList from right to left
      [1 2] -> [1] with next [2] so 2 "in" first then 1 following "top of stack"
  -#to_a instance method
    -forms an array with the elements from the list
    -"top" of stack is the first element and so on and so on
  -#reverse instance method
    -reverses the order of the linkedlist (can be new object)

Data Structure:

class Element(1-2 arguments)
  #constructor
    -first argument is the data contained
    -second argument is the "next" value (nil if not given)

  #datum instance method
    -returns the data

  #tail? instance method
    -if the "next" is nil then its the tail

  #next instance method
    -points to the "next" linked element

class SimpleLinkedList
  #constructor
    -empty array to hold the instance of the element class

   #size instance method
    -looks at the size of the array of "Elements"

  -#empty? instance method
    -looks to see if there is elements in our list

  -#push instance method
    -accepts one integer argument
    -adds instance of element class to linkedlist
      with the first element's information as the "next"
    -"next" should be nil if the list is empty

  -#peek instance method
    -returns nil if the list is empty
    -returns the data from the element at index 0

  -#head instance method
    -returns the first element in our linked list

  -#pop instance method
    -removes the first element and returns it

  -#from_a class method
    -accepts an argument of an array
    -forms an instance of the SimpleLinkedList with those array elements
    -nil will just give an empty LinkedList
    -pushes the element into the LinkedList from right to left
      [1 2] -> [1] with next [2] so 2 "in" first then 1 following "top of stack"

  -#to_a instance method
    -iterates through our linked list, transform the elements to the data

  -#reverse instance method
    -reverses the order of the linkedlist
    -returns a linkedlist object

Algorithm:
  #from_a class method (accepts an array)
    -initialize a LinkedList instance
    -return the LinkedList if the from_a argument is nil
    -iterate through the array (in reverse order)
    -push each element to the LinkedList
    -return the LinkedList object

  #reverse instance method
  -could use the to_a instance method to get an array of the data
  -reverse the array
  -use the from_a class method to generate a linkedlist with that data

=end

class Element
  def initialize(data, linked_next = nil)
    @data = data
    @linked_next = linked_next
  end

  def datum
    @data
  end

  def tail?
    @linked_next.nil?
  end

  def next
    @linked_next
  end
end

class SimpleLinkedList
  def initialize
    @list = []
  end

  def size
    @list.size
  end

  def empty?
    @list.empty?
  end

  def push(data)
    if @list.empty?
      @list << Element.new(data)
    else
      @list = [Element.new(data, @list[0])] + @list
    end
  end

  def peek
    return nil if @list.empty?
    @list[0].datum
  end

  def head
    @list[0]
  end

  def pop
    @list.shift.datum
  end

  def to_a
    @list.map(&:datum)
  end

  def self.from_a(arr)
    new_list = SimpleLinkedList.new
    return new_list if arr.nil?
    arr.reverse.each { |ele| new_list.push(ele) }
    new_list
  end

  def reverse
    SimpleLinkedList.from_a(to_a.reverse)
  end
end
