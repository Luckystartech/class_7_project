class Review {
  const Review({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });

  final int rating;
  final String comment;
  final String date;
  final String reviewerName;
  final String reviewerEmail;

  factory Review.fromMap(Map<String, dynamic> map) {
    return Review(
      rating: map['rating'],
      comment: map['comment'],
      date: map['date'],
      reviewerName: map['reviewerName'],
      reviewerEmail: map['reviewerEmail'],
    );
  }

  Map<String, dynamic> toMap(Review review) {
    return {
      'rating': review.rating,
      'comment': review.comment,
      'date': review.date,
      'reviewerName': review.reviewerName,
      'reviewerEmail': review.reviewerEmail,
    };
  }

  @override
  String toString() {
    return 'Review(rating: $rating, comment: $comment, date: $date, reviewerName: $reviewerName, reviewerEmail: $reviewerEmail)';
  }
}
