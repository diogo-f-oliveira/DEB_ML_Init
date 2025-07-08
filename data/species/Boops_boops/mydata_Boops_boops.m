function [data, auxData, metaData, txtData, weights] = mydata_Boops_boops

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Boops_boops'; 
metaData.species_en = 'Bogue'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L', 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Handjar Houria'};    
metaData.date_subm = [2015 04 21];              
metaData.email    = {'handjarhouria@gmail.com'};            
metaData.address  = {'Tiaret, 14000, Algeria'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2015 10 21];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};  

metaData.author_mod_2   = {'Samira Boufersaoui'};    
metaData.date_mod_2 = [2018 07 03];              
metaData.email_mod_2    = {'samira.boufersaoui@gmail.com'};            
metaData.address_mod_2  = {'ENSSMAL, 16000, Algeria'};  

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 07 03]; 


%% set data
% zero-variate data

data.ab = 4;    units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'Hour2015';   
  temp.ab = C2K(18);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 540;    units.tp = 'd';    label.tp = 'tiome since birth at puberty'; bibkey.tp = 'Hour2015';
  temp.tp = C2K(18);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'BoufZero2018 found 729 d at 19C';
data.am = 2920;    units.am = 'd';    label.am = 'life span';               bibkey.am = 'Hour2015';   
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'BoufZero2018 found 2190 d at 19C';

data.Lb  = 0.26;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';  bibkey.Lb  = 'Hour2015';
  comment.Lb = 'BoufZero2018 found 0.2 cm';
data.Lp  = 17;   units.Lp  = 'cm';  label.Lp  = 'total length st puberty';  bibkey.Lp  = 'Hour2015';
  comment.Lp = 'BoufZero2018 found 13.9 cm';
data.Li  = 28.42;   units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'Hour2015';
  comment.Li = 'BoufZero2018 found 28.345 cm';

data.Wwb = 5.24e-4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'Hour2015';
  comment.Wwb = 'BoufZero2018 found 6.44e-5 g';
data.Wwp = 44.5;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'Hour2015';
  comment.Wwp = 'BoufZero2018 found 25.9 g';
data.Wwi = 216;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Hour2015';
  comment.Wwi = 'BoufZero2018 found 224.6 g ';

data.Ri  = 430;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Hour2015';   
  temp.Ri = C2K(18);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri  = 'BoufZero2018 found 383 #/d at 19C'; 
 
% uni-variate data
% t-L data
data.tL = [365	730	1095 1460 1825 2190;    % d, time since birth
           14	20	23	25	26	28]';  % cm, total length at f and T
data.tL(:,1) = data.tL(:,1) - 365/3; % convert to time since birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'fishbase';
comment.tL = 'total length and wet weight were measured at the same time';
  
data.tL_BT = [365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 2190 2190 2190 2190 2190 2190 2190 ; % d, time since birth
            12.83 12.13 17.26 8.32 10.89 10.68 9.15 9.14 12.92 12.78 11.73 11.94 9.87 11.29 9.98 10.92 11.7 11.47 10.11 10.91 9.08 12.74 8.59 10.03 9.33 11.89 8.72 9.16 10.1 8.96 9.24 10.94 15.37 11.76 12.13 10.22 11.39 14.11 10.68 12.08 10.37 9.38 11.88 10.38 9.22 11.47 10.62 11.93 9.98 11.85 13.04 9.78 9.01 12.15 9.45 10.44 10.7 9.82 11.69 10.75 11.09 10.37 12.86 11.2 12.44 10.45 10.74 11.79 8.97 9.54 10.39 11.32 11.41 10.68 9.61 9.2 12.7 8.82 10.46 11.94 9.69 10.7 11.07 8.93 10.66 9.88 9.46 9.8 10.02 10.38 11.86 7.41 12.94 9.43 9.68 8.83 9.59 11.95 11.01 9.53 8.84 12.57 11.13 11.3 8.32 7.08 10.16 9.96 9.34 9.53 7.33 9.44 10.19 12.07 9.43 9.05 10.09 10.9 8.92 8.91 10.04 8.62 9.58 9.78 9.21 10.45 10.25 9.64 9.2 11.21 9.85 13.11 11.06 10.33 9.66 9.42 8.79 8.81 9.18 8.77 9.24 9.75 8.67 9.4 8.68 9.43 8.63 10.61 9 10.59 11.77 10.8 9.97 10.23 11.07 10.08 11.08 9.27 12.3 12.28 11.66 11.55 10.99 9.52 9.73 10.67 9.57 7.9 9.86 8.4 9.06 9.24 8.84 9.16 9.56 8.9 9.45 9.47 9.68 8.67 8.73 8.98 9.71 9.04 9.85 8.48 9.34 8.99 9.13 10.43 10.88 8.68 10.44 10.07 10.36 9.35 11.21 9.65 10.29 11.47 9.31 10.65 10.75 10.82 9.67 10.34 8.35 10.21 9.46 16.64 14.98 21.52 11.92 14.43 15.58 13.89 12.2 17.88 18.13 16.05 17.48 13.85 15.16 14.55 14.46 15.78 15.74 14.37 13.92 12.86 18.18 12.57 14.62 13.49 15.78 13.14 13.8 14.91 12.83 13.5 13.16 19.15 15 15.67 14.61 15.1 18.62 16.65 17.56 15.31 12.21 16.96 15.18 12.9 18.26 15.26 14.83 13.43 16.48 17.23 13.87 13.08 17.69 13.45 16.26 14.94 14.77 16.05 15.63 16.82 14.95 17.19 14.75 16.56 14.21 16.34 16.69 15.05 15.93 15.36 13.69 15.17 14.01 14.11 13.38 17.05 12.78 14.55 16.16 13.1 16.83 17.64 13.96 14.9 15 12.01 11.98 12.69 13.07 14.9 10.85 16.07 14.25 13.2 12.25 12.28 16.85 14.48 13.85 12.31 16.37 15.96 16.17 11.4 10.47 14.61 14.56 12.74 13.88 9.65 14.08 15.12 16.79 13.51 13.39 15.04 15.48 13.58 13.28 14.34 13.91 15.02 15.35 12.02 12.66 13.4 12.85 13 13.8 13.46 17.53 15.77 15.34 13.78 13.18 11.17 13.25 14.85 14.14 13.39 14.54 12.77 13.31 15.25 14.15 14.89 15.53 15.36 13.54 14.65 15.61 12.28 12.58 13.39 12.91 15.44 11.7 15.18 15.85 14.24 15.84 15.27 12.5 13.47 14.78 14.27 10.3 14.85 13.57 14.37 13.76 13.48 14.2 14.07 14.27 14.34 13.88 15.37 13.34 12.95 14.21 14.18 13.97 15.58 13.6 13.29 13.24 13.63 19.82 19.93 25.78 14.95 18.31 19.03 18.58 14.04 20.13 22.32 19.72 19.89 15.34 17.24 17.52 17.67 18.86 18.49 17.04 16.7 16.44 21.19 15.11 18.54 15.46 20.19 17.47 16.7 19.07 15.98 16.26 15.03 21.61 18.11 19.65 16.93 17.36 21.86 20.4 20.76 17.94 14.06 20.69 18.71 16.36 20.69 18.57 17.19 15.12 19.16 21.09 17.38 16.29 20.78 15.5 20.5 18.31 16.85 18.91 18.33 19.99 18.64 21.16 17.85 19.63 17.11 20.28 19.7 18.09 18.85 18.14 15.11 17.77 16.73 16.11 15.72 19.36 14.97 18.39 19.11 15.64 19.3 21.56 16.69 19.36 19.52 13.18 13.48 15.18 15.04 16.56 13.17 18.03 16.17 15.39 14.01 15.14 19.77 16.3 15.95 14.07 18.52 17.62 18.41 13.21 11.72 17.94 17.86 16.14 17.17 11.52 16.23 18.74 19.29 17.05 16.61 20.04 18.77 18.18 16 17.71 16.56 17.94 17.11 23 21.83 28.36 17.06 20.54 21.23 21.81 15.2 22.52 26.59 23.71 22.18 17.84 18.78 20.05 19.54 21.46 20.7 18.95 18.85 19.33 23.24 17.77 21.06 18.86 23.11 19.58 20.44 22.18 18.68 18.9 16.84 23.5 20.11 23.19 19.07 20.13 23.98 23.02 23.1 20.12 15.85 24.56 21.46 20.05 21.88 20.12 19.61 16.59 22.06 22.87 19.37 19.39 23.51 17.28 23.16 20.87 18.99 20.22 20.32 21.61 20.87 25.64 20.45 22.76 20.56 23.15 22.9 20.03 20.17 20.75 25.7 23.46 31.12 19.32 21.96 23.68 24.18 16.52 24.96 29.12 26.59 23.65 19.68 20.51 21.98 21.02 23.34 22.35 20.23 19.95 20.99 25.44 20.04 22.68 21.43 25.25 20.89 22.45 24.05 20.39 21.15 27.29 25.29 33.96 20.5 23.33 24.81 26.07]';   % cm, total length at f and T
data.tL_BT(:,1) = data.tL_BT(:,1) - 365/3; % convert to time since birth
units.tL_BT = {'d', 'cm'};     label.tL_BT = {'time since birth', 'total length'};  bibkey.tL_BT = 'BoufTamo2018';
  temp.tL_BT = C2K(23);  units.temp.tL_BT = 'K'; label.temp.tL_BT = 'temperature';

data.LW = [17.4	17.3	18.5	16.4	17.7	20.2	16	18	20	18.2	19.6	17.4	20	19	20.7	15.8	17	21.5	18.2	18.6	17.5	16.5	19	19.5	15	20.4	18	17	17.8	15.7	19.3	16	15.6	18	15.6	16	17	19	15	17.5	21.5	19.4	24.4	16.4	16.8	17.5	17.8	17.8	15.5	19.2	18	16.7	17.5	15.2	17.8	16.5	17.4	19	10.7	18	17.8	15.7	18	18	17	17	11.6	17.5	17.5	17.4	12	15.5	15.7	10.8	19	18.8	17.5	20.1	20.6	18.7	18.2	17	16.6	17.6	16.2	17.7	16.4	18.8	19	17.1	16.8	18	10.3	11.1	10.1	9.2	20.3	20.2	17	24.7	21	21.7	20.2	23.5	19.7	16.2	17.8	18.5	17.6	20.8	13.5	11.8	17.1	17.8	16.8	16.9	14.7	14.9	16.1	17.1	17.3	16.5	17.6	14.5	24.6	27.4	18.1	21.9	19.9	23.7	22	20.3	18	18.2	21.5	20	15	16.5	18.5	17	15	18	23.5	16.5	16.2	17.5	17.8	16.8	19	17.3	16.5	15.5	17.8	17.5	18	20.3	19.5	20	11.2	17	17.6	22	18.5	19.5	19	18.2	18.5	19.3	22.5	23.2;      % cm, total length at f
           38.0	45.0	49.0	33.0	44.0	72.0	32.0	43.0	55.0	45.0	65.0	45.0	71.0	63.0	69.0	33.0	39.0	76.0	50.0	62.0	53.0	41.0	58.0	71.0	30.0	72.0	55.0	48.0	49.0	36.0	67.0	39.0	39.0	60.0	33.0	40.0	44.0	63.0	31.0	51.0	83.0	66.0	135.0	37.0	44.0	48.0	54.0	50.0	33.0	73.0	50.0	43.0	50.0	29.0	49.0	40.0	51.0	66.0	8.5	55.0	50.0	33.0	53.0	52.0	49.0	42.0	11.0	45.0	50.0	47.0	15.0	33.0	36.0	8.0	59.0	55.0	43.0	75.0	66.0	54.0	56.0	42.0	41.0	50.0	39.0	47.0	37.0	55.0	61.0	40.0	41.0	48.0	6.5	9.0	6.5	4.5	66.0	74.0	44.0	136.0	81.0	82.0	69.0	114.0	65.0	37.0	46.0	55.0	37.0	75.0	23.0	13.0	44.0	46.0	44.0	54.0	28.0	38.0	37.0	45.0	44.0	40.0	49.0	25.0	138.0	196.0	47.0	101.0	78.0	121.0	100.0	87.0	54.0	58.0	90.0	72.0	26.0	32.0	53.0	40.0	27.0	43.0	100.0	33.0	32.0	43.0	47.0	34.0	51.0	40.0	37.0	31.0	43.0	40.0	50.0	61.0	69.0	68.0	14.0	39.0	46.0	83.0	52.0	66.0	55.0	50.0	46.0	63.0	94.0	106.0]';
units.LW   = {'cm', 'g'};  label.LW = {'total length','wet weight'};  
bibkey.LW = 'fishbase';
comment.LW = 'total length and wet weight were measured at the same time';

data.LW_BZ = [14.0 13.6 12.8 14.3 15.2 15.0 14.5 15.5 15.8 14.2 18.4 15.6 14.4 15.1 15.7 18.0 14.8 16.0 16.2 12.9 15.6 11.0 13.4 13.1 13.5 16.1 13.4 12.6 12.2 13.1 14.3 14.2 16.2 12.9 12.8 16.1 15.0 24.6 20.1 16.3 25.8 28.4 24.9 20.3 19.0 21.3 18.0 14.8 25.9 21.1 23.3 21.2 16.8 20.7 17.4 18.0 18.7 18.2 19.9 17.5 16.6 16.3 18.8 14.7 16.5 17.1 17.8 15.8 17.3 17.1 15.8 18.0 16.8 16.5 17.7 18.0 15.9 15.8 16.0 17.5 18.0 14.4 16.8 18.1 16.9 17.6 16.8 18.5 22.6 20.0 16.0 16.1 18.1 30.2 22.9 20.9 21.2 24.3 23.5 23.2 21.5 21.3 24.0 22.6 21.2 22.6 21.5 21.5 22.4 23.6 20.4 17.5 21.6 21.5 20.7 21.1 23.3 21.8 19.6 22.9 21.7 18.4 17.0 15.9 23.3 22.4 22.3 17.5 18.4 17.3 22.8 22.2 25.0 20.7 21.4 23.5 21.0 17.3 22.8 17.3 24.2 18.8 22.8 17.5 26.1 22.5 24.0 22.0 22.6 23.4 22.0 20.5 27.9 15.2 20.0 ;      % cm, total length at f
         23.75 21.51 17.75 25.67 30.03 31.99 25.47 32.77 37.55 33.00 53.5 46.00 37.5 45.5 45.00 73.00 30.7 36.32 39.47 21.63 36.92 20.97 23.73 21.22 25.33 38.9 22.98 18.96 18.39 21.48 30.06 26.87 40.26 20.31 21.73 37.56 32.35 156.71 95.69 44.24 220.74 271.25 174.38 86.58 74.96 96.28 60.66 31.52 174.18 96.23 90.07 124.31 48.42 90.16 49.76 57.94 65.14 57.4 83.15 48.81 46.92 39.71 70.23 35.78 41.72 49.71 57.72 36.82 48.32 51.35 38.26 55.27 45.43 44.65 49.69 55.01 59.22 38.00 37.65 55.55 54.5 28.97 45.07 55.9 47.48 46.82 44.13 58.6 115.71 74.5 41.43 41.14 59.89 273.74 115.59 92.87 88.00 144.1 129.88 127.98 95.99 90.73 132.9 112.74 95.93 109.47 96.14 105.14 118.74 145.03 93.59 48.85 91.93 111.79 97.08 105.22 133.6 102.19 83.74 118.29 102.25 57.7 44.25 37.73 132.74 112.9 113.47 48.67 41.86 45.74 118.26 106.49 164.00 83.11 99.8 120.59 89.25 50.43 115.92 52.37 139.02 64.8 104.5 52.22 187.15 110.33 136.16 108.35 117.9 125.23 104.77 94.32 215.15 39.16 79.27]';   % g, wet weight at f and T
units.LW_BZ = {'cm', 'g'};     label.LW_BZ = {'total length', 'wet weight'};  bibkey.LW_BZ = 'BoufZero2018';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW','LW_BZ'}; subtitle1 = {'Data from fishbase, BoufZero2018'};
set2 = {'tL','tL_BT'}; subtitle2 = {'Data from fishbase, BoufTamo2018'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Mod_2: additional data on tL, LW';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = 'MHY3'; % Cat of Life
metaData.links.id_ITIS = '998994'; % ITIS
metaData.links.id_EoL = '46579924'; % Ency of Life
metaData.links.id_Wiki = 'Boops_boops'; % Wikipedia
metaData.links.id_ADW = 'Boops_boops'; % ADW
metaData.links.id_Taxo = '164378'; % Taxonomicon
metaData.links.id_WoRMS = '127047'; % WoRMS
metaData.links.id_fishbase = 'Boops-boops'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Boops_boops}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = [ ...
'author = {Anonymous}, ' ...
'year = {2015}, ' ...
'howpublished = {\url{https://www.fishbase.de/summary/Boops-boops.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Hour2015'; type = 'Misc'; bib = [ ...
'author = {Handjar Houria}, ' ...
'year = {2015}, ' ...
'note = {Data from Handjar Houria}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BoufZero2018'; type = 'techreport'; bib = [ ...  
'author = {Boufersaoui, S and Zeroual, H.}, ' ...
'year = {2018}, ' ...
'title  = {Estimation des param\`{e}tres du mod\`{e}le bio\''{e}nerg\''{e}tique DEB pour \''{e}tudier la croissance et la reproduction de quelques esp\`{e}ces des c\^{o}tes {A}lg\''{e}riennes}, ' ...
'institution = {ENSSMAL Univ., Algiers}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BoufTamo2018'; type = 'techreport'; bib = [ ...  
'author = {Boufersaoui, S. and Tamourt, A.}, ' ...
'year = {2018}, ' ...
'title  = {Elaboration d'' outil de simulation de l'' evaluation et de la gestion de pecheries mixtes multiflottiles}, ' ...
'institution = {ENSSMAL Univ., Algiers}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

