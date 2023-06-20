export default function Confirmation() {
  return (
    <div className="confirmation">
      <h1 className="hidden">Confirmation</h1>
      <img src="../../../assets/img/submitted.svg" alt="submitted image" />
      <div className="confirmation-text">
        <p>Your request has been sent!</p>
        <p>
          We’ll be in contact with you soon after we have reviewed your request!
        </p>
        <a href=".">Go back home</a>
      </div>
    </div>
  );
}
