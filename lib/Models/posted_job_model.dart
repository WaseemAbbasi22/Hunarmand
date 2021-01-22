class PostedJob {
  final String title;
  final String detail;
  final String location;
  final int offers;
  final String imageUrl;
  final String status;
  final String budget;

  PostedJob(
      {this.title,
      this.detail,
      this.location,
      this.offers,
      this.imageUrl,
      this.status,
      this.budget});
}

var posted_job = [
  PostedJob(
      title: 'electracian needed',
      detail: 'Need a electracian for single room wiring',
      location: 'i-14 Islamabad',
      offers: 5,
      imageUrl: 'assets/jobimages/job.jpg',
      status: 'Open',
      budget: '2,000'),
  PostedJob(
      title: 'electracian needed',
      detail: 'need a electracian for single room wiring',
      location: 'i-14 Islamabad',
      offers: 8,
      imageUrl: 'assets/jobimages/jobdetail1.jpg',
      status: 'Open',
      budget: '2,000'),
  PostedJob(
      title: 'electracian needed',
      detail: 'need a electracian for single room wiring',
      location: 'i-14 Islamabad',
      offers: 10,
      imageUrl: 'assets/jobimages/jobimg3.jpg',
      status: 'Open',
      budget: '2,000'),
  PostedJob(
      title: 'electracian needed',
      detail: 'need a electracian for single room wiring',
      location: 'i-14 Islamabad',
      offers: 6,
      imageUrl: '',
      status: 'Open',
      budget: '2,000'),
  PostedJob(
      title: 'electracian needed',
      detail: 'need a electracian for single room wiring',
      location: 'i-14 Islamabad',
      offers: 6,
      imageUrl: '',
      status: 'Assigned',
      budget: '2,000'),
  PostedJob(
      title: 'electracian needed',
      detail: 'need a electracian for single room wiring',
      location: 'i-14 Islamabad',
      offers: 9,
      imageUrl: '',
      status: 'Assigned',
      budget: '2,000'),
];
