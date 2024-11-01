*netdata.pyx*                                 Last change: 2023 Sep 15

Internet Data Handling
**********************

This chapter describes modules which support handling data formats
commonly used on the internet.

* "email" — An email and MIME handling package

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

* "json" — JSON encoder and decoder

  * Basic Usage

    * "dump()"

    * "dumps()"

    * "load()"

    * "loads()"

  * Encoders and Decoders

    * "JSONDecoder"

      * "JSONDecoder.decode()"

      * "JSONDecoder.raw_decode()"

    * "JSONEncoder"

      * "JSONEncoder.default()"

      * "JSONEncoder.encode()"

      * "JSONEncoder.iterencode()"

  * Exceptions

    * "JSONDecodeError"

      * "JSONDecodeError.msg"

      * "JSONDecodeError.doc"

      * "JSONDecodeError.pos"

      * "JSONDecodeError.lineno"

      * "JSONDecodeError.colno"

  * Standard Compliance and Interoperability

    * Character Encodings

    * Infinite and NaN Number Values

    * Repeated Names Within an Object

    * Top-level Non-Object, Non-Array Values

    * Implementation Limitations

  * Command Line Interface

    * Command line options

* "mailbox" — Manipulate mailboxes in various formats

  * "Mailbox" objects

    * "Mailbox"

      * "Mailbox.add()"

      * "Mailbox.remove()"

      * "Mailbox.__delitem__()"

      * "Mailbox.discard()"

      * "Mailbox.__setitem__()"

      * "Mailbox.iterkeys()"

      * "Mailbox.keys()"

      * "Mailbox.itervalues()"

      * "Mailbox.__iter__()"

      * "Mailbox.values()"

      * "Mailbox.iteritems()"

      * "Mailbox.items()"

      * "Mailbox.get()"

      * "Mailbox.__getitem__()"

      * "Mailbox.get_message()"

      * "Mailbox.get_bytes()"

      * "Mailbox.get_string()"

      * "Mailbox.get_file()"

      * "Mailbox.__contains__()"

      * "Mailbox.__len__()"

      * "Mailbox.clear()"

      * "Mailbox.pop()"

      * "Mailbox.popitem()"

      * "Mailbox.update()"

      * "Mailbox.flush()"

      * "Mailbox.lock()"

      * "Mailbox.unlock()"

      * "Mailbox.close()"

    * "Maildir"

      * "Maildir"

        * "Maildir.list_folders()"

        * "Maildir.get_folder()"

        * "Maildir.add_folder()"

        * "Maildir.remove_folder()"

        * "Maildir.clean()"

        * "Maildir.add()"

        * "Maildir.__setitem__()"

        * "Maildir.update()"

        * "Maildir.flush()"

        * "Maildir.lock()"

        * "Maildir.unlock()"

        * "Maildir.close()"

        * "Maildir.get_file()"

    * "mbox"

      * "mbox"

        * "mbox.get_file()"

        * "mbox.lock()"

        * "mbox.unlock()"

    * "MH"

      * "MH"

        * "MH.list_folders()"

        * "MH.get_folder()"

        * "MH.add_folder()"

        * "MH.remove_folder()"

        * "MH.get_sequences()"

        * "MH.set_sequences()"

        * "MH.pack()"

        * "MH.remove()"

        * "MH.__delitem__()"

        * "MH.discard()"

        * "MH.lock()"

        * "MH.unlock()"

        * "MH.get_file()"

        * "MH.flush()"

        * "MH.close()"

    * "Babyl"

      * "Babyl"

        * "Babyl.get_labels()"

        * "Babyl.get_file()"

        * "Babyl.lock()"

        * "Babyl.unlock()"

    * "MMDF"

      * "MMDF"

        * "MMDF.get_file()"

        * "MMDF.lock()"

        * "MMDF.unlock()"

  * "Message" objects

    * "Message"

    * "MaildirMessage"

      * "MaildirMessage"

        * "MaildirMessage.get_subdir()"

        * "MaildirMessage.set_subdir()"

        * "MaildirMessage.get_flags()"

        * "MaildirMessage.set_flags()"

        * "MaildirMessage.add_flag()"

        * "MaildirMessage.remove_flag()"

        * "MaildirMessage.get_date()"

        * "MaildirMessage.set_date()"

        * "MaildirMessage.get_info()"

        * "MaildirMessage.set_info()"

    * "mboxMessage"

      * "mboxMessage"

        * "mboxMessage.get_from()"

        * "mboxMessage.set_from()"

        * "mboxMessage.get_flags()"

        * "mboxMessage.set_flags()"

        * "mboxMessage.add_flag()"

        * "mboxMessage.remove_flag()"

    * "MHMessage"

      * "MHMessage"

        * "MHMessage.get_sequences()"

        * "MHMessage.set_sequences()"

        * "MHMessage.add_sequence()"

        * "MHMessage.remove_sequence()"

    * "BabylMessage"

      * "BabylMessage"

        * "BabylMessage.get_labels()"

        * "BabylMessage.set_labels()"

        * "BabylMessage.add_label()"

        * "BabylMessage.remove_label()"

        * "BabylMessage.get_visible()"

        * "BabylMessage.set_visible()"

        * "BabylMessage.update_visible()"

    * "MMDFMessage"

      * "MMDFMessage"

        * "MMDFMessage.get_from()"

        * "MMDFMessage.set_from()"

        * "MMDFMessage.get_flags()"

        * "MMDFMessage.set_flags()"

        * "MMDFMessage.add_flag()"

        * "MMDFMessage.remove_flag()"

  * Exceptions

    * "Error"

    * "NoSuchMailboxError"

    * "NotEmptyError"

    * "ExternalClashError"

    * "FormatError"

  * Examples

