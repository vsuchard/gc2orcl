--------------------------------------------------------
--  DDL for Index GC_I_CLOSED_POSITIONS_UNIQ
--------------------------------------------------------

CREATE UNIQUE INDEX "GC_I_CLOSED_POSITIONS_UNIQ" ON "GC_T_CLOSED_POSITIONS" 
   (	"ACCOUNT", 
	"ACT", 
	"TICKET", 
	"INSTRUMENT", 
	"LOT", 
	"BS", 
	"OPEN", 
	"OPENDATE", 
	"CLOSE", 
	"CLOSEDATE", 
	"LOTPL", 
	"COM", 
	"SWAP", 
	"FUTROLLADJ", 
	"NETPL", 
	"REASON", 
	"OPNCHANGE", 
   	"USER", 
	"CLCHARGE", 
   	"OPENEDBY", 
   	"CLOSEDBY", 
	"TRADEID", 
   	"COMMENT", 
	"TRADEOPENDATE"
   ) ;
