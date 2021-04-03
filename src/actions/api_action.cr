abstract class ApiAction < Lucky::Action
  disable_cookies
  accepted_formats [:json]
end
