*email.pyx*                                   Last change: 2023 Sep 15

"email" — An email and MIME handling package
********************************************

**Source code:** Lib/email/__init__.py

======================================================================

The "email" package is a library for managing email messages.  It is
specifically _not_ designed to do any sending of email messages to
SMTP (**RFC 2821**), NNTP, or other servers; those are functions of
modules such as "smtplib".  The "email" package attempts to be as RFC-
compliant as possible, supporting **RFC 5322** and **RFC 6532**, as
well as such MIME-related RFCs as **RFC 2045**, **RFC 2046**, **RFC
2047**, **RFC 2183**, and **RFC 2231**.

The overall structure of the email package can be divided into three
major components, plus a fourth component that controls the behavior
of the other components.

The central component of the package is an “object model” that
represents email messages.  An application interacts with the package
primarily through the object model interface defined in the "message"
sub-module.  The application can use this API to ask questions about
an existing email, to construct a new email, or to add or remove email
subcomponents that themselves use the same object model interface.
That is, following the nature of email messages and their MIME
subcomponents, the email object model is a tree structure of objects
that all provide the "EmailMessage" API.

The other two major components of the package are the "parser" and the
"generator".  The parser takes the serialized version of an email
message (a stream of bytes) and converts it into a tree of
"EmailMessage" objects.  The generator takes an "EmailMessage" and
turns it back into a serialized byte stream.  (The parser and
generator also handle streams of text characters, but this usage is
discouraged as it is too easy to end up with messages that are not
valid in one way or another.)

The control component is the "policy" module.  Every "EmailMessage",
every "generator", and every "parser" has an associated "policy"
object that controls its behavior.  Usually an application only needs
to specify the policy when an "EmailMessage" is created, either by
directly instantiating an "EmailMessage"  to create a new email, or by
parsing an input stream using a "parser".  But the policy can be
changed when the message is serialized using a "generator". This
allows, for example, a generic email message to be parsed from disk,
but to serialize it using standard SMTP settings when sending it to an
email server.

The email package does its best to hide the details of the various
governing RFCs from the application.  Conceptually the application
should be able to treat the email message as a structured tree of
unicode text and binary attachments, without having to worry about how
these are represented when serialized.  In practice, however, it is
often necessary to be aware of at least some of the rules governing
MIME messages and their structure, specifically the names and nature
of the MIME “content types” and how they identify multipart documents.
For the most part this knowledge should only be required for more
complex applications, and even then it should only be the high level
structure in question, and not the details of how those structures are
represented.  Since MIME content types are used widely in modern
internet software (not just email), this will be a familiar concept to
many programmers.

The following sections describe the functionality of the "email"
package. We start with the "message" object model, which is the
primary interface an application will use, and follow that with the
"parser" and "generator" components.  Then we cover the "policy"
controls, which completes the treatment of the main components of the
library.

The next three sections cover the exceptions the package may raise and
the defects (non-compliance with the RFCs) that the "parser" may
detect.  Then we cover the "headerregistry" and the "contentmanager"
sub-components, which provide tools for doing more detailed
manipulation of headers and payloads, respectively.  Both of these
components contain features relevant to consuming and producing non-
trivial messages, but also document their extensibility APIs, which
will be of interest to advanced applications.

Following those is a set of examples of using the fundamental parts of
the APIs covered in the preceding sections.

The foregoing represent the modern (unicode friendly) API of the email
package. The remaining sections, starting with the "Message" class,
cover the legacy "compat32" API that deals much more directly with the
details of how email messages are represented.  The "compat32" API
does _not_ hide the details of the RFCs from the application, but for
applications that need to operate at that level, they can be useful
tools.  This documentation is also relevant for applications that are
still using the "compat32" API for backward compatibility reasons.

Changed in version 3.6: Docs reorganized and rewritten to promote the
new "EmailMessage"/"EmailPolicy" API.

Contents of the "email" package documentation:

