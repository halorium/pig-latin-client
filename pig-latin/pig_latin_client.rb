class Translator::Client

  @@run = true

  def self.welcome
    puts "Welcome to the Pig Latin Translator."
    help
  end

  def self.process_command(args)
    # args = Array(cmd)
    command = args.shift.to_sym

    self.send(command, args)
  end

  def self.running?
    @@run
  end

  private

  def self.method_missing method, *args, &block
    puts "Invalid command."
    puts
  end

  def self.cmd_list
    [ '  help - Show these commands again',
      '  exit - Exit this application',
      '  translate SENTENCE - translates sentence to pig latin' ]
  end

  def self.help args = []
    str = "Available Commands:\n"
    str += cmd_list.join("\n")
    puts str
  end

  def self.translate args
    if valid(args)
      sentence = args.join(' ')

      puts PigLatin.translate(sentence)
    end
  end

  def self.exit args = []
    puts "exiting"
    @@run = false
  end

  def self.valid args
    if args.empty?
      puts "Invalid arguments"
      false
    else
      true
    end
  end
end
