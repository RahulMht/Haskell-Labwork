class User:
    def __init__(self, username, email):
        self.username = username
        self.email = email
        self.contacts = []

    def __str__(self):
        return self.username

    def add_contact(self, user):
        if isinstance(user, User):
            print(f"Adding {user.username} to {self.username}'s contacts")
            self.contacts.append(user)
        else:
            print("Error: Invalid user object")

    def send_message(self, recipient, content):
        if isinstance(recipient, User) and recipient in self.contacts:
            message = Message(self, recipient, content)
            recipient.receive_message(message)
        else:
            print(f"Error: {recipient.username} not in contacts list. Cannot send message.")

    def receive_message(self, message):
        print(f"Received message from {message.sender}: {message.content}")


class Message:
    def __init__(self, sender, recipient, content):
        self.sender = sender
        self.recipient = recipient
        self.content = content

    def __str__(self):
        return f"From: {self.sender}, To: {self.recipient}, Message: {self.content}"


class GroupChat(Message):
    def __init__(self, sender, recipients, content):
        super().__init__(sender, None, content)
        self.recipients = recipients if isinstance(recipients, list) else [recipients]

    def send(self):
        for recipient in self.recipients:
            if recipient in self.sender.contacts:
                recipient.receive_message(self)
            else:
                print(f"Error: {recipient.username} not in contacts list. Cannot send message.")

# Example Usage:
user1 = User('user1', 'user1@example.com')
user2 = User('user2', 'user2@example.com')
user3 = User('user3', 'user3@example.com')

user1.send_message(user3, 'Hello!')
user1.send_message(user2, 'Hello!')

group_chat = GroupChat(user1, [user2, user3], 'Group chat message')
group_chat.add_member(user1)
group_chat.add_member(user2)