* "email.message": Representing an email message

  * "EmailMessage"

    * "EmailMessage.as_string()"

    * "EmailMessage.__str__()"

    * "EmailMessage.as_bytes()"

    * "EmailMessage.__bytes__()"

    * "EmailMessage.is_multipart()"

    * "EmailMessage.set_unixfrom()"

    * "EmailMessage.get_unixfrom()"

    * "EmailMessage.__len__()"

    * "EmailMessage.__contains__()"

    * "EmailMessage.__getitem__()"

    * "EmailMessage.__setitem__()"

    * "EmailMessage.__delitem__()"

    * "EmailMessage.keys()"

    * "EmailMessage.values()"

    * "EmailMessage.items()"

    * "EmailMessage.get()"

    * "EmailMessage.get_all()"

    * "EmailMessage.add_header()"

    * "EmailMessage.replace_header()"

    * "EmailMessage.get_content_type()"

    * "EmailMessage.get_content_maintype()"

    * "EmailMessage.get_content_subtype()"

    * "EmailMessage.get_default_type()"

    * "EmailMessage.set_default_type()"

    * "EmailMessage.set_param()"

    * "EmailMessage.del_param()"

    * "EmailMessage.get_filename()"

    * "EmailMessage.get_boundary()"

    * "EmailMessage.set_boundary()"

    * "EmailMessage.get_content_charset()"

    * "EmailMessage.get_charsets()"

    * "EmailMessage.is_attachment()"

    * "EmailMessage.get_content_disposition()"

    * "EmailMessage.walk()"

    * "EmailMessage.get_body()"

    * "EmailMessage.iter_attachments()"

    * "EmailMessage.iter_parts()"

    * "EmailMessage.get_content()"

    * "EmailMessage.set_content()"

    * "EmailMessage.make_related()"

    * "EmailMessage.make_alternative()"

    * "EmailMessage.make_mixed()"

    * "EmailMessage.add_related()"

    * "EmailMessage.add_alternative()"

    * "EmailMessage.add_attachment()"

    * "EmailMessage.clear()"

    * "EmailMessage.clear_content()"

    * "EmailMessage.preamble"

    * "EmailMessage.epilogue"

    * "EmailMessage.defects"

  * "MIMEPart"

* "email.parser": Parsing email messages

  * FeedParser API

    * "BytesFeedParser"

      * "BytesFeedParser.feed()"

      * "BytesFeedParser.close()"

    * "FeedParser"

  * Parser API

    * "BytesParser"

      * "BytesParser.parse()"

      * "BytesParser.parsebytes()"

    * "BytesHeaderParser"

    * "Parser"

      * "Parser.parse()"

      * "Parser.parsestr()"

    * "HeaderParser"

    * "message_from_bytes()"

    * "message_from_binary_file()"

    * "message_from_string()"

    * "message_from_file()"

  * Additional notes

* "email.generator": Generating MIME documents

  * "BytesGenerator"

    * "BytesGenerator.flatten()"

    * "BytesGenerator.clone()"

    * "BytesGenerator.write()"

  * "Generator"

    * "Generator.flatten()"

    * "Generator.clone()"

    * "Generator.write()"

  * "DecodedGenerator"

* "email.policy": Policy Objects

  * "Policy"

    * "Policy.max_line_length"

    * "Policy.linesep"

    * "Policy.cte_type"

    * "Policy.raise_on_defect"

    * "Policy.mangle_from_"

    * "Policy.message_factory"

    * "Policy.clone()"

    * "Policy.handle_defect()"

    * "Policy.register_defect()"

    * "Policy.header_max_count()"

    * "Policy.header_source_parse()"

    * "Policy.header_store_parse()"

    * "Policy.header_fetch_parse()"

    * "Policy.fold()"

    * "Policy.fold_binary()"

  * "EmailPolicy"

    * "EmailPolicy.utf8"

    * "EmailPolicy.refold_source"

    * "EmailPolicy.header_factory"

    * "EmailPolicy.content_manager"

    * "EmailPolicy.header_max_count()"

    * "EmailPolicy.header_source_parse()"

    * "EmailPolicy.header_store_parse()"

    * "EmailPolicy.header_fetch_parse()"

    * "EmailPolicy.fold()"

    * "EmailPolicy.fold_binary()"

  * "default"

  * "SMTP"

  * "SMTPUTF8"

  * "HTTP"

  * "strict"

  * "Compat32"

    * "Compat32.mangle_from_"

    * "Compat32.header_source_parse()"

    * "Compat32.header_store_parse()"

    * "Compat32.header_fetch_parse()"

    * "Compat32.fold()"

    * "Compat32.fold_binary()"

  * "compat32"

* "email.errors": Exception and Defect classes

  * "MessageError"

  * "MessageParseError"

  * "HeaderParseError"

  * "BoundaryError"

  * "MultipartConversionError"

* "email.headerregistry": Custom Header Objects

  * "BaseHeader"

    * "BaseHeader.name"

    * "BaseHeader.defects"

    * "BaseHeader.max_count"

    * "BaseHeader.fold()"

  * "UnstructuredHeader"

  * "DateHeader"

    * "DateHeader.datetime"

  * "AddressHeader"

    * "AddressHeader.groups"

    * "AddressHeader.addresses"

  * "SingleAddressHeader"

    * "SingleAddressHeader.address"

  * "MIMEVersionHeader"

    * "MIMEVersionHeader.version"

    * "MIMEVersionHeader.major"

    * "MIMEVersionHeader.minor"

  * "ParameterizedMIMEHeader"

    * "ParameterizedMIMEHeader.params"

  * "ContentTypeHeader"

    * "ContentTypeHeader.content_type"

    * "ContentTypeHeader.maintype"

    * "ContentTypeHeader.subtype"

  * "ContentDispositionHeader"

    * "ContentDispositionHeader.content_disposition"

  * "ContentTransferEncoding"

    * "ContentTransferEncoding.cte"

  * "HeaderRegistry"

    * "HeaderRegistry.map_to_type()"

    * "HeaderRegistry.__getitem__()"

    * "HeaderRegistry.__call__()"

  * "Address"

    * "Address.display_name"

    * "Address.username"

    * "Address.domain"

    * "Address.addr_spec"

    * "Address.__str__()"

  * "Group"

    * "Group.display_name"

    * "Group.addresses"

    * "Group.__str__()"

