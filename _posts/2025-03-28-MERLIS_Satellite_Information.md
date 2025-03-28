---
layout: post
title: MERLIS Satellite Information
author: [ BH4EZW, BI4KUF ]
keywords: [MERLIS, 链路预算, 载荷, 卫星]
categories: [ 卫星 ]
---

The MERLIS satellite is an amateur radio satellite currently under development by the Amateur Radio Club of the University of Science and Technology of China.

***DOC VERSION:** 1 @ MAR 28, 2025* 

## Functional Description of Satellite Sub-systems

### Satellite Platform

A standardized 12U CubeSat platform will be utilized, incorporating subsystems for power supply, attitude determination & control (ADCS), and thermal management.

### UHF/VHF Transceiver

This low-IF software-defined transceiver adopts a LilacSat-2-like architecture. Operating at 146 MHz uplink and 436 MHz downlink. It supports FM voice repeat for radio hams, telemetry downlink, telecommand uplink, and over-the-air (OTA) firmware updates.

### 47 GHz Transceiver

A software-defined radio (SDR) transceiver operating in the 47 GHz band. It features dual operational modes with different data rates, to match different kinds and levels of ground station:
* High-speed DVB-S2(X)-compliant downlink transmitter for UHD video and payload data,
* DVB-S2(X)-based regenerative transponder for video streams/data packets.

Its primary objectives are:
* Provide high-speed data downlink support for payloads,
* Validate mmWave wideband/high-spectral-efficiency communications on CubeSats,
* Characterize Q-band satellite-ground channel properties,
* Enable amateur radio enthusiasts/youth to experiment with advanced communication technologies.

### Video Camera

Equipped with an UHD CMOS sensor, wide-angle lens, and multi-bandpass filters. Designed for atmospheric luminous phenomena observation, with emphasis on transient luminous events (TLEs) such as sprite lightning.

### Light Beacon

High-intensity LED array featuring:
* \> 2,000 lumens output, peak apparent magnitude + 7,
* Naked-eye visibility in low-speed Morse-coded blinking mode,
* \~ 100 kSps maximum modulation rate for optical communication verification,
* Optical tracking beacon for precision orbit determination.

### Payload for Children

Student-developed subsystem created by affiliated secondary school teams, to focus on simple, inspirational programs. Utilizes the 47 GHz downlink channel for experimental data transmission.

## Electrical Power budget

The satellite employs triple-junction GaAs solar panels with 30 % efficiency. Forty solar cells (80 mm × 40 mm each) are sun-facing, generating ~ 40 W peak power. Accounting for 50 % orbital time in Earth’s shadow, average power generation stabilizes at ~20 W.The operational power budget demonstrates a ~2W margin under nominal duty cycles. 

To align with thermal constraints and mission objectives, most payloads activate during shadow periods. Full payload activation in eclipse results in 99 W power dissipation.

The eclipse duration is about 50 minutes, and total energy demand is about 82.5 Wh, which requires nine 18650 Li-ion batteries (3.7 V nominal voltage, 2600 mAh capacity each).

| **Parts**                | **Max Power Dissaption (W)** | **Duty Rate** | **Avg Power Dissaption (W)** |
|:------------------------:|:----------------------------:|:-------------:|:----------------------------:|
| **Satellite Platform**   | 5                            | 1             | 5                            |
| **U/V Transceiver Rx**   | 2                            | 1             | 2                            |
| **U/V Transceiver Tx**   | 3                            | 0.3           | 0.9                          |
| **47GHz Transceiver Rx** | 10                           | 0.05          | 0.5                          |
| **47GHz Transceiver Tx** | 50                           | 0.05          | 2.5                          |
| **8K UHD Camera**        | 12                           | 0.4           | 4.8                          |
| **Light Beacon**         | 15                           | 0.03          | 0.45                         |
| **Payload For Children** | 2                            | 1             | 2                            |
| **Total**                | 99                           |               | 18.15                        |

## Attitude Stabilization

The satellite employs a multi-sensor attitude determination suite comprising:
* Infrared Earth sensors
* Sun sensors
* Magnetometers
* Gyroscopes

A dedicated data fusion algorithm processes sensor inputs to derive high-precision attitude solutions.

For attitude actuation, the system combines:
* Momentum wheels - Primary actuators for routine attitude control
* Magnetic torquers - Secondary actuators for momentum wheel desaturation

