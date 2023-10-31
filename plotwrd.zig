const std = @import("std");
const print = std.debug.print;

const font57a = [_][]const u8{
    \\@DJJDXHBDDD@@@@@NDN_B_G_NN@@B@HNND^N^__OQNAQPQQN^N^N_QQQQQ__@_D@H@P@A@BMP@BPL@@@VM@@@@@@@@@CDX@ 
    ,
    \\@DJJOYTDHBUD@@@AQLQAFPHAQQ@@D@DQQJQQQPPPQDARP[QQQQQQDQQQQQAXPCN@D@P@A@DSPD@QD@@@YS@@D@@@@Q@DDDE 
    ,
    \\@DJ_TBTHPAND@@@BSDABJ^PBQQDDH_BBUQQPQPPPQDATPUYQQQQPDQQQJJBXHCU@BMVOMNDQV@BRDZVNQQVO_QQQQQ_DDDJ
    ,
    \\@D@JNDH@PAD_@_@DUDFFRA^DNO@@P@ADWQ^PQ^^P_DAXPUUQ^Q^NDQQUDDDXDCD@@SYPSQNSYLBTDUYQYSYPDQQQJQBH@BP
    ,
    \\@D@_EHU@PANDD@@HYDHA_AQHQADDH_BDT_QPQPPSQDATPQSQPUTADQQUJDHXBCD@@QQPQ_DMQDB\DUQQVMPNDQJQDODDDD@
    ,
    \\@@@J^SR@HBUDD@@PQDPQBQQHQB@DD@D@PQQQQPPQQDQRPQQQPRRQDQJ[QDPXACD@@SYPSPDAQDBRDUQQPAPADSJUJAHDDD@
    ,
    \\@D@JDCM@DDD@H@D@NN_NBNNHN\@HB@HDOQ^N^_POQNNQ_QQNPMQNDNDQQD__@_D_@MVOMND^QNLQNUQNPAP^DMDJQN_CDX@
};

pub fn main() !void {
    const args = try std.process.argsAlloc(std.heap.page_allocator);
    defer std.process.argsFree(std.heap.page_allocator, args);
    var plstr = args[1];

    var maxcols: u6 = 5;

    for (font57a) |fontline| { // traverse font array one line at a time (1-7)
        for (plstr) |abyte| { // get each character from the input string to plot
            var n: u64 = fontline[abyte - 32] - 64;
            var b: u6 = 0;

            b = maxcols-1;		// 5 columns (range: 4 to 0)
            while (b < maxcols) {	// unsigned int trick - we just go past zero to wrap around to maxint
                var m = n >= (@as(u64, 1) << b);
                if (m) {
                    print("{c}", .{abyte});
                    n = n - (@as(u64, 1) << b);
                } else {
                    print(" ", .{});
                }
                b = b - 1;
            }
            print("  ", .{});
        }
        print("\n", .{});
    }
    print("\n", .{});
}
