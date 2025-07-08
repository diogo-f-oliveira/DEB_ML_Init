function [data, auxData, metaData, txtData, weights] = mydata_Empetrichthys_latos
%% set metaData

metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cyprinodontiformes'; 
metaData.family     = 'Goodeidae';
metaData.species    = 'Empetrichthys_latos'; 
metaData.species_en = 'Pahrump poolfish'; 

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFp'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'}; 
metaData.data_1     = {'L-Ww';'L-N'}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2020 07 27];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 07 27]; 

%% set data
% zero-variate data;

data.tp = 0.75*365;     units.tp = 'd';    label.tp = 'time since birth at puiberty';     bibkey.tp = 'DeacWill2010';
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
  comment.tp = 'based on remark that largest SL with no annulus was 51 mm';
data.am = 4.5*365;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'DeacWill2010';
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 3.0;  units.Lp  = 'cm';	label.Lp  = 'standard length at puberty';  bibkey.Lp  = 'DeacWill2010';
data.Li  = 7.9;   units.Li  = 'cm';	label.Li  = 'ultimate std length';    bibkey.Li  = 'Good2016'; 
data.Lim  = 4.4;   units.Lim  = 'cm';	label.Lim  = 'ultimate std length for males';    bibkey.Lim  = 'Good2016'; 

data.Wwb = 4.2e-3; units.Wwb = 'g';	label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'UribGrie2012'; 
  comment.Wwb = 'based on egg diameter of 2 mm: pi/6*0.2^3; DeacWill2010 consider egg of 1.2mm as mature';

% uni-variate data

% length-fecundity 
data.LN = [ ... % standard length (cm), fecundity (#)
3.5 19
4.5 33
5.5 63
6.5 111];
units.LN   = {'cm','#'};  label.LN = {'standard length', 'fecundity'};  
temp.LN    = C2K(15);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'DeacWill2010';

% length-weight
data.LWw_f = [ ... % TL (mm), SL (mm), Ww (g)
  36.5 42.2 1.39
  38.1 44.4 1.64
  39.9 46.6 1.87
  37.7 43.7 1.54
  33.7 40.9 1.20
  47.0 52.5 2.49
  35.2 41.3 1.30
  38.8 45.5 1.65
  37.0 42.9 1.40
  43.7 50.3 2.65
  40.6 47.8 2.12
  34.2 39.9 1.11
  37.2 44.6 1.54
  37.3 42.7 1.39
  34.5 38.6 1.12
  34.7 41.0 1.28
  37.2 42.5 1.45
  40.0 46.0 1.70
  34.6 41.4 1.23
  38.2 43.3 1.61
  37.6 42.2 1.36
  37.1 42.8 1.33
  40.2 45.8 1.80
  40.7 48.4 1.82
  53.2 59.5 4.15
  45.0 52.9 2.50
  41.7 46.9 1.76
  43.5 49.9 2.25
  44.8 50.4 2.20
  43.4 50.7 2.27
  42.7 48.7 1.94
  39.9 45.6 1.70
  36.4 42.8 1.41
  40.1 47.0 1.83
  46.6 53.8 2.74
  47.7 53.4 2.81
  37.0 42.0 1.33
  37.7 43.6 1.36
  39.8 46.5 1.65
  45.1 52.6 2.41
  46.6 53.6 2.51
  38.3 44.6 1.65
  43.1 49.4 2.07
  50.1 55.3 2.79
  38.5 45.6 1.80
  44.4 51.6 2.32
  43.7 49.6 2.33
  47.0 54.1 2.87
  47.6 55.6 3.04
  41.4 48.2 1.92
  44.1 51.3 2.42
  40.7 47.8 2.08
  37.4 43.8 1.50
  39.2 44.6 1.70
  40.9 47.4 1.95
  42.8 48.9 2.12
  40.8 44.4 1.55
  39.2 45.5 1.57
  45.7 52.1 2.40
  50.0 56.7 3.17
  43.0 48.7 2.02
  45.0 52.9 2.59
  39.8 45.9 1.63
  45.3 51.0 2.39
  40.9 45.5 1.64
  49.5 56.3 3.25
  51.2 56.8 3.69
  45.7 52.4 2.46
  46.0 52.5 2.67
  49.6 55.0 3.21
  44.8 49.8 2.09
  40.6 46.2 1.61
  47.6 55.4 3.03
  50.5 58.1 3.44
  50.8 58.1 3.32
  37.3 42.4 1.32
  39.5 45.4 1.58
  46.1 53.0 2.35
  30.5 36.4 0.81
  44.6 51.5 2.53
  38.9 47.3 1.60
  40.6 47.2 1.87
  39.6 45.3 1.48
  40.1 46.2 1.80
  41.2 47.2 1.74
  49.7 58.2 3.08
  42.2 48.9 2.03
  41.2 46.5 1.97
  43.3 50.0 2.15
  48.5 55.4 3.08
  43.3 49.2 2.09
  48.1 54.8 3.13
  41.3 47.4 1.79
  49.3 57.2 2.99
  40.1 45.3 1.74
  43.2 49.6 2.16
  40.1 46.6 1.84
  38.8 46.0 1.63
  38.0 45.0 1.50
  37.5 44.1 1.53
  48.2 54.5 2.83
  44.8 51.9 2.74
  41.9 48.2 2.03
  41.1 48.6 2.41
  39.5 46.4 1.90
  44.2 50.0 2.27
  41.6 49.6 2.36
  38.1 44.0 1.55
  43.5 50.5 2.42
  40.7 46.7 1.86
  41.3 48.8 2.12
  41.9 49.0 2.00
  39.1 45.7 1.71
  40.8 47.0 1.81
  50.7 57.4 3.62
  33.5 38.7 1.02
  48.4 56.3 3.31
  50.0 59.9 4.35
  44.9 54.0 2.97
  47.5 55.8 3.35
  31.4 36.8 0.84
  39.7 46.7 1.83
  41.3 51.1 2.18
  48.9 58.3 3.58
  44.5 53.1 2.78
  43.2 49.7 2.09
  36.5 45.8 1.69
  44.6 52.4 2.45
  37.5 44.5 1.73
  44.3 53.3 2.74
  34.2 40.4 1.05
  43.3 51.5 2.85
  38.7 46.2 1.84
  52.3 60.4 3.94
  41.5 48.3 2.16
  45.8 54.1 2.93
  44.5 52.8 3.02
  46.8 54.4 2.97
  40.4 47.9 2.32
  31.8 38.9 0.95
  31.2 37.8 0.87
  47.6 55.5 3.43
  42.0 49.1 2.20
  42.0 48.9 2.17
  31.6 36.4 0.82
  43.0 51.2 2.30
  45.2 52.2 2.36
  52.9 61.4 4.76
  52.3 61.7 4.35
  41.9 49.7 2.38
  41.9 48.8 1.99
  42.4 50.5 2.30
  42.2 50.1 2.44
  30.2 35.6 0.79
  31.8 37.8 0.87
  41.7 48.8 2.23
  34.6 40.7 1.12
  34.9 41.7 1.22
  30.1 36.1 0.77
  34.1 39.7 1.11
  51.8 58.0 3.40
  37.6 43.6 1.50
  36.8 41.5 1.31
  42.1 47.4 2.06
  51.4 57.4 3.51
  47.1 53.8 2.78
  38.4 42.5 1.37
  42.0 46.5 1.70
  35.9 41.9 1.22
  36.3 42.8 1.34
  39.3 44.1 1.58
  38.1 43.0 1.56
  41.9 47.3 1.75
  46.2 52.1 2.42
  38.0 43.5 1.31
  66.2 58.1 5.46
  39.1 43.0 1.16
  37.6 41.3 1.22
  36.4 40.5 1.07
  32.0 35.5 0.75
  33.5 36.0 0.82
  49.9 56.6 3.51
  47.8 55.3 3.17
  34.2 40.3 1.02
  39.3 48.0 1.73
  56.6 64.8 5.14
  48.6 57.0 3.41
  46.2 52.9 2.59
  58.8 63.9 5.29
  50.6 60.0 3.75
  50.5 57.9 3.53
  66.4 73.7 7.95
  66.9 75.8 8.30
  51.6 57.2 3.59
  47.1 52.3 2.47
  44.2 50.0 2.33
  60.4 68.2 6.06
  45.0 52.7 2.38
  49.9 56.9 3.36
  46.6 51.4 2.43
  41.0 46.8 1.67
  56.3 64.5 5.44
  45.0 50.3 2.54
  57.8 63.8 5.20
  48.5 55.7 2.94
  56.0 64.6 5.05
  59.3 65.7 5.20
  48.8 55.3 3.20
  63.0 70.6 6.45
  46.5 53.9 2.81
  63.7 71.4 6.56
  50.0 56.4 3.48
  51.3 59.6 3.95
  49.5 58.4 3.63
  79.2 88.6 14.94
  46.8 53.2 3.06
  68.2 77.4 9.90
  44.1 50.1 2.51
  58.8 66.1 5.83
  49.6 58.8 4.03
  51.8 57.9 3.94
  45.6 52.6 2.62
  57.0 64.8 5.75
  53.4 60.2 3.82
  75.1 83.1 10.67
  57.4 65.5 5.81
  65.7 73.9 8.01
  53.2 60.2 4.44
  66.5 74.7 8.73
  50.6 57.1 4.13
  50.5 56.1 3.16
  67.1 74.5 8.50
  50.1 57.2 3.86
  57.6 64.5 5.47
  43.8 49.8 2.44
  56.1 63.4 5.35
  57.2 65.7 5.47
  69.7 77.5 9.51
  50.1 56.7 3.38
  47.5 55.0 3.19
  60.0 69.4 6.48
  49.4 56.1 3.42
  53.1 61.6 4.74
  57.3 64.2 5.72
  57.0 64.8 6.34
  59.2 66.8 6.11
  53.5 60.2 4.22
  62.0 69.6 7.09
  49.1 54.9 3.52
  61.2 68.4 6.69
  50.7 57.7 4.40
  66.0 73.7 8.93
  53.8 59.8 4.17
  48.8 54.2 2.89
  45.8 51.9 2.90
  49.3 56.3 3.30
  51.7 59.0 4.15
  52.2 58.3 3.79
  54.6 63.6 4.67
  51.1 59.7 4.15
  57.5 65.3 5.70
  46.1 53.6 3.01
  42.8 49.2 2.43
  54.2 61.1 3.92
  45.9 53.4 3.07
  51.2 57.3 3.81
  50.4 58.8 3.66
  48.6 55.2 3.37
  67.3 78.5 9.39
  62.9 71.1 7.15
  55.8 66.9 5.40
  52.4 61.3 4.57
  57.7 64.8 4.99
  62.8 70.9 6.80
  51.4 57.5 3.66
  44.9 53.2 3.13
  67.1 75.7 9.90
  59.2 67.4 5.99
  43.9 49.9 2.48
  53.0 63.4 4.78
  61.8 71.0 7.56
  44.0 51.1 2.79
  57.5 65.3 6.13
  45.7 53.4 2.18
  57.2 65.9 5.92
  45.9 54.0 3.52
  52.1 61.6 4.45
  48.5 54.9 3.37
  54.6 62.7 4.75
  50.0 57.7 3.60
  54.2 60.6 4.43
  55.6 61.7 5.15
  61.4 70.8 6.69
  51.0 58.8 4.09
  46.6 54.7 3.14
  48.5 56.0 3.35
  53.5 61.1 4.71
  53.6 61.0 4.31
  49.6 55.9 4.00
  36.3 42.0 1.19
  55.0 63.5 4.70
  53.0 62.9 4.77
  54.7 61.5 4.43
  53.5 61.4 4.46
  51.1 58.9 3.71
  47.9 57.5 3.36
  53.5 60.8 4.33
  48.9 57.2 3.40
  51.6 59.6 4.24
  57.5 66.9 5.68
  46.1 53.8 3.17
  44.7 53.2 3.06
  56.9 64.4 5.60
  63.3 70.4 8.45
  55.4 65.2 5.22
  55.1 63.2 4.81
  50.7 58.7 3.81
  60.2 68.9 6.76
  57.0 66.4 5.38
  47.5 54.8 3.36
  53.4 62.4 4.95
  45.4 52.2 3.03
  49.1 56.5 3.66
  54.3 66.0 5.47
  52.5 62.0 4.96
  49.2 57.7 3.73
  44.5 53.2 3.05
  53.5 61.1 4.32
  57.2 64.2 5.24
  50.0 58.3 3.67
  45.2 54.6 3.32
  48.6 57.9 3.92];
data.LWw_f = data.LWw_f(:,[1 3]); data.LWw_f(:,1) =  data.LWw_f(:,1)/10; % convert mm to cm
units.LWw_f   = {'cm','g'};  label.LWw_f = {'standard length', 'wet weight', 'female'};  
bibkey.LWw_f = 'Good2016';
comment.LWw_f = 'Data for females';
%    
data.LWw_m = [ ...    
 34.6 40.5 1.32
 31.9 37.8 0.92
 33.9 40.3 1.12
 34.9 39.8 1.04
 35.4 42.4 1.29
 36.3 40.8 1.30
 34.3 39.4 1.10
 31.8 38.9 0.91
 35.8 41.0 1.39
 33.7 39.7 1.16
 41.9 47.2 2.05
 36.8 42.0 1.32
 38.8 44.4 1.73
 33.3 39.0 0.96
 33.3 38.7 0.99
 31.5 37.5 0.86
 33.5 38.0 1.09
 30.0 35.2 0.75
 36.6 43.2 1.26
 29.7 34.3 0.66
 33.0 39.1 1.14
 31.4 38.1 1.01
 32.6 37.7 0.99
 29.7 35.4 0.74
 33.5 40.4 1.16
 32.5 39.4 1.05
 30.7 37.1 0.76
 29.4 36.0 0.83
 30.0 36.2 0.88
 36.0 42.9 1.39
 36.6 43.6 1.44
 27.6 32.5 0.57
 29.3 34.8 0.77
 40.9 46.3 1.90
 34.0 34.7 0.70
 36.1 39.9 1.24
 33.5 36.5 0.87
 42.6 46.5 1.80
 32.8 38.7 0.99
 28.9 32.8 0.62
 34.7 39.5 1.06
 31.2 36.3 0.80
 32.1 36.0 0.76
 38.3 41.2 1.22
 39.1 45.0 1.66
 32.1 35.3 0.76
 36.4 39.0 1.10
 30.7 34.7 0.68
 31.7 35.2 0.69
 32.4 36.5 0.77
 23.8 26.8 0.32
 23.4 25.8 0.31
 37.3 41.6 1.06
 29.3 32.8 0.65
 38.1 41.5 1.21
 38.4 43.5 1.26
 29.7 33.5 0.62
 34.9 39.3 1.03
 35.7 39.9 1.05
 18.6 21.1 0.16
 26.7 29.0 0.38
 23.5 25.9 0.31
 22.4 24.9 0.25
 17.3 19.9 0.12
 24.9 28.2 0.39
 30.0 32.4 0.62
 26.2 29.5 0.42
 28.8 32.0 0.62
 27.0 30.1 0.45
 29.1 33.0 0.65
 29.4 32.3 0.59
 27.8 32.5 0.62
 30.9 37.0 0.82
 37.6 43.0 1.39
 34.0 41.0 1.09
 34.3 40.4 1.08
 32.1 36.8 0.77
 36.3 41.4 1.01
 31.0 37.4 0.76
 37.3 43.6 1.37
 30.3 35.5 0.58
 37.3 45.6 1.63
 32.6 39.1 0.97
 37.9 42.9 1.34
 30.6 36.2 0.82
 37.5 43.2 1.53
 34.3 40.4 1.13
 38.0 45.2 1.58
 42.0 48.6 2.18
 36.1 42.1 1.31
 40.4 45.0 1.91
 38.6 43.5 1.28
 35.0 40.2 1.08
 39.4 44.8 1.62
 34.2 39.3 0.97
 39.2 44.8 1.49
 38.4 45.0 1.64
 36.0 41.1 1.15
 32.7 38.4 0.92
 39.3 45.3 1.83
 36.2 43.0 1.32
 38.2 44.9 1.55
 36.9 41.3 1.31
 38.4 44.0 1.42
 43.5 48.7 2.12
 37.2 43.9 1.39
 38.7 45.7 1.63
 36.9 42.9 1.42
 40.5 45.5 1.65
 34.6 39.2 1.14
 39.9 46.8 1.82
 43.1 49.4 2.07
 42.5 48.4 2.17
 37.1 42.0 1.35
 37.0 42.5 1.27
 38.0 44.4 1.50
 44.0 48.9 2.20
 39.8 45.0 1.57
 39.6 45.9 1.56
 38.8 44.7 1.48
 36.9 42.8 1.49
 37.1 43.8 1.39
 35.6 40.8 1.21
 36.0 39.9 1.12
 29.9 35.4 0.92];
data.LWw_m = data.LWw_m(:,[1 3]); data.LWw_m(:,1) =  data.LWw_m(:,1)/10; % convert mm to cm
units.LWw_m   = {'cm','g'};  label.LWw_m = {'standard length', 'wet weight', 'male'};  
bibkey.LWw_m = 'Good2016';
comment.LWw_m = 'Data for males';

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
set1 = {'LWw_f', 'LWw_m'}; subtitle1 = {'Data for males, females'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Temperature in tL and tWw data varied between 5 and 20 C';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: W in g = 0.01000*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL = 0.87*TL';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '39HKK'; % Cat of Life
metaData.links.id_ITIS = '165691'; % ITIS
metaData.links.id_EoL = '207202'; % Ency of Life
metaData.links.id_Wiki = 'Empetrichthys_latos'; % Wikipedia
metaData.links.id_ADW = 'Empetrichthys_latos'; % ADW
metaData.links.id_Taxo = '192746'; % Taxonomicon
metaData.links.id_WoRMS = '1014289'; % WoRMS
metaData.links.id_fishbase = 'Empetrichthys-latos'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Empetrichthys_latos}}';
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
bibkey = 'Good2016'; type = 'phdthesis'; bib = [ ... 
'author = {Shawn Christopher Goodchild},'...
'title = {Life history and interspecific co-persistence of native imperiled fishes in single species and multi-species ex situ refuges},'...
'school = {North Dakota State Univ.},'...
'year = {2016}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'UribGrie2012'; type = 'Article'; bib = [ ... 
'author = {Mari Carmen Uribe and Harry J. Grier and Lynne R. Parenti},'...
'title = {Ovarian Structure and Oogenesis of the Oviparous Goodeids \emph{Crenichthys baileyi} ({G}ilbert, 1893) and \emph{Empetrichthys latos} {M}iller, 1948 ({T}eleostei, {C}yprinodontiformes)},'...
'journal = {Journal of Morphology},'...
'volume = {273},'...
'year = {2012},'...
'pages = {371-387}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DeacWill2010'; type = 'Article'; bib = [ ... 
'author = {James E. Deacon and Joshua E. Williams},'...
'title = {RETROSPECTIVE EVALUATION OF THE EFFECTS OF HUMAN DISTURBANCE AND GOLDFISHINTRODUCTION ON ENDANGERED PAHRUMP POOLFISH},'...
'journal = {Western North American Naturalist},'...
'volume = {70(4)},'...
'year = {2010},'...
'pages = {425-436}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Empetrichthys-latos.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

