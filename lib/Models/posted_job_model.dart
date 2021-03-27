class PostedJob {
  String title;
  String detail;
  String location;
  int offers;
  String imageUrl;
  String status;
  String budget;

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
      title: 'electrician  needed',
      detail: 'Need a electrician  for single room wiring',
      location: 'I-14 Islamabad,',
      offers: 5,
      imageUrl: 'assets/jobimages/job.jpg',
      status: 'Open',
      budget: '2,000'),
  PostedJob(
      title: 'electrician  needed',
      detail: 'need a electrician  for single room wiring',
      location: 'I-14 Islamabad,',
      offers: 8,
      imageUrl: 'assets/jobimages/jobdetail1.jpg',
      status: 'Open',
      budget: '2,000'),
  PostedJob(
      title: 'electrician  needed',
      detail: 'need a electrician  for single room wiring',
      location: 'I-14 Islamabad,',
      offers: 10,
      imageUrl: 'assets/jobimages/jobimg3.jpg',
      status: 'Open',
      budget: '2,000'),
  PostedJob(
      title: 'electrician  needed',
      detail: 'need a electrician  for single room wiring',
      location: 'I-14 Islamabad,',
      offers: 6,
      imageUrl: '',
      status: 'Open',
      budget: '2,000'),
  PostedJob(
      title: 'electrician  needed',
      detail: 'need a electrician  for single room wiring',
      location: 'I-14 Islamabad,',
      offers: 6,
      imageUrl: '',
      status: 'Assigned',
      budget: '2,000'),
  PostedJob(
      title: 'electrician  needed',
      detail: 'need a electrician  for single room wiring',
      location: 'I-14 Islamabad,',
      offers: 9,
      imageUrl: '',
      status: 'Assigned',
      budget: '2,000'),
];
