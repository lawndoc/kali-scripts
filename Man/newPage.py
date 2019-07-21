#!/usr/bin/env python3

import datetime

DATE = datetime.datetime.now().strftime("%d %B %Y")

NAME = ""
USAGE = [NAME]
SHORT_DESC = ""
LONG_DESC = ""
OPTIONS = []
SEE_ALSO = []
BUGS = "No known bugs."
AUTHOR = "C.J. May"
EMAIL = "doctormay6@gmail.com"

genUsage(usage):
    return ""

genOptions(options):
    return ""

genSeeAlso(seeAlso):
    return ""

manpage = """.\\" Manpage for """ + NAME + "\n"
manpage += """.\\" Contact """ + EMAIL + " to correct errors or typos.\n"
manpage += ".TH man 1 " + '"' + DATE + '"' + """ "1.0" """ + '"' + NAME + '"' + """ man page"\n"""
manpage += ".SH NAME\n"
manpage += NAME + " \- " + SHORT_DESC + "\n"
manpage += ".SH SYNOPSIS\n"
manpage += genUsage(USAGE) + "\n"
manpage += ".SH DESCRIPTION\n"
manpage += LONG_DESC + "\n"
manpage += ".SH OPTIONS\n"
manpage += genOptions(OPTIONS) + "\n"
manpage += ".SH SEE ALSO\n"
manpage += genSeeAlso(SEE_ALSO) + "\n"
manpage += ".SH BUGS\n"
manpage += BUGS + "\n"
manpage += ".SH AUTHOR\n"
manpage += AUTHOR + " (" + EMAIL + ")"
