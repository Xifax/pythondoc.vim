*numeric.pyx*                                 Last change: 2023 Sep 15

Numeric and Mathematical Modules
********************************

The modules described in this chapter provide numeric and math-related
functions and data types. The "numbers" module defines an abstract
hierarchy of numeric types. The "math" and "cmath" modules contain
various mathematical functions for floating-point and complex numbers.
The "decimal" module supports exact representations of decimal
numbers, using arbitrary precision arithmetic.

The following modules are documented in this chapter:

* "numbers" — Numeric abstract base classes

  * "Number"

  * The numeric tower

    * "Complex"

      * "Complex.real"

      * "Complex.imag"

      * "Complex.conjugate()"

    * "Real"

    * "Rational"

      * "Rational.numerator"

      * "Rational.denominator"

    * "Integral"

  * Notes for type implementors

    * Adding More Numeric ABCs

    * Implementing the arithmetic operations

* "math" — Mathematical functions

  * Number-theoretic and representation functions

    * "ceil()"

    * "comb()"

    * "copysign()"

    * "fabs()"

    * "factorial()"

    * "floor()"

    * "fmod()"

    * "frexp()"

    * "fsum()"

    * "gcd()"

    * "isclose()"

    * "isfinite()"

    * "isinf()"

    * "isnan()"

    * "isqrt()"

    * "lcm()"

    * "ldexp()"

    * "modf()"

    * "nextafter()"

    * "perm()"

    * "prod()"

    * "remainder()"

    * "sumprod()"

    * "trunc()"

    * "ulp()"

  * Power and logarithmic functions

    * "cbrt()"

    * "exp()"

    * "exp2()"

    * "expm1()"

    * "log()"

    * "log1p()"

    * "log2()"

    * "log10()"

    * "pow()"

    * "sqrt()"

  * Trigonometric functions

    * "acos()"

    * "asin()"

    * "atan()"

    * "atan2()"

    * "cos()"

    * "dist()"

    * "hypot()"

    * "sin()"

    * "tan()"

  * Angular conversion

    * "degrees()"

    * "radians()"

  * Hyperbolic functions

    * "acosh()"

    * "asinh()"

    * "atanh()"

    * "cosh()"

    * "sinh()"

    * "tanh()"

  * Special functions

    * "erf()"

    * "erfc()"

    * "gamma()"

    * "lgamma()"

  * Constants

    * "pi"

    * "e"

    * "tau"

    * "inf"

    * "nan"

* "cmath" — Mathematical functions for complex numbers

  * Conversions to and from polar coordinates

    * "phase()"

    * "polar()"

    * "rect()"

  * Power and logarithmic functions

    * "exp()"

    * "log()"

    * "log10()"

    * "sqrt()"

  * Trigonometric functions

    * "acos()"

    * "asin()"

    * "atan()"

    * "cos()"

    * "sin()"

    * "tan()"

  * Hyperbolic functions

    * "acosh()"

    * "asinh()"

    * "atanh()"

    * "cosh()"

    * "sinh()"

    * "tanh()"

  * Classification functions

    * "isfinite()"

    * "isinf()"

    * "isnan()"

    * "isclose()"

  * Constants

    * "pi"

    * "e"

    * "tau"

    * "inf"

    * "infj"

    * "nan"

    * "nanj"

