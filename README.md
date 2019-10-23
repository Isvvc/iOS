# iOS

## Introduction

Every parent knows the struggle of getting their kids to consistently and meaningfully contribute to the household chores. If you are tired of the exhorbitant allowance demands, half-done chores, and dubious claims that "I can't put that away because I don't know where it goes!" or "Johnny's parents are better than you because they don't make him do chores...", then ChoreTracker is the tool you have been waiting for. With ChoreTracker, it's easy to get your kids excited about chores with our "gamified" approach to household chore tracking and management. Easily create a list of chores (or use one of our templates) and then randomly assign them to your children. Foster healthy competition and habits with ChoreScore and CleanStreaks: our proprietary chore rating and tracking tools that have been (un)scientifically proven to be 100% more effecitve than side-eye and time-outs. Create accountability with  ChoreCheck - never again find that 6 month old lost banana rotting behind your precious little angel's nightstand. By requiring a photo of the completed chore to be uploaded, you decide if that chore is actually completed or not. 

**With ChoreTracker in their corner, parents can effortlessly turn household chores from "bore" into "score!"**

---

## Instructions

Please fork and clone this repository.

---

## API Documentation

The base URL for this API is https://home-chore-tracker88.herokuapp.com

--- 

### Log In

**Endpoint:** `/api/auth/login`

**Method:** `POST`

**Description:**
After creating a user, you may log in to the API using the same credentials as you used to sign up.

``` JSON
{
    "username": "CiaratheCodingQueen",
    "password": "password123"
}
```

#### Success Response

**Code:** `200 OK` or `201 OK`

--- 

## Frameworks

[SwiftLint](https://github.com/realm/SwiftLint)<br/>
[Alamofire](https://github.com/Alamofire/Alamofire)

---

## Authors
[Ciara Beitel](https://github.com/LadyBeitel)<br/>
[Isaac Lyons](https://github.com/Isvvc)<br/>
[Jerry Haaser](https://github.com/JerryHaaser)

---

## Misc.

This project was create by Lambda iOS Students to display knowledge of networking basics and core data. 
Students demonstrated team work and creative skills to colloborate with each other to build a cohesive app. 

