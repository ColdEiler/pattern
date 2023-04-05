#adaptee
class Twitter
    def twit
        puts "twit"
    end
end

class Facebook
    def post
        puts "post"
    end
end

#target
module WebServiceInterface
    def send_message
        raise NotImplementedError
    end
end

#adapter
class TwitterAdapter
    include WebServiceInterface

    def initialize
        @webservice = Twitter.new
    end

    def send_message
        @webservice.twit
    end
end

class FacebookAdapter
    include WebServiceInterface

    def initialize
        @webservice = Facebook.new
    end

    def send_message
        @webservice.post
    end
end

#client
class Message 
    attr_accessor:webservice
    def send
        self.webservice.send_message
    end
end

message = Message.new
message.webservice = TwitterAdapter.new
message.send

message.webservice = FacebookAdapter.new
message.send


