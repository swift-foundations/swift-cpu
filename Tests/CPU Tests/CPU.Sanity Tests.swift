import CPU
import Testing

extension CPU {
    @Suite
    struct Test {

        @Test
        func `CPU.Atomic vocabulary visible`() {

            let _: CPU.Atomic.Load.Ordering.Type = CPU.Atomic.Load.Ordering.self
        }

        @Test
        func `CPU.Cache.Padded vocabulary visible`() {

            let _: CPU.Cache.Padded<Int>.Type = CPU.Cache.Padded<Int>.self
        }

        #if arch(x86_64) || arch(i386)
            @Test
            func `CPU.X86 ISA spec visible on x86`() {

                let _: CPU.X86.Identification.Leaf.Type = CPU.X86.Identification.Leaf.self
            }
        #elseif arch(arm64) || arch(arm)
            @Test
            func `CPU.ARM ISA spec visible on ARM`() {

                let _: CPU.ARM.Counter.Frequency.Type = CPU.ARM.Counter.Frequency.self
            }
        #endif
    }
}