This hybrid configuration maintains attitude stability while managing angular momentum accumulation through periodic magnetic desaturation maneuvers.

## Radio Link budget

### Telecommand

| **Name**                          | **Value** | **Unit** |
|:---------------------------------:|:---------:|:--------:|
| **Baud Rate**                     | 9600      | baud     |
| **Modulation**                    | GMSK      |          |
| **Bandwidth**                     | 4.8       | kHz      |
| **BER Threshold**                 | 1E-06     |          |
| **SNR Threshold**                 | 10.57     | dB       |
| **Frequency**                     | 146       | MHz      |
| **Distance**                      | 2000      | km       |
| **Free Space Loss**               | 141.76    | dB       |
| **Ground Station Tx Power**       | 37        | dBm      |
| **Ground Station Antenna Gain**   | 3         | dBi      |
| **Satellite Rx Antenna Gain**     | -2        | dBi      |
| **Satellite Rx Power**            | -103.76   | dB       |
| **Satellite Rx Noise Temprature** | 3000      | K        |
| **Satellite Rx Noise Power**      | -127.19   | dBm      |
| **Satellite Rx SNR**              | 23.43     | dB       |
| **Link Margin**                   | 12.86     | dB       |

**Key Notes:**
1. Forward Error Correction (FEC):
    * Budget excludes FEC gains
    * Achievable BER of 1e-6 enables near-error-free decoding with FEC implementation
2. Demodulation Scheme:
    * Assumes non-coherent demodulation
3. Operational Flexibility:
    * Maximum downlink rate: 9600 baud
    * Supports reduced-speed modes under degraded link conditions

### 47GHz Uplink

| **Name**                    | **Mode 1** | **Mode 2** | **Mode 3** | **Mode 4** | **Mode 5** | **Mode 6** | **Unit** |
|:---------------------------:|:----------:|:----------:|:----------:|:----------:|:----------:|:----------:|:--------:|
| **Modulation**              | QPSK       | QPSK       | QPSK       | 16APSK     | 256APSK    | BPSK       |          |
| **FEC Code**                | 3/5        | 1/4        | 1/4        | 2/3        | 3/4        | 1/5        |          |
| **Spectrum Efficiency**     | 1.18       | 0.49       | 0.49       | 2.63       | 5.9        | 0.16       | bps/Hz   |
| **Es/N0 Threshold**         | 2.23       | -2.35      | -2.35      | 8.97       | 19.57      | -6.1       | dB       |
| **Frame Length**            | 64800      | 64800      | 64800      | 64800      | 64800      | 64800      |          |
| **Symbol Rate**             | 62.5       | 10         | 2          | 4          | 0.2        | 4          | Msps     |
| **Max Data Rate**           | 73.75      | 4.90       | 0.98       | 10.52      | 1.18       | 0.64       | Mbps     |
| **Roll Off Factor**         | 0.35       | 0.35       | 0.35       | 0.35       | 0.35       | 0.35       |          |
| **RF Bandwidth**            | 84.38      | 13.50      | 2.70       | 5.40       | 0.27       | 5.40       | MHz      |
| **Distance**                | 1000       | 1000       | 1000       | 1000       | 1000       | 1000       | km       |
| **Free Space Loss**         | 185.89     | 185.89     | 185.89     | 185.89     | 185.89     | 185.89     | dB       |
| **Atmosphere Absorption**   | 3          | 3          | 3          | 3          | 3          | 3          | dB       |
| **Total Loss**              | 188.89     | 188.89     | 188.89     | 188.89     | 188.89     | 188.89     | dB       |
| **Satellite Rx G/T**        | -18        | -18        | -18        | -18        | -18        | -18        | dB/K     |
| **Ground Station Diameter** | 5          | 1          | 1          | 3          | 5          | 0.5        | m        |
| **Aperture Efficiency**     | 0.6        | 0.6        | 0.6        | 0.6        | 0.7        | 0.6        |          |
| **Tx Power**                | 33         | 27         | 18         | 33         | 33         | 18         | dBm      |
| **Gain**                    | 65.05      | 51.07      | 51.07      | 60.62      | 65.72      | 45.05      | dBi      |
| **Ground Station Tx EIRP**  | 98.05      | 78.07      | 69.07      | 93.62      | 98.72      | 63.05      | dBm      |
| **Satellite Rx SNR**        | 11.09      | 2.88       | 0.87       | 15.11      | 29.71      | -3.30      | dB       |
| **Uplink Margin**           | 8.86       | 5.23       | 3.22       | 6.14       | 10.14      | 2.80       | dB       |


