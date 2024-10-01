class SurveyQuestions {
  final String question;
  final List<SurveryAnswer> answers;
  SurveyQuestions({
    required this.question,
    required this.answers,
  });
}

class SurveryAnswer {
  final String answer;
  final bool selectedAnswer;

  SurveryAnswer({
    required this.answer,
    required this.selectedAnswer,
  });
}

List askWhenBuyingLand = [
  SurveyQuestions(
    question:
        "Is the land currently zoned for the use you intend (residential, commercial, agricultural, etc.)?",
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question: "Are there any existing liens or encumbrances on the property?",
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question: "Has the land been surveyed recently?",
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question: "Are there any easements that affect the property?",
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question: "Is the land free of environmental hazards?",
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question: "Has the property been involved in any legal disputes?",
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question: "Is there access to utilities (water, electricity, sewage)?",
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question: "Are there any restrictions on building or land use?",
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question: "Is the land located in a flood zone?",
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question: "Are there ongoing maintenance fees or association dues?",
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question: "Has the property been appraised recently?",
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question: "Is there clear title to the property?",
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question: "Is the land accessible by a public road?",
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question: "Are there any zoning changes expected in the near future?",
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question: "Have you owned the land for more than five years?",
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question: "Is the land serviced by a reliable internet provider?",
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question: "Are there any known pests or wildlife issues on the property?",
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question:
        "Is the property part of any conservation or preservation easement?",
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question: "Have there been any recent property tax assessments?",
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question: "Is the land suitable for any type of construction?",
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
];
List newSurveyQuestions = [
  SurveyQuestions(
    question: 'What class is the property?',
    answers: [
      SurveryAnswer(answer: 'A', selectedAnswer: false),
      SurveryAnswer(answer: 'B', selectedAnswer: false),
      SurveryAnswer(answer: 'C', selectedAnswer: false),
      SurveryAnswer(answer: 'Other', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question: 'What type of building are you selling?',
    answers: [
      SurveryAnswer(answer: 'office', selectedAnswer: false),
      SurveryAnswer(answer: 'retail', selectedAnswer: false),
      SurveryAnswer(answer: 'industrial', selectedAnswer: false),
      SurveryAnswer(answer: 'multifamily', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question: 'Is the asking price based on a recent appraisal?',
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question: 'Is the current occupancy rate above 90%?',
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question: 'Do you have a detailed breakdown of operating expenses?',
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question:
        'Can you provide the last three years of financial statements for the property?',
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question:
        'Has the property shown consistent income over the past few years?',
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question: 'Are there existing leases in place for tenants?',
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question: 'Are the current leases longer than one year?',
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question: 'Is the property zoned for its current use?',
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question:
        'Have there been any major repairs or renovations in the last five years?',
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question:
        'Is the property free from significant past issues, such as environmental concerns?',
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question:
        'Are there any upcoming assessments or special taxes anticipated?',
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question:
        'Is the local market trending positively for commercial properties?',
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question: 'Is there a specific reason for selling the property?',
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question: 'Are there any ongoing legal disputes related to the property?',
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question: 'Has the property been on the market for less than six months?',
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question: 'Are there specific terms of sale that could be negotiated?',
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question: 'Are there any hidden fees or costs associated with the sale?',
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question: 'Can I see a clean title report for the property?',
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question: 'Has regular maintenance been performed on the property?',
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question:
        'Is there potential for property appreciation in the near future?',
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question: 'Can you provide the T12 financial statement?',
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question: 'Does the T12 show significant seasonal fluctuations in income?',
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question: 'Are there any anomalies in the T12 that raise concerns?',
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question: 'Can you explain notable increases in expenses on the T12?',
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question: 'Is the T12 performance consistent with previous years?',
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question: 'Can I see the detailed P&L statement for the last few years?',
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question: 'Are the primary revenue sources clearly outlined in the P&L?',
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question: "Are there any one-time expenses in the P&L that won't recur?",
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question: "Is the P&L updated on a monthly basis?",
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question:
        "Are adjustments necessary to accurately reflect the property's profitability?",
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question: "Do you know the current cap rate for this property?",
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question: "Is the cap rate based on the most recent financial data?",
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question: "Is the cap rate in line with similar properties in the area?",
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question: "Has the cap rate changed significantly in the past year?",
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question: "Is the cap rate reflective of the property’s current income?",
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question: "Do you expect the cap rate to improve in the near future?",
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question:
        "Are there any factors that could impact the cap rate negatively?",
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question:
        "Is the cap rate calculated using a conservative estimate of expenses?",
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question:
        "Have you adjusted the cap rate for any potential risks or vacancies?",
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question:
        "Is the cap rate competitive compared to market averages for this type of property?",
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question: "Are you open to seller financing options?",
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question: "Would you consider profit-sharing options as part of the sale?",
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question:
        "Instead of a real estate transaction, would you consider selling the legal entity that owns the real estate?",
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question:
        "Instead of a real estate transaction, would you consider selling the legal entity that owns the real estate?",
    answers: [
      SurveryAnswer(answer: 'Yes', selectedAnswer: false),
      SurveryAnswer(answer: 'No', selectedAnswer: false),
    ],
  ),
  SurveyQuestions(
    question: "For example, would you be open to discussing options such as:",
    answers: [
      SurveryAnswer(
          answer:
              'UCC (Uniform Commercial Code) filings that may affect the entity?',
          selectedAnswer: false),
      SurveryAnswer(
          answer:
              'Existing operating agreements that outline ownership and management structures?',
          selectedAnswer: false),
      SurveryAnswer(
          answer:
              'Any outstanding loans or liens that may be tied to the entity?',
          selectedAnswer: false),
      SurveryAnswer(
          answer:
              'Tax implications for transferring ownership of the legal entity?',
          selectedAnswer: false),
      SurveryAnswer(
          answer: 'Indemnity agreements that could impact liability?',
          selectedAnswer: false),
    ],
  ),
];
