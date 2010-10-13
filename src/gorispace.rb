require 'strscan'

class Gorispace
  OPS = {
    /AA([AB]+)(C)/ => :stack_push,
    /ACA/ => :stack_copy,
    /ABA([AB]+)(C)/ => :stack_copynth,
    /ACB/ => :stack_swap,
    /ACC/ => :stack_discard,
    #/ABC([AB]+)(C)/ => :stack_slide,
    /BAAA/ => :arithmetic_add,
    /BAAB/ => :arithmetic_sub,
    /BAAC/ => :arithmetic_mul,
    /BABA/ => :arithmetic_div,
    /BABB/ => :arithmetic_mod,
    /BBA/ => :heap_store,
    /BBB/ => :heap_restore,
    /CAA([AB]+)C/ => :flow_mark,
    /CAB([AB]+)C/ => :flow_call,
    /CAC([AB]+)C/ => :flow_jump,
    /CBA([AB]+)C/ => :flow_zero,
    /CBB([AB]+)C/ => :flow_nega,
    /CBC/ => :flow_return,
    /CCC/ => :flow_exit,
    /BCAA/ => :io_outchar,
    /BCAB/ => :io_outnum,
    /BCBA/ => :io_readchar,
    /BCBB/ => :io_readnum
  }

  def initialize
    @instructions = []
    @stack = []
    @heap = {}
    @marks = {}
    @call_stack = []
  end

  def scan(code)
    puts code if $DEBUG
    scanner = StringScanner.new(code)
    until scanner.eos?
      converted = false
      OPS.keys.each do |key|
        if scanner.scan(key)
          command = OPS[key]
          param = scanner[1]
          if scanner[2]
            sign = param[0] == ?A ? 1 : -1
            abs = 0
            param[1..-1].each_byte do |c|
              abs <<= 1
              abs |= 1 if c == ?B
            end
            param = sign * abs
          end
          puts([command, param].compact.inspect) if $DEBUG
          @instructions << [command, param]
          @marks[param] = @instructions.size - 1 if command == :flow_mark
          puts("**MARK** #{param.inspect} => #{@marks[param]}") if $DEBUG and command == :flow_mark
          converted = true
          break
        end
      end
      #raise "Invalid:\n#{scanner.peek(10)}..." unless converted
      break unless converted
    end
  end

  def execute
    pc = 0
    while pc < @instructions.size
      old_stack_size = @stack.size
      old_heap_size = @heap.size
      command, param = *@instructions[pc]
      puts "    #{[command, param].compact.inspect}" if $DEBUG
      case command
      when :stack_push
        @stack.push(param)
      when :stack_copy
        @stack.push(@stack.last)
      when :stack_copynth
        @stack.push(@stack[param])
      when :stack_swap
        val1 = @stack.pop
        val2 = @stack.pop
        @stack.push(val1)
        @stack.push(val2)
      when :stack_discard
        @stack.pop
      #when :stack_slide
      when :arithmetic_add
        val1 = @stack.pop
        val2 = @stack.pop
        @stack.push(val2 + val1)
      when :arithmetic_sub
        val1 = @stack.pop
        val2 = @stack.pop
        @stack.push(val2 - val1)
      when :arithmetic_mul
        val1 = @stack.pop
        val2 = @stack.pop
        @stack.push(val2 * val1)
      when :arithmetic_div
        val1 = @stack.pop
        val2 = @stack.pop
        @stack.push(val2 / val1)
      when :arithmetic_mod
        val1 = @stack.pop
        val2 = @stack.pop
        @stack.push(val2 % val1)
      when :heap_store
        val = @stack.pop
        addr = @stack.pop
        @heap[addr] = val
      when :heap_restore
        addr = @stack.pop
        @stack.push(@heap[addr])
      when :flow_mark
        # do nothing
      when :flow_call
        @call_stack.push(pc)
        pc = @marks[param]
      when :flow_jump
        pc = @marks[param]
      when :flow_zero
        pc = @marks[param] if @stack.pop == 0
      when :flow_nega
        pc = @marks[param] if @stack.pop < 0
      when :flow_return
        pc = @call_stack.pop
      when :flow_exit
        exit(0)
      when :io_outchar
        print(@stack.pop.chr)
      when :io_outnum
        print(@stack.pop)
      when :io_readchar
        @heap[@stack.pop] = $stdin.readline[0]
      when :io_readnum
        @heap[@stack.pop] = $stdin.readline.to_i
      end
      @stack.compact!
      puts "    Stack: #{@stack.inspect}" if $DEBUG and @stack.size != old_stack_size
      puts "    Heap : #{@heap.inspect}" if $DEBUG and @heap.size != old_heap_size
      pc += 1
    end
  end

  def whitespace(code)
    scan(code.gsub(/\S/, '').gsub(/\r\n/, "\n").gsub(/[\r\n]/, 'C').gsub("\t", 'B').gsub(' ', 'A').gsub(/[^ABC]/, ''))
    execute
  end

  def gorispace(code)
    scan(code.gsub(/[^ウッホーイ]/, '').gsub(/ホ+/, 'ホ').gsub(/ウホーイ/, 'C').gsub(/ウッホ/, 'B').gsub(/ウホ/, 'A').gsub(/[^ABC]/, ''))
    execute
  end

  def self.interprete(code, type=:gorispace)
    self.new.send(type, code)
  end
end
