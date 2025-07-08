function [data, auxData, metaData, txtData, weights] = mydata_Pegusa_lascaris

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Soleidae';
metaData.species    = 'Pegusa_lascaris'; 
metaData.species_en = 'Sand sole'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18.1); % in K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author     = {'Bas Kooijman'}; 
metaData.date_subm  = [2019 02 14]; 
metaData.email      = {'bas.kooijman@vu.nl'}; 
metaData.address    = {'VU University, Amsterdam'};

metaData.author_mod_1  = {'Samira Boufersaoui'};            
metaData.date_mod_1    = [2021 10 06];                      
metaData.email_mod_1   = {'samira.boufersaoui@gmail.com'}; 
metaData.address_mod_1 = {'ENSSMAL, 16000, Algeria'};      

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2023 04 03];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 03];

%% set data
% zero-variate data;

data.ab = 2;      units.ab = 'd';      label.ab = 'age at birth';            bibkey.ab = 'Ahls1984';    
  temp.ab = C2K(18.1);  units.temp.ab = 'K'; label.temp.ab = 'temperature';       
data.am = 7*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'BoufMera2021';  
  temp.am = C2K(18.1); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'fishbase gives 15 yr';
  
data.Lb  = 0.35;   units.Lb  = 'cm';   label.Lb  = ' total length at birth';   bibkey.Lb  = 'Ahls1984';
data.Lp  = 13.2;   units.Lp  = 'cm';   label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'BoufMera2021';
data.Lpm  = 12.6;   units.Lpm  = 'cm';   label.Lpm  = 'total length at pubertyfor in males';  bibkey.Lpm  = 'BoufMera2021';
data.Li = 26.5;    units.Li = 'cm';   label.Li = 'ultimate total length for females';    bibkey.Li = 'Deni1990';
data.Lim = 23.6;    units.Lim = 'cm';   label.Lim = 'ultimate total length for males'; bibkey.Lim = 'Deni1990';

data.Wwb = 1.4e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'Mari1991';
  comment.Wwb = 'based on egg diameter of 1.38  mm of Pegusa lascaris: pi/6*0.138^3';
data.Wwp = 21.5;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';  bibkey.Wwp = 'BoufMera2021';
data.Wwpm = 15.57;   units.Wwpm = 'g';   label.Wwpm = 'wet weight at puberty for males';  bibkey.Wwpm = 'BoufMera2021';
data.Wwi = 184.1;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'BoufMera2021';
data.Wwim = 120.74;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'BoufMera2021';

data.Ri = 84.1; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'BoufMera2021';
  temp.Ri = C2K(18.1); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data
% time-length
data.tL_f = [ ... % age (years), total length (cm)
    0  6.7
    1  7.5
    2 18.8
    3 20.9
    4 22.4
    5 24.8
    6 25.2
    7 29.5];
data.tL_f(:,1) = (.75 + data.tL_f(:,1)) * 365; % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(18.1);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Deni1990';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % age (years), total length (cm)
    0  6.7
    1  7.5
    2 18.4
    3 20.3
    4 21.0
    5 22.3
    6 23.8
    7 24.7];
data.tL_m(:,1) = (.75 + data.tL_m(:,1)) * 365; % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(18.1);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Deni1990';
comment.tL_m = 'Data for males';

% time-length
data.tL_1f = [365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1825 1825 1825 1825 1825 1825 1825 1825 2190 2190 2555 ; % d, time since birth
            8.5 8.6 8.9 9.0 9.1 9.1 9.2 9.3 9.3 9.33 9.34 9.4 9.39 9.55 9.6 9.6 9.6 9.7 9.7 9.75 9.78 9.8 9.9 9.9 9.9 9.9 9.9 9.9 10.0 10.1 10.1 10.1 10.1 10.1 10.1 10.1 10.1 10.2 10.2 10.2 10.20 10.3 10.3 10.3 10.29 10.29 10.3 10.4 10.4 10.4 10.5 10.5 10.5 10.5 10.6 10.7 10.7 10.7 10.7 10.75 10.8 10.84 10.9 10.90 10.96 10.96 11.0 11.0 11.0 11.1 11.2 11.23 11.2 11.3 11.3 11.3 11.3 11.4 11.4 11.4 11.4 11.4 11.6 11.76 11.81 11.81 11.90 11.92 12.00 12.1 12.1 12.1 12.2 12.3 12.3 12.4 12.5 12.8 15.6 12.7 13.0 13.3 13.5 13.7 13.7 13.7 13.8 13.8 13.8 13.9 13.9 14.0 14.1 14.1 14.1 14.2 14.2 14.24 14.3 14.3 14.34 14.4 14.4 14.4 14.4 14.5 14.5 14.5 14.6 14.6 14.6 14.6 14.6 14.6 14.6 14.6 14.6 14.7 14.7 14.7 14.72 14.74 14.7 14.81 14.85 14.9 14.90 14.9 14.9 15.0 15.0 15.0 15.07 15.20 15.20 15.2 15.3 15.4 15.4 15.50 15.5 15.5 15.6 15.6 15.60 15.63 15.65 15.8 15.8 15.8 15.8 15.9 15.9 16.0 16.1 16.3 16.3 16.4 16.4 16.40 16.5 16.5 16.6 16.57 16.63 16.6 16.8 16.8 16.9 17.1 17.3 17.3 17.5 17.6 18.0 18.3 18.7 19.0 14.8 14.9 15.1 15.2 15.2 15.3 15.3 15.6 15.8 15.78 15.79 15.88 15.88 15.90 15.95 16.02 16.06 16.12 16.2 16.3 16.3 16.3 16.3 16.4 16.46 16.5 16.5 16.6 16.6 16.7 16.7 16.7 16.7 16.8 16.8 16.8 16.8 16.89 16.90 16.91 16.93 17.0 16.96 17.0 17.10 17.20 17.21 17.26 17.27 17.28 17.36 17.38 17.39 17.42 17.50 17.5 17.51 17.56 17.57 17.60 17.7 17.7 17.7 17.80 17.8 17.9 17.9 18.0 18.0 18.0 18.0 18.1 18.2 18.2 18.3 18.3 18.36 18.4 18.4 18.4 18.5 18.5 18.64 18.65 18.7 18.7 18.80 19.00 19.08 19.17 19.2 19.5 19.5 19.9 20.2 20.3 20.4 21.1 16.3 17.0 17.5 17.5 17.6 17.9 17.9 17.9 18.1 18.1 18.2 18.2 18.2 18.3 18.4 18.4 18.5 18.7 18.7 18.9 19.1 19.1 19.1 19.21 19.3 19.6 19.8 19.9 19.9 20.3 20.4 20.6 20.7 20.9 20.99 21.39 21.58 21.70 22.31 22.8 20.2 21.0 21.4 21.6 22.0 22.47 23.5 24.4 23.38 25.3 25.8]';   % cm, total length at f and T
