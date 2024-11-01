*internet.pyx*                                Last change: 2023 Sep 15

Internet Protocols and Support
******************************

The modules described in this chapter implement internet protocols and
support for related technology.  They are all implemented in Python.
Most of these modules require the presence of the system-dependent
module "socket", which is currently supported on most popular
platforms.  Here is an overview:

* "webbrowser" — Convenient web-browser controller

  * "Error"

  * "open()"

  * "open_new()"

  * "open_new_tab()"

  * "get()"

  * "register()"

  * Browser Controller Objects

    * "controller.name"

    * "controller.open()"

    * "controller.open_new()"

    * "controller.open_new_tab()"

* "wsgiref" — WSGI Utilities and Reference Implementation

  * "wsgiref.util" – WSGI environment utilities

    * "guess_scheme()"

    * "request_uri()"

    * "application_uri()"

    * "shift_path_info()"

    * "setup_testing_defaults()"

    * "is_hop_by_hop()"

    * "FileWrapper"

  * "wsgiref.headers" – WSGI response header tools

    * "Headers"

      * "Headers.get_all()"

      * "Headers.add_header()"

  * "wsgiref.simple_server" – a simple WSGI HTTP server

    * "make_server()"

    * "demo_app()"

    * "WSGIServer"

      * "WSGIServer.set_app()"

      * "WSGIServer.get_app()"

    * "WSGIRequestHandler"

      * "WSGIRequestHandler.get_environ()"

      * "WSGIRequestHandler.get_stderr()"

      * "WSGIRequestHandler.handle()"

  * "wsgiref.validate" — WSGI conformance checker

    * "validator()"

  * "wsgiref.handlers" – server/gateway base classes

    * "CGIHandler"

    * "IISCGIHandler"

    * "BaseCGIHandler"

    * "SimpleHandler"

    * "BaseHandler"

      * "BaseHandler.run()"

      * "BaseHandler._write()"

      * "BaseHandler._flush()"

      * "BaseHandler.get_stdin()"

      * "BaseHandler.get_stderr()"

      * "BaseHandler.add_cgi_vars()"

      * "BaseHandler.wsgi_multithread"

      * "BaseHandler.wsgi_multiprocess"

      * "BaseHandler.wsgi_run_once"

      * "BaseHandler.os_environ"

      * "BaseHandler.server_software"

      * "BaseHandler.get_scheme()"

      * "BaseHandler.setup_environ()"

      * "BaseHandler.log_exception()"

      * "BaseHandler.traceback_limit"

      * "BaseHandler.error_output()"

      * "BaseHandler.error_status"

      * "BaseHandler.error_headers"

      * "BaseHandler.error_body"

      * "BaseHandler.wsgi_file_wrapper"

      * "BaseHandler.sendfile()"

      * "BaseHandler.origin_server"

      * "BaseHandler.http_version"

    * "read_environ()"

  * "wsgiref.types" – WSGI types for static type checking

    * "StartResponse"

    * "WSGIEnvironment"

    * "WSGIApplication"

    * "InputStream"

    * "ErrorStream"

    * "FileWrapper"

  * Examples

* "urllib" — URL handling modules