* "mimetypes" — Map filenames to MIME types

  * "guess_type()"

  * "guess_all_extensions()"

  * "guess_extension()"

  * "init()"

  * "read_mime_types()"

  * "add_type()"

  * "inited"

  * "knownfiles"

  * "suffix_map"

  * "encodings_map"

  * "types_map"

  * "common_types"

  * MimeTypes Objects

    * "MimeTypes"

      * "MimeTypes.suffix_map"

      * "MimeTypes.encodings_map"

      * "MimeTypes.types_map"

      * "MimeTypes.types_map_inv"

      * "MimeTypes.guess_extension()"

      * "MimeTypes.guess_type()"

      * "MimeTypes.guess_all_extensions()"

      * "MimeTypes.read()"

      * "MimeTypes.readfp()"

      * "MimeTypes.read_windows_registry()"

* "base64" — Base16, Base32, Base64, Base85 Data Encodings

  * "b64encode()"

  * "b64decode()"

  * "standard_b64encode()"

  * "standard_b64decode()"

  * "urlsafe_b64encode()"

  * "urlsafe_b64decode()"

  * "b32encode()"

  * "b32decode()"

  * "b32hexencode()"

  * "b32hexdecode()"

  * "b16encode()"

  * "b16decode()"

  * "a85encode()"

  * "a85decode()"

  * "b85encode()"

  * "b85decode()"

  * "decode()"

  * "decodebytes()"

  * "encode()"

  * "encodebytes()"

  * Security Considerations

* "binascii" — Convert between binary and ASCII

  * "a2b_uu()"

  * "b2a_uu()"

  * "a2b_base64()"

  * "b2a_base64()"

  * "a2b_qp()"

  * "b2a_qp()"

  * "crc_hqx()"

  * "crc32()"

  * "b2a_hex()"

  * "hexlify()"

  * "a2b_hex()"

  * "unhexlify()"

  * "Error"

  * "Incomplete"

* "quopri" — Encode and decode MIME quoted-printable data

  * "decode()"

  * "encode()"

  * "decodestring()"

  * "encodestring()"

vim:tw=78:ts=8:ft=help:norl: