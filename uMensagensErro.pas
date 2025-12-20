unit uMensagensErro;

interface
const
    ErrorCount = 675;

const
    ERROR_INVALID_FUNCTION = 1;                      // Incorrect function.
    ERROR_FILE_NOT_FOUND = 2;                        // The system cannot find the file specified.
    ERROR_PATH_NOT_FOUND = 3;                        // The system cannot find the path specified.
    ERROR_TOO_MANY_OPEN_FILES = 4;                   // The system cannot open the file.
    ERROR_INVALID_HANDLE = 6;                        // The handle is invalid.
    ERROR_ARENA_TRASHED = 7;                         // The storage control blocks were destroyed.
    ERROR_NOT_ENOUGH_MEMORY = 8;                     // Not enough storage is available to process this command.
    ERROR_INVALID_BLOCK = 9;                         // The storage control block address is invalid.
    ERROR_BAD_ENVIRONMENT = 10;                      // The environment is incorrect.
    ERROR_BAD_FORMAT = 11;                           // An attempt was made to load a program with an incorrect format.
    ERROR_INVALID_ACCESS = 12;                       // The access code is invalid.
    ERROR_INVALID_DATA = 13;                         // The data is invalid.
    ERROR_OUTOFMEMORY = 14;                          // Not enough storage is available to complete this operation.
    ERROR_INVALID_DRIVE = 15;                        // The system cannot find the drive specified.
    ERROR_CURRENT_DIRECTORY = 16;                    // The directory cannot be removed.
    ERROR_NOT_SAME_DEVICE = 17;                      // The system cannot move the file to a different disk drive.
    ERROR_NO_MORE_FILES = 18;                        // There are no more files.
    ERROR_WRITE_PROTECT = 19;                        // The media is write protected.
    ERROR_BAD_UNIT = 20;                             // The system cannot find the device specified.
    ERROR_NOT_READY = 21;                            // The device is not ready.
    ERROR_BAD_COMMAND = 22;                          // The device does not recognize the command.
    ERROR_CRC = 23;                                  // Data error (cyclic redundancy check)
    ERROR_BAD_LENGTH = 24;                           // The program issued a command but the command length is incorrect.
    ERROR_SEEK = 25;                                 // The drive cannot locate a specific area or track on the disk.
    ERROR_NOT_DOS_DISK = 26;                         // The specified disk or diskette cannot be accessed.
    ERROR_SECTOR_NOT_FOUND = 27;                     // The drive cannot find the sector requested.
    ERROR_OUT_OF_PAPER = 28;                         // The printer is out of paper.
    ERROR_WRITE_FAULT = 29;                          // The system cannot write to the specified device.
    ERROR_READ_FAULT = 30;                           // The system cannot read from the specified device.
    ERROR_GEN_FAILURE = 31;                          // A device attached to the system is not functioning.
    ERROR_SHARING_VIOLATION = 32;                    // The process cannot access the file because it is being used by another process.

    ERROR_LOCK_VIOLATION = 33;                       // The process cannot access the file because another process has locked a portion of the file.
    ERROR_WRONG_DISK = 34;                           // The wrong diskette is in the drive. Insert %2 (Volume Serial Number: %3) into drive %1.
    ERROR_SHARING_BUFFER_EXCEEDED = 36;              // Too many files opened for sharing.
    ERROR_HANDLE_EOF = 38;                           // Reached end of file.
    ERROR_HANDLE_DISK_FULL = 39;                     // The disk is full.
    ERROR_NOT_SUPPORTED = 50;                        // The network request is not supported.
    ERROR_REM_NOT_LIST = 51;                         // The remote computer is not available.
    ERROR_DUP_NAME = 52;                             // A duplicate name exists on the network.
    ERROR_BAD_NETPATH = 53;                          // The network path was not found.
    ERROR_NETWORK_BUSY = 54;                         // The network is busy.
    ERROR_DEV_NOT_EXIST = 55;                        // The specified network resource or device is no longer available.
    ERROR_TOO_MANY_CMDS = 56;                        // The network BIOS command limit has been reached.
    ERROR_ADAP_HDW_ERR = 57;                         // A network adapter hardware error occurred.
    ERROR_BAD_NET_RESP = 58;                         // The specified server cannot perform the requested operation.
    ERROR_UNEXP_NET_ERR = 59;                        // An unexpected network error occurred.
    ERROR_BAD_REM_ADAP = 60;                         // The remote adapter is not compatible.
    ERROR_PRINTQ_FULL = 61;                          // The printer queue is full.
    ERROR_NO_SPOOL_SPACE = 62;                       // Space to store the file waiting to be printed is not available on the server.
    ERROR_PRINT_CANCELLED = 63;                      // Your file waiting to be printed was deleted.
    ERROR_NETNAME_DELETED = 64;                      // The specified network name is no longer available.
    ERROR_NETWORK_ACCESS_DENIED = 65;                // Network access is denied.
    ERROR_BAD_DEV_TYPE = 66;                         // The network resource type is not correct.
    ERROR_BAD_NET_NAME = 67;                         // The network name cannot be found.
    ERROR_TOO_MANY_NAMES = 68;                       // The name limit for the local computer network adapter card was exceeded.
    ERROR_TOO_MANY_SESS = 69;                        // The network BIOS session limit was exceeded.
    ERROR_SHARING_PAUSED = 70;                       // The remote server has been paused or is in the process of being started.
    ERROR_REQ_NOT_ACCEP = 71;                        // No more connections can be made to this remote computer at this time because there are already as many connections as the computer can accept.
    ERROR_REDIR_PAUSED = 72;                         // The specified printer or disk device has been paused.
    ERROR_FILE_EXISTS = 80;                          // The file exists.
    ERROR_CANNOT_MAKE = 82;                          // The directory or file cannot be created.
    ERROR_FAIL_I24 = 83;                             // Fail on INT 24
    ERROR_OUT_OF_STRUCTURES = 84;                    // Storage to process this request is not available.
    ERROR_ALREADY_ASSIGNED = 85;                     // The local device name is already in use.
    ERROR_INVALID_PASSWORD = 86;                     // The specified network password is not correct.
    ERROR_INVALID_PARAMETER = 87;                    // The parameter is incorrect.
    ERROR_NET_WRITE_FAULT = 88;                      // A write fault occurred on the network.
    ERROR_NO_PROC_SLOTS = 89;                        // The system cannot start another process at this time.
    ERROR_TOO_MANY_SEMAPHORES = 100;                 // Cannot create another system semaphore.
    ERROR_EXCL_SEM_ALREADY_OWNED = 101;              // The exclusive semaphore is owned by another process.
    ERROR_SEM_IS_SET = 102;                          // The semaphore is set and cannot be closed.
    ERROR_TOO_MANY_SEM_REQUESTS = 103;               // The semaphore cannot be set again.
    ERROR_INVALID_AT_INTERRUPT_TIME = 104;           // Cannot request exclusive semaphores at interrupt time.
    ERROR_SEM_OWNER_DIED = 105;                      // The previous ownership of this semaphore has ended.
    ERROR_SEM_USER_LIMIT = 106;                      // Insert the diskette for drive %1.
    ERROR_DISK_CHANGE = 107;                         // Program stopped because alternate diskette was not inserted.
    ERROR_DRIVE_LOCKED = 108;                        // The disk is in use or locked by another process.
    ERROR_BROKEN_PIPE = 109;                         // The pipe has been ended.
    ERROR_OPEN_FAILED = 110;                         // The system cannot open the device or file specified.
    ERROR_BUFFER_OVERFLOW = 111;                     // The file name is too long.
    ERROR_DISK_FULL = 112;                           // There is not enough space on the disk.
    ERROR_NO_MORE_SEARCH_HANDLES = 113;              // No more internal file identifiers available.
    ERROR_INVALID_TARGET_HANDLE = 114;               // The target internal file identifier is incorrect.
    ERROR_INVALID_CATEGORY = 117;                    // The IOCTL call made by the application program is not correct.
    ERROR_INVALID_VERIFY_SWITCH = 118;               // The verify-on-write switch parameter value is not correct.
    ERROR_BAD_DRIVER_LEVEL = 119;                    // The system does not support the command requested.
    ERROR_CALL_NOT_IMPLEMENTED = 120;                // This function is only valid in Windows NT mode.
    ERROR_SEM_TIMEOUT = 121;                         // The semaphore timeout period has expired.
    ERROR_INSUFFICIENT_BUFFER = 122;                 // The data area passed to a system call is too small.
    ERROR_INVALID_NAME = 123;                        // The filename, directory name, or volume label syntax is incorrect.
    ERROR_INVALID_LEVEL = 124;                       // The system call level is not correct.
    ERROR_NO_VOLUME_LABEL = 125;                     // The disk has no volume label.
    ERROR_MOD_NOT_FOUND = 126;                       // The specified module could not be found.
    ERROR_PROC_NOT_FOUND = 127;                      // The specified procedure could not be found.
    ERROR_WAIT_NO_CHILDREN = 128;                    // There are no child processes to wait for.
    ERROR_CHILD_NOT_COMPLETE = 129;                  // The %1 application cannot be run in Windows NT mode.
    ERROR_DIRECT_ACCESS_HANDLE = 130;                // Attempt to use a file handle to an open disk partition for an operation other than raw disk I/O.
    ERROR_NEGATIVE_SEEK = 131;                       // An attempt was made to move the file pointer before the beginning of the file.
    ERROR_SEEK_ON_DEVICE = 132;                      // The file pointer cannot be set on the specified device or file.
    ERROR_IS_JOIN_TARGET = 133;                      // A JOIN or SUBST command cannot be used for a drive that contains previously joined drives.
    ERROR_IS_JOINED = 134;                           // An attempt was made to use a JOIN or SUBST command on a drive that has already been joined.
    ERROR_IS_SUBSTED = 135;                          // An attempt was made to use a JOIN or SUBST command on a drive that has already been substituted.
    ERROR_NOT_JOINED = 136;                          // The system tried to delete the JOIN of a drive that is not joined.
    ERROR_NOT_SUBSTED = 137;                         // The system tried to delete the substitution of a drive that is not substituted.
    ERROR_JOIN_TO_JOIN = 138;                        // The system tried to join a drive to a directory on a joined drive.
    ERROR_SUBST_TO_SUBST = 139;                      // The system tried to substitute a drive to a directory on a substituted drive.
    ERROR_JOIN_TO_SUBST = 140;                       // The system tried to join a drive to a directory on a substituted drive.
    ERROR_SUBST_TO_JOIN = 141;                       // The system tried to SUBST a drive to a directory on a joined drive.
    ERROR_BUSY_DRIVE = 142;                          // The system cannot perform a JOIN or SUBST at this time.
    ERROR_SAME_DRIVE = 143;                          // The system cannot join or substitute a drive to or for a directory on the same drive.
    ERROR_DIR_NOT_ROOT = 144;                        // The directory is not a subdirectory of the root directory.
    ERROR_DIR_NOT_EMPTY = 145;                       // The directory is not empty.
    ERROR_IS_SUBST_PATH = 146;                       // The path specified is being used in a substitute.
    ERROR_IS_JOIN_PATH = 147;                        // Not enough resources are available to process this command.
    ERROR_PATH_BUSY = 148;                           // The path specified cannot be used at this time.
    ERROR_IS_SUBST_TARGET = 149;                     // An attempt was made to join or substitute a drive for which a directory on the drive is the target of a previous substitute.
    ERROR_SYSTEM_TRACE = 150;                        // System trace information was not specified in your CONFIG.SYS file, or tracing is disallowed.
    ERROR_INVALID_EVENT_COUNT = 151;                 // The number of specified semaphore events for DosMuxSemWait is not correct.
    ERROR_TOO_MANY_MUXWAITERS = 152;                 // DosMuxSemWait did not execute; too many semaphores are already set.
    ERROR_INVALID_LIST_FORMAT = 153;                 // The DosMuxSemWait list is not correct.
    ERROR_LABEL_TOO_LONG = 154;                      // The volume label you entered exceeds the label character limit of the target file system.
    ERROR_TOO_MANY_TCBS = 155;                       // Cannot create another thread.
    ERROR_SIGNAL_REFUSED = 156;                      // The recipient process has refused the signal.
    ERROR_DISCARDED = 157;                           // The segment is already discarded and cannot be locked.
    ERROR_NOT_LOCKED = 158;                          // The segment is already unlocked.
    ERROR_BAD_THREADID_ADDR = 159;                   // The address for the thread ID is not correct.
    ERROR_BAD_ARGUMENTS = 160;                       // The argument string passed to DosExecPgm is not correct.
    ERROR_BAD_PATHNAME = 161;                        // The specified path is invalid.
    ERROR_SIGNAL_PENDING = 162;                      // A signal is already pending.
    ERROR_MAX_THRDS_REACHED = 164;                   // No more threads can be created in the system.
    ERROR_LOCK_FAILED = 167;                         // Unable to lock a region of a file.
    ERROR_BUSY = 170;                                // The requested resource is in use.
    ERROR_CANCEL_VIOLATION = 173;                    // A lock request was not outstanding for the supplied cancel region.
    ERROR_ATOMIC_LOCKS_NOT_SUPPORTED = 174;          // The file system does not support atomic changes to the lock type.
    ERROR_INVALID_SEGMENT_NUMBER = 180;              // The system detected a segment number that was not correct.
    ERROR_INVALID_ORDINAL = 182;                     // The operating system cannot run %1.
    ERROR_ALREADY_EXISTS = 183;                      // Cannot create a file when that file already exists.
    ERROR_INVALID_FLAG_NUMBER = 186;                 // The flag passed is not correct.
    ERROR_SEM_NOT_FOUND = 187;                       // The specified system semaphore name was not found.
    ERROR_INVALID_STARTING_CODESEG = 188;            // The operating system cannot run %1.
    ERROR_INVALID_STACKSEG = 189;                    // The operating system cannot run %1.
    ERROR_INVALID_MODULETYPE = 190;                  // The operating system cannot run %1.
    ERROR_INVALID_EXE_SIGNATURE = 191;               // Cannot run %1 in Windows NT mode.
    ERROR_EXE_MARKED_INVALID = 192;                  // The operating system cannot run %1.
    ERROR_BAD_EXE_FORMAT = 193;                      // %1 is not a valid Windows NT application.
    ERROR_ITERATED_DATA_EXCEEDS_64k = 194;           // The operating system cannot run %1.
    ERROR_INVALID_MINALLOCSIZE = 195;                // The operating system cannot run %1.
    ERROR_DYNLINK_FROM_INVALID_RING = 196;           // The operating system cannot run this application program.
    ERROR_IOPL_NOT_ENABLED = 197;                    // The operating system is not presently configured to run this application.
    ERROR_INVALID_SEGDPL = 198;                      // The operating system cannot run %1.
    ERROR_AUTODATASEG_EXCEEDS_64k = 199;             // The operating system cannot run this application program.
    ERROR_RING2SEG_MUST_BE_MOVABLE = 200;            // The code segment cannot be greater than or equal to 64KB.
    ERROR_RELOC_CHAIN_XEEDS_SEGLIM = 201;            // The operating system cannot run %1.
    ERROR_INFLOOP_IN_RELOC_CHAIN = 202;              // The operating system cannot run %1.
    ERROR_ENVVAR_NOT_FOUND = 203;                    // The system could not find the environment option that was entered.
    ERROR_NO_SIGNAL_SENT = 205;                      // No process in the command subtree has a signal handler.
    ERROR_FILENAME_EXCED_RANGE = 206;                // The filename or extension is too long.
    ERROR_RING2_STACK_IN_USE = 207;                  // The ring 2 stack is in use.
    ERROR_META_EXPANSION_TOO_LONG = 208;             // The global filename characters, * or ?, are entered incorrectly or too many global filename characters are specified.
    ERROR_INVALID_SIGNAL_NUMBER = 209;               // The signal being posted is not correct.
    ERROR_THREAD_1_INACTIVE = 210;                   // The signal handler cannot be set.
    ERROR_LOCKED = 212;                              // The segment is locked and cannot be reallocated.
    ERROR_TOO_MANY_MODULES = 214;                    // Too many dynamic link modules are attached to this program or dynamic link module.
    ERROR_NESTING_NOT_ALLOWED = 215;                 // Can't nest calls to LoadModule.
    ERROR_EXE_MACHINE_TYPE_MISMATCH = 216;           // The image file %1 is valid, but is for a machine type other than the current machine.
    ERROR_BAD_PIPE = 230;                            // The pipe state is invalid.
    ERROR_PIPE_BUSY = 231;                           // All pipe instances are busy.
    ERROR_NO_DATA = 232;                             // The pipe is being closed.
    ERROR_PIPE_NOT_CONNECTED = 233;                  // No process is on the other end of the pipe.
    ERROR_MORE_DATA = 234;                           // More data is available.
    ERROR_VC_DISCONNECTED = 240;                     // The session was cancelled.
    ERROR_INVALID_EA_NAME = 254;                     // The specified extended attribute name was invalid.
    ERROR_EA_LIST_INCONSISTENT = 255;                // The extended attributes are inconsistent.
    ERROR_NO_MORE_ITEMS = 259;                       // No more data is available.
    ERROR_CANNOT_COPY = 266;                         // The Copy API cannot be used.
    ERROR_DIRECTORY = 267;                           // The directory name is invalid.
    ERROR_EAS_DIDNT_FIT = 275;                       // The extended attributes did not fit in the buffer.
    ERROR_EA_FILE_CORRUPT = 276;                     // The extended attribute file on the mounted file system is corrupt.
    ERROR_EA_TABLE_FULL = 277;                       // The extended attribute table file is full.
    ERROR_INVALID_EA_HANDLE = 278;                   // The specified extended attribute handle is invalid.
    ERROR_EAS_NOT_SUPPORTED = 282;                   // The mounted file system does not support extended attributes.
    ERROR_NOT_OWNER = 288;                           // Attempt to release mutex not owned by caller.
    ERROR_TOO_MANY_POSTS = 298;                      // Too many posts were made to a semaphore.
    ERROR_PARTIAL_COPY = 299;                        // Only part of a Read/WriteProcessMemory request was completed.
    ERROR_MR_MID_NOT_FOUND = 317;                    // The system cannot find message for message number 0x%1 in message file for %2.
    ERROR_INVALID_ADDRESS = 487;                     // Attempt to access invalid address.
    ERROR_ARITHMETIC_OVERFLOW = 534;                 // Arithmetic result exceeded 32 bits.
    ERROR_PIPE_CONNECTED = 535;                      // There is a process on other end of the pipe.
    ERROR_PIPE_LISTENING = 536;                      // Waiting for a process to open the other end of the pipe.
    ERROR_EA_ACCESS_DENIED = 994;                    // Access to the extended attribute was denied.
    ERROR_OPERATION_ABORTED = 995;                   // The I/O operation has been aborted because of either a thread exit or an application request.
    ERROR_IO_INCOMPLETE = 996;                       // Overlapped I/O event is not in a signalled state.
    ERROR_IO_PENDING = 997;                          // Overlapped I/O operation is in progress.
    ERROR_NOACCESS = 998;                            // Invalid access to memory location.
    ERROR_SWAPERROR = 999;                           // Error performing inpage operation.
    ERROR_STACK_OVERFLOW = 1001;                     // Recursion too deep, stack overflowed.
    ERROR_INVALID_MESSAGE = 1002;                    // The window cannot act on the sent message.
    ERROR_CAN_NOT_COMPLETE = 1003;                   // Cannot complete this function.
    ERROR_INVALID_FLAGS = 1004;                      // Invalid flags.
    ERROR_UNRECOGNIZED_VOLUME = 1005;                // The volume does not contain a recognized file system. Please make sure that all required file system drivers are loaded and that the volume is not corrupt.
    ERROR_FILE_INVALID = 1006;                       // The volume for a file has been externally altered such that the opened file is no longer valid.
    ERROR_FULLSCREEN_MODE = 1007;                    // The requested operation cannot be performed in full-screen mode.
    ERROR_NO_TOKEN = 1008;                           // An attempt was made to reference a token that does not exist.
    ERROR_BADDB = 1009;                              // The configuration registry database is corrupt.
    ERROR_BADKEY = 1010;                             // The configuration registry key is invalid.
    ERROR_CANTOPEN = 1011;                           // The configuration registry key could not be opened.
    ERROR_CANTREAD = 1012;                           // The configuration registry key could not be read.
    ERROR_CANTWRITE = 1013;                          // The configuration registry key could not be written.
    ERROR_REGISTRY_RECOVERED = 1014;                 // One of the files in the Registry database had to be recovered by use of a log or alternate copy. The recovery was successful.
    ERROR_REGISTRY_CORRUPT = 1015;                   // The Registry is corrupt. The structure of one of the files that contains Registry data is corrupt, or the system's image of the file in memory is corrupt, or the file could not be recovered because the alternate copy or log was absent or corrupt.
    ERROR_REGISTRY_IO_FAILED = 1016;                 // An I/O operation initiated by the Registry failed unrecoverably. The Registry could not read in, or write out, or flush, one of the files that contain the system's image of the Registry.
    ERROR_NOT_REGISTRY_FILE = 1017;                  // The system has attempted to load or restore a file into the Registry, but the specified file is not in a Registry file format.
    ERROR_KEY_DELETED = 1018;                        // Illegal operation attempted on a Registry key which has been marked for deletion.
    ERROR_NO_LOG_SPACE = 1019;                       // System could not allocate the required space in a Registry log.
    ERROR_KEY_HAS_CHILDREN = 1020;                   // Cannot create a symbolic link in a Registry key that already has subkeys or values.
    ERROR_CHILD_MUST_BE_VOLATILE = 1021;             // Cannot create a stable subkey under a volatile parent key.
    ERROR_NOTIFY_ENUM_DIR = 1022;                    // A notify change request is being completed and the information is not being returned in the caller's buffer. The caller now needs to enumerate the files to find the changes.
    ERROR_DEPENDENT_SERVICES_RUNNING = 1051;         // A stop control has been sent to a service which other running services are dependent on.
    ERROR_INVALID_SERVICE_CONTROL = 1052;            // The requested control is not valid for this service
    ERROR_SERVICE_REQUEST_TIMEOUT = 1053;            // The service did not respond to the start or control request in a timely fashion.
    ERROR_SERVICE_NO_THREAD = 1054;                  // A thread could not be created for the service.
    ERROR_SERVICE_DATABASE_LOCKED = 1055;            // The service database is locked.
    ERROR_SERVICE_ALREADY_RUNNING = 1056;            // An instance of the service is already running.
    ERROR_INVALID_SERVICE_ACCOUNT = 1057;            // The account name is invalid or does not exist.
    ERROR_SERVICE_DISABLED = 1058;                   // The specified service is disabled and cannot be started.
    ERROR_CIRCULAR_DEPENDENCY = 1059;                // Circular service dependency was specified.
    ERROR_SERVICE_DOES_NOT_EXIST = 1060;             // The specified service does not exist as an installed service.
    ERROR_SERVICE_CANNOT_ACCEPT_CTRL = 1061;         // The service cannot accept control messages at this time.
    ERROR_SERVICE_NOT_ACTIVE = 1062;                 // The service has not been started.
    ERROR_FAILED_SERVICE_CONTROLLER_CONNECT = 1063;  // The service process could not connect to the service controller.
    ERROR_EXCEPTION_IN_SERVICE = 1064;               // An exception occurred in the service when handling the control request.
    ERROR_DATABASE_DOES_NOT_EXIST = 1065;            // The database specified does not exist.
    ERROR_SERVICE_SPECIFIC_ERROR = 1066;             // The service has returned a service-specific error code.
    ERROR_PROCESS_ABORTED = 1067;                    // The process terminated unexpectedly.
    ERROR_SERVICE_DEPENDENCY_FAIL = 1068;            // The dependency service or group failed to start.
    ERROR_SERVICE_LOGON_FAILED = 1069;               // The service did not start due to a logon failure.
    ERROR_SERVICE_START_HANG = 1070;                 // After starting, the service hung in a start-pending state.
    ERROR_INVALID_SERVICE_LOCK = 1071;               // The specified service database lock is invalid.
    ERROR_SERVICE_MARKED_FOR_DELETE = 1072;          // The specified service has been marked for deletion.
    ERROR_SERVICE_EXISTS = 1073;                     // The specified service already exists.
    ERROR_ALREADY_RUNNING_LKG = 1074;                // The system is currently running with the last-known-good configuration.
    ERROR_SERVICE_DEPENDENCY_DELETED = 1075;         // The dependency service does not exist or has been marked for deletion.
    ERROR_BOOT_ALREADY_ACCEPTED = 1076;              // The current boot has already been accepted for use as the last-known-good control set.
    ERROR_SERVICE_NEVER_STARTED = 1077;              // No attempts to start the service have been made since the last boot.
    ERROR_DUPLICATE_SERVICE_NAME = 1078;             // The name is already in use as either a service name or a service display name.
    ERROR_DIFFERENT_SERVICE_ACCOUNT = 1079;          // The account specified for this service is different from the account specified for other services running in the same process.
    ERROR_END_OF_MEDIA = 1100;                       // The physical end of the tape has been reached.
    ERROR_FILEMARK_DETECTED = 1101;                  // A tape access reached a filemark.
    ERROR_BEGINNING_OF_MEDIA = 1102;                 // Beginning of tape or partition was encountered.
    ERROR_SETMARK_DETECTED = 1103;                   // A tape access reached the end of a set of files.
    ERROR_NO_DATA_DETECTED = 1104;                   // No more data is on the tape.
    ERROR_PARTITION_FAILURE = 1105;                  // Tape could not be partitioned.
    ERROR_INVALID_BLOCK_LENGTH = 1106;               // When accessing a new tape of a multivolume partition, the current blocksize is incorrect.
    ERROR_DEVICE_NOT_PARTITIONED = 1107;             // Tape partition information could not be found when loading a tape.
    ERROR_UNABLE_TO_LOCK_MEDIA = 1108;               // Unable to lock the media eject mechanism.
    ERROR_UNABLE_TO_UNLOAD_MEDIA = 1109;             // Unable to unload the media.
    ERROR_MEDIA_CHANGED = 1110;                      // Media in drive may have changed.
    ERROR_BUS_RESET = 1111;                          // The I/O bus was reset.
    ERROR_NO_MEDIA_IN_DRIVE = 1112;                  // No media in drive.
    ERROR_NO_UNICODE_TRANSLATION = 1113;             // No mapping for the Unicode character exists in the target multi-byte code page.
    ERROR_DLL_INIT_FAILED = 1114;                    // A dynamic link library (DLL) initialization routine failed.
    ERROR_SHUTDOWN_IN_PROGRESS = 1115;               // A system shutdown is in progress.
    ERROR_NO_SHUTDOWN_IN_PROGRESS = 1116;            // Unable to abort the system shutdown because no shutdown was in progress.
    ERROR_IO_DEVICE = 1117;                          // The request could not be performed because of an I/O device error.
    ERROR_SERIAL_NO_DEVICE = 1118;                   // No serial device was successfully initialized. The serial driver will unload.
    ERROR_IRQ_BUSY = 1119;                           // Unable to open a device that was sharing an interrupt request (IRQ) with other devices. At least one other device that uses that IRQ was already opened.
    ERROR_MORE_WRITES = 1120;                        // A serial I/O operation was completed by another write to the serial port. (The IOCTL_SERIAL_XOFF_COUNTER reached zero.)
    ERROR_COUNTER_TIMEOUT = 1121;                    // A serial I/O operation completed because the time-out period expired. (The IOCTL_SERIAL_XOFF_COUNTER did not reach zero.)
    ERROR_FLOPPY_ID_MARK_NOT_FOUND = 1122;           // No ID address mark was found on the floppy disk.
    ERROR_FLOPPY_WRONG_CYLINDER = 1123;              // Mismatch between the floppy disk sector ID field and the floppy disk controller track address.
    ERROR_FLOPPY_UNKNOWN_ERROR = 1124;               // The floppy disk controller reported an error that is not recognized by the floppy disk driver.
    ERROR_FLOPPY_BAD_REGISTERS = 1125;               // The floppy disk controller returned inconsistent results in its registers.
    ERROR_DISK_RECALIBRATE_FAILED = 1126;            // While accessing the hard disk, a recalibrate operation failed, even after retries.
    ERROR_DISK_OPERATION_FAILED = 1127;              // While accessing the hard disk, a disk operation failed even after retries.
    ERROR_DISK_RESET_FAILED = 1128;                  // While accessing the hard disk, a disk controller reset was needed, but even that failed.
    ERROR_EOM_OVERFLOW = 1129;                       // Physical end of tape encountered.
    ERROR_NOT_ENOUGH_SERVER_MEMORY = 1130;           // Not enough server storage is available to process this command.
    ERROR_POSSIBLE_DEADLOCK = 1131;                  // A potential deadlock condition has been detected.
    ERROR_MAPPED_ALIGNMENT = 1132;                   // The base address or the file offset specified does not have the proper alignment.
    ERROR_SET_POWER_STATE_VETOED = 1140;             // An attempt to change the system power state was vetoed by another application or driver.
    ERROR_SET_POWER_STATE_FAILED = 1141;             // The system BIOS failed an attempt to change the system power state.
    ERROR_TOO_MANY_LINKS = 1142;                     // An attempt was made to create more links on a file than the file system supports.
    ERROR_OLD_WIN_VERSION = 1150;                    // The specified program requires a newer version of Windows.
    ERROR_APP_WRONG_OS = 1151;                       // The specified program is not a Windows or MS-DOS program.
    ERROR_SINGLE_INSTANCE_APP = 1152;                // Cannot start more than one instance of the specified program.
    ERROR_RMODE_APP = 1153;                          // The specified program was written for an older version of Windows.
    ERROR_INVALID_DLL = 1154;                        // One of the library files needed to run this application is damaged.
    ERROR_NO_ASSOCIATION = 1155;                     // No application is associated with the specified file for this operation.
    ERROR_DDE_FAIL = 1156;                           // An error occurred in sending the command to the application.
    ERROR_DLL_NOT_FOUND = 1157;                      // One of the library files needed to run this application cannot be found.
    ERROR_BAD_USERNAME = 2202;                       // The specified username is invalid.
    ERROR_NOT_CONNECTED = 2250;                      // This network connection does not exist.
    ERROR_OPEN_FILES = 2401;                         // This network connection has files open or requests pending.
    ERROR_ACTIVE_CONNECTIONS = 2402;                 // Active connections still exist.
    ERROR_DEVICE_IN_USE = 2404;                      // The device is in use by an active process and cannot be disconnected.
    ERROR_BAD_DEVICE = 1200;                         // The specified device name is invalid.
    ERROR_CONNECTION_UNAVAIL = 1201;                 // The device is not currently connected but it is a remembered connection.
    ERROR_DEVICE_ALREADY_REMEMBERED = 1202;          // An attempt was made to remember a device that had previously been remembered.
    ERROR_NO_NET_OR_BAD_PATH = 1203;                 // No network provider accepted the given network path.
    ERROR_BAD_PROVIDER = 1204;                       // The specified network provider name is invalid.
    ERROR_CANNOT_OPEN_PROFILE = 1205;                // Unable to open the network connection profile.
    ERROR_BAD_PROFILE = 1206;                        // The network connection profile is corrupt.
    ERROR_NOT_CONTAINER = 1207;                      // Cannot enumerate a non-container.
    ERROR_EXTENDED_ERROR = 1208;                     // An extended error has occurred.
    ERROR_INVALID_GROUPNAME = 1209;                  // The format of the specified group name is invalid.
    ERROR_INVALID_COMPUTERNAME = 1210;               // The format of the specified computer name is invalid.
    ERROR_INVALID_EVENTNAME = 1211;                  // The format of the specified event name is invalid.
    ERROR_INVALID_DOMAINNAME = 1212;                 // The format of the specified domain name is invalid.
    ERROR_INVALID_SERVICENAME = 1213;                // The format of the specified service name is invalid.
    ERROR_INVALID_NETNAME = 1214;                    // The format of the specified network name is invalid.
    ERROR_INVALID_SHARENAME = 1215;                  // The format of the specified share name is invalid.
    ERROR_INVALID_PASSWORDNAME = 1216;               // The format of the specified password is invalid.
    ERROR_INVALID_MESSAGENAME = 1217;                // The format of the specified message name is invalid.
    ERROR_INVALID_MESSAGEDEST = 1218;                // The format of the specified message destination is invalid.
    ERROR_SESSION_CREDENTIAL_CONFLICT = 1219;        // The credentials supplied conflict with an existing set of credentials.
    ERROR_REMOTE_SESSION_LIMIT_EXCEEDED = 1220;      // An attempt was made to establish a session to a network server, but there are already too many sessions established to that server.
    ERROR_DUP_DOMAINNAME = 1221;                     // The workgroup or domain name is already in use by another computer on the network.
    ERROR_NO_NETWORK = 1222;                         // The network is not present or not started.
    ERROR_CANCELLED = 1223;                          // The operation was cancelled by the user.
    ERROR_USER_MAPPED_FILE = 1224;                   // The requested operation cannot be performed on a file with a user mapped section open.
    ERROR_CONNECTION_REFUSED = 1225;                 // The remote system refused the network connection.
    ERROR_GRACEFUL_DISCONNECT = 1226;                // The network connection was gracefully closed.
    ERROR_ADDRESS_ALREADY_ASSOCIATED = 1227;         // The network transport endpoint already has an address associated with it.
    ERROR_ADDRESS_NOT_ASSOCIATED = 1228;             // An address has not yet been associated with the network endpoint.
    ERROR_CONNECTION_INVALID = 1229;                 // An operation was attempted on a non-existent network connection.
    ERROR_CONNECTION_ACTIVE = 1230;                  // An invalid operation was attempted on an active network connection.
    ERROR_NETWORK_UNREACHABLE = 1231;                // The remote network is not reachable by the transport.
    ERROR_HOST_UNREACHABLE = 1232;                   // The remote system is not reachable by the transport.
    ERROR_PROTOCOL_UNREACHABLE = 1233;               // The remote system does not support the transport protocol.
    ERROR_PORT_UNREACHABLE = 1234;                   // No service is operating at the destination network endpoint on the remote system.
    ERROR_REQUEST_ABORTED = 1235;                    // The request was aborted.
    ERROR_CONNECTION_ABORTED = 1236;                 // The network connection was aborted by the local system.
    ERROR_RETRY = 1237;                              // The operation could not be completed. A retry should be performed.
    ERROR_CONNECTION_COUNT_LIMIT = 1238;             // A connection to the server could not be made because the limit on the number of concurrent connections for this account has been reached.
    ERROR_LOGIN_TIME_RESTRICTION = 1239;             // Attempting to login during an unauthorized time of day for this account.
    ERROR_LOGIN_WKSTA_RESTRICTION = 1240;            // The account is not authorized to login from this station.
    ERROR_INCORRECT_ADDRESS = 1241;                  // The network address could not be used for the operation requested.
    ERROR_ALREADY_REGISTERED = 1242;                 // The service is already registered.
    ERROR_SERVICE_NOT_FOUND = 1243;                  // The specified service does not exist.
    ERROR_NOT_AUTHENTICATED = 1244;                  // The operation being requested was not performed because the user has not been authenticated.
    ERROR_NOT_LOGGED_ON = 1245;                      // The operation being requested was not performed because the user has not logged on to the network. The specified service does not exist.
    ERROR_CONTINUE = 1246;                           // Return that wants caller to continue with work in progress.
    ERROR_ALREADY_INITIALIZED = 1247;                // An attempt was made to perform an initialization operation when initialization has already been completed.
    ERROR_NO_MORE_DEVICES = 1248;                    // No more local devices.
    ERROR_NOT_ALL_ASSIGNED = 1300;                   // Not all privileges referenced are assigned to the caller.
    ERROR_SOME_NOT_MAPPED = 1301;                    // Some mapping between account names and security IDs was not done.
    ERROR_NO_QUOTAS_FOR_ACCOUNT = 1302;              // No system quota limits are specifically set for this account.
    ERROR_LOCAL_USER_SESSION_KEY = 1303;             // No encryption key is available. A well-known encryption key was returned.
    ERROR_NULL_LM_PASSWORD = 1304;                   // The NT password is too complex to be converted to a LAN Manager password. The LAN Manager password returned is a NULL string.
    ERROR_UNKNOWN_REVISION = 1305;                   // The revision level is unknown.
    ERROR_REVISION_MISMATCH = 1306;                  // Indicates two revision levels are incompatible.
    ERROR_INVALID_OWNER = 1307;                      // This security ID may not be assigned as the owner of this object.
    ERROR_INVALID_PRIMARY_GROUP = 1308;              // This security ID may not be assigned as the primary group of an object.
    ERROR_NO_IMPERSONATION_TOKEN = 1309;             // An attempt has been made to operate on an impersonation token by a thread that is not currently impersonating a client.
    ERROR_CANT_DISABLE_MANDATORY = 1310;             // The group may not be disabled.
    ERROR_NO_LOGON_SERVERS = 1311;                   // There are currently no logon servers available to service the logon request.
    ERROR_NO_SUCH_LOGON_SESSION = 1312;              // A specified logon session does not exist. It may already have been terminated.
    ERROR_NO_SUCH_PRIVILEGE = 1313;                  // A specified privilege does not exist.
    ERROR_PRIVILEGE_NOT_HELD = 1314;                 // A required privilege is not held by the client.
    ERROR_INVALID_ACCOUNT_NAME = 1315;               // The name provided is not a properly formed account name.
    ERROR_USER_EXISTS = 1316;                        // The specified user already exists.
    ERROR_NO_SUCH_USER = 1317;                       // The specified user does not exist.
    ERROR_GROUP_EXISTS = 1318;                       // The specified group already exists.
    ERROR_NO_SUCH_GROUP = 1319;                      // The specified group does not exist.
    ERROR_MEMBER_IN_GROUP = 1320;                    // Either the specified user account is already a member of the specified group, or the specified group cannot be deleted because it contains a member.
    ERROR_MEMBER_NOT_IN_GROUP = 1321;                // The specified user account is not a member of the specified group account.
    ERROR_LAST_ADMIN = 1322;                         // The last remaining administration account cannot be disabled or deleted.
    ERROR_WRONG_PASSWORD = 1323;                     // Unable to update the password. The value provided as the current password is incorrect.
    ERROR_ILL_FORMED_PASSWORD = 1324;                // Unable to update the password. The value provided for the new password contains values that are not allowed in passwords.
    ERROR_PASSWORD_RESTRICTION = 1325;               // Unable to update the password because a password update rule has been violated.
    ERROR_LOGON_FAILURE = 1326;                      // Logon failure: unknown user name or bad password.
    ERROR_ACCOUNT_RESTRICTION = 1327;                // Logon failure: user account restriction.
    ERROR_INVALID_LOGON_HOURS = 1328;                // Logon failure: account logon time restriction violation.
    ERROR_INVALID_WORKSTATION = 1329;                // Logon failure: user not allowed to log on to this computer.
    ERROR_PASSWORD_EXPIRED = 1330;                   // Logon failure: the specified account password has expired.
    ERROR_ACCOUNT_DISABLED = 1331;                   // Logon failure: account currently disabled.
    ERROR_NONE_MAPPED = 1332;                        // No mapping between account names and security IDs was done.
    ERROR_TOO_MANY_LUIDS_REQUESTED = 1333;           // Too many local user identifiers (LUIDs) were requested at one time.
    ERROR_LUIDS_EXHAUSTED = 1334;                    // No more local user identifiers (LUIDs) are available.
    ERROR_INVALID_SUB_AUTHORITY = 1335;              // The subauthority part of a security ID is invalid for this particular use.
    ERROR_INVALID_ACL = 1336;                        // The access control list (ACL) structure is invalid.
    ERROR_INVALID_SID = 1337;                        // The security ID structure is invalid.
    ERROR_INVALID_SECURITY_DESCR = 1338;             // The security descriptor structure is invalid.
    ERROR_BAD_INHERITANCE_ACL = 1340;                // The inherited access control list (ACL) or access control entry (ACE) could not be built.
    ERROR_SERVER_DISABLED = 1341;                    // The server is currently disabled.
    ERROR_SERVER_NOT_DISABLED = 1342;                // The server is currently enabled.
    ERROR_INVALID_ID_AUTHORITY = 1343;               // The value provided was an invalid value for an identifier authority.
    ERROR_ALLOTTED_SPACE_EXCEEDED = 1344;            // No more memory is available for security information updates.
    ERROR_INVALID_GROUP_ATTRIBUTES = 1345;           // The specified attributes are invalid, or incompatible with the attributes for the group as a whole.
    ERROR_BAD_IMPERSONATION_LEVEL = 1346;            // Either a required impersonation level was not provided, or the provided impersonation level is invalid.
    ERROR_CANT_OPEN_ANONYMOUS = 1347;                // Cannot open an anonymous level security token.
    ERROR_BAD_VALIDATION_CLASS = 1348;               // The validation information class requested was invalid.
    ERROR_BAD_TOKEN_TYPE = 1349;                     // The type of the token is inappropriate for its attempted use.
    ERROR_NO_SECURITY_ON_OBJECT = 1350;              // Unable to perform a security operation on an object which has no associated security.
    ERROR_CANT_ACCESS_DOMAIN_INFO = 1351;            // Indicates a Windows NT Server could not be contacted or that objects within the domain are protected such that necessary information could not be retrieved.
    ERROR_INVALID_SERVER_STATE = 1352;               // The security account manager (SAM) or local security authority (LSA) server was in the wrong state to perform the security operation.
    ERROR_INVALID_DOMAIN_STATE = 1353;               // The domain was in the wrong state to perform the security operation.
    ERROR_INVALID_DOMAIN_ROLE = 1354;                // This operation is only allowed for the Primary Domain Controller of the domain.
    ERROR_NO_SUCH_DOMAIN = 1355;                     // The specified domain did not exist.
    ERROR_DOMAIN_EXISTS = 1356;                      // The specified domain already exists.
    ERROR_DOMAIN_LIMIT_EXCEEDED = 1357;              // An attempt was made to exceed the limit on the number of domains per server.
    ERROR_INTERNAL_DB_CORRUPTION = 1358;             // Unable to complete the requested operation because of either a catastrophic media failure or a data structure corruption on the disk.
    ERROR_INTERNAL_ERROR = 1359;                     // The security account database contains an internal inconsistency.
    ERROR_GENERIC_NOT_MAPPED = 1360;                 // Generic access types were contained in an access mask which should already be mapped to non-generic types.
    ERROR_BAD_DESCRIPTOR_FORMAT = 1361;              // A security descriptor is not in the right format (absolute or self-relative).
    ERROR_NOT_LOGON_PROCESS = 1362;                  // The requested action is restricted for use by logon processes only. The calling process has not registered as a logon process.
    ERROR_LOGON_SESSION_EXISTS = 1363;               // Cannot start a new logon session with an ID that is already in use.
    ERROR_NO_SUCH_PACKAGE = 1364;                    // A specified authentication package is unknown.
    ERROR_BAD_LOGON_SESSION_STATE = 1365;            // The logon session is not in a state that is consistent with the requested operation.
    ERROR_LOGON_SESSION_COLLISION = 1366;            // The logon session ID is already in use.
    ERROR_INVALID_LOGON_TYPE = 1367;                 // A logon request contained an invalid logon type value.
    ERROR_CANNOT_IMPERSONATE = 1368;                 // Unable to impersonate via a named pipe until data has been read from that pipe.
    ERROR_RXACT_INVALID_STATE = 1369;                // The transaction state of a Registry subtree is incompatible with the requested operation.
    ERROR_RXACT_COMMIT_FAILURE = 1370;               // An internal security database corruption has been encountered.
    ERROR_SPECIAL_ACCOUNT = 1371;                    // Cannot perform this operation on built-in accounts.
    ERROR_SPECIAL_GROUP = 1372;                      // Cannot perform this operation on this built-in special group.
    ERROR_SPECIAL_USER = 1373;                       // Cannot perform this operation on this built-in special user.
    ERROR_MEMBERS_PRIMARY_GROUP = 1374;              // The user cannot be removed from a group because the group is currently the user's primary group.
    ERROR_TOKEN_ALREADY_IN_USE = 1375;               // The token is already in use as a primary token.
    ERROR_NO_SUCH_ALIAS = 1376;                      // The specified local group does not exist.
    ERROR_MEMBER_NOT_IN_ALIAS = 1377;                // The specified account name is not a member of the local group.
    ERROR_MEMBER_IN_ALIAS = 1378;                    // The specified account name is already a member of the local group.
    ERROR_ALIAS_EXISTS = 1379;                       // The specified local group already exists.
    ERROR_LOGON_NOT_GRANTED = 1380;                  // Logon failure: the user has not been granted the requested logon type at this computer.
    ERROR_TOO_MANY_SECRETS = 1381;                   // The maximum number of secrets that may be stored in a single system has been exceeded.
    ERROR_SECRET_TOO_LONG = 1382;                    // The length of a secret exceeds the maximum length allowed.
    ERROR_INTERNAL_DB_ERROR = 1383;                  // The local security authority database contains an internal inconsistency.
    ERROR_TOO_MANY_CONTEXT_IDS = 1384;               // During a logon attempt, the user's security context accumulated too many security IDs.
    ERROR_LOGON_TYPE_NOT_GRANTED = 1385;             // Logon failure: the user has not been granted the requested logon type at this computer.
    ERROR_NT_CROSS_ENCRYPTION_REQUIRED = 1386;       // A cross-encrypted password is necessary to change a user password.
    ERROR_NO_SUCH_MEMBER = 1387;                     // A new member could not be added to a local group because the member does not exist.
    ERROR_INVALID_MEMBER = 1388;                     // A new member could not be added to a local group because the member has the wrong account type.
    ERROR_TOO_MANY_SIDS = 1389;                      // Too many security IDs have been specified.
    ERROR_LM_CROSS_ENCRYPTION_REQUIRED = 1390;       // A cross-encrypted password is necessary to change this user password.
    ERROR_NO_INHERITANCE = 1391;                     // Indicates an ACL contains no inheritable components
    ERROR_FILE_CORRUPT = 1392;                       // The file or directory is corrupt and non-readable.
    ERROR_DISK_CORRUPT = 1393;                       // The disk structure is corrupt and non-readable.
    ERROR_NO_USER_SESSION_KEY = 1394;                // There is no user session key for the specified logon session.
    ERROR_LICENSE_QUOTA_EXCEEDED = 1395;             // The service being accessed is licensed for a particular number of connections. No more connections can be made to the service at this time because there are already as many connections as the service can accept.
    ERROR_INVALID_WINDOW_HANDLE = 1400;              // Invalid window handle.
    ERROR_INVALID_MENU_HANDLE = 1401;                // Invalid menu handle.
    ERROR_INVALID_CURSOR_HANDLE = 1402;              // Invalid cursor handle.
    ERROR_INVALID_ACCEL_HANDLE = 1403;               // Invalid accelerator table handle.
    ERROR_INVALID_HOOK_HANDLE = 1404;                // Invalid hook handle.
    ERROR_INVALID_DWP_HANDLE = 1405;                 // Invalid handle to a multiple-window position structure.
    ERROR_TLW_WITH_WSCHILD = 1406;                   // Cannot create a top-level child window.
    ERROR_CANNOT_FIND_WND_CLASS = 1407;              // Cannot find window class.
    ERROR_WINDOW_OF_OTHER_THREAD = 1408;             // Invalid window, belongs to other thread.
    ERROR_HOTKEY_ALREADY_REGISTERED = 1409;          // Hot key is already registered.
    ERROR_CLASS_ALREADY_EXISTS = 1410;               // Class already exists.
    ERROR_CLASS_DOES_NOT_EXIST = 1411;               // Class does not exist.
    ERROR_CLASS_HAS_WINDOWS = 1412;                  // Class still has open windows.
    ERROR_INVALID_INDEX = 1413;                      // Invalid index.
    ERROR_INVALID_ICON_HANDLE = 1414;                // Invalid icon handle.
    ERROR_PRIVATE_DIALOG_INDEX = 1415;               // Using private DIALOG window words.
    ERROR_LISTBOX_ID_NOT_FOUND = 1416;               // The listbox identifier was not found.
    ERROR_NO_WILDCARD_CHARACTERS = 1417;             // No wildcards were found.
    ERROR_CLIPBOARD_NOT_OPEN = 1418;                 // Thread does not have a clipboard open.
    ERROR_HOTKEY_NOT_REGISTERED = 1419;              // Hot key is not registered.
    ERROR_WINDOW_NOT_DIALOG = 1420;                  // The window is not a valid dialog window.
    ERROR_CONTROL_ID_NOT_FOUND = 1421;               // Control ID not found.
    ERROR_INVALID_COMBOBOX_MESSAGE = 1422;           // Invalid message for a combo box because it does not have an edit control.
    ERROR_WINDOW_NOT_COMBOBOX = 1423;                // The window is not a combo box.
    ERROR_INVALID_EDIT_HEIGHT = 1424;                // Height must be less than 256.
    ERROR_DC_NOT_FOUND = 1425;                       // Invalid device context (DC) handle.
    ERROR_INVALID_HOOK_FILTER = 1426;                // Invalid hook procedure type.
    ERROR_INVALID_FILTER_PROC = 1427;                // Invalid hook procedure.
    ERROR_HOOK_NEEDS_HMOD = 1428;                    // Cannot set non-local hook without a module handle.
    ERROR_GLOBAL_ONLY_HOOK = 1429;                   // This hook procedure can only be set globally.
    ERROR_JOURNAL_HOOK_SET = 1430;                   // The journal hook procedure is already installed.
    ERROR_HOOK_NOT_INSTALLED = 1431;                 // The hook procedure is not installed.
    ERROR_INVALID_LB_MESSAGE = 1432;                 // Invalid message for single-selection listbox.
    ERROR_SETCOUNT_ON_BAD_LB = 1433;                 // LB_SETCOUNT sent to non-lazy listbox.
    ERROR_LB_WITHOUT_TABSTOPS = 1434;                // This list box does not support tab stops.
    ERROR_DESTROY_OBJECT_OF_OTHER_THREAD = 1435;     // Cannot destroy object created by another thread.
    ERROR_CHILD_WINDOW_MENU = 1436;                  // Child windows cannot have menus.
    ERROR_NO_SYSTEM_MENU = 1437;                     // The window does not have a system menu.
    ERROR_INVALID_MSGBOX_STYLE = 1438;               // Invalid message box style.
    ERROR_INVALID_SPI_VALUE = 1439;                  // Invalid system-wide (SPI_*) parameter.
    ERROR_SCREEN_ALREADY_LOCKED = 1440;              // Screen already locked.
    ERROR_HWNDS_HAVE_DIFF_PARENT = 1441;             // All handles to windows in a multiple-window position structure must have the same parent.
    ERROR_NOT_CHILD_WINDOW = 1442;                   // The window is not a child window.
    ERROR_INVALID_GW_COMMAND = 1443;                 // Invalid GW_* command.
    ERROR_INVALID_THREAD_ID = 1444;                  // Invalid thread identifier.
    ERROR_NON_MDICHILD_WINDOW = 1445;                // Cannot process a message from a window that is not a multiple document interface (MDI) window.
    ERROR_POPUP_ALREADY_ACTIVE = 1446;               // Popup menu already active.
    ERROR_NO_SCROLLBARS = 1447;                      // The window does not have scroll bars.
    ERROR_INVALID_SCROLLBAR_RANGE = 1448;            // Scroll bar range cannot be greater than 0x7FFF.
    ERROR_INVALID_SHOWWIN_COMMAND = 1449;            // Cannot show or remove the window in the way specified.
    ERROR_NO_SYSTEM_RESOURCES = 1450;                // Insufficient system resources exist to complete the requested service.
    ERROR_NONPAGED_SYSTEM_RESOURCES = 1451;          // Insufficient system resources exist to complete the requested service.
    ERROR_PAGED_SYSTEM_RESOURCES = 1452;             // Insufficient system resources exist to complete the requested service.
    ERROR_WORKING_SET_QUOTA = 1453;                  // Insufficient quota to complete the requested service.
    ERROR_PAGEFILE_QUOTA = 1454;                     // Insufficient quota to complete the requested service.
    ERROR_COMMITMENT_LIMIT = 1455;                   // The paging file is too small for this operation to complete.
    ERROR_MENU_ITEM_NOT_FOUND = 1456;                // A menu item was not found.
    ERROR_INVALID_KEYBOARD_HANDLE = 1457;            // Invalid keyboard layout handle.
    ERROR_HOOK_TYPE_NOT_ALLOWED = 1458;              // Hook type not allowed.
    ERROR_REQUIRES_INTERACTIVE_WINDOWSTATION = 1459;  // This operation requires an interactive windowstation.
    ERROR_TIMEOUT = 1460;                            // This operation returned because the timeout period expired.
    ERROR_EVENTLOG_FILE_CORRUPT = 1500;              // The event log file is corrupt.
    ERROR_EVENTLOG_CANT_START = 1501;                // No event log file could be opened, so the event logging service did not start.
    ERROR_LOG_FILE_FULL = 1502;                      // The event log file is full.
    ERROR_EVENTLOG_FILE_CHANGED = 1503;              // The event log file has changed between reads.
    ERROR_IOERROR_1700 = 1700;                       // The string binding is invalid.
    ERROR_IOERROR_1701 = 1701;                       // The binding handle is not the correct type.
    ERROR_IOERROR_1702 = 1702;                       // The binding handle is invalid.
    ERROR_IOERROR_1703 = 1703;                       // The RPC protocol sequence is not supported.
    ERROR_IOERROR_1704 = 1704;                       // The RPC protocol sequence is invalid.
    ERROR_IOERROR_1705 = 1705;                       // The string universal unique identifier (UUID) is invalid.
    ERROR_IOERROR_1706 = 1706;                       // The endpoint format is invalid.
    ERROR_IOERROR_1707 = 1707;                       // The network address is invalid.
    ERROR_IOERROR_1708 = 1708;                       // No endpoint was found.
    ERROR_IOERROR_1709 = 1709;                       // The timeout value is invalid.
    ERROR_IOERROR_1710 = 1710;                       // The object universal unique identifier (UUID) was not found.
    ERROR_IOERROR_1711 = 1711;                       // The object universal unique identifier (UUID) has already been registered.
    ERROR_IOERROR_1712 = 1712;                       // The type universal unique identifier (UUID) has already been registered.
    ERROR_IOERROR_1713 = 1713;                       // The RPC server is already listening.
    ERROR_IOERROR_1714 = 1714;                       // No protocol sequences have been registered.
    ERROR_IOERROR_1715 = 1715;                       // The RPC server is not listening.
    ERROR_IOERROR_1716 = 1716;                       // The manager type is unknown.
    ERROR_IOERROR_1717 = 1717;                       // The interface is unknown.
    ERROR_IOERROR_1718 = 1718;                       // There are no bindings.
    ERROR_IOERROR_1719 = 1719;                       // There are no protocol sequences.
    ERROR_IOERROR_1720 = 1720;                       // The endpoint cannot be created.
    ERROR_IOERROR_1721 = 1721;                       // Not enough resources are available to complete this operation.
    ERROR_IOERROR_1722 = 1722;                       // The RPC server is unavailable.
    ERROR_IOERROR_1723 = 1723;                       // The RPC server is too busy to complete this operation.
    ERROR_IOERROR_1724 = 1724;                       // The network options are invalid.
    ERROR_IOERROR_1725 = 1725;                       // There is not a remote procedure call active in this thread.
    ERROR_IOERROR_1726 = 1726;                       // The remote procedure call failed.
    ERROR_IOERROR_1727 = 1727;                       // The remote procedure call failed and did not execute.
    ERROR_IOERROR_1728 = 1728;                       // A remote procedure call (RPC) protocol error occurred.
    ERROR_IOERROR_1730 = 1730;                       // The transfer syntax is not supported by the RPC server.
    ERROR_IOERROR_1732 = 1732;                       // The universal unique identifier (UUID) type is not supported.
    ERROR_IOERROR_1733 = 1733;                       // The tag is invalid.
    ERROR_IOERROR_1734 = 1734;                       // The array bounds are invalid.
    ERROR_IOERROR_1735 = 1735;                       // The binding does not contain an entry name.
    ERROR_IOERROR_1736 = 1736;                       // The name syntax is invalid.
    ERROR_IOERROR_1737 = 1737;                       // The name syntax is not supported.
    ERROR_IOERROR_1739 = 1739;                       // No network address is available to use to construct a universal unique identifier (UUID).
    ERROR_IOERROR_1740 = 1740;                       // The endpoint is a duplicate.
    ERROR_IOERROR_1741 = 1741;                       // The authentication type is unknown.
    ERROR_IOERROR_1742 = 1742;                       // The maximum number of calls is too small.
    ERROR_IOERROR_1743 = 1743;                       // The string is too long.
    ERROR_IOERROR_1744 = 1744;                       // The RPC protocol sequence was not found.
    ERROR_IOERROR_1745 = 1745;                       // The procedure number is out of range.
    ERROR_IOERROR_1746 = 1746;                       // The binding does not contain any authentication information.
    ERROR_IOERROR_1747 = 1747;                       // The authentication service is unknown.
    ERROR_IOERROR_1748 = 1748;                       // The authentication level is unknown.
    ERROR_IOERROR_1749 = 1749;                       // The security context is invalid.
    ERROR_IOERROR_1750 = 1750;                       // The authorization service is unknown.
    ERROR_IOERROR_1751 = 1751;                       // The entry is invalid.
    ERROR_IOERROR_1752 = 1752;                       // The server endpoint cannot perform the operation.
    ERROR_IOERROR_1753 = 1753;                       // There are no more endpoints available from the endpoint mapper.
    ERROR_IOERROR_1754 = 1754;                       // No interfaces have been exported.
    ERROR_IOERROR_1755 = 1755;                       // The entry name is incomplete.
    ERROR_IOERROR_1756 = 1756;                       // The version option is invalid.
    ERROR_IOERROR_1757 = 1757;                       // There are no more members.
    ERROR_IOERROR_1758 = 1758;                       // There is nothing to unexport.
    ERROR_IOERROR_1759 = 1759;                       // The interface was not found.
    ERROR_IOERROR_1760 = 1760;                       // The entry already exists.
    ERROR_IOERROR_1761 = 1761;                       // The entry is not found.
    ERROR_IOERROR_1762 = 1762;                       // The name service is unavailable.
    ERROR_IOERROR_1763 = 1763;                       // The network address family is invalid.
    ERROR_IOERROR_1764 = 1764;                       // The requested operation is not supported.
    ERROR_IOERROR_1765 = 1765;                       // No security context is available to allow impersonation.
    ERROR_IOERROR_1766 = 1766;                       // An internal error occurred in a remote procedure call (RPC).
    ERROR_IOERROR_1767 = 1767;                       // The RPC server attempted an integer division by zero.
    ERROR_IOERROR_1768 = 1768;                       // An addressing error occurred in the RPC server.
    ERROR_IOERROR_1769 = 1769;                       // A floating-point operation at the RPC server caused a division by zero.
    ERROR_IOERROR_1770 = 1770;                       // A floating-point underflow occurred at the RPC server.
    ERROR_IOERROR_1771 = 1771;                       // A floating-point overflow occurred at the RPC server.
    ERROR_IOERROR_1772 = 1772;                       // The list of RPC servers available for the binding of auto handles has been exhausted.
    ERROR_IOERROR_1773 = 1773;                       // Unable to open the character translation table file.
    ERROR_IOERROR_1774 = 1774;                       // The file containing the character translation table has fewer than 512 bytes.
    ERROR_IOERROR_1775 = 1775;                       // A null context handle was passed from the client to the host during a remote procedure call.
    ERROR_IOERROR_1777 = 1777;                       // The context handle changed during a remote procedure call.
    ERROR_IOERROR_1778 = 1778;                       // The binding handles passed to a remote procedure call do not match.
    ERROR_IOERROR_1779 = 1779;                       // The stub is unable to get the remote procedure call handle.
    ERROR_IOERROR_1780 = 1780;                       // A null reference pointer was passed to the stub.
    ERROR_IOERROR_1781 = 1781;                       // The enumeration value is out of range.
    ERROR_IOERROR_1782 = 1782;                       // The byte count is too small.
    ERROR_IOERROR_1783 = 1783;                       // The stub received bad data.
    ERROR_INVALID_USER_BUFFER = 1784;                // The supplied user buffer is not valid for the requested operation.
    ERROR_UNRECOGNIZED_MEDIA = 1785;                 // The disk media is not recognized. It may not be formatted.
    ERROR_NO_TRUST_LSA_SECRET = 1786;                // The workstation does not have a trust secret.
    ERROR_NO_TRUST_SAM_ACCOUNT = 1787;               // The SAM database on the Windows NT Server does not have a computer account for this workstation trust relationship.
    ERROR_TRUSTED_DOMAIN_FAILURE = 1788;             // The trust relationship between the primary domain and the trusted domain failed.
    ERROR_TRUSTED_RELATIONSHIP_FAILURE = 1789;       // The trust relationship between this workstation and the primary domain failed.
    ERROR_TRUST_FAILURE = 1790;                      // The network logon failed.
    ERROR_IOERROR_1791 = 1791;                       // A remote procedure call is already in progress for this thread.
    ERROR_NETLOGON_NOT_STARTED = 1792;               // An attempt was made to logon, but the network logon service was not started.
    ERROR_ACCOUNT_EXPIRED = 1793;                    // The user's account has expired.
    ERROR_REDIRECTOR_HAS_OPEN_HANDLES = 1794;        // The redirector is in use and cannot be unloaded.
    ERROR_PRINTER_DRIVER_ALREADY_INSTALLED = 1795;   // The specified printer driver is already installed.
    ERROR_UNKNOWN_PORT = 1796;                       // The specified port is unknown.
    ERROR_UNKNOWN_PRINTER_DRIVER = 1797;             // The printer driver is unknown.
    ERROR_UNKNOWN_PRINTPROCESSOR = 1798;             // The print processor is unknown.
    ERROR_INVALID_SEPARATOR_FILE = 1799;             // The specified separator file is invalid.
    ERROR_INVALID_PRIORITY = 1800;                   // The specified priority is invalid.
    ERROR_INVALID_PRINTER_NAME = 1801;               // The printer name is invalid.
    ERROR_PRINTER_ALREADY_EXISTS = 1802;             // The printer already exists.
    ERROR_INVALID_PRINTER_COMMAND = 1803;            // The printer command is invalid.
    ERROR_INVALID_DATATYPE = 1804;                   // The specified datatype is invalid.
    ERROR_INVALID_ENVIRONMENT = 1805;                // The Environment specified is invalid.
    ERROR_IOERROR_1806 = 1806;                       // There are no more bindings.
    ERROR_NOLOGON_INTERDOMAIN_TRUST_ACCOUNT = 1807;  // The account used is an interdomain trust account. Use your global user account or local user account to access this server.
    ERROR_NOLOGON_WORKSTATION_TRUST_ACCOUNT = 1808;  // The account used is a Computer Account. Use your global user account or local user account to access this server.
    ERROR_NOLOGON_SERVER_TRUST_ACCOUNT = 1809;       // The account used is a server trust account. Use your global user account or local user account to access this server.
    ERROR_DOMAIN_TRUST_INCONSISTENT = 1810;          // The name or security ID (SID) of the domain specified is inconsistent with the trust information for that domain.
    ERROR_SERVER_HAS_OPEN_HANDLES = 1811;            // The server is in use and cannot be unloaded.
    ERROR_RESOURCE_DATA_NOT_FOUND = 1812;            // The specified image file did not contain a resource section.
    ERROR_RESOURCE_TYPE_NOT_FOUND = 1813;            // The specified resource type can not be found in the image file.
    ERROR_RESOURCE_NAME_NOT_FOUND = 1814;            // The specified resource name can not be found in the image file.
    ERROR_RESOURCE_LANG_NOT_FOUND = 1815;            // The specified resource language ID cannot be found in the image file.
    ERROR_NOT_ENOUGH_QUOTA = 1816;                   // Not enough quota is available to process this command.
    ERROR_IOERROR_1817 = 1817;                       // No interfaces have been registered.
    ERROR_IOERROR_1818 = 1818;                       // The server was altered while processing this call.
    ERROR_IOERROR_1819 = 1819;                       // The binding handle does not contain all required information.
    ERROR_IOERROR_1820 = 1820;                       // Communications failure.
    ERROR_IOERROR_1821 = 1821;                       // The requested authentication level is not supported.
    ERROR_IOERROR_1822 = 1822;                       // No principal name registered.
    ERROR_IOERROR_1823 = 1823;                       // The error specified is not a valid Windows NT RPC error code.
    ERROR_IOERROR_1824 = 1824;                       // A UUID that is valid only on this computer has been allocated.
    ERROR_IOERROR_1825 = 1825;                       // A security package specific error occurred.
    ERROR_IOERROR_1826 = 1826;                       // Thread is not cancelled.
    ERROR_IOERROR_1827 = 1827;                       // Invalid operation on the encoding/decoding handle.
    ERROR_IOERROR_1828 = 1828;                       // Incompatible version of the serializing package.
    ERROR_IOERROR_1829 = 1829;                       // Incompatible version of the RPC stub.
    ERROR_IOERROR_1830 = 1830;                       // The idl pipe object is invalid or corrupted.
    ERROR_IOERROR_1831 = 1831;                       // The operation is invalid for a given idl pipe object.
    ERROR_IOERROR_1832 = 1832;                       // The idl pipe version is not supported.
    ERROR_IOERROR_1898 = 1898;                       // The group member was not found.
    ERROR_IOERROR_1899 = 1899;                       // The endpoint mapper database could not be created.
    ERROR_IOERROR_1900 = 1900;                       // The object universal unique identifier (UUID) is the nil UUID.
    ERROR_INVALID_TIME = 1901;                       // The specified time is invalid.
    ERROR_INVALID_FORM_NAME = 1902;                  // The specified Form name is invalid.
    ERROR_INVALID_FORM_SIZE = 1903;                  // The specified Form size is invalid
    ERROR_ALREADY_WAITING = 1904;                    // The specified Printer handle is already being waited on
    ERROR_PRINTER_DELETED = 1905;                    // The specified Printer has been deleted
    ERROR_INVALID_PRINTER_STATE = 1906;              // The state of the Printer is invalid
    ERROR_PASSWORD_MUST_CHANGE = 1907;               // The user must change his password before he logs on the first time.
    ERROR_DOMAIN_CONTROLLER_NOT_FOUND = 1908;        // Could not find the domain controller for this domain.
    ERROR_ACCOUNT_LOCKED_OUT = 1909;                 // The referenced account is currently locked out and may not be logged on to.
    ERROR_IOERROR_1910 = 1910;                       // The object exporter specified was not found.
    ERROR_IOERROR_1911 = 1911;                       // The object specified was not found.
    ERROR_IOERROR_1912 = 1912;                       // The object resolver set specified was not found.
    ERROR_IOERROR_1913 = 1913;                       // Some data remains to be sent in the request buffer.
    ERROR_INVALID_PIXEL_FORMAT = 2000;               // The pixel format is invalid.
    ERROR_BAD_DRIVER = 2001;                         // The specified driver is invalid.
    ERROR_INVALID_WINDOW_STYLE = 2002;               // The window style or class attribute is invalid for this operation.
    ERROR_METAFILE_NOT_SUPPORTED = 2003;             // The requested metafile operation is not supported.
    ERROR_TRANSFORM_NOT_SUPPORTED = 2004;            // The requested transformation operation is not supported.
    ERROR_CLIPPING_NOT_SUPPORTED = 2005;             // The requested clipping operation is not supported.
    ERROR_UNKNOWN_PRINT_MONITOR = 3000;              // The specified print monitor is unknown.
    ERROR_PRINTER_DRIVER_IN_USE = 3001;              // The specified printer driver is currently in use.
    ERROR_SPOOL_FILE_NOT_FOUND = 3002;               // The spool file was not found.
    ERROR_SPL_NO_STARTDOC = 3003;                    // A StartDocPrinter call was not issued.
    ERROR_SPL_NO_ADDJOB = 3004;                      // An AddJob call was not issued.
    ERROR_PRINT_PROCESSOR_ALREADY_INSTALLED = 3005;  // The specified print processor has already been installed.
    ERROR_PRINT_MONITOR_ALREADY_INSTALLED = 3006;    // The specified print monitor has already been installed.
    ERROR_INVALID_PRINT_MONITOR = 3007;              // The specified print monitor does not have the required functions.
    ERROR_PRINT_MONITOR_IN_USE = 3008;               // The specified print monitor is currently in use.
    ERROR_PRINTER_HAS_JOBS_QUEUED = 3009;            // The requested operation is not allowed when there are jobs queued to the printer.
    ERROR_SUCCESS_REBOOT_REQUIRED = 3010;            // The requested operation is successful. Changes will not be effective until the system is rebooted.
    ERROR_SUCCESS_RESTART_REQUIRED = 3011;           // The requested operation is successful. Changes will not be effective until the service is restarted.
    ERROR_WINS_INTERNAL = 4000;                      // WINS encountered an error while processing the command.
    ERROR_CAN_NOT_DEL_LOCAL_WINS = 4001;             // The local WINS can not be deleted.
    ERROR_STATIC_INIT = 4002;                        // The importation from the file failed.
    ERROR_INC_BACKUP = 4003;                         // The backup Failed. Was a full backup done before ?
    ERROR_FULL_BACKUP = 4004;                        // The backup Failed. Check the directory that you are backing the database to.
    ERROR_REC_NON_EXISTENT = 4005;                   // The name does not exist in the WINS database.
    ERROR_RPL_NOT_ALLOWED = 4006;                    // Replication with a non-configured partner is not allowed.
    ERROR_NO_BROWSER_SERVERS_FOUND = 6118;           // The list of servers for this workgroup is not currently available

const
    ErrorNumbers : array [1..675] of integer = (
    1,2,3,4,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30
    ,31,32,33,34,36,38,39,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68
    ,69,70,71,72,80,82,83,84,85,86,87,88,89,100,101,102,103,104,105,106,107,108,109
    ,110,111,112,113,114,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131
    ,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151
    ,152,153,154,155,156,157,158,159,160,161,162,164,167,170,173,174,180,182,183,186
    ,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,205,206,207
    ,208,209,210,212,214,215,216,230,231,232,233,234,240,254,255,259,266,267,275,276
    ,277,278,282,288,298,299,317,487,534,535,536,994,995,996,997,998,999,1001,1002
    ,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018
    ,1019,1020,1021,1022,1051,1052,1053,1054,1055,1056,1057,1058,1059,1060,1061,1062
    ,1063,1064,1065,1066,1067,1068,1069,1070,1071,1072,1073,1074,1075,1076,1077,1078
    ,1079,1100,1101,1102,1103,1104,1105,1106,1107,1108,1109,1110,1111,1112,1113,1114
    ,1115,1116,1117,1118,1119,1120,1121,1122,1123,1124,1125,1126,1127,1128,1129,1130
    ,1131,1132,1140,1141,1142,1150,1151,1152,1153,1154,1155,1156,1157,2202,2250,2401
    ,2402,2404,1200,1201,1202,1203,1204,1205,1206,1207,1208,1209,1210,1211,1212,1213
    ,1214,1215,1216,1217,1218,1219,1220,1221,1222,1223,1224,1225,1226,1227,1228,1229
    ,1230,1231,1232,1233,1234,1235,1236,1237,1238,1239,1240,1241,1242,1243,1244,1245
    ,1246,1247,1248,1300,1301,1302,1303,1304,1305,1306,1307,1308,1309,1310,1311,1312
    ,1313,1314,1315,1316,1317,1318,1319,1320,1321,1322,1323,1324,1325,1326,1327,1328
    ,1329,1330,1331,1332,1333,1334,1335,1336,1337,1338,1340,1341,1342,1343,1344,1345
    ,1346,1347,1348,1349,1350,1351,1352,1353,1354,1355,1356,1357,1358,1359,1360,1361
    ,1362,1363,1364,1365,1366,1367,1368,1369,1370,1371,1372,1373,1374,1375,1376,1377
    ,1378,1379,1380,1381,1382,1383,1384,1385,1386,1387,1388,1389,1390,1391,1392,1393
    ,1394,1395,1400,1401,1402,1403,1404,1405,1406,1407,1408,1409,1410,1411,1412,1413
    ,1414,1415,1416,1417,1418,1419,1420,1421,1422,1423,1424,1425,1426,1427,1428,1429
    ,1430,1431,1432,1433,1434,1435,1436,1437,1438,1439,1440,1441,1442,1443,1444,1445
    ,1446,1447,1448,1449,1450,1451,1452,1453,1454,1455,1456,1457,1458,1459,1460,1500
    ,1501,1502,1503,1700,1701,1702,1703,1704,1705,1706,1707,1708,1709,1710,1711,1712
    ,1713,1714,1715,1716,1717,1718,1719,1720,1721,1722,1723,1724,1725,1726,1727,1728
    ,1730,1732,1733,1734,1735,1736,1737,1739,1740,1741,1742,1743,1744,1745,1746,1747
    ,1748,1749,1750,1751,1752,1753,1754,1755,1756,1757,1758,1759,1760,1761,1762,1763
    ,1764,1765,1766,1767,1768,1769,1770,1771,1772,1773,1774,1775,1777,1778,1779,1780
    ,1781,1782,1783,1784,1785,1786,1787,1788,1789,1790,1791,1792,1793,1794,1795,1796
    ,1797,1798,1799,1800,1801,1802,1803,1804,1805,1806,1807,1808,1809,1810,1811,1812
    ,1813,1814,1815,1816,1817,1818,1819,1820,1821,1822,1823,1824,1825,1826,1827,1828
    ,1829,1830,1831,1832,1898,1899,1900,1901,1902,1903,1904,1905,1906,1907,1908,1909
    ,1910,1911,1912,1913,2000,2001,2002,2003,2004,2005,3000,3001,3002,3003,3004,3005
    ,3006,3007,3008,3009,3010,3011,4000,4001,4002,4003,4004,4005,4006,6118
    );

const
    ErrorMessages : array [1..675] of string = (
    'Incorrect function.',
    'The system cannot find the file specified.',
    'The system cannot find the path specified.',
    'The system cannot open the file.',
    'The handle is invalid.',
    'The storage control blocks were destroyed.',
    'Not enough storage is available to process this command.',
    'The storage control block address is invalid.',
    'The environment is incorrect.',
    'An attempt was made to load a program with an incorrect format.',
    'The access code is invalid.',
    'The data is invalid.',
    'Not enough storage is available to complete this operation.',
    'The system cannot find the drive specified.',
    'The directory cannot be removed.',
    'The system cannot move the file to a different disk drive.',
    'There are no more files.',
    'The media is write protected.',
    'The system cannot find the device specified.',
    'The device is not ready.',
    'The device does not recognize the command.',
    'Data error (cyclic redundancy check)',
    'The program issued a command but the command length is incorrect.',
    'The drive cannot locate a specific area or track on the disk.',
    'The specified disk or diskette cannot be accessed.',
    'The drive cannot find the sector requested.',
    'The printer is out of paper.',
    'The system cannot write to the specified device.',
    'The system cannot read from the specified device.',
    'A device attached to the system is not functioning.',
    'The process cannot access the file because it is being used by another process.',
    'The process cannot access the file because another process has locked a portion of the file.',
    'The wrong diskette is in the drive. Insert %2 (Volume Serial Number: %3) into drive %1.',
    'Too many files opened for sharing.',
    'Reached end of file.',
    'The disk is full.',
    'The network request is not supported.',
    'The remote computer is not available.',
    'A duplicate name exists on the network.',
    'The network path was not found.',
    'The network is busy.',
    'The specified network resource or device is no longer available.',
    'The network BIOS command limit has been reached.',
    'A network adapter hardware error occurred.',
    'The specified server cannot perform the requested operation.',
    'An unexpected network error occurred.',
    'The remote adapter is not compatible.',
    'The printer queue is full.',
    'Space to store the file waiting to be printed is not available on the server.',
    'Your file waiting to be printed was deleted.',
    'The specified network name is no longer available.',
    'Network access is denied.',
    'The network resource type is not correct.',
    'The network name cannot be found.',
    'The name limit for the local computer network adapter card was exceeded.',
    'The network BIOS session limit was exceeded.',
    'The remote server has been paused or is in the process of being started.',
    'No more connections can be made to this remote computer at this time because there are already as many connections as the computer can accept.',
    'The specified printer or disk device has been paused.',
    'The file exists.',
    'The directory or file cannot be created.',
    'Fail on INT 24',
    'Storage to process this request is not available.',
    'The local device name is already in use.',
    'The specified network password is not correct.',
    'The parameter is incorrect.',
    'A write fault occurred on the network.',
    'The system cannot start another process at this time.',
    'Cannot create another system semaphore.',
    'The exclusive semaphore is owned by another process.',
    'The semaphore is set and cannot be closed.',
    'The semaphore cannot be set again.',
    'Cannot request exclusive semaphores at interrupt time.',
    'The previous ownership of this semaphore has ended.',
    'Insert the diskette for drive %1.',
    'Program stopped because alternate diskette was not inserted.',
    'The disk is in use or locked by another process.',
    'The pipe has been ended.',
    'The system cannot open the device or file specified.',
    'The file name is too long.',
    'There is not enough space on the disk.',
    'No more internal file identifiers available.',
    'The target internal file identifier is incorrect.',
    'The IOCTL call made by the application program is not correct.',
    'The verify-on-write switch parameter value is not correct.',
    'The system does not support the command requested.',
    'This function is only valid in Windows NT mode.',
    'The semaphore timeout period has expired.',
    'The data area passed to a system call is too small.',
    'The filename, directory name, or volume label syntax is incorrect.',
    'The system call level is not correct.',
    'The disk has no volume label.',
    'The specified module could not be found.',
    'The specified procedure could not be found.',
    'There are no child processes to wait for.',
    'The %1 application cannot be run in Windows NT mode.',
    'Attempt to use a file handle to an open disk partition for an operation other than raw disk I/O.',
    'An attempt was made to move the file pointer before the beginning of the file.',
    'The file pointer cannot be set on the specified device or file.',
    'A JOIN or SUBST command cannot be used for a drive that contains previously joined drives.',
    'An attempt was made to use a JOIN or SUBST command on a drive that has already been joined.',
    'An attempt was made to use a JOIN or SUBST command on a drive that has already been substituted.',
    'The system tried to delete the JOIN of a drive that is not joined.',
    'The system tried to delete the substitution of a drive that is not substituted.',
    'The system tried to join a drive to a directory on a joined drive.',
    'The system tried to substitute a drive to a directory on a substituted drive.',
    'The system tried to join a drive to a directory on a substituted drive.',
    'The system tried to SUBST a drive to a directory on a joined drive.',
    'The system cannot perform a JOIN or SUBST at this time.',
    'The system cannot join or substitute a drive to or for a directory on the same drive.',
    'The directory is not a subdirectory of the root directory.',
    'The directory is not empty.',
    'The path specified is being used in a substitute.',
    'Not enough resources are available to process this command.',
    'The path specified cannot be used at this time.',
    'An attempt was made to join or substitute a drive for which a directory on the drive is the target of a previous substitute.',
    'System trace information was not specified in your CONFIG.SYS file, or tracing is disallowed.',
    'The number of specified semaphore events for DosMuxSemWait is not correct.',
    'DosMuxSemWait did not execute; too many semaphores are already set.',
    'The DosMuxSemWait list is not correct.',
    'The volume label you entered exceeds the label character limit of the target file system.',
    'Cannot create another thread.',
    'The recipient process has refused the signal.',
    'The segment is already discarded and cannot be locked.',
    'The segment is already unlocked.',
    'The address for the thread ID is not correct.',
    'The argument string passed to DosExecPgm is not correct.',
    'The specified path is invalid.',
    'A signal is already pending.',
    'No more threads can be created in the system.',
    'Unable to lock a region of a file.',
    'The requested resource is in use.',
    'A lock request was not outstanding for the supplied cancel region.',
    'The file system does not support atomic changes to the lock type.',
    'The system detected a segment number that was not correct.',
    'The operating system cannot run %1.',
    'Cannot create a file when that file already exists.',
    'The flag passed is not correct.',
    'The specified system semaphore name was not found.',
    'The operating system cannot run %1.',
    'The operating system cannot run %1.',
    'The operating system cannot run %1.',
    'Cannot run %1 in Windows NT mode.',
    'The operating system cannot run %1.',
    '%1 is not a valid Windows NT application.',
    'The operating system cannot run %1.',
    'The operating system cannot run %1.',
    'The operating system cannot run this application program.',
    'The operating system is not presently configured to run this application.',
    'The operating system cannot run %1.',
    'The operating system cannot run this application program.',
    'The code segment cannot be greater than or equal to 64KB.',
    'The operating system cannot run %1.',
    'The operating system cannot run %1.',
    'The system could not find the environment option that was entered.',
    'No process in the command subtree has a signal handler.',
    'The filename or extension is too long.',
    'The ring 2 stack is in use.',
    'The global filename characters, * or ?, are entered incorrectly or too many global filename characters are specified.',
    'The signal being posted is not correct.',
    'The signal handler cannot be set.',
    'The segment is locked and cannot be reallocated.',
    'Too many dynamic link modules are attached to this program or dynamic link module.',
    'Can''t nest calls to LoadModule.',
    'The image file %1 is valid, but is for a machine type other than the current machine.',
    'The pipe state is invalid.',
    'All pipe instances are busy.',
    'The pipe is being closed.',
    'No process is on the other end of the pipe.',
    'More data is available.',
    'The session was cancelled.',
    'The specified extended attribute name was invalid.',
    'The extended attributes are inconsistent.',
    'No more data is available.',
    'The Copy API cannot be used.',
    'The directory name is invalid.',
    'The extended attributes did not fit in the buffer.',
    'The extended attribute file on the mounted file system is corrupt.',
    'The extended attribute table file is full.',
    'The specified extended attribute handle is invalid.',
    'The mounted file system does not support extended attributes.',
    'Attempt to release mutex not owned by caller.',
    'Too many posts were made to a semaphore.',
    'Only part of a Read/WriteProcessMemory request was completed.',
    'The system cannot find message for message number 0x%1 in message file for %2.',
    'Attempt to access invalid address.',
    'Arithmetic result exceeded 32 bits.',
    'There is a process on other end of the pipe.',
    'Waiting for a process to open the other end of the pipe.',
    'Access to the extended attribute was denied.',
    'The I/O operation has been aborted because of either a thread exit or an application request.',
    'Overlapped I/O event is not in a signalled state.',
    'Overlapped I/O operation is in progress.',
    'Invalid access to memory location.',
    'Error performing inpage operation.',
    'Recursion too deep, stack overflowed.',
    'The window cannot act on the sent message.',
    'Cannot complete this function.',
    'Invalid flags.',
    'The volume does not contain a recognized file system. Please make sure that all required file system drivers are loaded and that the volume is not corrupt.',
    'The volume for a file has been externally altered such that the opened file is no longer valid.',
    'The requested operation cannot be performed in full-screen mode.',
    'An attempt was made to reference a token that does not exist.',
    'The configuration registry database is corrupt.',
    'The configuration registry key is invalid.',
    'The configuration registry key could not be opened.',
    'The configuration registry key could not be read.',
    'The configuration registry key could not be written.',
    'One of the files in the Registry database had to be recovered by use of a log or alternate copy. The recovery was successful.',
    'The Registry is corrupt. The structure of one of the files that contains Registry data is corrupt, or the system''s image of the file in memory is corrupt, or the file could not be recovered because the alternate copy or log was absent or corrupt.',
    'An I/O operation initiated by the Registry failed unrecoverably. The Registry could not read in, or write out, or flush, one of the files that contain the system''s image of the Registry.',
    'The system has attempted to load or restore a file into the Registry, but the specified file is not in a Registry file format.',
    'Illegal operation attempted on a Registry key which has been marked for deletion.',
    'System could not allocate the required space in a Registry log.',
    'Cannot create a symbolic link in a Registry key that already has subkeys or values.',
    'Cannot create a stable subkey under a volatile parent key.',
    'A notify change request is being completed and the information is not being returned in the caller''s buffer. The caller now needs to enumerate the files to find the changes.',
    'A stop control has been sent to a service which other running services are dependent on.',
    'The requested control is not valid for this service',
    'The service did not respond to the start or control request in a timely fashion.',
    'A thread could not be created for the service.',
    'The service database is locked.',
    'An instance of the service is already running.',
    'The account name is invalid or does not exist.',
    'The specified service is disabled and cannot be started.',
    'Circular service dependency was specified.',
    'The specified service does not exist as an installed service.',
    'The service cannot accept control messages at this time.',
    'The service has not been started.',
    'The service process could not connect to the service controller.',
    'An exception occurred in the service when handling the control request.',
    'The database specified does not exist.',
    'The service has returned a service-specific error code.',
    'The process terminated unexpectedly.',
    'The dependency service or group failed to start.',
    'The service did not start due to a logon failure.',
    'After starting, the service hung in a start-pending state.',
    'The specified service database lock is invalid.',
    'The specified service has been marked for deletion.',
    'The specified service already exists.',
    'The system is currently running with the last-known-good configuration.',
    'The dependency service does not exist or has been marked for deletion.',
    'The current boot has already been accepted for use as the last-known-good control set.',
    'No attempts to start the service have been made since the last boot.',
    'The name is already in use as either a service name or a service display name.',
    'The account specified for this service is different from the account specified for other services running in the same process.',
    'The physical end of the tape has been reached.',
    'A tape access reached a filemark.',
    'Beginning of tape or partition was encountered.',
    'A tape access reached the end of a set of files.',
    'No more data is on the tape.',
    'Tape could not be partitioned.',
    'When accessing a new tape of a multivolume partition, the current blocksize is incorrect.',
    'Tape partition information could not be found when loading a tape.',
    'Unable to lock the media eject mechanism.',
    'Unable to unload the media.',
    'Media in drive may have changed.',
    'The I/O bus was reset.',
    'No media in drive.',
    'No mapping for the Unicode character exists in the target multi-byte code page.',
    'A dynamic link library (DLL) initialization routine failed.',
    'A system shutdown is in progress.',
    'Unable to abort the system shutdown because no shutdown was in progress.',
    'The request could not be performed because of an I/O device error.',
    'No serial device was successfully initialized. The serial driver will unload.',
    'Unable to open a device that was sharing an interrupt request (IRQ) with other devices. At least one other device that uses that IRQ was already opened.',
    'A serial I/O operation was completed by another write to the serial port. (The IOCTL_SERIAL_XOFF_COUNTER reached zero.)',
    'A serial I/O operation completed because the time-out period expired. (The IOCTL_SERIAL_XOFF_COUNTER did not reach zero.)',
    'No ID address mark was found on the floppy disk.',
    'Mismatch between the floppy disk sector ID field and the floppy disk controller track address.',
    'The floppy disk controller reported an error that is not recognized by the floppy disk driver.',
    'The floppy disk controller returned inconsistent results in its registers.',
    'While accessing the hard disk, a recalibrate operation failed, even after retries.',
    'While accessing the hard disk, a disk operation failed even after retries.',
    'While accessing the hard disk, a disk controller reset was needed, but even that failed.',
    'Physical end of tape encountered.',
    'Not enough server storage is available to process this command.',
    'A potential deadlock condition has been detected.',
    'The base address or the file offset specified does not have the proper alignment.',
    'An attempt to change the system power state was vetoed by another application or driver.',
    'The system BIOS failed an attempt to change the system power state.',
    'An attempt was made to create more links on a file than the file system supports.',
    'The specified program requires a newer version of Windows.',
    'The specified program is not a Windows or MS-DOS program.',
    'Cannot start more than one instance of the specified program.',
    'The specified program was written for an older version of Windows.',
    'One of the library files needed to run this application is damaged.',
    'No application is associated with the specified file for this operation.',
    'An error occurred in sending the command to the application.',
    'One of the library files needed to run this application cannot be found.',
    'The specified username is invalid.',
    'This network connection does not exist.',
    'This network connection has files open or requests pending.',
    'Active connections still exist.',
    'The device is in use by an active process and cannot be disconnected.',
    'The specified device name is invalid.',
    'The device is not currently connected but it is a remembered connection.',
    'An attempt was made to remember a device that had previously been remembered.',
    'No network provider accepted the given network path.',
    'The specified network provider name is invalid.',
    'Unable to open the network connection profile.',
    'The network connection profile is corrupt.',
    'Cannot enumerate a non-container.',
    'An extended error has occurred.',
    'The format of the specified group name is invalid.',
    'The format of the specified computer name is invalid.',
    'The format of the specified event name is invalid.',
    'The format of the specified domain name is invalid.',
    'The format of the specified service name is invalid.',
    'The format of the specified network name is invalid.',
    'The format of the specified share name is invalid.',
    'The format of the specified password is invalid.',
    'The format of the specified message name is invalid.',
    'The format of the specified message destination is invalid.',
    'The credentials supplied conflict with an existing set of credentials.',
    'An attempt was made to establish a session to a network server, but there are already too many sessions established to that server.',
    'The workgroup or domain name is already in use by another computer on the network.',
    'The network is not present or not started.',
    'The operation was cancelled by the user.',
    'The requested operation cannot be performed on a file with a user mapped section open.',
    'The remote system refused the network connection.',
    'The network connection was gracefully closed.',
    'The network transport endpoint already has an address associated with it.',
    'An address has not yet been associated with the network endpoint.',
    'An operation was attempted on a non-existent network connection.',
    'An invalid operation was attempted on an active network connection.',
    'The remote network is not reachable by the transport.',
    'The remote system is not reachable by the transport.',
    'The remote system does not support the transport protocol.',
    'No service is operating at the destination network endpoint on the remote system.',
    'The request was aborted.',
    'The network connection was aborted by the local system.',
    'The operation could not be completed. A retry should be performed.',
    'A connection to the server could not be made because the limit on the number of concurrent connections for this account has been reached.',
    'Attempting to login during an unauthorized time of day for this account.',
    'The account is not authorized to login from this station.',
    'The network address could not be used for the operation requested.',
    'The service is already registered.',
    'The specified service does not exist.',
    'The operation being requested was not performed because the user has not been authenticated.',
    'The operation being requested was not performed because the user has not logged on to the network. The specified service does not exist.',
    'Return that wants caller to continue with work in progress.',
    'An attempt was made to perform an initialization operation when initialization has already been completed.',
    'No more local devices.',
    'Not all privileges referenced are assigned to the caller.',
    'Some mapping between account names and security IDs was not done.',
    'No system quota limits are specifically set for this account.',
    'No encryption key is available. A well-known encryption key was returned.',
    'The NT password is too complex to be converted to a LAN Manager password. The LAN Manager password returned is a NULL string.',
    'The revision level is unknown.',
    'Indicates two revision levels are incompatible.',
    'This security ID may not be assigned as the owner of this object.',
    'This security ID may not be assigned as the primary group of an object.',
    'An attempt has been made to operate on an impersonation token by a thread that is not currently impersonating a client.',
    'The group may not be disabled.',
    'There are currently no logon servers available to service the logon request.',
    'A specified logon session does not exist. It may already have been terminated.',
    'A specified privilege does not exist.',
    'A required privilege is not held by the client.',
    'The name provided is not a properly formed account name.',
    'The specified user already exists.',
    'The specified user does not exist.',
    'The specified group already exists.',
    'The specified group does not exist.',
    'Either the specified user account is already a member of the specified group, or the specified group cannot be deleted because it contains a member.',
    'The specified user account is not a member of the specified group account.',
    'The last remaining administration account cannot be disabled or deleted.',
    'Unable to update the password. The value provided as the current password is incorrect.',
    'Unable to update the password. The value provided for the new password contains values that are not allowed in passwords.',
    'Unable to update the password because a password update rule has been violated.',
    'Logon failure: unknown user name or bad password.',
    'Logon failure: user account restriction.',
    'Logon failure: account logon time restriction violation.',
    'Logon failure: user not allowed to log on to this computer.',
    'Logon failure: the specified account password has expired.',
    'Logon failure: account currently disabled.',
    'No mapping between account names and security IDs was done.',
    'Too many local user identifiers (LUIDs) were requested at one time.',
    'No more local user identifiers (LUIDs) are available.',
    'The subauthority part of a security ID is invalid for this particular use.',
    'The access control list (ACL) structure is invalid.',
    'The security ID structure is invalid.',
    'The security descriptor structure is invalid.',
    'The inherited access control list (ACL) or access control entry (ACE) could not be built.',
    'The server is currently disabled.',
    'The server is currently enabled.',
    'The value provided was an invalid value for an identifier authority.',
    'No more memory is available for security information updates.',
    'The specified attributes are invalid, or incompatible with the attributes for the group as a whole.',
    'Either a required impersonation level was not provided, or the provided impersonation level is invalid.',
    'Cannot open an anonymous level security token.',
    'The validation information class requested was invalid.',
    'The type of the token is inappropriate for its attempted use.',
    'Unable to perform a security operation on an object which has no associated security.',
    'Indicates a Windows NT Server could not be contacted or that objects within the domain are protected such that necessary information could not be retrieved.',
    'The security account manager (SAM) or local security authority (LSA) server was in the wrong state to perform the security operation.',
    'The domain was in the wrong state to perform the security operation.',
    'This operation is only allowed for the Primary Domain Controller of the domain.',
    'The specified domain did not exist.',
    'The specified domain already exists.',
    'An attempt was made to exceed the limit on the number of domains per server.',
    'Unable to complete the requested operation because of either a catastrophic media failure or a data structure corruption on the disk.',
    'The security account database contains an internal inconsistency.',
    'Generic access types were contained in an access mask which should already be mapped to non-generic types.',
    'A security descriptor is not in the right format (absolute or self-relative).',
    'The requested action is restricted for use by logon processes only. The calling process has not registered as a logon process.',
    'Cannot start a new logon session with an ID that is already in use.',
    'A specified authentication package is unknown.',
    'The logon session is not in a state that is consistent with the requested operation.',
    'The logon session ID is already in use.',
    'A logon request contained an invalid logon type value.',
    'Unable to impersonate via a named pipe until data has been read from that pipe.',
    'The transaction state of a Registry subtree is incompatible with the requested operation.',
    'An internal security database corruption has been encountered.',
    'Cannot perform this operation on built-in accounts.',
    'Cannot perform this operation on this built-in special group.',
    'Cannot perform this operation on this built-in special user.',
    'The user cannot be removed from a group because the group is currently the user''s primary group.',
    'The token is already in use as a primary token.',
    'The specified local group does not exist.',
    'The specified account name is not a member of the local group.',
    'The specified account name is already a member of the local group.',
    'The specified local group already exists.',
    'Logon failure: the user has not been granted the requested logon type at this computer.',
    'The maximum number of secrets that may be stored in a single system has been exceeded.',
    'The length of a secret exceeds the maximum length allowed.',
    'The local security authority database contains an internal inconsistency.',
    'During a logon attempt, the user''s security context accumulated too many security IDs.',
    'Logon failure: the user has not been granted the requested logon type at this computer.',
    'A cross-encrypted password is necessary to change a user password.',
    'A new member could not be added to a local group because the member does not exist.',
    'A new member could not be added to a local group because the member has the wrong account type.',
    'Too many security IDs have been specified.',
    'A cross-encrypted password is necessary to change this user password.',
    'Indicates an ACL contains no inheritable components',
    'The file or directory is corrupt and non-readable.',
    'The disk structure is corrupt and non-readable.',
    'There is no user session key for the specified logon session.',
    'The service being accessed is licensed for a particular number of connections. No more connections can be made to the service at this time because there are already as many connections as the service can accept.',
    'Invalid window handle.',
    'Invalid menu handle.',
    'Invalid cursor handle.',
    'Invalid accelerator table handle.',
    'Invalid hook handle.',
    'Invalid handle to a multiple-window position structure.',
    'Cannot create a top-level child window.',
    'Cannot find window class.',
    'Invalid window, belongs to other thread.',
    'Hot key is already registered.',
    'Class already exists.',
    'Class does not exist.',
    'Class still has open windows.',
    'Invalid index.',
    'Invalid icon handle.',
    'Using private DIALOG window words.',
    'The listbox identifier was not found.',
    'No wildcards were found.',
    'Thread does not have a clipboard open.',
    'Hot key is not registered.',
    'The window is not a valid dialog window.',
    'Control ID not found.',
    'Invalid message for a combo box because it does not have an edit control.',
    'The window is not a combo box.',
    'Height must be less than 256.',
    'Invalid device context (DC) handle.',
    'Invalid hook procedure type.',
    'Invalid hook procedure.',
    'Cannot set non-local hook without a module handle.',
    'This hook procedure can only be set globally.',
    'The journal hook procedure is already installed.',
    'The hook procedure is not installed.',
    'Invalid message for single-selection listbox.',
    'LB_SETCOUNT sent to non-lazy listbox.',
    'This list box does not support tab stops.',
    'Cannot destroy object created by another thread.',
    'Child windows cannot have menus.',
    'The window does not have a system menu.',
    'Invalid message box style.',
    'Invalid system-wide (SPI_*) parameter.',
    'Screen already locked.',
    'All handles to windows in a multiple-window position structure must have the same parent.',
    'The window is not a child window.',
    'Invalid GW_* command.',
    'Invalid thread identifier.',
    'Cannot process a message from a window that is not a multiple document interface (MDI) window.',
    'Popup menu already active.',
    'The window does not have scroll bars.',
    'Scroll bar range cannot be greater than 0x7FFF.',
    'Cannot show or remove the window in the way specified.',
    'Insufficient system resources exist to complete the requested service.',
    'Insufficient system resources exist to complete the requested service.',
    'Insufficient system resources exist to complete the requested service.',
    'Insufficient quota to complete the requested service.',
    'Insufficient quota to complete the requested service.',
    'The paging file is too small for this operation to complete.',
    'A menu item was not found.',
    'Invalid keyboard layout handle.',
    'Hook type not allowed.',
    'This operation requires an interactive windowstation.',
    'This operation returned because the timeout period expired.',
    'The event log file is corrupt.',
    'No event log file could be opened, so the event logging service did not start.',
    'The event log file is full.',
    'The event log file has changed between reads.',
    'The string binding is invalid.',
    'The binding handle is not the correct type.',
    'The binding handle is invalid.',
    'The RPC protocol sequence is not supported.',
    'The RPC protocol sequence is invalid.',
    'The string universal unique identifier (UUID) is invalid.',
    'The endpoint format is invalid.',
    'The network address is invalid.',
    'No endpoint was found.',
    'The timeout value is invalid.',
    'The object universal unique identifier (UUID) was not found.',
    'The object universal unique identifier (UUID) has already been registered.',
    'The type universal unique identifier (UUID) has already been registered.',
    'The RPC server is already listening.',
    'No protocol sequences have been registered.',
    'The RPC server is not listening.',
    'The manager type is unknown.',
    'The interface is unknown.',
    'There are no bindings.',
    'There are no protocol sequences.',
    'The endpoint cannot be created.',
    'Not enough resources are available to complete this operation.',
    'The RPC server is unavailable.',
    'The RPC server is too busy to complete this operation.',
    'The network options are invalid.',
    'There is not a remote procedure call active in this thread.',
    'The remote procedure call failed.',
    'The remote procedure call failed and did not execute.',
    'A remote procedure call (RPC) protocol error occurred.',
    'The transfer syntax is not supported by the RPC server.',
    'The universal unique identifier (UUID) type is not supported.',
    'The tag is invalid.',
    'The array bounds are invalid.',
    'The binding does not contain an entry name.',
    'The name syntax is invalid.',
    'The name syntax is not supported.',
    'No network address is available to use to construct a universal unique identifier (UUID).',
    'The endpoint is a duplicate.',
    'The authentication type is unknown.',
    'The maximum number of calls is too small.',
    'The string is too long.',
    'The RPC protocol sequence was not found.',
    'The procedure number is out of range.',
    'The binding does not contain any authentication information.',
    'The authentication service is unknown.',
    'The authentication level is unknown.',
    'The security context is invalid.',
    'The authorization service is unknown.',
    'The entry is invalid.',
    'The server endpoint cannot perform the operation.',
    'There are no more endpoints available from the endpoint mapper.',
    'No interfaces have been exported.',
    'The entry name is incomplete.',
    'The version option is invalid.',
    'There are no more members.',
    'There is nothing to unexport.',
    'The interface was not found.',
    'The entry already exists.',
    'The entry is not found.',
    'The name service is unavailable.',
    'The network address family is invalid.',
    'The requested operation is not supported.',
    'No security context is available to allow impersonation.',
    'An internal error occurred in a remote procedure call (RPC).',
    'The RPC server attempted an integer division by zero.',
    'An addressing error occurred in the RPC server.',
    'A floating-point operation at the RPC server caused a division by zero.',
    'A floating-point underflow occurred at the RPC server.',
    'A floating-point overflow occurred at the RPC server.',
    'The list of RPC servers available for the binding of auto handles has been exhausted.',
    'Unable to open the character translation table file.',
    'The file containing the character translation table has fewer than 512 bytes.',
    'A null context handle was passed from the client to the host during a remote procedure call.',
    'The context handle changed during a remote procedure call.',
    'The binding handles passed to a remote procedure call do not match.',
    'The stub is unable to get the remote procedure call handle.',
    'A null reference pointer was passed to the stub.',
    'The enumeration value is out of range.',
    'The byte count is too small.',
    'The stub received bad data.',
    'The supplied user buffer is not valid for the requested operation.',
    'The disk media is not recognized. It may not be formatted.',
    'The workstation does not have a trust secret.',
    'The SAM database on the Windows NT Server does not have a computer account for this workstation trust relationship.',
    'The trust relationship between the primary domain and the trusted domain failed.',
    'The trust relationship between this workstation and the primary domain failed.',
    'The network logon failed.',
    'A remote procedure call is already in progress for this thread.',
    'An attempt was made to logon, but the network logon service was not started.',
    'The user''s account has expired.',
    'The redirector is in use and cannot be unloaded.',
    'The specified printer driver is already installed.',
    'The specified port is unknown.',
    'The printer driver is unknown.',
    'The print processor is unknown.',
    'The specified separator file is invalid.',
    'The specified priority is invalid.',
    'The printer name is invalid.',
    'The printer already exists.',
    'The printer command is invalid.',
    'The specified datatype is invalid.',
    'The Environment specified is invalid.',
    'There are no more bindings.',
    'The account used is an interdomain trust account. Use your global user account or local user account to access this server.',
    'The account used is a Computer Account. Use your global user account or local user account to access this server.',
    'The account used is a server trust account. Use your global user account or local user account to access this server.',
    'The name or security ID (SID) of the domain specified is inconsistent with the trust information for that domain.',
    'The server is in use and cannot be unloaded.',
    'The specified image file did not contain a resource section.',
    'The specified resource type can not be found in the image file.',
    'The specified resource name can not be found in the image file.',
    'The specified resource language ID cannot be found in the image file.',
    'Not enough quota is available to process this command.',
    'No interfaces have been registered.',
    'The server was altered while processing this call.',
    'The binding handle does not contain all required information.',
    'Communications failure.',
    'The requested authentication level is not supported.',
    'No principal name registered.',
    'The error specified is not a valid Windows NT RPC error code.',
    'A UUID that is valid only on this computer has been allocated.',
    'A security package specific error occurred.',
    'Thread is not cancelled.',
    'Invalid operation on the encoding/decoding handle.',
    'Incompatible version of the serializing package.',
    'Incompatible version of the RPC stub.',
    'The idl pipe object is invalid or corrupted.',
    'The operation is invalid for a given idl pipe object.',
    'The idl pipe version is not supported.',
    'The group member was not found.',
    'The endpoint mapper database could not be created.',
    'The object universal unique identifier (UUID) is the nil UUID.',
    'The specified time is invalid.',
    'The specified Form name is invalid.',
    'The specified Form size is invalid',
    'The specified Printer handle is already being waited on',
    'The specified Printer has been deleted',
    'The state of the Printer is invalid',
    'The user must change his password before he logs on the first time.',
    'Could not find the domain controller for this domain.',
    'The referenced account is currently locked out and may not be logged on to.',
    'The object exporter specified was not found.',
    'The object specified was not found.',
    'The object resolver set specified was not found.',
    'Some data remains to be sent in the request buffer.',
    'The pixel format is invalid.',
    'The specified driver is invalid.',
    'The window style or class attribute is invalid for this operation.',
    'The requested metafile operation is not supported.',
    'The requested transformation operation is not supported.',
    'The requested clipping operation is not supported.',
    'The specified print monitor is unknown.',
    'The specified printer driver is currently in use.',
    'The spool file was not found.',
    'A StartDocPrinter call was not issued.',
    'An AddJob call was not issued.',
    'The specified print processor has already been installed.',
    'The specified print monitor has already been installed.',
    'The specified print monitor does not have the required functions.',
    'The specified print monitor is currently in use.',
    'The requested operation is not allowed when there are jobs queued to the printer.',
    'The requested operation is successful. Changes will not be effective until the system is rebooted.',
    'The requested operation is successful. Changes will not be effective until the service is restarted.',
    'WINS encountered an error while processing the command.',
    'The local WINS can not be deleted.',
    'The importation from the file failed.',
    'The backup Failed. Was a full backup done before ?',
    'The backup Failed. Check the directory that you are backing the database to.',
    'The name does not exist in the WINS database.',
    'Replication with a non-configured partner is not allowed.',
    'The list of servers for this workgroup is not currently available'
    );

implementation

end.