n=size(data.tL_1f,1); for i=2:n; if data.tL_1f(i,1)<=data.tL_1f(i-1,1); data.tL_1f(i,1)=data.tL_1f(i-1,1)+1e-3; end; end
units.tL_1f = {'d', 'cm'}; label.tL_1f = {'time since birth', 'total length', 'female'};  
temp.tL_1f = C2K(18.1);  units.temp.tL_1f = 'K'; label.temp.tL_1f = 'temperature';
bibkey.tL_1f = 'BoufMera2021';
comment.tL_1f = 'Data for females';
%
data.tL_1m = [365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1825 1825 2190 2190; % d, time since birth
            8.82 8.85 8.87 8.95 9.06 9.13 9.17 9.17 9.19 9.24 9.25 9.25 9.29 9.33 9.43 9.44 9.47 9.50 9.57 9.61 9.63 9.64 9.64 9.66 9.71 9.71 9.72 9.73 9.73 9.74 9.74 9.82 9.83 9.84 9.86 9.89 9.90 9.91 9.92 9.93 9.94 9.94 9.95 9.98 9.99 10.00 10.00 10.01 10.02 10.04 10.05 10.06 10.06 10.13 10.14 10.14 10.15 10.17 10.23 10.24 10.24 10.27 10.31 10.32 10.35 10.37 10.38 10.40 10.44 10.45 10.45 10.49 10.51 10.54 10.54 10.54 10.57 10.59 10.64 10.71 10.73 10.81 10.85 10.88 10.90 10.97 10.99 11.02 11.08 11.09 11.16 11.18 11.24 11.29 11.30 11.30 11.38 11.52 11.63 11.64 11.76 11.79 11.82 11.91 12.03 12.20 12.30 12.30 12.34 12.56 12.67 12.69 12.71 12.82 12.83 12.90 12.97 13.18 13.22 14.68 13.05 13.10 13.17 13.20 13.27 13.28 13.30 13.34 13.41 13.64 13.66 13.69 13.73 13.77 13.78 13.80 13.81 13.82 13.82 13.85 13.85 13.86 13.93 13.97 13.98 14.01 14.03 14.03 14.05 14.05 14.06 14.09 14.11 14.13 14.19 14.21 14.22 14.23 14.24 14.25 14.29 14.29 14.30 14.34 14.37 14.39 14.40 14.40 14.41 14.42 14.43 14.43 14.45 14.47 14.50 14.51 14.54 14.55 14.55 14.58 14.60 14.60 14.60 14.61 14.63 14.64 14.66 14.73 14.75 14.76 14.77 14.77 14.78 14.79 14.79 14.82 14.86 14.92 14.92 14.93 14.93 14.97 14.99 15.04 15.05 15.06 15.09 15.10 15.20 15.22 15.23 15.24 15.25 15.26 15.27 15.28 15.28 15.33 15.47 15.61 15.65 15.69 15.82 15.85 15.95 16.08 16.11 16.27 16.32 16.67 16.95 17.00 17.16 17.24 17.49 17.76 18.08 19.33 14.07 14.49 14.59 14.84 14.84 14.91 14.93 15.03 15.15 15.43 15.45 15.46 15.52 15.58 15.59 15.60 15.60 15.61 15.65 15.69 15.71 15.75 15.78 15.81 15.81 15.81 15.82 15.85 15.85 15.86 15.87 15.93 16.05 16.11 16.12 16.14 16.15 16.16 16.18 16.21 16.23 16.26 16.26 16.26 16.26 16.27 16.35 16.36 16.38 16.38 16.41 16.42 16.44 16.49 16.49 16.51 16.55 16.57 16.57 16.57 16.59 16.64 16.65 16.67 16.68 16.70 16.73 16.80 16.84 16.84 16.86 16.89 16.93 16.96 16.97 17.06 17.16 17.16 17.18 17.19 17.25 17.28 17.34 17.40 17.51 17.53 17.58 17.59 17.70 17.75 17.94 18.03 18.13 18.27 18.29 18.31 18.35 18.39 18.66 18.87 18.95 19.44 19.63 20.64 20.89 21.11 16.24 16.72 17.28 17.79 17.94 18.15 18.19 18.52 19.25 19.57 19.81 20.08 20.70 20.95 21.52 22.02 22.10 22.21 22.00 23.42 23.00 24.33]';   % cm, total length at f and T
data.tL_1m(:,1) = data.tL_1m(:,1) - 0.33*365; % convert year class to time since birth
n=size(data.tL_1m,1); for i=2:n; if data.tL_1m(i,1)<=data.tL_1m(i-1,1); data.tL_1m(i,1)=data.tL_1m(i-1,1)+1e-3; end; end
units.tL_1m = {'d', 'cm'};     label.tL_1m = {'time since birth', 'total length', 'male'};  
temp.tL_1m = C2K(18.1);  units.temp.tL_1m = 'K'; label.temp.tL_1m = 'temperature';
bibkey.tL_1m = 'BoufMera2021';
comment.tL_1m = 'Data for males';

