import 'package:flutter/material.dart';
import 'package:lunarestate/Config/config.dart';
import 'package:lunarestate/Widgets/customAppBar.dart';
import 'package:sizer/sizer.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              CustomAppBarwithBackButton('About US'),
            ];
          },
          body: Container(
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Image.asset(
                    'assets/icons/icon.png',
                    height: 125,
                    fit: BoxFit.fill,
                    width: 75.w,
                  ),
                ),
                nSpace(),
                paragraphText(
                    'Real estate is property consisting of land and the buildings on it, along with its natural resources such as crops, minerals, or water; immovable property of this nature; an interest vested in this an item of real property;'),
                bSpace(),
                Card(
                  child: Container(
                    child: Column(
                      children: [
                        nSpace(),
                        headingText('Contact Details'),
                        ListTile(
                          leading: Icon(
                            EvaIcons.phoneCallOutline,
                            color: Colors.amber,
                          ),
                          title: Text(
                            '8175011462',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            EvaIcons.emailOutline,
                            color: Colors.amber,
                          ),
                          title: Text(
                            'Lunaenterprises.jl@gmail.com',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            EvaIcons.navigation2Outline,
                            color: Colors.amber,
                          ),
                          title: Text(
                            '5 Cowboys Way Suite 300 Frisco tx 75034',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        nSpace(),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                    ),
                    // height: 140,
                    width: 85.w,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),

                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(2, 2), // changes position of shadow
                          ),
                        ],
                        color: Color.fromARGB(255, 69, 64, 64),
                        borderRadius: BorderRadius.circular(15.0)),
                  ),
                  color: Color.fromARGB(255, 69, 64, 64),
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                bSpace(),
                bSpace(),
                // paragraphText(
                //     'Past performance is no guarantee of future results. Any historical returns expected returns or probability projections may not reflect actual future performance. All securities involve risk and may result in significant losses. Represents an average net realized internal rate of return (IRR) concerning all matured investments in your portfolio, utilizing the effective dates and amounts to and from the investments and net of management fees and all other expenses charged to the investments. Past performance is not a reliable indicator of future results and should not be relied upon as the basis for making an investment decision. All securities involve risk and may result in significant losses, including the loss of principal invested. [Read more] “Annual interest,” “Annualized Return” or “Target Returns” represents a projected annual target rate of interest or annualized target return, and no returns or interest is obtained by fund investors. “Term” represents the estimated term of the investment; the term of the fund is generally at the discretion of the fund’s manager, and may exceed the estimated term by a significant amount of time. Unless otherwise specified on the fund’s offering page, target interest or returns are based on an analysis performed by Luna Enterprises of the potential inflows and outflows related to the transactions in which the strategy or fund has engaged and/or is anticipated to engage in over the estimated term of the fund. There is no guarantee that targeted interest or returns will be realized or achieved or that an investment will be successful. Actual performance may deviate from these expectations materially, including due to market or economic factors, portfolio management decisions, modeling errors, or other reasons. Reflects the annualized distribution rate that is calculated by taking the most recent quarterly distribution approved by the Fund’s Board of Directors and dividing it by the prior quarter-end NAV and analyzing it. The Fund’s distribution may exceed its earnings. Therefore, a portion of the Fund’s distribution may be a return of the money you originally invested and represent a return of capital to you for tax purposes. Represents the sum of the interest accrued during the statement period plus the interest paid during the statement period. The internal rate of return (“IRR”) represents an average net realized IRR concerning all matured investments, excluding our Short Term Notes program, weighted by the investment size of each investment, made by private investment vehicles managed by Luna Enterprises Management, LLC from July 1, 2015, through and including July 18th, 2022, after deduction of management fees and all other expenses charged to investments. Investors should carefully consider the investment objectives, risks, charges, and expenses of the Luna Enterprises Prism Fund before investing. The prospectus for the Luna Enterprises Prism Fund contains this and other information about the Fund and can be obtained by emailing investments@lunaenterprises.com or by referring to www.lunaenterprises.com. The prospectus should be read carefully before investing in the fund. Investments in the Fund are not bank deposits (and thus not insured by the FDIC or by any other federal governmental agency) and are not guaranteed by Luna Enterprises or any other party. This tool is for informational purposes only. You should not construe any information provided here as investment advice or a recommendation, endorsement, or solicitation to buy any securities offered by Luna Enterprises. Luna Enterprises is not a fiduciary for any person’s use of or access to this tool. The information provided here is general and does not address the circumstances of any particular individual or entity. You alone assume the sole responsibility of evaluating the merits and risks associated with the use of this information before making any decisions based on such information. 300 Park Avenue, 15th Floor, New York, NY 10022 844-943-5378 investments@lunaenterprises.com No communication by Luna Enterprises Inc. Or any of its affiliates (collectively, “Luna Enterprises ™”), through this website or any other medium, should be construed or is intended to be a recommendation to purchase, sell, or hold any security or otherwise to be investment, tax, financial, accounting, legal, regulatory, or compliance advice. Nothing on this website is intended as an offer to extend credit, an offer to purchase or sell securities, or a solicitation of any securities transaction. Any financial projections or returns shown on the website are estimates, predictions of performance only, hypothetical, are not based on actual investment results, and are not guarantees of future results. Estimated projections do not represent or guarantee the actual results of any transaction, and no representation is made that any transaction will, or is likely to, achieve results or profits similar to those shown. In addition, other financial metrics and calculations shown on the website (including amounts of principal and interest repaid) have not been independently verified or audited and may differ from the actual financial metrics and calculations for any investment that is contained in the investors’ portfolios. Any investment information contained herein has been secured from sources that Luna Enterprises believe are reliable, but we make no representations or warranties as to the accuracy of such information and accept no liability therefor. Private placement investments are NOT bank deposits (and thus NOT FDIC or other federal governmental agency insured), are NOT guaranteed by Luna Enterprises or any other party, and MAY lose value. Neither the Securities and Exchange Commission nor any federal or state securities commission or regulatory authority has recommended or approved any investment or the accuracy or completeness of any of the information or materials provided by or through the website. Investors must be able to afford the loss of their entire investment. Investments in private placements are speculative and involve a high degree of risk, and those investors who cannot afford to lose their entire investment should not invest. Additionally, investors may receive illiquid and/or restricted securities that may be subject to holding period requirements and/or liquidity concerns. Investments in private placements are highly illiquid and those investors who cannot hold an investment for the long term (at least 5-7 years) should not invest. Alternative investments should only be part of your overall investment portfolio. Further, the alternative investment portion of your portfolio should include a balanced portfolio of different alternative investments. Articles or information from third-party media outside of this domain may discuss Luna Enterprises or relate to the information contained herein, but Luna Enterprises do not approve of and is not responsible for such content. Hyperlinks to third-party sites or reproduction of third-party articles do not constitute an approval or endorsement by Luna Enterprises of the linked or reproduced content. Investing in securities (the “Securities”) listed on Luna Enterprises ™ poses risks, including but not limited to, credit risk, interest rate risk, and the risk of losing some or all of the money you invest. Before investing, you should: (1) conduct your investigation and analysis; (2) carefully consider the investment and all related charges, expenses, uncertainties, and risks, including all uncertainties and risks described in the offering materials; and (3) consult with your investment, tax, financial, and legal advisors. Such securities are only suitable for accredited investors who understand and are willing and able to accept the high risks associated with private investments. Investing in private placements requires long-term commitments, the ability to afford to lose the entire investment, and low liquidity needs. This website provides preliminary and general information about securities and is intended for initial reference purposes only. It does not summarize or compile all the applicable information. This website does not constitute an offer to sell or buy any securities. No offer or sale of any securities will occur without the delivery of confidential offering materials and related documents. This information contained herein is qualified by and subject to more detailed information in the applicable offering materials. Luna Enterprises ™ is not registered as a broker-dealer. Luna Enterprises ™ does not make any representation or warranty to any prospective investor regarding the legality of an investment in any Luna Enterprises securities. Banking services are provided by Evolve Bank & Trust, Member FDIC. Investment advisory services are provided by Luna Enterprises Management, LLC, an investment advisor registered with the Securities and Exchange Commission. Our site uses a third-party service to match browser cookies to your mailing address. We then use another company to send special offers through the mail on our behalf. Our company never receives or stores any of this information and our third parties do not provide or sell this information to any other company or service.'),
              ],
            ),
            height: 100.h,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Color(0xff141414),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                )),
          ),
        ),
        decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
              opacity: 0.2,
              image: AssetImage(
                'assets/images/tower.jpg',
              ),
              fit: BoxFit.cover,
            )),
        height: 100.h,
        width: 100.w,
      ),
      backgroundColor: Colors.black,
    );
  }
}
