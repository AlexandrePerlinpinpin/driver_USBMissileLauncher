#
# Makefile - Makefile for USBMissileLauncher
#
# Copyright (C) 2006-2008 Luke Cole
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of version 2 of the GNU General Public
# License as published by the Free Software Foundation
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
# 02111-1307, USA.
# 
#
# @author  Luke Cole
#          luke@coletek.org
#
# @version
#   $Id$
#

LDFLAGS = -lusb

CFLAGS = -c -O2 -Wall

BIN = USBMissileLauncherUtils
OBJS = USBMissileLauncherUtils.o USBMissileLauncher.o InputEvent.o traitement.o action.o initialisation.o

all:	${BIN}

USBMissileLauncherUtils:	${OBJS}
	@echo "CC $@"
	@${CC} -o $@ ${OBJS} ${LDFLAGS}

InputEvent.o: InputEvent.c InputEvent.h
	@echo "CC $@"
	@${CC} ${CFLAGS} InputEvent.c -o $@

USBMissileLauncher.o: USBMissileLauncher.c USBMissileLauncher.h
	@echo "CC $@"
	@${CC} ${CFLAGS} USBMissileLauncher.c -o $@

traitement.o: traitement.c traitement.h
	@echo "CC $@"
	@${CC} ${CFLAGS} traitement.c -o $@
	
action.o: action.c action.h
	@echo "CC $@"
	@${CC} ${CFLAGS} action.c -o $@
	
initialisation.o: initialisation.c initialisation.h
	@echo "CC $@"
	@${CC} ${CFLAGS} initialisation.c -o $@
	
USBMissileLauncherUtils.o: USBMissileLauncherUtils.c
	@echo "CC $@"
	@${CC} ${CFLAGS} USBMissileLauncherUtils.c -o $@

clean:		
	@rm -f core USBMissileLauncherUtils ${OBJS}
