-- @Autor Ramirez Andres Daniela, Sandoval Castro Josmar Leonardo
-- @Fecha 06/12/2023
-- @Descripcion: Creación de la BD

prompt conectando como sys
connect sys/Hola1234* as sysdba

prompt iniciando una instancia en modo nomount
startup nomount

prompt Ejecutar la grandiosa instrucción create database
whenever sqlerror exit rollback

create database rascproy
  user sys identified by systemhouse
  user system identified by systemhouse
  logfile group 1 (
    '/unam-bda/proyecto/d03/app/oracle/oradata/RASCPROY/redo01a.log',
    '/unam-bda/proyecto/d04/app/oracle/oradata/RASCPROY/redo01b.log',
    '/unam-bda/proyecto/d05/app/oracle/oradata/RASCPROY/redo01c.log') size 100m blocksize 512,
  group 2 (
    '/unam-bda/proyecto/d03/app/oracle/oradata/RASCPROY/redo02a.log',
    '/unam-bda/proyecto/d04/app/oracle/oradata/RASCPROY/redo02b.log',
    '/unam-bda/proyecto/d05/app/oracle/oradata/RASCPROY/redo02c.log') size 100m blocksize 512,
  group 3 (
    '/unam-bda/proyecto/d03/app/oracle/oradata/RASCPROY/redo03a.log',
    '/unam-bda/proyecto/d04/app/oracle/oradata/RASCPROY/redo03b.log',
    '/unam-bda/proyecto/d05/app/oracle/oradata/RASCPROY/redo03c.log') size 100m blocksize 512
  maxloghistory 1
  maxlogfiles 16
  maxlogmembers 3
  maxdatafiles 1024
  character set AL32UTF8
  national character set AL16UTF16
  extent management local
  datafile '/unam-bda/proyecto/d00/RASCPROY/system01.dbf' 
    size 700m reuse autoextend on next 10240k maxsize unlimited
  sysaux datafile '/unam-bda/proyecto/d01/RASCPROY/sysaux01.dbf'
    size 550m reuse autoextend on next 10240k maxsize unlimited
  default tablespace users
    datafile '/unam-bda/proyecto/d00/RASCPROY/users01.dbf'
    size 100m reuse autoextend on maxsize unlimited
  default temporary tablespace tempts1
    tempfile '/unam-bda/proyecto/d00/RASCPROY/temp01.dbf'
    size 20m reuse autoextend on next 640k maxsize unlimited
  undo tablespace undotbs1
    datafile '/unam-bda/proyecto/d00/RASCPROY/undotbs01.dbf'
    size 200m reuse autoextend on next 5120k maxsize unlimited;

Prompt Al fin!!  base creada!

Prompt Homologando passwords
alter user sys identified by systemhouse;
alter user system identified by systemhouse;
