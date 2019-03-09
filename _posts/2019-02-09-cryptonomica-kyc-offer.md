---
layout: post
title:  "Cryptonomica identity verification"
date:   2019-02-09 19:11:00 +0200
categories: cryptonomica kyc offer
---

<!-- MarkdownTOC -->

- [Why it's better than to manage own identity verification procedure](#why-its-better-than-to-manage-own-identity-verification-procedure)
- [How it works](#how-it-works)
- [Cryptonomica user identification procedure](#cryptonomica-user-identification-procedure)
	- [Step 0](#step-0)
	- [Step 1](#step-1)
	- [Step 2](#step-2)
	- [Step 3](#step-3)
	- [Step 4](#step-4)
	- [Step 5](#step-5)
	- [Step 6](#step-6)
- [How our API works](#how-our-api-works)
- [Optional Ethereum address verification](#optional-ethereum-address-verification)
- [Security and scalability](#security-and-scalability)
- [Recognition](#recognition)

<!-- /MarkdownTOC -->

[Cryptonomica](https://cryptonomica.net) offers user identity verification (for [KYC](https://en.wikipedia.org/wiki/Know_your_customer) etc.) for services such as banks, exchanges, financial companies, payment institutions.  

# Why it's better than to manage own identity verification procedure 

1) It's free for your service. 

2) It's managed by experienced lawyers. We also have [CIPP/E](https://iapp.org/certify/cippe/) certified Data Protection Officer. 

3) It can be easily and fast (in one evening) connected to your service 

4) It is more convenient for the user, eliminates the need to re-pass verification on different services 

5) It also can be used to sign and/or encrypt electronic documents sent to/from user. 

5) It can be used along with other verification/KYC methods/providers. 

# How it works 

You request our API for user data using user's key fingerprint provided by user. 

If user is not yet verified on Cryptonomica, you provide him/her link for verification with promocode (discount) for verification. 

# Cryptonomica user identification procedure 

Cryptonomica provides the most advanced online identity verification procedure on the market. More reliable than the one usually held when opening a bank account.

## Step 0

User has to log in to Cryptonomica [webapp](https://cryptonomica.net) with Google account (any email can be used to create Google account) 
Cryptonomica saves user email, google id, IP, browser and OS information. 

## Step 1

User has to provide two personal identifications documents. 
First: passport, this have to be passport with information on English. 
Second: another document containing a photo, first and last name in English and birth date, usually driving license. 
Documents have to be in color, and in good quality.

## Step 2

User records short video, where he/she reads provided verification text. 

## Step 3

Mobile phone number verification. User puts his/her phone number in international format into form, and sends to server. Than user receives sms-message with code in it and has to provide this code to proceed with verification.

## Step 4

User pays for verification with the credit/debit card with the same first and last name as in account (and as in passport). 
Credit/debit card data are processed by [Stripe](https://stripe.com), Cryptonomica does not receive an do not store card number and cvc/cvv. 
But Cryptonomica receive from Stripe and store last 4 numbers of card number, card exp. date, card holder's name, type of the card, billing address, issuing bank.

## Step 5

User has to check his/her credit card bank statement and to find description of the charge for key verification, it looks like: 'CRYPTONOMICA 6691170'. 
The last 7 digits is unique code that user has to enter in form on Cryptonomica website to prove that he/she is the legitimate owner of the credit card. 

## Step 6

All entered and recorded information has to be manually verified by Cryptonomica compliance officer. 
Compliance officer may ask user to provide additional verification data and/or short video-conference call via [Discord](https://discordapp.com), [Skype](https://www.skype.com) or other program for video-conferences. 

User's first and last name, birthdate, nationality, email and public key certificate will be published on Cryptonomica website and accessible for other users and services that use Cryptonomica API. 
Services approved by Cryptonomica can also obtain user's mobile phone number. 

Other data (such as scans of the documents, video, user IP address) entered in the verification process will not be published publicly, these data will be available only to: 1) employees of Cryptonomica Ltd. or persons having a service contract with the Cryptonomica Ltd, and only when it's necessary to ensure data validation and security 2) accredited notaries, 3) arbitrators of the arbitration court when resolving disputes involving a person whose key was verified. User can also grant access to this data to another registered user (witch also may represent financial or other regulated institution)

# How our API works 

Our API works on [Google Cloud Endpoints](https://cryptonomica-server.appspot.com/_ah/api/explorer).

1) We register you service and you receive serviceName (login) and apiKeyString (password) for access to our API

2) You send HTTP GET request like this : 

```sh

curl -X GET \
-H "serviceName:${serviceName}" \
-H "apiKeyString:${apiKeyString}" \
'https://cryptonomica-server.appspot.com/
_ah/api/pgpPublicKeyAPI/v1/getPGPPublicKeyByFingerprintWithApiKey
?fingerprint=05600EB8208485E6942666E06A7B21E2844C7980'

```

3) You'll get JSON with public key certificate data, like this:

```json
	
{
"fingerprint": "05600EB8208485E6942666E06A7B21E2844C7980",
"cryptonomicaUserId": "117669463418304639493",
"keyID": "[0x844C7980]",
"userID": "Viktor Ageyev <ageyev@international-arbitration.org.uk>; ",
"firstName": "Viktor",
"lastName": "Ageyev",
"userEmail": "ageyev@international-arbitration.org.uk",
"created": "2017-01-12T18:10:10.000Z",
"exp": "2019-01-12T10:00:00.000Z",
"bitStrength": 2048,
"asciiArmored":
 "-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: GnuPG v2

mQENBFh3xoIBCAC5X05PdGXugxPP30G9YxcEBXes6o5GdboltS+tXcSm4iXPmhKZ
pEHn5ibvbfINWSTy36/+ezCi20Mt8D493tXX0ngY4m4k8bvIaX7aKvNOQAEbYrha
yODz7Xd4eaBY1hAbQnTY6dKKuHTP7zL8RhLwD9/rlKmVzEYiznVecNvJOtVHNbrm
xNlZb/DfxcNcTrzISFG9AVVWd7RvDS/GIrEZ2a92a6kwWHrlA8wf97VhyyLwHIij
XG2wTiJ67ZP7ZNKNABJcIscBpB/jC1LdnVNEosdlE9+xSQLIQDv6tfm/xS9KfbPz
J30cxYgtK3nvwm3OFR5R9JfA8dVgY28H20/pABEBAAG0N1Zpa3RvciBBZ2V5ZXYg
PGFnZXlldkBpbnRlcm5hdGlvbmFsLWFyYml0cmF0aW9uLm9yZy51az6JAT0EEwEI
ACcFAlh3xoICGyMFCQPB9B4FCwkIBwIGFQgJCgsCBBYCAwECHgECF4AACgkQansh
4oRMeYA8DAf5AUwxQ1x/pfgWZnzJHVCksEPneKp4AGF0dzWXV61yvy7DqD+/jmct
+xCAAYDO45t/YFnQy0fmHucn6q6u23DOTSHW/ct6V6yUi3q6G/shuZEsAgeXHCSd
zN1hKQhrs44fe7DxwSh5oO1iGZrwkcp25P+XaCb+B28PceLfWyptztWZjuSI1jxM
SyCMxSiFrpLNx4c8834lcbDh7PigvSI8H4Efr8UBr8nE/SKKrsmOLEuAIAV1DtR6
hvJSKV12kumA14Tbk77ffyllxVkTr2USrD3ovr4WYHZQRIUVampo1Uom1HN+guM8
v/O5KEzB5wEfwBXgvse57i5XfbgAIgTAn7kBDQRYd8aCAQgAtU51JM5D3l0q1H1l
fupw+CgwqR3cRmi3J5aaRYC7sW4H8cASHoqe7LsJmPYHs565S1yX8rlA54kLGP0G
/pwDF6ukWclQXU7UhrUruU25zU6JPgmz8ObWgrgc0JS0Z9hzUg7rdJ2+Vy78rUkG
PxZVYUeQpKR0tTtVknY+LIFo50xeH9TLyLZ0QqjoTLC/6BZHVUJOOSLJzv2rHt8P
jifa+NtoxnSKNgu/k+4HstAn1XFf6Hkz5Y6XF/5NuqAntM9ob7IfWCrSZ8qvHqzj
rlaD6ikcMt/Q1QBLjEOuKqvJddrogSZ8PFF3fuNTwMePySaX3Nq/9+fk0EIgOkT4
us0I7QARAQABiQElBBgBCAAPBQJYd8aCAhsMBQkDwfQeAAoJEGp7IeKETHmAIGsH
/3buCvMuX3e2j/HXpGNtcoBJE+cNmxkbjjxcNRu6ioVJ5hpO5aqNTXYAafXuaEt5
twQA+rPqotgYvOioIYNSyVCluxPpIK92/Cxlj8N2QniF1FnjG3l2yG/h8zNKQTP1
d4F5TSmiewKIEQgb2lTnDLnnNz6flLQ71Jwpa8XwLd8gQaJapIinBFvanDSVmZq1
3MukTV22SGUYnPQfd28wOnu9+fhb5/wN2+0zaNMi7eCaPfYrLb+7osI69fTyMNvt
DbmbGxVhGD512HMHXuyUq6ImCN9CBW34eEALDvI1tu6HVegtSYOQKCnhNv/OxvYS
R1JKhyWR4/TAV0FCVqUVy20=
=QR1p
-----END PGP PUBLIC KEY BLOCK-----",
"nationality": "IL",
"verifiedOffline": true,
"verifiedOnline": false
}
	
```

We also provide simple API to generate promo codes with discounts for your users: 

You send HTTP POST request: 

````sh

curl -H "Content-Type: application/json" \
 -X POST -H "serviceName:${serviceName}" -H "apiKeyString:${apiKeyString}" \
'https://cryptonomica-server.appspot.com/_ah/api/stripePaymentsAPI/v1/createPromoCodeWithApiKey'

````

receive JSON: 

````json
	
{
"promoCode":"tv5EbZbskf3",
"discountInPercent": 50
}
	
````

and provide to user link like: https://www.cryptonomica.net/#!/promocode/ +${promoCode}

You can use webhooks to be notified about key revocation revocation. 

See how it implemented on: [stex.com](https://www.stex.com)

# Optional Ethereum address verification

Optionally user can verify itself as an owner of an address on the Ethereum blockchain, to use it in smart contracts and verified payments. 

You can obtain user information directly from [our smart contract](https://etherscan.io/address/0x846942953c3b2A898F10DF1e32763A823bf6b27f#readContract) using your smart contract, [Metamask](https://metamask.io/), [web3.js
](https://github.com/ethereum/wiki/wiki/JavaScript-API), [web3j](https://web3j.io) etc.

See how it implemented in [SONM](https://sonm.com) service: [docs.sonm.com/how-to/how-to-pass-kyc-by-cryptonomica](https://docs.sonm.com/how-to/how-to-pass-kyc-by-cryptonomica)

# Security and scalability

Our service works on [Google App Engine](https://cloud.google.com/appengine/), all data stored on [Google Cloud Datastore](https://cloud.google.com/datastore/), video and image files stored on [Google Cloud Storage](https://cloud.google.com/storage/). We use google login system, the same that used by Gmail, Youtube and others. This ensures maximum security and scalability. 
(We are alumni of [Google Launchpad TLV](https://developers.google.com/programs/launchpad/) and supported by [Google Cloud Startup Program](https://cloud.google.com/developers/startups/)) 

# Recognition 

Cryptonomica was selected as one of the world’s best legal innovations and supported by [The Hague Institute for Innovation of Law](http://www.hiil.org)

Cryptonomica is a member of [Oracle Scaleup Ecosystem](https://www.oracle.com/startup/), [Startup with IBM Program](https://developer.ibm.com/startups/) and supported by [Amazon Activate for Startups](https://aws.amazon.com/activate/)