* "email.contentmanager": Managing MIME Content

  * "ContentManager"

    * "ContentManager.get_content()"

    * "ContentManager.set_content()"

    * "ContentManager.add_get_handler()"

    * "ContentManager.add_set_handler()"

  * Content Manager Instances

    * "raw_data_manager"

    * "get_content()"

    * "set_content()"

* "email": Examples

Legacy API:

* "email.message.Message": Representing an email message using the
  "compat32" API

  * "Message"

    * "Message.as_string()"

    * "Message.__str__()"

    * "Message.as_bytes()"

    * "Message.__bytes__()"

    * "Message.is_multipart()"

    * "Message.set_unixfrom()"

    * "Message.get_unixfrom()"

    * "Message.attach()"

    * "Message.get_payload()"

    * "Message.set_payload()"

    * "Message.set_charset()"

    * "Message.get_charset()"

    * "Message.__len__()"

    * "Message.__contains__()"

    * "Message.__getitem__()"

    * "Message.__setitem__()"

    * "Message.__delitem__()"

    * "Message.keys()"

    * "Message.values()"

    * "Message.items()"

    * "Message.get()"

    * "Message.get_all()"

    * "Message.add_header()"

    * "Message.replace_header()"

    * "Message.get_content_type()"

    * "Message.get_content_maintype()"

    * "Message.get_content_subtype()"

    * "Message.get_default_type()"

    * "Message.set_default_type()"

    * "Message.get_params()"

    * "Message.get_param()"

    * "Message.set_param()"

    * "Message.del_param()"

    * "Message.set_type()"

    * "Message.get_filename()"

    * "Message.get_boundary()"

    * "Message.set_boundary()"

    * "Message.get_content_charset()"

    * "Message.get_charsets()"

    * "Message.get_content_disposition()"

    * "Message.walk()"

    * "Message.preamble"

    * "Message.epilogue"

    * "Message.defects"

* "email.mime": Creating email and MIME objects from scratch

  * "MIMEBase"

  * "MIMENonMultipart"

  * "MIMEMultipart"

  * "MIMEApplication"

  * "MIMEAudio"

  * "MIMEImage"

  * "MIMEMessage"

  * "MIMEText"

* "email.header": Internationalized headers

  * "Header"

    * "Header.append()"

    * "Header.encode()"

    * "Header.__str__()"

    * "Header.__eq__()"

    * "Header.__ne__()"

  * "decode_header()"

  * "make_header()"

* "email.charset": Representing character sets

  * "Charset"

    * "Charset.input_charset"

    * "Charset.header_encoding"

    * "Charset.body_encoding"

    * "Charset.output_charset"

    * "Charset.input_codec"

    * "Charset.output_codec"

    * "Charset.get_body_encoding()"

    * "Charset.get_output_charset()"

    * "Charset.header_encode()"

    * "Charset.header_encode_lines()"

    * "Charset.body_encode()"

    * "Charset.__str__()"

    * "Charset.__eq__()"

    * "Charset.__ne__()"

  * "add_charset()"

  * "add_alias()"

  * "add_codec()"

* "email.encoders": Encoders

  * "encode_quopri()"

  * "encode_base64()"

  * "encode_7or8bit()"

  * "encode_noop()"

* "email.utils": Miscellaneous utilities

  * "localtime()"

  * "make_msgid()"

  * "quote()"

  * "unquote()"

  * "parseaddr()"

  * "formataddr()"

  * "getaddresses()"

  * "parsedate()"

  * "parsedate_tz()"

  * "parsedate_to_datetime()"

  * "mktime_tz()"

  * "formatdate()"

  * "format_datetime()"

  * "decode_rfc2231()"

  * "encode_rfc2231()"

  * "collapse_rfc2231_value()"

  * "decode_params()"

* "email.iterators": Iterators

  * "body_line_iterator()"

  * "typed_subpart_iterator()"

  * "_structure()"

See also:

  Module "smtplib"
     SMTP (Simple Mail Transport Protocol) client

  Module "poplib"
     POP (Post Office Protocol) client

  Module "imaplib"
     IMAP (Internet Message Access Protocol) client

  Module "mailbox"
     Tools for creating, reading, and managing collections of messages
     on disk using a variety standard formats.

vim:tw=78:ts=8:ft=help:norl: