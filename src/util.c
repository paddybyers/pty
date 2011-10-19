#ifdef DEBUG_TRACE
void _trace(const char* format, ...) {

	va_list param;

	va_start(param, format);
	fprintf(stderr, "TRACE (%d): ", getpid());
	vfprintf(stderr, format, param);
	fprintf(stderr, "\n");
	va_end(param);
}
#endif /* DEBUG_TRACE */