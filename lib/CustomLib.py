import random
import string

__version__ = '1.0.0'


class CustomLib(object):
    ROBOT_LIBRARY_VERSION = __version__
    ROBOT_LIBRARY_SCOPE = 'GLOBAL'

    @staticmethod
    def get_random_name(email_length):
        letters = string.ascii_lowercase[:12]
        return ''.join(random.choice(letters) for _ in range(email_length))

    def generate_random_emails(self, length):

        domains = ["hotmail.com", "gmail.com", "aol.com",
                   "mail.com", "mail.kz", "yahoo.com"]
        random_email = self.get_random_name(length) + '@' + random.choice(domains)
        return random_email
