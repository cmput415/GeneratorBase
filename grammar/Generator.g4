grammar Generator;

file: .*? EOF;

// Skip whitespace
WS : [ \t\r\n]+ -> skip ;
