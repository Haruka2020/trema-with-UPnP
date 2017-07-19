require 'google/apis/gmail_v1'
require 'googleauth'
require 'googleauth/stores/file_token_store'
require 'rmail'
require 'fileutils'
OOB_URI = 'urn:ietf:wg:oauth:2.0:oob'
APPLICATION_NAME = 'Send gmail'
CLIENT_SECRETS_PATH = File.join(Dir.home, 'Desktop',"client_secret.json")
CREDENTIALS_PATH = File.join(Dir.home, 'Desktop',"send-gmail.yaml")
SCOPE = Google::Apis::GmailV1::AUTH_GMAIL_SEND
CURRENT_DIRECTORY = Dir.pwd

def main
  send_mail(ARGV[0])
end

def authorize
  FileUtils.mkdir_p(File.dirname(CREDENTIALS_PATH))

  client_id = Google::Auth::ClientId.from_file(CLIENT_SECRETS_PATH)
  token_store = Google::Auth::Stores::FileTokenStore.new(file: CREDENTIALS_PATH)
  authorizer = Google::Auth::UserAuthorizer.new(
    client_id, SCOPE, token_store)
  user_id = 'default'
  credentials = authorizer.get_credentials(user_id)
  if credentials.nil?
    url = authorizer.get_authorization_url(
      base_url: OOB_URI)
    puts "Open the following URL in the browser and enter the " +
         "resulting code after authorization"
    puts url
    code = gets
    credentials = authorizer.get_and_store_credentials_from_code(
      user_id: user_id, code: code, base_url: OOB_URI)
  end
  credentials
end
def send_mail(body)
  # @return [Google::Auth::UserRefreshCredentials] OAuth2 credentials

# Initialize the API
  service = Google::Apis::GmailV1::GmailService.new
  service.client_options.application_name = APPLICATION_NAME
  service.authorization = authorize
  user_id = 'me'

  message = RMail::Message.new
  message.header['To'] = "vessel.bum1077.@gmail.com"
  message.header['From'] = "SDN Controller"
  message.body = "Test message"
  message.body = body
  message.header['Subject'] = "Policy Sugesstion"
  service.send_user_message('me',upload_source: StringIO.new(message.to_s),content_type: 'message/rfc822')
end

if __FILE__ == $0
    main
end
