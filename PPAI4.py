import ply.lex as lex
import ply.yacc as yacc

tokens = (
    'OPERATION',
    'NUMBER',
)

t_OPERATION = r'SUM|STRSUM'
t_NUMBER = r'\d+'

t_ignore = ' \t\n'

def t_error(t):
    print(f"Invalid character: '{t.value[0]}'")
    t.lexer.skip(1)

lexer = lex.lex()

def p_expression_operation(p):
    '''
    expression : SUM NUMBER NUMBER
              | STRSUM NUMBER NUMBER
    '''
    if p[1] == 'SUM':
        p[0] = int(p[2]) + int(p[3])
    elif p[1] == 'STRSUM':
        p[0] = str(p[2]) + str(p[3])

def p_error(p):
    print("Syntax error")

parser = yacc.yacc()

input_text = """
    SUM 2 3
    STRSUM "Hello" "World"
"""

for line in input_text.splitlines():
    result = parser.parse(line)
    if result:
        print("Result:", result)