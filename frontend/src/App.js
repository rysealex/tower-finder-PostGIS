import React, { useEffect, useState } from "react";
import { MapContainer, TileLayer, Marker, Popup } from "react-leaflet";
import L from "leaflet";
import icon from "leaflet/dist/images/marker-icon.png";
import iconShadow from "leaflet/dist/images/marker-shadow.png";
import "leaflet/dist/leaflet.css";

delete L.Icon.Default.prototype._getIconUrl;
L.Icon.Default.mergeOptions({
  iconRetinaUrl: icon,
  iconUrl: icon,
  shadowUrl: iconShadow,
});

function App() {
  const [towers, setTowers] = useState([]);

  // fetch towers from postgreSQL db
  useEffect(() => {
    fetch("https://localhost:5000/api/towers")
      .then((response) => response.json())
      .then((data) => {
        console.log("Fetched towers:", data);
        setTowers(data);
      })
      .catch((error) => console.error("Error fetching towers: ", error));
  }, []);

  // center of map (Washington State)
  const position = [47.6062, -122.3321];

  return (
    <div className="App">
      <h1>Tower Tracker - Washington State</h1>
      <MapContainer
        center={position}
        zoom={7}
        style={{ height: "80vh", width: "100%" }}
      >
        <TileLayer
          attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
          url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
        />
        {towers.map((tower, idx) => {
          <Marker key={idx} position={[tower.location]}>
            <Popup>
              <strong>{tower.node_name}</strong>
              <br />
              IP: {tower.ip_address}
            </Popup>
          </Marker>;
        })}
      </MapContainer>
    </div>
  );
}

export default App;
