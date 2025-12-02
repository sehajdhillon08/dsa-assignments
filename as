#include <bits/stdc++.h>
using namespace std;

struct Node{
    int coeff, pow;
    Node* next;
    Node(int c, int p){coeff=c; pow=p; next=NULL;}
};

Node* add(Node* p1, Node* p2){
    Node* head=NULL;
    Node* tail=NULL;

    while(p1 && p2){
        Node* n;
        if(p1->pow == p2->pow){
            n=new Node(p1->coeff+p2->coeff,p1->pow);
            p1=p1->next; p2=p2->next;
        }
        else if(p1->pow > p2->pow){
            n=new Node(p1->coeff,p1->pow);
            p1=p1->next;
        }
        else{
            n=new Node(p2->coeff,p2->pow);
            p2=p2->next;
        }

        if(!head){head=n; tail=n;}
        else{tail->next=n; tail=n;}
    }

    while(p1){
        Node* n=new Node(p1->coeff,p1->pow);
        if(!head){head=n; tail=n;}
        else{tail->next=n; tail=n;}
        p1=p1->next;
    }

    while(p2){
        Node* n=new Node(p2->coeff,p2->pow);
        if(!head){head=n; tail=n;}
        else{tail->next=n; tail=n;}
        p2=p2->next;
    }

    return head;
}

void printPoly(Node* head){
    while(head){
        cout<<head->coeff<<"x^"<<head->pow<<" ";
        head=head->next;
    }
}

int main(){
    Node* p1=new Node(5,2);
    p1->next=new Node(4,1);
    p1->next->next=new Node(2,0);

    Node* p2=new Node(5,1);
    p2->next=new Node(5,0);

    Node* res=add(p1,p2);
    printPoly(res);
}
