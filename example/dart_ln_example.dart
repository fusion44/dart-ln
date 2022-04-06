import 'package:dart_ln/dart_ln.dart';

void main() async {
  final awesome = CLightningRPCSource();
  await awesome.connect(CLightningConnectionData());
  final info = await awesome.walletBalance();
  print(info.totalBalance);
  // final inv = await awesome.createInvoice(mSat: 125000, memo: "hello test");
  // print(inv.bolt11);

  final status = await awesome.invoiceStatus("1648719056426804");
  print(status);

  // final invoices = await awesome.listInvoices();
  // print(invoices);

  final stream = await awesome.invoicesPaidStream();
  stream.listen((event) {
    print(event);
  });

  final decoded = await awesome.decodeInvoice(
    'lntb1250n1p3yw9zcpp5z07kpstfxqcw8f2fqr285w453es8nv3hp086639qr8fs5q22lpasdqsdpjkcmr0yp6x2um5xqyjw5qcqp2sp5rwu3nj6c4c30zzslcz68k84fq802e76fw72hl3wv4wy8stsyz9wsrzjqv8shunq4nda8mw2mpxhtz8v03wlgug7sln2yvqklxym35ayz3erqgtj9sqqqfgqqqqqqqlgqqqqqqgq9q9qyysgq55qlmdpp889sw3cfd0vnkk3jdhhe3d04g6u46e4a8w8clmw4j6th0r7nfsy665wln9jdqq72a78zz87cnv5nlpkvknhndlcfjfz6e3spwafxwk',
  );
  print(decoded);

  final pstatus = await awesome.paymentStatus(
    paymentHash:
        '7b63879bbdf047a608fed2fc93138b470281c62b3db7cb196b3163fa5fd724bc',
    // bolt11:
    //     'lntb2100n1p3yt9dypp50d3c0xaa7pr6vz876t7fxyutgupgr33t8kmukxttx93l5h7hyj7qdqqcqzpgxqyz5vqsp5uxp0m4e69ezveucsuyrwlf45vgasu3l5k4v26a08ufdtsh9hr36s9qyyssqcq63ne6w73je42a4cl6fp7ntf8l4s52cecftqsw7gspm9vy6w05p6usyuc6j7lq3m0j4gf86jsmx8ey074lr4k0g8l400u4n3f2l36sp0725wp',
  );
  print(pstatus);

  // final df = await awesome.sendPayment(
  //   "lntb4500n1p3ysme5pp59rk6qc0z04an4r78twe9wnqv9qusmzzuld4n0nht6q7vqmghh43sdqqcqzpgxqyz5vqsp5u6pfkuypl2w5qftkye5fek3tstmqwjwnzlhrcnqr5qjnrqfs250s9qyyssqyjqcap8jvp4mtn5j7e2gk5zn5p58pte7je7patx35snelhd0wt0hx8lceqxx6jxjauuf4kkvmh7x4mqlzaz2vwk5d37x494006hefpsp82y8yw",
  // );
  // print(df);

  // awesome.dispose();
}
