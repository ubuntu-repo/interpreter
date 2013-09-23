## Our humble bytecode format
#
#                                       Stack
# Opcode           Operands     before         after
CALL,            # index, argc  [rcv, arg...]  [returned]
PUSH_NUMBER,     # index        []             [number]
PUSH_STRING,     # index        []             [string]
PUSH_SELF,       #              []             [self]
PUSH_NIL,        #              []             [nil]
PUSH_BOOL,       # 1=t, 0=f     []             [true or false]
GET_LOCAL,       # index        []             [value]
SET_LOCAL,       # index        [value]        []
JUMP_UNLESS,     # offset       [test]         []
JUMP,            # offset       []             []
ADD,             #              [a, b]         [result]
RETURN = *       #              []             []
(0..11)

class BytecodeGenerator
  def initialize
    @literals = []
    @locals = []
    @instructions = []
  end
  
  def compile_all(nodes)
    
  end
  
  def number_literal(value)
    
  end
  
  def string_literal(value)
    
  end
  
  def true_literal
    
  end
  
  def false_literal
    
  end
  
  def nil_literal
    
  end
  
  def set_local(name, value)
    
  end
  
  def get_local(name)
    
  end
  
  def call(receiver, method, arguments)
    
  end
  
  def if(condition, body, else_body)
    
  end
  
  # Returns the index of the local in the local table
  def local_index(name)
    @locals << name unless @locals.include?(name)
    @locals.index(name)
  end
  
  # Returns the index of the literal in the literal table
  def literal_index(literal)
    @literals << literal unless @literals.include?(literal)
    @literals.index(literal)
  end
  
  # Emit the instruction
  # Eg.:
  #  emit CALL, 1, 10
  # will generate the bytecode
  # 0, 1, 10
  def emit(opcode, *operands)
    @instructions << opcode
    @instructions.concat operands
  end

  # Updates the last generated byte to the size (in bytes) of the generated
  # instructions of a passed blocked.
  #
  # Eg.:
  #   emit JUMP, 0 <---------------------------------v
  #   set_previous_byte_to_size_of do  # Will update 0 to 2.
  #     emit PUSH_NUMBER, 1  # size = 2 bytes <-----------^
  #   end
  def set_previous_byte_to_size_of
    # Get the position of the previous byte in @instructions.
    byte_position = @instructions.size - 1
    # Execute the passed block (everything between do ... end).
    yield
    # Update the previous byte to the number of bytes generated by yield.
    @instructions[byte_position] = @instructions.size - 1 - byte_position
  end
  
  def assemble
    emit RETURN
    
    {
      :literals => @literals,
      :locals => @locals,
      :instructions => @instructions
    }
  end
end