* "decimal" — Decimal fixed point and floating point arithmetic

  * Quick-start Tutorial

  * Decimal objects

    * "Decimal"

      * "Decimal.adjusted()"

      * "Decimal.as_integer_ratio()"

      * "Decimal.as_tuple()"

      * "Decimal.canonical()"

      * "Decimal.compare()"

      * "Decimal.compare_signal()"

      * "Decimal.compare_total()"

      * "Decimal.compare_total_mag()"

      * "Decimal.conjugate()"

      * "Decimal.copy_abs()"

      * "Decimal.copy_negate()"

      * "Decimal.copy_sign()"

      * "Decimal.exp()"

      * "Decimal.from_float()"

      * "Decimal.fma()"

      * "Decimal.is_canonical()"

      * "Decimal.is_finite()"

      * "Decimal.is_infinite()"

      * "Decimal.is_nan()"

      * "Decimal.is_normal()"

      * "Decimal.is_qnan()"

      * "Decimal.is_signed()"

      * "Decimal.is_snan()"

      * "Decimal.is_subnormal()"

      * "Decimal.is_zero()"

      * "Decimal.ln()"

      * "Decimal.log10()"

      * "Decimal.logb()"

      * "Decimal.logical_and()"

      * "Decimal.logical_invert()"

      * "Decimal.logical_or()"

      * "Decimal.logical_xor()"

      * "Decimal.max()"

      * "Decimal.max_mag()"

      * "Decimal.min()"

      * "Decimal.min_mag()"

      * "Decimal.next_minus()"

      * "Decimal.next_plus()"

      * "Decimal.next_toward()"

      * "Decimal.normalize()"

      * "Decimal.number_class()"

      * "Decimal.quantize()"

      * "Decimal.radix()"

      * "Decimal.remainder_near()"

      * "Decimal.rotate()"

      * "Decimal.same_quantum()"

      * "Decimal.scaleb()"

      * "Decimal.shift()"

      * "Decimal.sqrt()"

      * "Decimal.to_eng_string()"

      * "Decimal.to_integral()"

      * "Decimal.to_integral_exact()"

      * "Decimal.to_integral_value()"

    * Logical operands

  * Context objects

    * "getcontext()"

    * "setcontext()"

    * "localcontext()"

    * "BasicContext"

    * "ExtendedContext"

    * "DefaultContext"

    * "Context"

      * "Context.clear_flags()"

      * "Context.clear_traps()"

      * "Context.copy()"

      * "Context.copy_decimal()"

      * "Context.create_decimal()"

      * "Context.create_decimal_from_float()"

      * "Context.Etiny()"

      * "Context.Etop()"

      * "Context.abs()"

      * "Context.add()"

      * "Context.canonical()"

      * "Context.compare()"

      * "Context.compare_signal()"

      * "Context.compare_total()"

      * "Context.compare_total_mag()"

      * "Context.copy_abs()"

      * "Context.copy_negate()"

      * "Context.copy_sign()"

      * "Context.divide()"

      * "Context.divide_int()"

      * "Context.divmod()"

      * "Context.exp()"

      * "Context.fma()"

      * "Context.is_canonical()"

      * "Context.is_finite()"

      * "Context.is_infinite()"

      * "Context.is_nan()"

      * "Context.is_normal()"

      * "Context.is_qnan()"

      * "Context.is_signed()"

      * "Context.is_snan()"

      * "Context.is_subnormal()"

      * "Context.is_zero()"

      * "Context.ln()"

      * "Context.log10()"

      * "Context.logb()"

      * "Context.logical_and()"

      * "Context.logical_invert()"

      * "Context.logical_or()"

      * "Context.logical_xor()"

      * "Context.max()"

      * "Context.max_mag()"

      * "Context.min()"

      * "Context.min_mag()"

      * "Context.minus()"

      * "Context.multiply()"

      * "Context.next_minus()"

      * "Context.next_plus()"

      * "Context.next_toward()"

      * "Context.normalize()"

      * "Context.number_class()"

      * "Context.plus()"

      * "Context.power()"

      * "Context.quantize()"

      * "Context.radix()"

      * "Context.remainder()"

      * "Context.remainder_near()"

      * "Context.rotate()"

      * "Context.same_quantum()"

      * "Context.scaleb()"

      * "Context.shift()"

      * "Context.sqrt()"

      * "Context.subtract()"

      * "Context.to_eng_string()"

      * "Context.to_integral_exact()"

      * "Context.to_sci_string()"

  * Constants

    * "MAX_PREC"

    * "MAX_EMAX"

    * "MIN_EMIN"

    * "MIN_ETINY"

    * "HAVE_THREADS"

    * "HAVE_CONTEXTVAR"

  * Rounding modes

    * "ROUND_CEILING"

    * "ROUND_DOWN"

    * "ROUND_FLOOR"

    * "ROUND_HALF_DOWN"

    * "ROUND_HALF_EVEN"

    * "ROUND_HALF_UP"

    * "ROUND_UP"

    * "ROUND_05UP"

  * Signals

    * "Clamped"

    * "DecimalException"

    * "DivisionByZero"

    * "Inexact"

    * "InvalidOperation"

    * "Overflow"

    * "Rounded"

    * "Subnormal"

    * "Underflow"

    * "FloatOperation"

  * Floating Point Notes

    * Mitigating round-off error with increased precision

    * Special values

  * Working with threads

  * Recipes

  * Decimal FAQ

* "fractions" — Rational numbers

  * "Fraction"

    * "Fraction.numerator"

    * "Fraction.denominator"

    * "Fraction.as_integer_ratio()"

    * "Fraction.is_integer()"

    * "Fraction.from_float()"

    * "Fraction.from_decimal()"

    * "Fraction.limit_denominator()"

    * "Fraction.__floor__()"

    * "Fraction.__ceil__()"

    * "Fraction.__round__()"

    * "Fraction.__format__()"

* "random" — Generate pseudo-random numbers

  * Bookkeeping functions

    * "seed()"

    * "getstate()"

    * "setstate()"

  * Functions for bytes

    * "randbytes()"

  * Functions for integers

    * "randrange()"

    * "randint()"

    * "getrandbits()"

  * Functions for sequences

    * "choice()"

    * "choices()"

    * "shuffle()"

    * "sample()"

  * Discrete distributions

    * "binomialvariate()"

  * Real-valued distributions

    * "random()"

    * "uniform()"

    * "triangular()"

    * "betavariate()"

    * "expovariate()"

    * "gammavariate()"

    * "gauss()"

    * "lognormvariate()"

    * "normalvariate()"

    * "vonmisesvariate()"

    * "paretovariate()"

    * "weibullvariate()"

  * Alternative Generator

    * "Random"

    * "SystemRandom"

  * Notes on Reproducibility

  * Examples

  * Recipes

* "statistics" — Mathematical statistics functions

  * Averages and measures of central location

  * Measures of spread

  * Statistics for relations between two inputs

  * Function details

    * "mean()"

    * "fmean()"

    * "geometric_mean()"

    * "harmonic_mean()"

    * "median()"

    * "median_low()"

    * "median_high()"

    * "median_grouped()"

    * "mode()"

    * "multimode()"

    * "pstdev()"

    * "pvariance()"

    * "stdev()"

    * "variance()"

    * "quantiles()"

    * "covariance()"

    * "correlation()"

    * "linear_regression()"

  * Exceptions

    * "StatisticsError"

  * "NormalDist" objects

    * "NormalDist"

      * "NormalDist.mean"

      * "NormalDist.median"

      * "NormalDist.mode"

      * "NormalDist.stdev"

      * "NormalDist.variance"

      * "NormalDist.from_samples()"

      * "NormalDist.samples()"

      * "NormalDist.pdf()"

      * "NormalDist.cdf()"

      * "NormalDist.inv_cdf()"

      * "NormalDist.overlap()"

      * "NormalDist.quantiles()"

      * "NormalDist.zscore()"

    * "NormalDist" Examples and Recipes

      * Classic probability problems

      * Monte Carlo inputs for simulations

      * Approximating binomial distributions

      * Naive bayesian classifier

      * Kernel density estimation

vim:tw=78:ts=8:ft=help:norl: