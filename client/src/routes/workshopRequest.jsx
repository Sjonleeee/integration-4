import { Form } from "react-router-dom";
import Button from "../components/Button.jsx";
import { submitRequest } from "../js/designs.js";
import { useNavigate } from "react-router-dom";

export const action = async ({ request }) => {
  console.log("Submit action");
  const formData = await request.formData();
  const updates = Object.fromEntries(formData);
  const result = await submitRequest(updates);
  console.log(result);
  return result;
};

export default function WorkshopRequest() {
  const navigate = useNavigate();
  const handleSubmit = async () => {
    await submitRequest();
    // navigate("/workshops/request/confirmation");
  };
  return (
    <div className="request">
      <h1 className="hidden">Workshop Request</h1>
      <div className="request-deco">
        <img src="" alt="" />
        <p>Request...</p>
      </div>
      <div className="request-info">
        <p>Fill in the form to get in contact!</p>
        <p>
          We’ll review your request and get in contact with you as soon as
          possible
        </p>
      </div>
      <Form className="request-form" method="post" onSubmit={handleSubmit}>
        <div className="form-one">
          <p>General info</p>
          <label htmlFor="companyName">Company Name</label>
          <input type="text" id="companyName" name="title" />
          <label htmlFor="companyEmail">Company Email</label>
          <input type="email" id="companyEmail" name="companyMail" />
          <label htmlFor="companyPhone">Company Phone</label>
          <input type="tel" id="companyPhone" name="companyTelephone" />
          <label htmlFor="companyAddress">Your Address</label>
          <input type="text" id="companyAddress" name="companyAdres" />
          <label htmlFor="companyPostal">Postal Code + City</label>
          <input type="text" id="companyPostal" name="companyPostcode" />
          <label htmlFor="companyCountry">Country</label>
          <input type="text" id="companyCountry" name="companyCountry" />
          <Button></Button>
        </div>
        <div className="form-two">
          <p>Practical info</p>
          <label htmlFor="requestDate">Preferred date for workshop</label>
          <input type="date" id="requestDate" name="requestDate" />
          <p>Duration</p>
          <input
            type="radio"
            id="requestDate-option"
            name="requestDuration"
            value="2"
          />
          <label htmlFor="requestDuration">2 hours</label>
          <input
            type="radio"
            id="requestDate-option"
            name="requestDuration"
            value="2"
          />
          <label htmlFor="requestDuration">4 hours</label>
          <label htmlFor="requestAmount">Amount of people attending</label>
          <input type="number" id="requestAmount" name="requestAmount" />
          <Button></Button>
          <button type="submit">Submit request</button>
        </div>
      </Form>
    </div>
  );
}