% length-weight
data.LW_f = [11.4 13.2 14.1 14.3 15.4 15.5 15.5 15.6 15.8 16.1 16.1 16.1 16.2 16.2 16.3 16.3 16.4 16.4 16.5 16.6 16.6 16.7 16.7 16.8 16.8 16.8 16.8 16.9 16.9 17 17 17 17.1 17.2 17.4 17.4 17.5 17.5 17.5 17.5 17.5 17.7 17.7 17.7 17.9 18 18 18 18 18.1 18.1 18.1 18.1 18.2 18.3 18.4 18.4 18.4 18.4 18.5 18.5 18.5 18.5 18.5 18.5 18.6 18.6 18.6 18.6 18.7 18.7 18.8 18.8 19 19 19 19 19.1 19.2 19.2 19.2 19.3 19.3 19.4 19.4 19.4 19.4 19.4 19.5 19.5 19.7 19.7 19.7 19.7 19.8 19.8 20 20 20 20 20.1 20.4 20.5 20.5 20.5 20.5 20.5 20.7 20.8 20.8 20.8 21 21 21 21.1 21.2 21.3 21.5 21.7 21.8 21.8 22 22 22 22 22 22.5 23 23.3 24.4 24.5 26.5 17.27 17.68 ;      % cm, total length at f
         11.6 21.5 22.68 28.26 33.18 29.34 36.64 37.3 54.17 45.51 46.87 54.55 34.64 42.53 33.52 46.39 46.07 48.39 44.86 41.2 43.08 44.43 54.44 43.06 45.03 47.94 59.29 44.88 51.92 44.61 52.79 55.79 50.2 48.66 57.3 57.53 50.14 52.11 53.35 56.48 60.02 48.39 57.76 59.84 60.56 50.3 50.61 53.61 55 55.8 60.34 67.08 75.17 65.93 58.21 51.05 60.2 66.67 76 51.68 57.37 58.44 61.34 62.39 62.88 50.39 63.44 64.78 69.92 49.02 64.1 54.17 59.67 47.43 60.53 66.02 72.02 69.52 57.98 64.27 75.72 59.73 62.8 66.9 67.69 69.18 75.19 76.19 73.13 78.31 64.89 73.73 76.82 84.61 73.66 72.31 73.32 79.27 83.28 93.24 77.85 78.16 71.85 79.81 88.12 89.8 94.63 88.72 75.9 86.23 90.34 85.23 88.15 88.29 96.9 89.98 89.85 98.05 95.06 92.14 102 88.56 90.18 91.98 103.14 114.27 130.32 113.36 127.16 142.79 141.56 184.1 55.63 63.45]';   % g, wet weight at f and T
units.LW_f = {'cm', 'g'};     label.LW_f = {'total length', 'wet weight', 'female'};  
bibkey.LW_f = 'BoufMera2021'; comment.tL_f = 'Data for females';
%
data.LW_m = [12.6 13.2 13.2 13.4 13.5 13.5 13.6 14.2 14.3 14.3 14.4 14.4 14.5 14.5 14.6 14.6 14.8 14.9 15 15 15 15 15.1 15.2 15.3 15.3 15.3 15.4 15.4 15.5 15.5 15.7 15.7 15.7 15.7 15.7 15.8 15.9 16 16 16 16 16.1 16.1 16.14 16.2 16.2 16.2 16.3 16.4 16.4 16.5 16.5 16.5 16.5 16.5 16.5 16.5 16.6 16.6 16.6 16.6 16.7 16.7 16.7 16.7 16.7 16.7 16.8 16.8 16.9 16.9 16.9 16.9 17 17 17 17 17 17 17 17 17 17 17 17.1 17.1 17.2 17.2 17.2 17.2 17.2 17.2 17.2 17.2 17.2 17.2 17.3 17.3 17.3 17.3 17.4 17.4 17.4 17.5 17.5 17.5 17.5 17.5 17.5 17.5 17.6 17.7 17.8 17.8 17.9 18 18 18 18 18 18 18 18.1 18.1 18.1 18.1 18.2 18.2 18.2 18.3 18.3 18.4 18.5 18.5 18.6 18.7 18.8 18.9 18.9 19 19 19 19.01 19.1 19.2 19.2 19.3 19.3 19.5 19.5 19.6 19.6 19.7 19.9 19.9 20 20 20 20.2 20.3 20.3 20.5 20.7 20.8 20.9 21 21.2 21.5 21.6 21.6 21.7 22.7 22.9 23.5 23.6 15.44 15.77 16.25 16.57 ;      % cm, total length at f
         15.57 22.3 25.29 19.18 20.5 20.63 28.87 25.16 23.06 24.21 24.25 26 22.01 24.3 25.03 26.3 32.95 25.8 28.62 29.63 30.5 33.7 26.2 38.87 30.5 31.62 34.06 31.92 37.91 31.17 32.4 32.41 32.6 33.53 33.61 38.61 38.79 38.21 33.16 34.9 35.63 38.48 36.03 39.21 38.21 32.76 40.45 41.27 43.07 39.88 42.34 34.63 38.38 41.53 43.5 44.15 45.63 53.65 39.27 40.99 43.4 48.39 39.09 41.44 44.7 44.97 47.18 48.36 38.77 42.77 41.28 44.25 45.06 48.47 33.59 38.95 44.85 45.06 45.16 46.64 47.14 47.24 47.53 49.05 50.36 46.16 48.16 38.23 41.76 42.68 44.03 44.39 46.83 47.81 48.99 49.31 49.32 38.63 49.72 50.16 52.01 47.49 47.9 51.97 42.98 48.26 49.8 51.52 52.27 52.65 61.76 51.66 46.61 46.58 52.04 47.8 48.26 48.34 49.54 52.61 53.6 53.91 62.6 45.92 51.37 51.57 57.99 50.88 52.44 55.3 47.09 56.14 59.78 59.75 60.62 51.72 59.36 63.32 58.63 59.77 52.36 56.34 68.99 68.17 62.57 62.73 74.94 60.92 72.3 56.62 83.34 74.04 78.21 62.3 65.61 67.15 66.11 66.42 70.17 77.14 74.74 74.97 72.63 74.44 85.02 78.8 81.79 94.16 76.75 85.69 90.73 110.93 105.55 98.08 120.74 109.8 30.63 34.19 39.86 44.33]';   % g, wet weight at f and T