### VHF FM Voice Uplink

| **Name**                                | **Value** | **Unit** |
|:---------------------------------------:|:---------:|:--------:|
| **Voice Bandwidth**                     | 4         | kHz      |
| **Modulate Frequency Delta**            | 2         | kHz      |
| **Modulate Index**                      | 0.5       |          |
| **RF Bandwidth**                        | 12        |          |
| **RF SNR Threshold at 10dB Output SNR** | 9.49      | dB       |
| **Frequency**                           | 146       | MHz      |
| **Distance**                            | 2000      | km       |
| **Free Space Loss**                     | 141.76    | dB       |
| **Ground Station Tx Power**             | 37        | dBm      |
| **Ground Station Antenna Gain**         | 3         | dBi      |
| **Satellite Rx Antenna Gain**           | -2        | dBi      |
| **Satellite Rx Power**                  | -101.76   | dB       |
| **Satellite Rx Noise Temprature**       | 3000      | K        |
| **Satellite Rx Noise Power**            | -123.21   | dBm      |
| **Satellite Rx SNR**                    | 21.45     | dB       |
| **Link Margin**                         | 11.96     | dB       |

### Telemetry

| **Name**                               | **Value** | **Unit** |
|:--------------------------------------:|:---------:|:--------:|
| **Baud Rate**                          | 9600      | baud     |
| **Modulation**                         | GMSK      |          |
| **Bandwidth**                          | 4.8       | kHz      |
| **BER Threshold**                      | 1E-06     |          |
| **SNR Threshold**                      | 10.57     | dB       |
| **Frequency**                          | 436       | MHz      |
| **Distance**                           | 2000      | km       |
| **Free Space Loss**                    | 151.26    | dB       |
| **Satellite Tx Power**                 | 30        | dBm      |
| **Satellite Antenna Gain**             | 0         | dBi      |
| **Ground Station Rx Antenna Gain**     | 8         | dBi      |
| **Ground Station Rx Power**            | -113.26   | dB       |
| **Ground Station Rx Noise Temprature** | 3000      | K        |
| **Ground Station Rx Noise Power**      | -127.19   | dBm      |
| **Ground Station Rx SNR**              | 13.93     | dB       |
| **Link Margin**                        | 3.36      | dB       |

**Key Notes:**
1. Forward Error Correction (FEC):
    * Budget excludes FEC gains
    * Achievable BER of 1e-6 enables near-error-free decoding with FEC implementation
2. Demodulation Scheme:
    * Assumes non-coherent demodulation
3. Operational Flexibility:
    * Maximum downlink rate: 9600 baud
    * Supports reduced-speed modes under degraded link conditions

### 47 GHz Downlink

| **Name**                    | **Mode 1** | **Mode 2** | **Mode 3** | **Mode 4** | **Mode 5** | **Mode 6** | **Unit** |
|:---------------------------:|:----------:|:----------:|:----------:|:----------:|:----------:|:----------:|:--------:|
| **Modulation**              | QPSK       | QPSK       | QPSK       | 16APSK     | 256APSK    | BPSK       |          |
| **FEC Code**                | 3/5        | 1/4        | 1/4        | 2/3        | 3/4        | 1/5        |          |
| **Spectrum Efficiency**     | 1.18       | 0.49       | 0.49       | 2.63       | 5.9        | 0.16       | bps/Hz   |
| **Es/N0 Threshold**         | 2.23       | -2.35      | -2.35      | 8.97       | 19.57      | -6.10      | dB       |
| **Frame Length**            | 64800      | 64800      | 64800      | 64800      | 64800      | 64800      |          |
| **Symbol Rate**             | 62.5       | 10         | 2          | 4          | 0.2        | 4          | Msps     |
| **Max Data Rate**           | 73.75      | 4.9        | 0.98       | 10.52      | 1.18       | 0.64       | Mbps     |
| **Roll Off Factor**         | 0.35       | 0.35       | 0.35       | 0.35       | 0.35       | 0.35       |          |
| **RF Bandwidth**            | 84.375     | 13.5       | 2.7        | 5.4        | 0.27       | 5.4        | MHz      |
| **Distance**                | 1000       | 1000       | 1000       | 1000       | 1000       | 1000       | km       |
| **Free Space Loss**         | 185.89     | 185.89     | 185.89     | 185.89     | 185.89     | 185.89     | dB       |
| **Atmosphere Absorption**   | 3          | 3          | 3          | 3          | 3          | 3          | dB       |
| **Total Loss**              | 188.89     | 188.89     | 188.89     | 188.89     | 188.89     | 188.89     | dB       |
| **Satellite Tx EIRP**       | 42         | 42         | 42         | 39.5       | 33         | 42         | dBm      |
| **Ground Station Diameter** | 5          | 1          | 1          | 3          | 5          | 0.5        | m        |
| **Aperture Efficiency**     | 0.6        | 0.6        | 0.6        | 0.6        | 0.7        | 0.6        |          |
| **Tx Power**                | 33         | 27         | 18         | 33         | 33         | 18         | dBm      |
| **Rx Noise Temprature**     | 600        | 600        | 600        | 600        | 300        | 600        | K        |
| **Gain**                    | 65.05      | 51.07      | 51.07      | 60.62      | 65.72      | 45.05      | dBi      |
| **Ground Station G/T**      | 37.27      | 23.29      | 23.29      | 32.83      | 40.95      | 17.27      | dB/K     |
| **Ground Station Rx SNR**   | 10.30      | 8.10       | 15.09      | 11.82      | 22.94      | 10.92      | dB       |
| **Downlink Margin**         | 8.07       | 10.45      | 17.44      | 2.85       | 3.37       | 17.02      | dB       |

### UHF FM Voice Downlink

| **Name**                                | **Value** | **Unit** |
|:---------------------------------------:|:---------:|:--------:|
| **Voice Bandwidth**                     | 4         | kHz      |
| **Modulate Frequency Delta**            | 2         | kHz      |
| **Modulate Index**                      | 0.5       |          |
| **RF Bandwidth**                        | 12        |          |
| **RF SNR Threshold at 10dB Output SNR** | 9.49      | dB       |
| **Frequency**                           | 436       | MHz      |
| **Distance**                            | 2000      | km       |
| **Free Space Loss**                     | 151.26    | dB       |
| **Satellite Tx Power**                  | 30        | dBm      |
| **Satellite Antenna Gain**              | 0         | dBi      |
| **Ground Station Rx Antenna Gain**      | 8         | dBi      |
| **Ground Station Rx Power**             | -113.26   | dB       |
| **Ground Station Rx Noise Temprature**  | 1500      | K        |
| **Ground Station Rx Noise Power**       | -126.22   | dBm      |
| **Ground Station Rx SNR**               | 12.96     | dB       |
| **Link Margin**                         | 3.47      | dB       |

## Transmission Formats

### Modulation Modes & Data Rates (Physical Layer)

* **High-speed link:** GMSK-FM @ 9600 baud
* **Low-speed link:** GMSK-FM @ 1200 baud

### Attached Sync Marker (Link Layer)

* **CCSDS Standard ASM:** 0x1ACFFC1D

### Data Frame Length (Link Layer)

* Fixed-length frames: 255 bytes
* Short frames padded with 0xC0 values

### Data Frame Structure (Link Layer)

*Reference Standard:*

* CCSDS 131.0-B (TM Synchronization and Channel Coding)

*Frame Composition:*

1. Transmission Frame Header
2. Data Field
3. Validity Check Field
4. Frame Error Control Field

### Transmission Frame Header Fields

| **FIELD**                | **LENGTH** | **DESCRIPTION**                |
|:------------------------:|:----------:|:------------------------------:|
| **Satellite Callsign**   | 5 bytes    | To be determined               |
| **Timestamp**            | 5 bytes    | Composite field:               |
| **├── Seconds**          | 1 byte     |                                |
| **├── Minutes**          | 1 byte     |                                |
| **├── Hours**            | 1 byte     |                                |
| **└── Days**             | 2 bytes    |                                |
| **Frame Counter**        | 1 byte     | Increments 00→FF, cyclic reset |
| **Frame Type Indicator** | 1 byte     | To be determined               |
| **Reserved Bits**        | 4 bytes    | To be determined               |

### Data Field

* Structure defined at network layer (TBD)

### Validity Check Field

* RSA 4-byte truncated signature for data integrity/authenticity

### Scrambling (Pseudo-Randomization)

* CCSDS-standard scrambler applied pre-channel encoding

### Channel Error Correction Coding

*Concatenated coding scheme:*
* Inner code: (1/2, 7) convolutional code
* Outer code: (255, 223) Reed-Solomon code
