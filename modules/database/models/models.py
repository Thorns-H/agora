
class User:
    def __init__(self, data: tuple) -> None:
        self.id = data[0]
        self.name = data[1]
        self.email = data[2]
        self.phone = data[3]
        self.password = data[4]
        self.gender = data[5]
        self.description = data[6]
        self.profile_picture = data[7]