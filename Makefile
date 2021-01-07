run: compile
	java FriendFinderFrontEnd

compile:FriendFinderFrontEnd.class FriendFinderTester2.class


test: compile
	java -jar junit5.jar -cp . --scan-classpath -n FriendFinderTester2 


FriendFinderTester2.class: FriendFinderTester2.java FriendFinderFrontEnd.class junit5.jar
	javac -cp .:junit5.jar FriendFinderTester2.java

FriendFinderFrontEnd.class: FriendFinderFrontEnd.java FriendFinder.class
	javac FriendFinderFrontEnd.java

FriendFinder.class: FriendFinder.java FriendFinderRBTree.class
	javac FriendFinder.java

FriendFinderRBTree.class: FriendFinderRBTree.java Person.class FriendFinderRBTreeInterface.class
	javac FriendFinderRBTree.java
FriendFinderRBTreeInterface.class: FriendFinderRBTreeInterface.java
	javac FriendFinderRBTreeInterface.java

Person.class: Person.java RedBlackTree.class
	javac Person.java

RedBlackTree.class: RedBlackTree.java
	javac RedBlackTree.java

clean:
	$(RM) *.class
	$(RM) *~
