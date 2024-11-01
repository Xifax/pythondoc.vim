*crypto.pyx*                                  Last change: 2023 Sep 15

Cryptographic Services
**********************

The modules described in this chapter implement various algorithms of
a cryptographic nature.  They are available at the discretion of the
installation. Here’s an overview:

* "hashlib" — Secure hashes and message digests

  * Hash algorithms

  * Usage

  * Constructors

    * "new()"

    * "md5()"

    * "sha1()"

    * "sha224()"

    * "sha256()"

    * "sha384()"

    * "sha512()"

    * "sha3_224()"

    * "sha3_256()"

    * "sha3_384()"

    * "sha3_512()"

  * Attributes

    * "algorithms_guaranteed"

    * "algorithms_available"

  * Hash Objects

    * "hash.digest_size"

    * "hash.block_size"

    * "hash.name"

    * "hash.update()"

    * "hash.digest()"

    * "hash.hexdigest()"

    * "hash.copy()"

  * SHAKE variable length digests

    * "shake_128()"

    * "shake_256()"

    * "shake.digest()"

    * "shake.hexdigest()"

  * File hashing

    * "file_digest()"

  * Key derivation

    * "pbkdf2_hmac()"

    * "scrypt()"

  * BLAKE2

    * Creating hash objects

      * "blake2b()"

      * "blake2s()"

    * Constants

      * "blake2b.SALT_SIZE"

      * "blake2s.SALT_SIZE"

      * "blake2b.PERSON_SIZE"

      * "blake2s.PERSON_SIZE"

      * "blake2b.MAX_KEY_SIZE"

      * "blake2s.MAX_KEY_SIZE"

      * "blake2b.MAX_DIGEST_SIZE"

      * "blake2s.MAX_DIGEST_SIZE"

    * Examples

      * Simple hashing

      * Using different digest sizes

      * Keyed hashing

      * Randomized hashing

      * Personalization

      * Tree mode

    * Credits

* "hmac" — Keyed-Hashing for Message Authentication

  * "new()"

  * "digest()"

  * "HMAC.update()"

  * "HMAC.digest()"

  * "HMAC.hexdigest()"

  * "HMAC.copy()"

  * "HMAC.digest_size"

  * "HMAC.block_size"

  * "HMAC.name"

  * "compare_digest()"

* "secrets" — Generate secure random numbers for managing secrets

  * Random numbers

    * "SystemRandom"

    * "choice()"

    * "randbelow()"

    * "randbits()"

  * Generating tokens

    * "token_bytes()"

    * "token_hex()"

    * "token_urlsafe()"

    * How many bytes should tokens use?

  * Other functions

    * "compare_digest()"

  * Recipes and best practices

vim:tw=78:ts=8:ft=help:norl: