import LoginScreen from "./screens/LoginScreen";
import HomeScreen from "./screens/HomeScreen";
import RestaurantDetailsScreen from "./screens/RestaurantDetailsScreen";
import ReservationScreen from "./screens/ReservationScreen";
import PaymentProofScreen from "./screens/PaymentProofScreen";

// Logic prototype (no navigation library required yet)
export default function App() {
  // Change this variable to preview different screens quickly
  const SCREEN = "HOME"; // LOGIN | HOME | DETAILS | RESERVATION | PAYMENT_PROOF

  if (SCREEN === "LOGIN") return <LoginScreen />;
  if (SCREEN === "HOME") return <HomeScreen />;
  if (SCREEN === "DETAILS") return <RestaurantDetailsScreen />;
  if (SCREEN === "RESERVATION") return <ReservationScreen />;
  if (SCREEN === "PAYMENT_PROOF") return <PaymentProofScreen />;

  return <HomeScreen />;
}