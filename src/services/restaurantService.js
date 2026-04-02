export const getRestaurants = async () => {
  // Prototype: fetch restaurants from Firestore or local JSON
  return [];
};
import { restaurants } from "./mockData";

export const getRestaurants = async () => {
  return restaurants;
};

export const filterRestaurants = (list, { priceRange, minRating }) => {
  let result = [...list];
  if (priceRange) result = result.filter(r => r.priceRange === priceRange);
  if (minRating) result = result.filter(r => r.rating >= minRating);
  return result;
};