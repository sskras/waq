@echo off
title WOA

SET QEMU_CMD=
FOR /F "Delims=" %%x IN (qemu.cmd) DO CALL SET "QEMU_CMD=%%QEMU_CMD%% %%x"
CALL %QEMU_CMD%
