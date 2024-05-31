# Assignment 1: Design a Logical Model

## Question 1
Create a logical model for a small bookstore. 📚

At the minimum it should have employee, order, sales, customer, and book entities (tables). Determine sensible column and table design based on what you know about these concepts. Keep it simple, but work out sensible relationships to keep tables reasonably sized. Include a date table. There are several tools online you can use, I'd recommend [_Draw.io_](https://www.drawio.com/) or [_LucidChart_](https://www.lucidchart.com/pages/).

## Question 2
We want to create employee shifts, splitting up the day into morning and evening. Add this to the ERD.

## Question 3
The store wants to keep customer addresses. Propose two architectures for the CUSTOMER_ADDRESS table, one that will retain changes, and another that will overwrite. Which is type 1, which is type 2?

_Hint, search type 1 vs type 2 slowly changing dimensions._

Bonus: Are there privacy implications to this, why or why not?
```
Type 1 architecture will overwrite changes and Type 2 architecture will retain changes.

Yes, there are some privacy implications, e.g.:

Sensitive Information: 
Customer addresses are considered sensitive personal information. 
Storing this data without proper security measures could lead to unauthorized access or misuse, potentially compromising customer privacy.

Risk of Data Breaches: 
Storing personal information like addresses increases the risk of data breaches. 
If the bookstore's database is hacked or accessed by unauthorized parties, customer addresses could be exposed, leading to identity theft, fraud, or other malicious activities.

Legal Compliance: 
Depending on the jurisdiction, there may be legal requirements regarding the storage and protection of personal information, including addresses. 
Failure to comply with these regulations could result in legal consequences for the bookstore.

Customer Trust: 
Customers expect businesses to handle their personal information responsibly. 
If a customer learns that their address has been mishandled or compromised, it can erode trust in the bookstore and damage its reputation.
```

## Question 4
Review the AdventureWorks Schema [here](https://i.stack.imgur.com/LMu4W.gif)

Highlight at least two differences between it and your ERD. Would you change anything in yours?
```
The AdventureWorks Shema is obviously more advanced, I see a lot of improvements that can be done in my ERD, e.g.:

Apply 3NF to reduce the duplication of data in customer address (create city/street tables) and books (create author and publishing house tables)

Since the bookstore in this assignment is small I do not think that we need Human Resorces department and tables related to that, but we may use this for bigger businesses

I would add an option to store customers and employees email addresses and phone numbers.

I would add more information about bookstore supliers.

```

# Criteria

[Assignment Rubric](./assignment_rubric.md)

# Submission Information

🚨 **Please review our [Assignment Submission Guide](https://github.com/UofT-DSI/onboarding/blob/main/onboarding_documents/submissions.md)** 🚨 for detailed instructions on how to format, branch, and submit your work. Following these guidelines is crucial for your submissions to be evaluated correctly.

### Submission Parameters:
* Submission Due Date: `June 1, 2024`
* The branch name for your repo should be: `model-design`
* What to submit for this assignment:
    * This markdown (design_a_logical_model.md) should be populated.
    * Two Entity-Relationship Diagrams (preferably in a pdf, jpeg, png format).
* What the pull request link should look like for this assignment: `https://github.com/<your_github_username>/sql/pull/<pr_id>`
    * Open a private window in your browser. Copy and paste the link to your pull request into the address bar. Make sure you can see your pull request properly. This helps the technical facilitator and learning support staff review your submission easily.

Checklist:
- [ ] Create a branch called `model-design`.
- [ ] Ensure that the repository is public.
- [ ] Review [the PR description guidelines](https://github.com/UofT-DSI/onboarding/blob/main/onboarding_documents/submissions.md#guidelines-for-pull-request-descriptions) and adhere to them.
- [ ] Verify that the link is accessible in a private browser window.

If you encounter any difficulties or have questions, please don't hesitate to reach out to our team via our Slack at `#cohort-3-help`. Our Technical Facilitators and Learning Support staff are here to help you navigate any challenges.