* "urllib.request" — Extensible library for opening URLs

  * "urlopen()"

  * "install_opener()"

  * "build_opener()"

  * "pathname2url()"

  * "url2pathname()"

  * "getproxies()"

  * "Request"

  * "OpenerDirector"

  * "BaseHandler"

  * "HTTPDefaultErrorHandler"

  * "HTTPRedirectHandler"

  * "HTTPCookieProcessor"

  * "ProxyHandler"

  * "HTTPPasswordMgr"

  * "HTTPPasswordMgrWithDefaultRealm"

  * "HTTPPasswordMgrWithPriorAuth"

  * "AbstractBasicAuthHandler"

  * "HTTPBasicAuthHandler"

  * "ProxyBasicAuthHandler"

  * "AbstractDigestAuthHandler"

  * "HTTPDigestAuthHandler"

  * "ProxyDigestAuthHandler"

  * "HTTPHandler"

  * "HTTPSHandler"

  * "FileHandler"

  * "DataHandler"

  * "FTPHandler"

  * "CacheFTPHandler"

  * "UnknownHandler"

  * "HTTPErrorProcessor"

  * Request Objects

    * "Request.full_url"

    * "Request.type"

    * "Request.host"

    * "Request.origin_req_host"

    * "Request.selector"

    * "Request.data"

    * "Request.unverifiable"

    * "Request.method"

    * "Request.get_method()"

    * "Request.add_header()"

    * "Request.add_unredirected_header()"

    * "Request.has_header()"

    * "Request.remove_header()"

    * "Request.get_full_url()"

    * "Request.set_proxy()"

    * "Request.get_header()"

    * "Request.header_items()"

  * OpenerDirector Objects

    * "OpenerDirector.add_handler()"

    * "OpenerDirector.open()"

    * "OpenerDirector.error()"

  * BaseHandler Objects

    * "BaseHandler.add_parent()"

    * "BaseHandler.close()"

    * "BaseHandler.parent"

    * "BaseHandler.default_open()"

    * "BaseHandler.unknown_open()"

    * "BaseHandler.http_error_default()"

  * HTTPRedirectHandler Objects

    * "HTTPRedirectHandler.redirect_request()"

    * "HTTPRedirectHandler.http_error_301()"

    * "HTTPRedirectHandler.http_error_302()"

    * "HTTPRedirectHandler.http_error_303()"

    * "HTTPRedirectHandler.http_error_307()"

    * "HTTPRedirectHandler.http_error_308()"

  * HTTPCookieProcessor Objects

    * "HTTPCookieProcessor.cookiejar"

  * ProxyHandler Objects

  * HTTPPasswordMgr Objects

    * "HTTPPasswordMgr.add_password()"

    * "HTTPPasswordMgr.find_user_password()"

  * HTTPPasswordMgrWithPriorAuth Objects

    * "HTTPPasswordMgrWithPriorAuth.add_password()"

    * "HTTPPasswordMgrWithPriorAuth.find_user_password()"

    * "HTTPPasswordMgrWithPriorAuth.update_authenticated()"

    * "HTTPPasswordMgrWithPriorAuth.is_authenticated()"

  * AbstractBasicAuthHandler Objects

    * "AbstractBasicAuthHandler.http_error_auth_reqed()"

  * HTTPBasicAuthHandler Objects

    * "HTTPBasicAuthHandler.http_error_401()"

  * ProxyBasicAuthHandler Objects

    * "ProxyBasicAuthHandler.http_error_407()"

  * AbstractDigestAuthHandler Objects

    * "AbstractDigestAuthHandler.http_error_auth_reqed()"

  * HTTPDigestAuthHandler Objects

    * "HTTPDigestAuthHandler.http_error_401()"

  * ProxyDigestAuthHandler Objects

    * "ProxyDigestAuthHandler.http_error_407()"

  * HTTPHandler Objects

    * "HTTPHandler.http_open()"

  * HTTPSHandler Objects

    * "HTTPSHandler.https_open()"

  * FileHandler Objects

    * "FileHandler.file_open()"

  * DataHandler Objects

    * "DataHandler.data_open()"

  * FTPHandler Objects

    * "FTPHandler.ftp_open()"

  * CacheFTPHandler Objects

    * "CacheFTPHandler.setTimeout()"

    * "CacheFTPHandler.setMaxConns()"

  * UnknownHandler Objects

    * "UnknownHandler.unknown_open()"

  * HTTPErrorProcessor Objects

    * "HTTPErrorProcessor.http_response()"

    * "HTTPErrorProcessor.https_response()"

  * Examples

  * Legacy interface

    * "urlretrieve()"

    * "urlcleanup()"

    * "URLopener"

      * "URLopener.open()"

      * "URLopener.open_unknown()"

      * "URLopener.retrieve()"

      * "URLopener.version"

    * "FancyURLopener"

      * "FancyURLopener.prompt_user_passwd()"

  * "urllib.request" Restrictions

* "urllib.response" — Response classes used by urllib

  * "addinfourl"

    * "addinfourl.url"

    * "addinfourl.headers"

    * "addinfourl.status"

    * "addinfourl.geturl()"

    * "addinfourl.info()"

    * "addinfourl.code"

    * "addinfourl.getcode()"

* "urllib.parse" — Parse URLs into components

  * URL Parsing

    * "urlparse()"

    * "parse_qs()"

    * "parse_qsl()"

    * "urlunparse()"

    * "urlsplit()"

    * "urlunsplit()"

    * "urljoin()"

    * "urldefrag()"

    * "unwrap()"

  * URL parsing security

  * Parsing ASCII Encoded Bytes

  * Structured Parse Results

    * "urllib.parse.SplitResult.geturl()"

    * "DefragResult"

    * "ParseResult"

    * "SplitResult"

    * "DefragResultBytes"

    * "ParseResultBytes"

    * "SplitResultBytes"

  * URL Quoting

    * "quote()"

    * "quote_plus()"

    * "quote_from_bytes()"

    * "unquote()"

    * "unquote_plus()"

    * "unquote_to_bytes()"

    * "urlencode()"

* "urllib.error" — Exception classes raised by urllib.request

  * "URLError"

    * "URLError.reason"

  * "HTTPError"

    * "HTTPError.url"

    * "HTTPError.code"

    * "HTTPError.reason"

    * "HTTPError.headers"

    * "HTTPError.fp"

  * "ContentTooShortError"

    * "ContentTooShortError.content"

* "urllib.robotparser" —  Parser for robots.txt

  * "RobotFileParser"

    * "RobotFileParser.set_url()"

    * "RobotFileParser.read()"

    * "RobotFileParser.parse()"

    * "RobotFileParser.can_fetch()"

    * "RobotFileParser.mtime()"

    * "RobotFileParser.modified()"

    * "RobotFileParser.crawl_delay()"

    * "RobotFileParser.request_rate()"

    * "RobotFileParser.site_maps()"

* "http" — HTTP modules

  * "HTTPStatus"

  * HTTP status codes

  * HTTP status category

    * "HTTPMethod"

  * HTTP methods

* "http.client" — HTTP protocol client

  * "HTTPConnection"

  * "HTTPSConnection"

  * "HTTPResponse"

  * "parse_headers()"

  * "HTTPException"

  * "NotConnected"

  * "InvalidURL"

  * "UnknownProtocol"

  * "UnknownTransferEncoding"

  * "UnimplementedFileMode"

  * "IncompleteRead"

  * "ImproperConnectionState"

  * "CannotSendRequest"

  * "CannotSendHeader"

  * "ResponseNotReady"

  * "BadStatusLine"

  * "LineTooLong"

  * "RemoteDisconnected"

  * "HTTP_PORT"

  * "HTTPS_PORT"

  * "responses"

  * HTTPConnection Objects

    * "HTTPConnection.request()"

    * "HTTPConnection.getresponse()"

    * "HTTPConnection.set_debuglevel()"

    * "HTTPConnection.set_tunnel()"

    * "HTTPConnection.get_proxy_response_headers()"

    * "HTTPConnection.connect()"

    * "HTTPConnection.close()"

    * "HTTPConnection.blocksize"

    * "HTTPConnection.putrequest()"

    * "HTTPConnection.putheader()"

    * "HTTPConnection.endheaders()"

    * "HTTPConnection.send()"

  * HTTPResponse Objects

    * "HTTPResponse.read()"

    * "HTTPResponse.readinto()"

    * "HTTPResponse.getheader()"

    * "HTTPResponse.getheaders()"

    * "HTTPResponse.fileno()"

    * "HTTPResponse.msg"

    * "HTTPResponse.version"

    * "HTTPResponse.url"

    * "HTTPResponse.headers"

    * "HTTPResponse.status"

    * "HTTPResponse.reason"

    * "HTTPResponse.debuglevel"

    * "HTTPResponse.closed"

    * "HTTPResponse.geturl()"

    * "HTTPResponse.info()"

    * "HTTPResponse.getcode()"

  * Examples

  * HTTPMessage Objects

* "ftplib" — FTP protocol client

  * "FTP"

  * "error_reply"

  * "error_temp"

  * "error_perm"

  * "error_proto"

  * "all_errors"

  * FTP Objects

    * "FTP.set_debuglevel()"

    * "FTP.connect()"

    * "FTP.getwelcome()"

    * "FTP.login()"

    * "FTP.abort()"

    * "FTP.sendcmd()"

    * "FTP.voidcmd()"

    * "FTP.retrbinary()"

    * "FTP.retrlines()"

    * "FTP.set_pasv()"

    * "FTP.storbinary()"

    * "FTP.storlines()"

    * "FTP.transfercmd()"

    * "FTP.ntransfercmd()"

    * "FTP.mlsd()"

    * "FTP.nlst()"

    * "FTP.dir()"

    * "FTP.rename()"

    * "FTP.delete()"

    * "FTP.cwd()"

    * "FTP.mkd()"

    * "FTP.pwd()"

    * "FTP.rmd()"

    * "FTP.size()"

    * "FTP.quit()"

    * "FTP.close()"

  * FTP_TLS Objects

    * "FTP_TLS.ssl_version"

    * "FTP_TLS.auth()"

    * "FTP_TLS.ccc()"

    * "FTP_TLS.prot_p()"

    * "FTP_TLS.prot_c()"

* "poplib" — POP3 protocol client

  * "POP3"

  * "POP3_SSL"

  * "error_proto"

  * POP3 Objects

    * "POP3.set_debuglevel()"

    * "POP3.getwelcome()"

    * "POP3.capa()"

    * "POP3.user()"

    * "POP3.pass_()"

    * "POP3.apop()"

    * "POP3.rpop()"

    * "POP3.stat()"

    * "POP3.list()"

    * "POP3.retr()"

    * "POP3.dele()"

    * "POP3.rset()"

    * "POP3.noop()"

    * "POP3.quit()"

    * "POP3.top()"

    * "POP3.uidl()"

    * "POP3.utf8()"

    * "POP3.stls()"

  * POP3 Example

* "imaplib" — IMAP4 protocol client

  * "IMAP4"

    * "IMAP4.error"

    * "IMAP4.abort"

    * "IMAP4.readonly"

  * "IMAP4_SSL"

  * "IMAP4_stream"

  * "Internaldate2tuple()"

  * "Int2AP()"

  * "ParseFlags()"

  * "Time2Internaldate()"

  * IMAP4 Objects

    * "IMAP4.append()"

    * "IMAP4.authenticate()"

    * "IMAP4.check()"

    * "IMAP4.close()"

    * "IMAP4.copy()"

    * "IMAP4.create()"

    * "IMAP4.delete()"

    * "IMAP4.deleteacl()"

    * "IMAP4.enable()"

    * "IMAP4.expunge()"

    * "IMAP4.fetch()"

    * "IMAP4.getacl()"

    * "IMAP4.getannotation()"

    * "IMAP4.getquota()"

    * "IMAP4.getquotaroot()"

    * "IMAP4.list()"

    * "IMAP4.login()"

    * "IMAP4.login_cram_md5()"

    * "IMAP4.logout()"

    * "IMAP4.lsub()"

    * "IMAP4.myrights()"

    * "IMAP4.namespace()"

    * "IMAP4.noop()"

    * "IMAP4.open()"

    * "IMAP4.partial()"

    * "IMAP4.proxyauth()"

    * "IMAP4.read()"

    * "IMAP4.readline()"

    * "IMAP4.recent()"

    * "IMAP4.rename()"

    * "IMAP4.response()"

    * "IMAP4.search()"

    * "IMAP4.select()"

    * "IMAP4.send()"

    * "IMAP4.setacl()"

    * "IMAP4.setannotation()"

    * "IMAP4.setquota()"

    * "IMAP4.shutdown()"

    * "IMAP4.socket()"

    * "IMAP4.sort()"

    * "IMAP4.starttls()"

    * "IMAP4.status()"

    * "IMAP4.store()"

    * "IMAP4.subscribe()"

    * "IMAP4.thread()"

    * "IMAP4.uid()"

    * "IMAP4.unsubscribe()"

    * "IMAP4.unselect()"

    * "IMAP4.xatom()"

    * "IMAP4.PROTOCOL_VERSION"

    * "IMAP4.debug"

    * "IMAP4.utf8_enabled"

  * IMAP4 Example

* "smtplib" — SMTP protocol client

  * "SMTP"

  * "SMTP_SSL"

  * "LMTP"

  * "SMTPException"

  * "SMTPServerDisconnected"

  * "SMTPResponseException"

  * "SMTPSenderRefused"

  * "SMTPRecipientsRefused"

  * "SMTPDataError"

  * "SMTPConnectError"

  * "SMTPHeloError"

  * "SMTPNotSupportedError"

  * "SMTPAuthenticationError"

  * SMTP Objects

    * "SMTP.set_debuglevel()"

    * "SMTP.docmd()"

    * "SMTP.connect()"

    * "SMTP.helo()"

    * "SMTP.ehlo()"

    * "SMTP.ehlo_or_helo_if_needed()"

    * "SMTP.has_extn()"

    * "SMTP.verify()"

    * "SMTP.login()"

    * "SMTP.auth()"

    * "SMTP.starttls()"

    * "SMTP.sendmail()"

    * "SMTP.send_message()"

    * "SMTP.quit()"

  * SMTP Example

* "uuid" — UUID objects according to **RFC 4122**

  * "SafeUUID"

    * "SafeUUID.safe"

    * "SafeUUID.unsafe"

    * "SafeUUID.unknown"

  * "UUID"

    * "UUID.bytes"

    * "UUID.bytes_le"

    * "UUID.fields"

    * "UUID.time_low"

    * "UUID.time_mid"

    * "UUID.time_hi_version"

    * "UUID.clock_seq_hi_variant"

    * "UUID.clock_seq_low"

    * "UUID.node"

    * "UUID.time"

    * "UUID.clock_seq"

    * "UUID.hex"

    * "UUID.int"

    * "UUID.urn"

    * "UUID.variant"

    * "UUID.version"

    * "UUID.is_safe"

  * "getnode()"

  * "uuid1()"

  * "uuid3()"

  * "uuid4()"

  * "uuid5()"

  * "NAMESPACE_DNS"

  * "NAMESPACE_URL"

  * "NAMESPACE_OID"

  * "NAMESPACE_X500"

  * "RESERVED_NCS"

  * "RFC_4122"

  * "RESERVED_MICROSOFT"

  * "RESERVED_FUTURE"

  * Command-Line Usage

  * Example

  * Command-Line Example

* "socketserver" — A framework for network servers

  * "TCPServer"

  * "UDPServer"

  * "UnixStreamServer"

  * "UnixDatagramServer"

  * Server Creation Notes

    * "ForkingMixIn"

    * "ThreadingMixIn"

    * "ForkingTCPServer"

    * "ForkingUDPServer"

    * "ThreadingTCPServer"

    * "ThreadingUDPServer"

    * "ForkingUnixStreamServer"

    * "ForkingUnixDatagramServer"

    * "ThreadingUnixStreamServer"

    * "ThreadingUnixDatagramServer"

  * Server Objects

    * "BaseServer"

      * "BaseServer.fileno()"

      * "BaseServer.handle_request()"

      * "BaseServer.serve_forever()"

      * "BaseServer.service_actions()"

      * "BaseServer.shutdown()"

      * "BaseServer.server_close()"

      * "BaseServer.address_family"

      * "BaseServer.RequestHandlerClass"

      * "BaseServer.server_address"

      * "BaseServer.socket"

      * "BaseServer.allow_reuse_address"

      * "BaseServer.request_queue_size"

      * "BaseServer.socket_type"

      * "BaseServer.timeout"

      * "BaseServer.finish_request()"

      * "BaseServer.get_request()"

      * "BaseServer.handle_error()"

      * "BaseServer.handle_timeout()"

      * "BaseServer.process_request()"

      * "BaseServer.server_activate()"

      * "BaseServer.server_bind()"

      * "BaseServer.verify_request()"

  * Request Handler Objects

    * "BaseRequestHandler"

      * "BaseRequestHandler.setup()"

      * "BaseRequestHandler.handle()"

      * "BaseRequestHandler.finish()"

    * "StreamRequestHandler"

    * "DatagramRequestHandler"

  * Examples

    * "socketserver.TCPServer" Example

    * "socketserver.UDPServer" Example

    * Asynchronous Mixins

* "http.server" — HTTP servers

  * "HTTPServer"

  * "ThreadingHTTPServer"

  * "BaseHTTPRequestHandler"

    * "BaseHTTPRequestHandler.client_address"

    * "BaseHTTPRequestHandler.server"

    * "BaseHTTPRequestHandler.close_connection"

    * "BaseHTTPRequestHandler.requestline"

    * "BaseHTTPRequestHandler.command"

    * "BaseHTTPRequestHandler.path"

    * "BaseHTTPRequestHandler.request_version"

    * "BaseHTTPRequestHandler.headers"

    * "BaseHTTPRequestHandler.rfile"

    * "BaseHTTPRequestHandler.wfile"

    * "BaseHTTPRequestHandler.server_version"

    * "BaseHTTPRequestHandler.sys_version"

    * "BaseHTTPRequestHandler.error_message_format"

    * "BaseHTTPRequestHandler.error_content_type"

    * "BaseHTTPRequestHandler.protocol_version"

    * "BaseHTTPRequestHandler.MessageClass"

    * "BaseHTTPRequestHandler.responses"

    * "BaseHTTPRequestHandler.handle()"

    * "BaseHTTPRequestHandler.handle_one_request()"

    * "BaseHTTPRequestHandler.handle_expect_100()"

    * "BaseHTTPRequestHandler.send_error()"

    * "BaseHTTPRequestHandler.send_response()"

    * "BaseHTTPRequestHandler.send_header()"

    * "BaseHTTPRequestHandler.send_response_only()"

    * "BaseHTTPRequestHandler.end_headers()"

    * "BaseHTTPRequestHandler.flush_headers()"

    * "BaseHTTPRequestHandler.log_request()"

    * "BaseHTTPRequestHandler.log_error()"

    * "BaseHTTPRequestHandler.log_message()"

    * "BaseHTTPRequestHandler.version_string()"

    * "BaseHTTPRequestHandler.date_time_string()"

    * "BaseHTTPRequestHandler.log_date_time_string()"

    * "BaseHTTPRequestHandler.address_string()"

  * "SimpleHTTPRequestHandler"

    * "SimpleHTTPRequestHandler.server_version"

    * "SimpleHTTPRequestHandler.extensions_map"

    * "SimpleHTTPRequestHandler.do_HEAD()"

    * "SimpleHTTPRequestHandler.do_GET()"

  * "CGIHTTPRequestHandler"

    * "CGIHTTPRequestHandler.cgi_directories"

    * "CGIHTTPRequestHandler.do_POST()"

  * Security Considerations

* "http.cookies" — HTTP state management

  * "CookieError"

  * "BaseCookie"

  * "SimpleCookie"

  * Cookie Objects

    * "BaseCookie.value_decode()"

    * "BaseCookie.value_encode()"

    * "BaseCookie.output()"

    * "BaseCookie.js_output()"

    * "BaseCookie.load()"

  * Morsel Objects

    * "Morsel"

      * "Morsel.value"

      * "Morsel.coded_value"

      * "Morsel.key"

      * "Morsel.set()"

      * "Morsel.isReservedKey()"

      * "Morsel.output()"

      * "Morsel.js_output()"

      * "Morsel.OutputString()"

      * "Morsel.update()"

      * "Morsel.copy()"

      * "Morsel.setdefault()"

  * Example

* "http.cookiejar" — Cookie handling for HTTP clients

  * "LoadError"

  * "CookieJar"

  * "FileCookieJar"

  * "CookiePolicy"

  * "DefaultCookiePolicy"

  * "Cookie"

  * CookieJar and FileCookieJar Objects

    * "CookieJar.add_cookie_header()"

    * "CookieJar.extract_cookies()"

    * "CookieJar.set_policy()"

    * "CookieJar.make_cookies()"

    * "CookieJar.set_cookie_if_ok()"

    * "CookieJar.set_cookie()"

    * "CookieJar.clear()"

    * "CookieJar.clear_session_cookies()"

    * "FileCookieJar.save()"

    * "FileCookieJar.load()"

    * "FileCookieJar.revert()"

    * "FileCookieJar.filename"

    * "FileCookieJar.delayload"

  * FileCookieJar subclasses and co-operation with web browsers

    * "MozillaCookieJar"

    * "LWPCookieJar"

  * CookiePolicy Objects

    * "CookiePolicy.set_ok()"

    * "CookiePolicy.return_ok()"

    * "CookiePolicy.domain_return_ok()"

    * "CookiePolicy.path_return_ok()"

    * "CookiePolicy.netscape"

    * "CookiePolicy.rfc2965"

    * "CookiePolicy.hide_cookie2"

  * DefaultCookiePolicy Objects

    * "DefaultCookiePolicy.blocked_domains()"

    * "DefaultCookiePolicy.set_blocked_domains()"

    * "DefaultCookiePolicy.is_blocked()"

    * "DefaultCookiePolicy.allowed_domains()"

    * "DefaultCookiePolicy.set_allowed_domains()"

    * "DefaultCookiePolicy.is_not_allowed()"

    * "DefaultCookiePolicy.rfc2109_as_netscape"

    * "DefaultCookiePolicy.strict_domain"

    * "DefaultCookiePolicy.strict_rfc2965_unverifiable"

    * "DefaultCookiePolicy.strict_ns_unverifiable"

    * "DefaultCookiePolicy.strict_ns_domain"

    * "DefaultCookiePolicy.strict_ns_set_initial_dollar"

    * "DefaultCookiePolicy.strict_ns_set_path"

    * "DefaultCookiePolicy.DomainStrictNoDots"

    * "DefaultCookiePolicy.DomainStrictNonDomain"

    * "DefaultCookiePolicy.DomainRFC2965Match"

    * "DefaultCookiePolicy.DomainLiberal"

    * "DefaultCookiePolicy.DomainStrict"

  * Cookie Objects

    * "Cookie.version"

    * "Cookie.name"

    * "Cookie.value"

    * "Cookie.port"

    * "Cookie.path"

    * "Cookie.secure"

    * "Cookie.expires"

    * "Cookie.discard"

    * "Cookie.comment"

    * "Cookie.comment_url"

    * "Cookie.rfc2109"

    * "Cookie.port_specified"

    * "Cookie.domain_specified"

    * "Cookie.domain_initial_dot"

    * "Cookie.has_nonstandard_attr()"

    * "Cookie.get_nonstandard_attr()"

    * "Cookie.set_nonstandard_attr()"

    * "Cookie.is_expired()"

  * Examples

* "xmlrpc" — XMLRPC server and client modules

* "xmlrpc.client" — XML-RPC client access

  * "ServerProxy"

  * ServerProxy Objects

    * "ServerProxy.system.listMethods()"

    * "ServerProxy.system.methodSignature()"

    * "ServerProxy.system.methodHelp()"

  * DateTime Objects

    * "DateTime"

      * "DateTime.decode()"

      * "DateTime.encode()"

  * Binary Objects

    * "Binary"

      * "Binary.data"

      * "Binary.decode()"

      * "Binary.encode()"

  * Fault Objects

    * "Fault"

      * "Fault.faultCode"

      * "Fault.faultString"

  * ProtocolError Objects

    * "ProtocolError"

      * "ProtocolError.url"

      * "ProtocolError.errcode"

      * "ProtocolError.errmsg"

      * "ProtocolError.headers"

  * MultiCall Objects

    * "MultiCall"

  * Convenience Functions

    * "dumps()"

    * "loads()"

  * Example of Client Usage

  * Example of Client and Server Usage

* "xmlrpc.server" — Basic XML-RPC servers

  * "SimpleXMLRPCServer"

  * "CGIXMLRPCRequestHandler"

  * "SimpleXMLRPCRequestHandler"

  * SimpleXMLRPCServer Objects

    * "SimpleXMLRPCServer.register_function()"

    * "SimpleXMLRPCServer.register_instance()"

    * "SimpleXMLRPCServer.register_introspection_functions()"

    * "SimpleXMLRPCServer.register_multicall_functions()"

    * "SimpleXMLRPCRequestHandler.rpc_paths"

    * SimpleXMLRPCServer Example

  * CGIXMLRPCRequestHandler

    * "CGIXMLRPCRequestHandler.register_function()"

    * "CGIXMLRPCRequestHandler.register_instance()"

    * "CGIXMLRPCRequestHandler.register_introspection_functions()"

    * "CGIXMLRPCRequestHandler.register_multicall_functions()"

    * "CGIXMLRPCRequestHandler.handle_request()"

  * Documenting XMLRPC server

    * "DocXMLRPCServer"

    * "DocCGIXMLRPCRequestHandler"

    * "DocXMLRPCRequestHandler"

  * DocXMLRPCServer Objects

    * "DocXMLRPCServer.set_server_title()"

    * "DocXMLRPCServer.set_server_name()"

    * "DocXMLRPCServer.set_server_documentation()"

  * DocCGIXMLRPCRequestHandler

    * "DocCGIXMLRPCRequestHandler.set_server_title()"

    * "DocCGIXMLRPCRequestHandler.set_server_name()"

    * "DocCGIXMLRPCRequestHandler.set_server_documentation()"

* "ipaddress" — IPv4/IPv6 manipulation library

  * Convenience factory functions

    * "ip_address()"

    * "ip_network()"

    * "ip_interface()"

  * IP Addresses

    * Address objects

      * "IPv4Address"

        * "IPv4Address.version"

        * "IPv4Address.max_prefixlen"

        * "IPv4Address.compressed"

        * "IPv4Address.exploded"

        * "IPv4Address.packed"

        * "IPv4Address.reverse_pointer"

        * "IPv4Address.is_multicast"

        * "IPv4Address.is_private"

        * "IPv4Address.is_global"

        * "IPv4Address.is_unspecified"

        * "IPv4Address.is_reserved"

        * "IPv4Address.is_loopback"

        * "IPv4Address.is_link_local"

        * "IPv4Address.__format__()"

      * "IPv6Address"

        * "IPv6Address.compressed"

        * "IPv6Address.exploded"

        * "IPv6Address.packed"

        * "IPv6Address.reverse_pointer"

        * "IPv6Address.version"

        * "IPv6Address.max_prefixlen"

        * "IPv6Address.is_multicast"

        * "IPv6Address.is_private"

        * "IPv6Address.is_global"

        * "IPv6Address.is_unspecified"

        * "IPv6Address.is_reserved"

        * "IPv6Address.is_loopback"

        * "IPv6Address.is_link_local"

        * "IPv6Address.is_site_local"

        * "IPv6Address.ipv4_mapped"

        * "IPv6Address.scope_id"

        * "IPv6Address.sixtofour"

        * "IPv6Address.teredo"

        * "IPv6Address.__format__()"

    * Conversion to Strings and Integers

    * Operators

      * Comparison operators

      * Arithmetic operators

  * IP Network definitions

    * Prefix, net mask and host mask

    * Network objects

      * "IPv4Network"

        * "IPv4Network.version"

        * "IPv4Network.max_prefixlen"

        * "IPv4Network.is_multicast"

        * "IPv4Network.is_private"

        * "IPv4Network.is_unspecified"

        * "IPv4Network.is_reserved"

        * "IPv4Network.is_loopback"

        * "IPv4Network.is_link_local"

        * "IPv4Network.network_address"

        * "IPv4Network.broadcast_address"

        * "IPv4Network.hostmask"

        * "IPv4Network.netmask"

        * "IPv4Network.with_prefixlen"

        * "IPv4Network.compressed"

        * "IPv4Network.exploded"

        * "IPv4Network.with_netmask"

        * "IPv4Network.with_hostmask"

        * "IPv4Network.num_addresses"

        * "IPv4Network.prefixlen"

        * "IPv4Network.hosts()"

        * "IPv4Network.overlaps()"

        * "IPv4Network.address_exclude()"

        * "IPv4Network.subnets()"

        * "IPv4Network.supernet()"

        * "IPv4Network.subnet_of()"

        * "IPv4Network.supernet_of()"

        * "IPv4Network.compare_networks()"

      * "IPv6Network"

        * "IPv6Network.version"

        * "IPv6Network.max_prefixlen"

        * "IPv6Network.is_multicast"

        * "IPv6Network.is_private"

        * "IPv6Network.is_unspecified"

        * "IPv6Network.is_reserved"

        * "IPv6Network.is_loopback"

        * "IPv6Network.is_link_local"

        * "IPv6Network.network_address"

        * "IPv6Network.broadcast_address"

        * "IPv6Network.hostmask"

        * "IPv6Network.netmask"

        * "IPv6Network.with_prefixlen"

        * "IPv6Network.compressed"

        * "IPv6Network.exploded"

        * "IPv6Network.with_netmask"

        * "IPv6Network.with_hostmask"

        * "IPv6Network.num_addresses"

        * "IPv6Network.prefixlen"

        * "IPv6Network.hosts()"

        * "IPv6Network.overlaps()"

        * "IPv6Network.address_exclude()"

        * "IPv6Network.subnets()"

        * "IPv6Network.supernet()"

        * "IPv6Network.subnet_of()"

        * "IPv6Network.supernet_of()"

        * "IPv6Network.compare_networks()"

        * "IPv6Network.is_site_local"

    * Operators

      * Logical operators

      * Iteration

      * Networks as containers of addresses

  * Interface objects

    * "IPv4Interface"

      * "IPv4Interface.ip"

      * "IPv4Interface.network"

      * "IPv4Interface.with_prefixlen"

      * "IPv4Interface.with_netmask"

      * "IPv4Interface.with_hostmask"

    * "IPv6Interface"

      * "IPv6Interface.ip"

      * "IPv6Interface.network"

      * "IPv6Interface.with_prefixlen"

      * "IPv6Interface.with_netmask"

      * "IPv6Interface.with_hostmask"

    * Operators

      * Logical operators

  * Other Module Level Functions

    * "v4_int_to_packed()"

    * "v6_int_to_packed()"

    * "summarize_address_range()"

    * "collapse_addresses()"

    * "get_mixed_type_key()"

  * Custom Exceptions

    * "AddressValueError"

    * "NetmaskValueError"

vim:tw=78:ts=8:ft=help:norl: