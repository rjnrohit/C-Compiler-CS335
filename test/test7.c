// Linked list iteration
struct Node {
	int data;
	struct Node* next;
};

int main()
{
	struct Node head;
	struct Node second;
	struct Node third;

	head.data = 1;
	head.next = &second;
	second.data = 2;
	second.next = &third;
	third.data = 3; // assign data to third node
	third.next = 0;
	
	struct Node* itr = &head;
	while(itr != 0){
	    printf("%d", itr->data);
	    itr = itr->next;
	}
	return 0;
}
