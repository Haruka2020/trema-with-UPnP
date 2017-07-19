require 'pio/open_flow10/flow_stats/reply'

describe Pio::OpenFlow10::FlowStats::Reply do
  describe '.read' do
    context 'with a Flow Stats Reply binary' do
      Given(:binary) do
        [0x01, 0x11, 0x00, 0xe4, 0x00, 0x00, 0x00, 0x06, 0x00, 0x01,
         0x00, 0x00, 0x00, 0x68, 0x03, 0x00, 0x00, 0x3f, 0xff, 0xff,
         0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
         0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
         0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
         0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01,
         0x00, 0x00, 0x00, 0x02, 0x00, 0x64, 0x00, 0x05, 0x00, 0x0a,
         0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x23, 0x45, 0x67,
         0x89, 0xab, 0xcd, 0xef, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
         0x00, 0x0a, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0xe8,
         0x00, 0x00, 0x00, 0x08, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00,
         0x00, 0x08, 0x00, 0x02, 0x00, 0x00, 0x00, 0x70, 0x04, 0x00,
         0x00, 0x3f, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
         0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
         0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
         0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
         0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x64,
         0x00, 0x05, 0x00, 0x0a, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
         0x01, 0x23, 0x45, 0x67, 0x89, 0xab, 0xcd, 0xef, 0x00, 0x00,
         0x00, 0x00, 0x00, 0x00, 0x00, 0x0a, 0x00, 0x00, 0x00, 0x00,
         0x00, 0x00, 0x03, 0xe8, 0x00, 0x00, 0x00, 0x08, 0x00, 0x01,
         0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x02, 0x00, 0x00,
         0x00, 0x00, 0x00, 0x08, 0x00, 0x03, 0x00, 0x00].pack('C*')
      end

      When(:flow_stats_reply) do
        Pio::OpenFlow10::FlowStats::Reply.read(binary)
      end

      Then { flow_stats_reply.class == Pio::OpenFlow10::FlowStats::Reply }
    end
  end
end