units.LW_m = {'cm', 'g'};     label.LW_m = {'total length', 'wet weight', 'male'};  
bibkey.LW_m = 'BoufMera2021'; comment.tL_m = 'Data for males';

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
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tL_1f','tL_1m'}; subtitle2 = {'Data for females, males'};
set3 = {'LW_f','LW_m'}; subtitle3 = {'Data for females, males'};
metaData.grp.sets = {set1,set2,set3};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: new and extra data';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '75XN6'; % Cat of Life
metaData.links.id_ITIS = '173051'; % ITIS
metaData.links.id_EoL = '46570277'; % Ency of Life
metaData.links.id_Wiki = 'Pegusa_lascaris'; % Wikipedia
metaData.links.id_ADW = 'Pegusa_lascaris'; % ADW
metaData.links.id_Taxo = '513562'; % Taxonomicon
metaData.links.id_WoRMS = '127156'; % WoRMS
metaData.links.id_fishbase = 'Pegusa-lascaris'; % fishbase

%% References 
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pegusa_lascaris}}';
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
bibkey = 'BoufMera2021'; type = 'techreport'; bib = [ ...  
'author = {Boufersaoui, S. and Meradef, B. and Samer, A.}, ' ...
'year = {2021}, ' ...
'title  = {Effet des param\`{e}tres du milieu sur la reproduction et la dynamique de population de \emph{Pegusa lascaris} ({R}isso, 1810) des eaux centre alg\''{e}riennes selon la th\''{e}orie {D}{E}{B}}, ' ...
'institution = {ENSSMAL Univ., Algiers}']; ...
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Ahls1984'; type = 'article'; bib = [ ...
'author = {E. H. Ahlstrom and K. Amaoka and D. A. Hensley and H. G. Moser and B. Y. Sumida}, ' ... 
'year   = {1984}, ' ...
'title  = {Pleuronectiformes: development}, ' ...
'journal = {Ontogeny and systematics of fishes}, ' ...
'page = { 640-670}, ' ...
'volume = {1}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mari1991'; type = 'article'; bib = [ ...
'author = {J. Marinaro}, ' ... 
'year   = {1991}, ' ...
'title  = {Eggs and larvae in some species of the genus \emph{Solea} ({P}isces, {S}oleidae) of the north-eastern {A}tlantic and the {M}editerranean}, ' ...
'journal = {Italian Journal of Zoology}, ' ...
'page = { 163-169}, ' ...
'volume = {2}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Deni1990'; type = 'article'; bib = [ ...
'author = {C. Deniel}, ' ... 
'year   = {1990}, ' ...
'title  = {Comparative study of growth of flatfishes on the west coast of {B}rittany}, ' ...
'journal = {Journalof Fish Biology}, ' ...
'page = {149-166}, ' ...
'volume = {37}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Pegusa-lascaris.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

