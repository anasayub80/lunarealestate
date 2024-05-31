import 'package:flutter/material.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:lunarestate/Pages/Background/bg_one.dart';
import '../../../Config/config.dart';
import '../../../Widgets/customAppBar.dart';

class TermsAndCondition extends StatelessWidget {
  const TermsAndCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BgOne(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBarWithCircleback(),
              30.height,
              headingText('NO BROKERAGE RELATIONSHIP NOTICE'),
              SizedBox(
                height: 5,
              ),
              paragraphText(
                  'FLORIDA LAW REQUIRES THAT REAL ESTATE LICENSEES WHO HAVE NO BROKERAGE RELATIONSHIP WITH A POTENTIAL SELLER OR BUYER DISCLOSE THEIR DUTIES TO SELLERS AND BUYERS.'),
              SizedBox(
                height: 5,
              ),
              paragraphText(
                  'As a real estate licensee who has no brokerage relationship with you, Lunaenterprises.com, inc. owes to you the following duties:'),
              nSpace(),
              paragraphText(
                  '$bullet Dealing honestly and fairly;\n$bullet Disclosing all known facts that materially affect the value of residential real property which are not readily observable to the buyer.\n$bullet Accounting for all funds entrusted to the licensee.'),
              bSpace(),
              headingText('1. ACCEPTANCE OF TERMS.'),
              nSpace(),
              paragraphText(
                  'Luna Enterprises.com ( Luna Enterprises ) owns and operates the site www.Luna Enterprises.com and its related sites, applications (including mobile sites and applications), services and technology that are made available by Luna Enterprises, together with any content, tools, forums, information sharing, and transactions available herein (collectively, the “Service”).'),
              nSpace(),
              paragraphText(
                  'These terms of service govern your access to and use of the Service (“Terms of Use”). The Terms of Use shall be deemed to include all other operating rules, policies and procedures that are referred to herein or that may otherwise be published by Luna Enterprises from time to time (collectively, “Policies”), including without limitation, the following:'),
              nSpace(),
              paragraphText(
                  'For purposes of these Terms of Use “User” shall mean either you as an individual or the entity on whose behalf you are accepting these Terms of Use and who is afforded all rights and bound by all terms hereunder. User represents that he/she/it is authorized to accept these Terms of Use.'),
              bSpace(),
              headingText(
                  'IF YOU DO NOT AGREE TO ALL OF THE TERMS OF USE, OR IF YOU ARE NOT ELIGIBLE OR AUTHORIZED TO ENTER INTO THIS AGREEMENT, THEN DO NOT USE OR DOWNLOAD OR OTHERWISE ACCESS ANY PART OF THE SERVICE. USING ALL OR ANY PART OF THE SERVICE WILL CONSTITUTE ACCEPTANCE AND CREATE A LEGALLY ENFORCEABLE CONTRACT UNDER WHICH YOU AGREE TO BE BOUND BY ALL OF THE TERMS OF SERVICE, WITHOUT MODIFICATION.'),
              bSpace(),
              headingText('2. CHANGES.'),
              nSpace(),
              paragraphText(
                  'Luna Enterprises reserves the right, at its sole discretion, to modify or replace the Terms of Use (including any Policy), in whole or in part, at any time. Change notices may be communicated by postings at the Service, via email, or other reasonable means. Users should periodically check the Terms of Use for changes. Continued use of the Service following any change to the Terms of Use constitutes User’s acceptance of those changes. The Terms of Use may not otherwise be amended, except by a written agreement executed by User and Luna Enterprises.'),
              nSpace(),
              paragraphText(
                  'Luna Enterprises may terminate, modify or suspend the Service, in whole or in part, at any time, with or without notice.'),
              bSpace(),
              headingText('3. ELIGIBILITY.'),
              nSpace(),
              paragraphText(
                  'You must be at least 18 years of age to visit the Site and use the Service. If you do not so qualify, you are prohibited from accessing or using the Service. Luna Enterprises will not collect personally identifiable information from any person that is actually known to us to be a child under the age of 18. If Luna Enterprises is alerted that a User is under the age of 18, Luna Enterprises will take steps to remove the User’s content and terminate and/or block his/her access to the Service.'),
              nSpace(),
              paragraphText(
                  'Luna Enterprises may refuse to offer or continue offering the Service to any person and may change its eligibility criteria from time to time.'),
              bSpace(),
              headingText('4. REGISTRATION.'),
              nSpace(),
              paragraphText(
                  'Registration is not required as a condition of gaining access to the Service.'),
              bSpace(),
              headingText('5. PRIVACY.'),
              nSpace(),
              paragraphText(
                  'Luna Enterprises’s current Privacy Policy is available at which shall apply to any use of the Service and which may be modified by Luna Enterprises in its discretion from time to time pursuant to the procedures set forth therein.'),
              bSpace(),
              headingText('6. USER CONDUCT'),
              nSpace(),
              paragraphText(
                  'User may only use the Service for his/her personal and noncommercial use, or as part of an evaluation of the Service with regard to potential commercial use thereof. Any commercial use of the Service requires a separate written agreement with Luna Enterprises.'),
              nSpace(),
              paragraphText(
                  'User will comply with all applicable laws, regulations and rules in connection with the Service. Without limiting the foregoing, Users shall not use the Service for the purpose of money laundering, bid rigging, price fixing or other unlawful collusion, price signaling or exchange of competitively sensitive data or information.'),
              nSpace(),
              paragraphText(
                  'User may not use the Service in violation of these Terms of Use.'),
              nSpace(),
              paragraphText(
                  'User agrees not to take any action using any aspect of the Service, in any manner, that:'),
              nSpace(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    paragraphText(
                        '$bullet is unlawful, deceptive, misleading, fraudulent, threatening, abusive, harassing, libelous, invasive of another’s privacy, tortious, obscene, profane or which otherwise violates the Terms of Use;'),
                    paragraphText(
                        '$bullet infringes any patent, trademark, trade secret, copyright, right of publicity, privacy right or other right of any party;'),
                    paragraphText(
                        '$bullet reveals any personal information about another individual, including another person’s name, address, phone number, electronic mail address, credit card information or any other information that could be used to track, contact or impersonate that person;'),
                    paragraphText(
                        '$bullet constitutes unauthorized or unsolicited advertising, junk or bulk e-mail (“spamming”), chain letters or any form of lottery or gambling;'),
                    paragraphText(
                        '$bullet imposes an unreasonable or disproportionately large load on Luna Enterprises’s computing, storage or communications infrastructure, or attempts to gain unauthorized access to the Service, other accounts, computer systems or networks connected to the Service, through password mining or otherwise;'),
                    paragraphText(
                        '$bullet contains software viruses or any other computer codes, files, or programs that are designed or intended to disrupt, damage, limit or interfere with the proper function of any software, hardware or network system or to damage or obtain unauthorized access to any system, data or other information of Luna Enterprises or any third party;'),
                    paragraphText(
                        '$bullet harvests, scrapes or collects any information from the Site;'),
                    paragraphText(
                        '$bullet seeks to solicit information from or about minors; or'),
                    paragraphText(
                        '$bullet impersonates any person or entity, including any employee or representative of Luna Enterprises Luna Enterprises may, at its sole discretion, immediately suspend or terminate any User’s access to the Service should its conduct fail (or appear to fail) to strictly conform to any provision of these Terms of Use.'),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                ),
              ),
              paragraphText(
                  'Luna Enterprises may, at any time, monitor, review, remove, retain or disclose any information as necessary to satisfy any applicable law, regulation, legal process or governmental request or investigation (including law enforcement). Luna Enterprises is not responsible for any failure or delay in removing any such content.'),
              bSpace(),
              headingText('7. PROPRIETARY RIGHTS.'),
              bSpace(),
              paragraphText(
                  'User acknowledges and agrees that the Service and all content and materials created by or for Luna Enterprises and made available on or via the Service are protected by copyrights, trademarks, service marks, patents, trade secrets or other proprietary rights and laws, and Luna Enterprises (and its licensors) shall own and retain all rights, title and interests (including all intellectual property and proprietary rights) therein and thereto.'),
              bSpace(),
              paragraphText(
                  'User may not to sell, license, reverse engineer, rent, modify, distribute, copy, reproduce, transmit, publicly display, publicly perform, publish, adapt, edit or create derivative works of the Service or its content and materials.'),
              bSpace(),
              paragraphText(
                  'Systematic retrieval of data or other content from the Site by any User to create or compile, directly or indirectly, a collection, database or directory is strictly prohibited.'),
              bSpace(),
              headingText('8. TERMINATION.'),
              bSpace(),
              paragraphText(
                  'Luna Enterprises may terminate any User’s access to all or any part of the Service, with or without cause, with or without notice, effective at any time.'),
              bSpace(),
              paragraphText(
                  'Upon any termination, User shall immediately cease using the Service, except that (a) all obligations that accrued prior to the effective date of termination and all remedies for breach of the Terms of Use shall survive and (b) Sections 9 – 16 shall survive.'),
              bSpace(),
              headingText('9. DISCLAIMER OF ALL WARRANTIES.'),
              bSpace(),
              paragraphText(
                  'THE SERVICE IS PROVIDED “AS IS” AND “AS AVAILABLE”. THE SERVICE IS PROVIDED WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF TITLE, NON-INFRINGEMENT, INTEGRATION, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE, AND ANY WARRANTIES IMPLIED BY ANY COURSE OF PERFORMANCE OR USAGE OF TRADE, ALL OF WHICH ARE EXPRESSLY DISCLAIMED. Luna Enterprises AND ITS AFFILIATES, LICENSORS AND SUPPLIERS DO NOT WARRANT THAT: (A) ANY INFORMATION WILL BE TIMELY, ACCURATE, RELIABLE OR CORRECT; (B) THE SERVICE WILL BE SECURE OR AVAILABLE AT ANY PARTICULAR TIME OR PLACE; (C) ANY DEFECTS OR ERRORS WILL BE CORRECTED; (D) THE SERVICE WILL BE FREE OF VIRUSES OR OTHER HARMFUL COMPONENTS; OR (E) ANY RESULT OR OUTCOME CAN BE ACHIEVED. USER’S USE OF THE SERVICE IS SOLELY AT ITS OWN RISK.'),
              bSpace(),
              headingText('10. LIMITATION OF LIABILITY.'),
              bSpace(),
              paragraphText(
                  'User agrees that Luna Enterprises shall not be responsible or liable for any material or data sent or received or not sent or received through the Service. User agrees that Luna Enterprises is not responsible or liable for any threatening, defamatory, obscene, offensive, illegal or other content or conduct of any third party or any infringement of another’s rights, including intellectual property rights.'),
              bSpace(),
              paragraphText(
                  'User agrees, in connection with any use of the Service: (a) to release Luna Enterprises (and its licensors and suppliers) from any and all claims, demands, damages and liabilities, of any type and nature, known and unknown, suspected and unsuspected, disclosed and undisclosed, arising out of or in any way connected with use of the Service by such User (including any disputes with other Users using the Service); and (b) to attempt to settle any disputes directly with such other User or other third party.'),
              bSpace(),
              paragraphText(
                  "IN NO EVENT SHALL Luna Enterprises (OR ITS AFFILIATES, LICENSORS AND SUPPLIERS) BE LIABLE CONCERNING ANY SUBJECT MATTER RELATED TO THE SERVICE REGARDLESS OF THE FORM OF CLAIM OR ACTION (WHETHER IN CONTRACT, NEGLIGENCE, STRICT LIABILITY OR OTHERWISE), FOR ANY (A) MATTER BEYOND ITS REASONABLE CONTROL, (B) LOSS OR INACCURACY OF DATA, LOSS OR INTERRUPTION OF USE, OR COST OF PROCURING SUBSTITUTE TECHNOLOGY, GOODS OR SERVICES, (C) INDIRECT, PUNITIVE, INCIDENTAL, RELIANCE, SPECIAL, EXEMPLARY OR CONSEQUENTIAL DAMAGES INCLUDING, BUT NOT LIMITED TO, LOSS OF BUSINESS, REVENUES, PROFITS OR GOODWILL, OR (D) DAMAGES, IN THE AGGREGATE, IN EXCESS OF AMOUNTS PAID TO Luna Enterprises BY USER (AND RETAINED BY Luna Enterprises HEREUNDER DURING THE PREVIOUS 12-MONTH PERIOD) OR US\$50.00, WHICHEVER IS GREATER, EVEN IF Luna Enterprises HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES. THESE LIMITATIONS ARE INDEPENDENT FROM ALL OTHER PROVISIONS OF THIS AGREEMENT AND SHALL APPLY NOTWITHSTANDING THE FAILURE OF ANY REMEDY PROVIDED HEREIN."),
              bSpace(),
              paragraphText(
                  'SOME STATES AND OTHER JURISDICTIONS DO NOT ALLOW THE EXCLUSION OR LIMITATION OF LIABILITY FOR INCIDENTAL OR CONSEQUENTIAL DAMAGES, SO THE ABOVE LIMITATIONS AND EXCLUSIONS MAY NOT APPLY TO YOU.'),
              bSpace(),
              headingText('11. INDEMNIFICATION.'),
              bSpace(),
              paragraphText(
                  'User agrees to (a) defend Luna Enterprises and its employees, contractors, officers, directors and representatives against any action or suit by a third party that arises out of any transaction with Luna Enterprises or another User in which User is involved, User’s use or misuse of the Service, or User’s breach of any of its representations, warranties or covenants under this Agreement and (b) indemnify Luna Enterprises for settlement amounts or damages, liabilities, costs and expenses (including reasonable attorneys’ fees) awarded and arising out of such a claim. Luna Enterprises reserves the right to assume the exclusive defense and control of any matter otherwise subject to indemnification by User, in which event User will assist and cooperate with Luna Enterprises in asserting any available defenses.'),
              bSpace(),
              headingText('12. INTERNATIONAL USE.'),
              bSpace(),
              paragraphText(
                  'Luna Enterprises makes no representation that the Service is appropriate or legally available for use in locations outside the United States, and accessing and using the Service is prohibited from territories where doing so would be illegal. Users that access the Service from other locations do so at their own initiative and are responsible for compliance with local laws.'),
              bSpace(),
              headingText('13. DISPUTES; CHOICE OF LAW AND FORUM.'),
              bSpace(),
              paragraphText(
                  'User and Luna Enterprises agree that any claim or cause o action arising out of or related to the Service must commence within one (1) year after the claim or cause of action arose; otherwise, such cause of action is permanently barred.'),
              bSpace(),
              paragraphText(
                  'The Terms of Use shall be governed by and construed in accordance with the laws of the State of Florida, excluding its conflicts of law rules, and the United States of America. In the event of any conflict between US and foreign laws, rules and regulations, US laws, rules and regulations shall govern. The United Nations Convention on Contracts for the International Sale of Goods shall not apply to the Terms of Use. User expressly agrees that the exclusive jurisdiction for any claim or action arising out of or relating to the Terms of Use or use of the Site or Service shall be in the state of Florida, USA, and User further agrees and submits to the exercise of personal jurisdiction of such courts for the purpose of litigating any such claim or action. Use of the Service is not authorized in any jurisdiction that does not give effect to all provisions of the Terms of Use, including without limitation, this section.'),
              bSpace(),
              paragraphText('14. INTEGRATION AND SEVERABILITY.'),
              bSpace(),
              paragraphText(
                  'The Terms of Use (including the Policies) are the entire agreement between User and Luna Enterprises with respect to access, use and operation of the Service, and supersede all prior or contemporaneous communications and proposals (whether oral, written or electronic) between User and Luna Enterprises with respect to the Service. If any provision of the Terms of Use is found to be unenforceable or invalid, that provision will be limited or eliminated to the minimum extent necessary so that the Terms of Use will otherwise remain in full force and effect and enforceable.'),
              bSpace(),
              headingText(
                  '15. RESERVATION OF RIGHTS; COPYRIGHT AND TRADEMARK.'),
              bSpace(),
              paragraphText(
                  'Any rights not expressly granted herein are reserved. Luna Enterprises.com™ is the trademark of Luna Enterprises The names and logos of companies and products mentioned in connection with the Service are the property of their respective owners.'),
              bSpace(),
              paragraphText(
                  'If you believe that material or content residing or accessible on the Service infringes your copyright, please send a notice of copyright infringement containing the following information to Luna Enterprises as specified below:'),
              nSpace(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    paragraphText(
                        '$bullet Specific identification of the aspect of the Service to which the notice pertains.'),
                    paragraphText(
                        '$bullet Identification of the work or material being infringed.'),
                    paragraphText(
                        '$bullet Identification of the material that is claimed to be infringing, including its location, with sufficient detail so that Luna Enterprises is capable of finding and verifying its existence.'),
                    paragraphText(
                        '$bullet Contact information about the notifying party (the Notifying Party), including name, address, telephone number and e-mail address.'),
                    paragraphText(
                        '$bullet A statement that the Notifying Party has a good faith belief that the material is not authorized by the copyright owner, its agent or law.'),
                    paragraphText(
                        '$bullet A statement made under penalty of perjury that the information provided in the notice is accurate and that the Notifying Party is authorized to make the complaint on behalf of the copyright owner.'),
                    paragraphText(
                        '$bullet The Notifying Party’s physical or electronic signature.'),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                ),
              ),
              headingText(
                  'Designated Agent to Receive Notification of Claimed Infringement.'),
              bSpace(),
              paragraphText(
                  'Luna Enterprises. \n1500 Highway A1A\nVero Beach, FL 32963\nUSA\nAttn: Copyright Policy'),
              bSpace(),
              headingText('16. GENERAL PROVISIONS.'),
              bSpace(),
              bSpace(),
              paragraphText(
                  'User may not assign, transferable or delegate any right of obligation under these Terms of Use. Any attempted assignment, transfer or delegation will be void. All waivers, consents and modifications must be in a writing signed by both parties, except as otherwise provided herein. No agency, partnership, joint venture, or employment relationship is created as a result of the Service or Terms of Use, and neither party has any authority of any kind to bind the other in any respect. All notices to Luna Enterprises under this Agreement will be in writing and deemed received: three days after being sent by certified or registered mail, return receipt requested, or next day after being sent by recognized overnight delivery service to the following address: 2125 Windward Way #210, Vero Beach, FL 32963'),
            ],
          ).addPadding(overall: 12),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
