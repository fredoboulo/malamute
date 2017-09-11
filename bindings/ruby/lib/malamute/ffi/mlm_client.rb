################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################

module Malamute
  module FFI

    # Malamute Client
    #
    #     Codec class for mlm_client.
    # @note This class is 100% generated using zproject.
    class MlmClient
      # Raised when one tries to use an instance of {MlmClient} after
      # the internal pointer to the native object has been nullified.
      class DestroyedError < RuntimeError; end

      # Boilerplate for self pointer, initializer, and finalizer
      class << self
        alias :__new :new
      end
      # Attaches the pointer _ptr_ to this instance and defines a finalizer for
      # it if necessary.
      # @param ptr [::FFI::Pointer]
      # @param finalize [Boolean]
      def initialize(ptr, finalize = true)
        @ptr = ptr
        if @ptr.null?
          @ptr = nil # Remove null pointers so we don't have to test for them.
        elsif finalize
          @finalizer = self.class.create_finalizer_for @ptr
          ObjectSpace.define_finalizer self, @finalizer
        end
      end
      # @param ptr [::FFI::Pointer]
      # @return [Proc]
      def self.create_finalizer_for(ptr)
        Proc.new do
          ptr_ptr = ::FFI::MemoryPointer.new :pointer
          ptr_ptr.write_pointer ptr
          ::Malamute::FFI.mlm_client_destroy ptr_ptr
        end
      end
      # @return [Boolean]
      def null?
        !@ptr or @ptr.null?
      end
      # Return internal pointer
      # @return [::FFI::Pointer]
      def __ptr
        raise DestroyedError unless @ptr
        @ptr
      end
      # So external Libraries can just pass the Object to a FFI function which expects a :pointer
      alias_method :to_ptr, :__ptr
      # Nullify internal pointer and return pointer pointer.
      # @note This detaches the current instance from the native object
      #   and thus makes it unusable.
      # @return [::FFI::MemoryPointer] the pointer pointing to a pointer
      #   pointing to the native object
      def __ptr_give_ref
        raise DestroyedError unless @ptr
        ptr_ptr = ::FFI::MemoryPointer.new :pointer
        ptr_ptr.write_pointer @ptr
        __undef_finalizer if @finalizer
        @ptr = nil
        ptr_ptr
      end
      # Undefines the finalizer for this object.
      # @note Only use this if you need to and can guarantee that the native
      #   object will be freed by other means.
      # @return [void]
      def __undef_finalizer
        ObjectSpace.undefine_finalizer self
        @finalizer = nil
      end

      # Create a new mlm_client, return the reference if successful,
      # or NULL if construction failed due to lack of available memory.
      # @return [Malamute::MlmClient]
      def self.new()
        ptr = ::Malamute::FFI.mlm_client_new()
        __new ptr
      end

      # Destroy the mlm_client and free all memory used by the object.
      #
      # @return [void]
      def destroy()
        return unless @ptr
        self_p = __ptr_give_ref
        result = ::Malamute::FFI.mlm_client_destroy(self_p)
        result
      end

      # Return actor, when caller wants to work with multiple actors and/or
      # input sockets asynchronously.
      #
      # @return [::FFI::Pointer]
      def actor()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::Malamute::FFI.mlm_client_actor(self_p)
        result
      end

      # Return message pipe for asynchronous message I/O. In the high-volume case,
      # we send methods and get replies to the actor, in a synchronous manner, and
      # we send/recv high volume message data to a second pipe, the msgpipe. In
      # the low-volume case we can do everything over the actor pipe, if traffic
      # is never ambiguous.
      #
      # @return [::FFI::Pointer]
      def msgpipe()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::Malamute::FFI.mlm_client_msgpipe(self_p)
        result
      end

      # Return true if client is currently connected, else false. Note that the
      # client will automatically re-connect if the server dies and restarts after
      # a successful first connection.
      #
      # @return [Boolean]
      def connected()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::Malamute::FFI.mlm_client_connected(self_p)
        result
      end

      # Set PLAIN authentication username and password. If you do not call this, the
      # client will use NULL authentication. TODO: add "set curve auth".
      # Returns >= 0 if successful, -1 if interrupted.
      #
      # @param username [String, #to_s, nil]
      # @param password [String, #to_s, nil]
      # @return [Integer]
      def set_plain_auth(username, password)
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::Malamute::FFI.mlm_client_set_plain_auth(self_p, username, password)
        result
      end

      # Connect to server endpoint, with specified timeout in msecs (zero means wait
      # forever). Constructor succeeds if connection is successful. The caller may
      # specify its address.
      # Returns >= 0 if successful, -1 if interrupted.
      #
      # @param endpoint [String, #to_s, nil]
      # @param timeout [Integer, #to_int, #to_i]
      # @param address [String, #to_s, nil]
      # @return [Integer]
      def connect(endpoint, timeout, address)
        raise DestroyedError unless @ptr
        self_p = @ptr
        timeout = Integer(timeout)
        result = ::Malamute::FFI.mlm_client_connect(self_p, endpoint, timeout, address)
        result
      end

      # Prepare to publish to a specified stream. After this, all messages are sent to
      # this stream exclusively.
      # Returns >= 0 if successful, -1 if interrupted.
      #
      # @param stream [String, #to_s, nil]
      # @return [Integer]
      def set_producer(stream)
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::Malamute::FFI.mlm_client_set_producer(self_p, stream)
        result
      end

      # Consume messages with matching subjects. The pattern is a regular expression
      # using the CZMQ zrex syntax. The most useful elements are: ^ and $ to match the
      # start and end, . to match any character, \s and \S to match whitespace and
      # non-whitespace, \d and \D to match a digit and non-digit, \a and \A to match
      # alphabetic and non-alphabetic, \w and \W to match alphanumeric and
      # non-alphanumeric, + for one or more repetitions, * for zero or more repetitions,
      # and ( ) to create groups. Returns 0 if subscription was successful, else -1.
      # Returns >= 0 if successful, -1 if interrupted.
      #
      # @param stream [String, #to_s, nil]
      # @param pattern [String, #to_s, nil]
      # @return [Integer]
      def set_consumer(stream, pattern)
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::Malamute::FFI.mlm_client_set_consumer(self_p, stream, pattern)
        result
      end

      # Offer a particular named service, where the pattern matches request subjects
      # using the CZMQ zrex syntax.
      # Returns >= 0 if successful, -1 if interrupted.
      #
      # @param address [String, #to_s, nil]
      # @param pattern [String, #to_s, nil]
      # @return [Integer]
      def set_worker(address, pattern)
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::Malamute::FFI.mlm_client_set_worker(self_p, address, pattern)
        result
      end

      # Send STREAM SEND message to server, takes ownership of message
      # and destroys message when done sending it.
      #
      # @param subject [String, #to_s, nil]
      # @param content [::FFI::Pointer, #to_ptr]
      # @return [Integer]
      def send(subject, content)
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::Malamute::FFI.mlm_client_send(self_p, subject, content)
        result
      end

      # Send MAILBOX SEND message to server, takes ownership of message
      # and destroys message when done sending it.
      #
      # @param address [String, #to_s, nil]
      # @param subject [String, #to_s, nil]
      # @param tracker [String, #to_s, nil]
      # @param timeout [Integer, #to_int, #to_i]
      # @param content [::FFI::Pointer, #to_ptr]
      # @return [Integer]
      def sendto(address, subject, tracker, timeout, content)
        raise DestroyedError unless @ptr
        self_p = @ptr
        timeout = Integer(timeout)
        result = ::Malamute::FFI.mlm_client_sendto(self_p, address, subject, tracker, timeout, content)
        result
      end

      # Send SERVICE SEND message to server, takes ownership of message
      # and destroys message when done sending it.
      #
      # @param address [String, #to_s, nil]
      # @param subject [String, #to_s, nil]
      # @param tracker [String, #to_s, nil]
      # @param timeout [Integer, #to_int, #to_i]
      # @param content [::FFI::Pointer, #to_ptr]
      # @return [Integer]
      def sendfor(address, subject, tracker, timeout, content)
        raise DestroyedError unless @ptr
        self_p = @ptr
        timeout = Integer(timeout)
        result = ::Malamute::FFI.mlm_client_sendfor(self_p, address, subject, tracker, timeout, content)
        result
      end

      # Receive message from server; caller destroys message when done
      #
      # @return [::FFI::Pointer]
      def recv()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::Malamute::FFI.mlm_client_recv(self_p)
        result
      end

      # Return last received command. Can be one of these values:
      #     "STREAM DELIVER"
      #     "MAILBOX DELIVER"
      #     "SERVICE DELIVER"
      #
      # @return [String]
      def command()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::Malamute::FFI.mlm_client_command(self_p)
        result
      end

      # Return last received status
      #
      # @return [Integer]
      def status()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::Malamute::FFI.mlm_client_status(self_p)
        result
      end

      # Return last received reason
      #
      # @return [String]
      def reason()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::Malamute::FFI.mlm_client_reason(self_p)
        result
      end

      # Return last received address
      #
      # @return [String]
      def address()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::Malamute::FFI.mlm_client_address(self_p)
        result
      end

      # Return last received sender
      #
      # @return [String]
      def sender()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::Malamute::FFI.mlm_client_sender(self_p)
        result
      end

      # Return last received subject
      #
      # @return [String]
      def subject()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::Malamute::FFI.mlm_client_subject(self_p)
        result
      end

      # Return last received content
      #
      # @return [::FFI::Pointer]
      def content()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::Malamute::FFI.mlm_client_content(self_p)
        result
      end

      # Return last received tracker
      #
      # @return [String]
      def tracker()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::Malamute::FFI.mlm_client_tracker(self_p)
        result
      end

      # Send multipart string message to stream, end list with NULL
      # Returns 0 if OK, -1 if failed due to lack of memory or other error.
      #
      # @param subject [String, #to_s, nil]
      # @param content [String, #to_s, nil]
      # @param args [Array<Object>] see https://github.com/ffi/ffi/wiki/examples#using-varargs
      # @return [Integer]
      def sendx(subject, content, *args)
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::Malamute::FFI.mlm_client_sendx(self_p, subject, content, *args)
        result
      end

      # Send multipart string to mailbox, end list with NULL
      # Returns 0 if OK, -1 if failed due to lack of memory or other error.
      #
      # @param address [String, #to_s, nil]
      # @param subject [String, #to_s, nil]
      # @param content [String, #to_s, nil]
      # @param args [Array<Object>] see https://github.com/ffi/ffi/wiki/examples#using-varargs
      # @return [Integer]
      def sendtox(address, subject, content, *args)
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::Malamute::FFI.mlm_client_sendtox(self_p, address, subject, content, *args)
        result
      end

      # Send multipart string to service, end list with NULL
      # Returns 0 if OK, -1 if failed due to lack of memory or other error.
      #
      # @param address [String, #to_s, nil]
      # @param subject [String, #to_s, nil]
      # @param content [String, #to_s, nil]
      # @param args [Array<Object>] see https://github.com/ffi/ffi/wiki/examples#using-varargs
      # @return [Integer]
      def sendforx(address, subject, content, *args)
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::Malamute::FFI.mlm_client_sendforx(self_p, address, subject, content, *args)
        result
      end

      # Receive a subject and string content from the server. The content may be
      # 1 or more string frames. This method is orthogonal to the sendx methods.
      # End the string arguments with NULL. If there are not enough frames in
      # the received message, remaining strings are set to NULL. Returns number
      # of string contents received, or -1 in case of error. Free the returned
      # subject and content strings when finished with them. To get the type of
      # the command, use mlm_client_command ().
      #
      # @param subject_p [::FFI::Pointer, #to_ptr]
      # @param string_p [::FFI::Pointer, #to_ptr]
      # @param args [Array<Object>] see https://github.com/ffi/ffi/wiki/examples#using-varargs
      # @return [Integer]
      def recvx(subject_p, string_p, *args)
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::Malamute::FFI.mlm_client_recvx(self_p, subject_p, string_p, *args)
        result
      end

      # Enable verbose tracing (animation) of state machine activity.
      #
      # @param verbose [Boolean]
      # @return [void]
      def set_verbose(verbose)
        raise DestroyedError unless @ptr
        self_p = @ptr
        verbose = !(0==verbose||!verbose) # boolean
        result = ::Malamute::FFI.mlm_client_set_verbose(self_p, verbose)
        result
      end

      # Self test of this class.
      #
      # @param verbose [Boolean]
      # @return [void]
      def self.test(verbose)
        verbose = !(0==verbose||!verbose) # boolean
        result = ::Malamute::FFI.mlm_client_test(verbose)
        result
      end
    end
  end
end

################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################
