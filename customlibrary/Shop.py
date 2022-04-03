from robot.api.deco import library, keyword


@library
class Shop:

    @keyword
    def hello_word(self):
        print("hello")

    @keyword
    def add_item_into_cart(self):

        print("hello")
