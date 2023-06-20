import { Form } from "react-router-dom";
import Button from "../components/Button.jsx";
import { submitRequest } from "../js/designs.js";
import { useNavigate } from "react-router-dom";
import { useState } from "react";

export const action = async ({ request }) => {
  console.log("Submit action");
  const formData = await request.formData();
  console.log(formData);
  const updates = Object.fromEntries(formData);
  const result = await submitRequest(updates);

  if (result) {
    window.location.href = "request/confirmation";
  }

  return result;
};

export default function WorkshopRequest() {
  const [secondStep, setSecondStep] = useState(false);

  const handleSecondStep = () => {
    setSecondStep(!secondStep);
  };

  return (
    <div className="request">
      <h1 className="hidden">Workshop Request</h1>
      <div className="mobile-hidden request-deco ">
        <img src="../../assets/img/requestpage.jpg" alt="" />
        <p>Requesting...</p>
      </div>
      <div className="request-info">
        <p>Fill in the form to get in contact!</p>
        <p>
          We’ll review your request and get in contact with you as soon as
          possible
        </p>
      </div>
      <Form className="request-form" method="post">
        <div className="form-one">
          <p>General info</p>
          <label htmlFor="companyName">Name</label>
          <input
            type="text"
            id="companyName"
            name="title"
            required
            onChange={(e) => {
              console.log(e.target);
              if (e.target.value.length < 4) {
                e.target.style.border = "1px solid red";
                e.target.nextElementSibling.style.color = "red";
                e.target.nextElementSibling.innerHTML = "Fill in your name";
              } else {
                e.target.style.border = "1px solid var(--color-black)";
                e.target.nextElementSibling.style.color = "var(--color-black)";
                e.target.nextElementSibling.innerHTML = "";
              }
            }}
          />
          <p></p>
          <label htmlFor="companyEmail">Email</label>
          <input
            type="email"
            id="companyEmail"
            name="companyMail"
            required
            onChange={(e) => {
              console.log(e.target);
              if (e.target.value.length < 4 || !e.target.value.includes("@")) {
                e.target.style.border = "1px solid red";
                e.target.nextElementSibling.style.color = "red";
                e.target.nextElementSibling.innerHTML =
                  "Fill in a valid email address";
              } else {
                e.target.style.border = "1px solid var(--color-black)";
                e.target.nextElementSibling.style.color = "var(--color-black)";
                e.target.nextElementSibling.innerHTML = "";
              }
            }}
          />
          <p></p>
          <label htmlFor="companyPhone">Phone number</label>
          <input
            type="tel"
            id="companyPhone"
            name="companyTelephone"
            required
            onChange={(e) => {
              console.log(e.target);
              if (e.target.value.length < 4) {
                e.target.style.border = "1px solid red";
                e.target.nextElementSibling.style.color = "red";
                e.target.nextElementSibling.innerHTML =
                  "Add a valid phone number";
              } else {
                e.target.style.border = "1px solid var(--color-black)";
                e.target.nextElementSibling.style.color = "var(--color-black)";
                e.target.nextElementSibling.innerHTML = "";
              }
            }}
          />
          <p></p>
          <label htmlFor="companyAddress">Your Address</label>
          <input type="text" id="companyAddress" name="companyAdres" required />
          <div className="two-fields">
            <div className="postal">
              <label htmlFor="companyPostal">Postal Code + City</label>
              <input
                type="text"
                id="companyPostal"
                name="companyPostcode"
                required
                onChange={(e) => {
                  console.log(e.target);
                  const pattern = /\d/g;

                  if (
                    e.target.value.length < 4 ||
                    !e.target.value.includes(",") ||
                    !e.target.value.match(pattern)
                  ) {
                    e.target.style.border = "1px solid red";
                    e.target.nextElementSibling.style.color = "red";
                    e.target.nextElementSibling.innerHTML = "Postal code, city";
                  } else {
                    e.target.style.border = "1px solid var(--color-black)";
                    e.target.nextElementSibling.style.color =
                      "var(--color-black)";
                    e.target.nextElementSibling.innerHTML = "";
                  }
                }}
              />
              <p></p>
            </div>
            <div className="country">
              <label htmlFor="companyCountry">Country</label>
              <input
                type="text"
                id="companyCountry"
                name="companyCountry"
                required
                onChange={(e) => {
                  console.log(e.target);
                  if (e.target.value.length < 4) {
                    e.target.style.border = "1px solid red";
                    e.target.nextElementSibling.style.color = "red";
                    e.target.nextElementSibling.innerHTML =
                      "Enter a valid country";
                  } else {
                    e.target.style.border = "1px solid var(--color-black)";
                    e.target.nextElementSibling.style.color =
                      "var(--color-black)";
                    e.target.nextElementSibling.innerHTML = "";
                  }
                }}
              />
              <p></p>
            </div>
          </div>
          <div onClick={handleSecondStep} className="button-primary">
            Practical info
            <svg
              width="41"
              height="15"
              viewBox="0 0 41 15"
              fill="none"
              xmlns="http://www.w3.org/2000/svg"
            >
              <path
                d="M1 6.5C0.447715 6.5 0 6.94772 0 7.5C0 8.05228 0.447715 8.5 1 8.5V6.5ZM40.2071 8.20711C40.5976 7.81658 40.5976 7.18342 40.2071 6.79289L33.8431 0.428932C33.4526 0.0384078 32.8195 0.0384078 32.4289 0.428932C32.0384 0.819457 32.0384 1.45262 32.4289 1.84315L38.0858 7.5L32.4289 13.1569C32.0384 13.5474 32.0384 14.1805 32.4289 14.5711C32.8195 14.9616 33.4526 14.9616 33.8431 14.5711L40.2071 8.20711ZM1 8.5H39.5V6.5H1V8.5Z"
                fill="#101010"
              />
            </svg>
          </div>
        </div>
        <div className="form-two">
          <p>Practical info</p>
          <label className="workshop-date" htmlFor="requestDate">
            Preferred date for workshop
          </label>
          <br />
          <input
            type="date"
            id="requestDate"
            name="requestDate"
            required
            onChange={(e) => {
              console.log(e.target);
              if (e.target.value.length < 0) {
                e.target.style.border = "1px solid red";
                e.target.nextElementSibling.style.color = "red";
                e.target.nextElementSibling.innerHTML = "Choose a date";
              } else {
                e.target.style.border = "1px solid var(--color-black)";
                e.target.nextElementSibling.style.color = "var(--color-black)";
                e.target.nextElementSibling.innerHTML = "";
              }
            }}
          />
          <p></p>
          <p>Duration</p>
          <input
            type="radio"
            id="requestDate-option"
            name="requestDuration"
            value="2"
            required
          />
          <label htmlFor="requestDuration">2 hours</label>
          <input
            type="radio"
            id="requestDate-option"
            name="requestDuration"
            value="2"
            required
          />
          <label htmlFor="requestDuration">4 hours</label>
          <p id="duration_error"></p>
          <br />
          <label htmlFor="requestAmount">Amount of people attending</label>
          <br />
          <input
            type="number"
            id="requestAmount"
            name="requestAmount"
            min="10"
            max="50"
            required
            onChange={(e) => {
              const amount = Number(e.target.value);
              console.log(amount);
              if (amount < 10 || amount > 50) {
                e.target.style.border = "1px solid red";
                e.target.nextElementSibling.style.color = "red";
                e.target.nextElementSibling.innerHTML =
                  "Enter a value between 10 and 50";
              } else {
                e.target.style.border = "1px solid var(--color-black)";
                e.target.nextElementSibling.style.color = "var(--color-black)";
                e.target.nextElementSibling.innerHTML = "";
              }
            }}
          />
          <p></p>
          <div onClick={handleSecondStep} className="button-primary">
            <svg
              width="41"
              height="15"
              viewBox="0 0 41 15"
              fill="none"
              xmlns="http://www.w3.org/2000/svg"
            >
              <path
                d="M39.5 8.5C40.0523 8.5 40.5 8.05228 40.5 7.5C40.5 6.94772 40.0523 6.5 39.5 6.5V8.5ZM0.292892 6.79289C-0.0976295 7.18342 -0.0976295 7.81658 0.292892 8.20711L6.65685 14.5711C7.04738 14.9616 7.68054 14.9616 8.07107 14.5711C8.46159 14.1805 8.46159 13.5474 8.07107 13.1569L2.41422 7.5L8.07107 1.84315C8.46159 1.45262 8.46159 0.819457 8.07107 0.428932C7.68054 0.0384078 7.04738 0.0384078 6.65685 0.428932L0.292892 6.79289ZM39.5 6.5H1V8.5H39.5V6.5Z"
                fill="#101010"
              />
            </svg>
            General info
          </div>
          <div className="button-secondary">
            <button type="submit">Submit request</button>
            <svg
              width="41"
              height="15"
              viewBox="0 0 41 15"
              fill="none"
              xmlns="http://www.w3.org/2000/svg"
            >
              <path
                d="M1 6.5C0.447715 6.5 0 6.94772 0 7.5C0 8.05228 0.447715 8.5 1 8.5V6.5ZM40.2071 8.20711C40.5976 7.81658 40.5976 7.18342 40.2071 6.79289L33.8431 0.428932C33.4526 0.0384078 32.8195 0.0384078 32.4289 0.428932C32.0384 0.819457 32.0384 1.45262 32.4289 1.84315L38.0858 7.5L32.4289 13.1569C32.0384 13.5474 32.0384 14.1805 32.4289 14.5711C32.8195 14.9616 33.4526 14.9616 33.8431 14.5711L40.2071 8.20711ZM1 8.5H39.5V6.5H1V8.5Z"
                fill="#FFFFFF"
              />
            </svg>
          </div>
        </div>
      </Form>
      <style>
        {`
          .request-form {
            transform: ${secondStep ? "translateX(-100vw)" : "translateX(0)"};
          }   
          
          @media screen and (min-width: 1280px) {
            .request-form {
              transform: ${secondStep ? "translateX(-128vw)" : "translateX(0)"};
            }
            `}
      </style>
    </div>
  );
}
