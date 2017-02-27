#!/usr/bin/env python
# ########################################### #
# Send mail
# Credts to https://github.com/adriancmiranda
# ########################################### #

from email.MIMEMultipart import MIMEMultipart
from email.MIMEBase import MIMEBase
from email.MIMEText import MIMEText
from email.utils import COMMASPACE, formatdate
from email import Encoders
import smtplib, os
import time, sys

def send_mail(send_from, send_to, subject, text, files=[], server='localhost', port=80, mail_password=''):
	assert type(send_to)==list;
	assert type(files)==list;
	
	msg = MIMEMultipart();
	msg['From'] = send_from;
	msg['To'] = COMMASPACE.join(send_to);
	msg['Date'] = formatdate(localtime=True);
	msg['Subject'] = subject;
	msg.attach(MIMEText(text));
	
	print('');
	
	for filepath in files:
		if filepath:
			try:
				part = MIMEBase('application', 'octet-stream');
				part.set_payload(open(filepath, 'rb').read());
				
				# setup progressbar
				bytestotal = len(files);
				sys.stdout.write('[%s]' % (' ' * bytestotal));
				sys.stdout.flush();
				sys.stdout.write('\b' * (bytestotal+1)); # return to start of line, after '['
				
				for bytesloaded in xrange(bytestotal):
					Encoders.encode_base64(part);
					part.add_header('Content-Disposition', 'attachment; filename="%s"' % os.path.basename(filepath));
					msg.attach(part);
					
					# update progressbar
					sys.stdout.write('-');
					sys.stdout.flush();
				
				# complete
				sys.stdout.write('] ');
				sys.stdout.write(os.path.basename(filepath));
				sys.stdout.write('\n');
			except:
				print("No such file or directory: '%s'" %filepath);
	
	smtp = smtplib.SMTP(server, port);
	smtp.ehlo();
	smtp.starttls();
	smtp.ehlo();
	smtp.login(send_from, mail_password);
	
	confirm = raw_input('Send (y/n): ');
	if confirm == 'y':
		try:
			smtp.sendmail(send_from, send_to, msg.as_string());
			print('-----------\nEmail sent');
		except:
			print('-------------------\nError sending email');
	else:
		print('\nRelax! Not sent your email!');
	
	smtp.quit();
	
if __name__ == '__main__':
	FROM = raw_input('FROM: ') or 'dummy@mail.com';
	TO = raw_input('TO: ') or 'dummy@mail.com';
	SUBJECT = raw_input('SUBJECT: ') or 'Just a email from Python script';
	MESSAGE = raw_input('MESSAGE: ') or "Success! You're awesome, mate!";
	FILES = raw_input('ATTACH: ');
	SERVER = 'smtp.gmail.com';
	PORT = 587;
	PASSWORD = raw_input('PASSWORD: ');
	send_mail(FROM, TO.strip().split(';'), SUBJECT, MESSAGE, FILES.strip().split(' '), SERVER, PORT, PASSWORD);
