spam_keyword("buy now").
spam_keyword("limited time").
spam_keyword("earn money").
spam_keyword("free gift").
spam_keyword("click here").
spam_keyword("unsubscribe").

suspicious_sender_domain("example.com").
suspicious_sender_domain("spammydomain.com").

lowercase(String, LowercaseString) :-
    string_lower(String, LowercaseString).

contains_spam_keyword(Email) :-
    spam_keyword(Keyword),
    sub_string(Email, _, _, _, Keyword).

contains_suspicious_domain(Email) :-
    suspicious_sender_domain(Domain),
    sub_string(Email, _, _, _, Domain).

is_spam(Email) :-
    lowercase(Email, LowercaseEmail),
    (contains_spam_keyword(LowercaseEmail) ; contains_suspicious_domain(LowercaseEmail)).

email_text("Congratulations! Congratulations!! Congratulations!!!  You've won a free gift. Click here to claim it now.").

:- initialization(main).
main :-
    email_text(EmailText),
    (is_spam(EmailText) -> writeln("This email is likely spam.") ; writeln("This email is not spam.")).
