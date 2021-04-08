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
	third.next = NULL;
	
	struct Node* itr = &head;
	while(itr != NULL){
	    printf("%d", itr->data);
	    itr = itr->next;
	}
	return 0;
}
