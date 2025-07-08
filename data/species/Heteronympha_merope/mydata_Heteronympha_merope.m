function [data, auxData, metaData, txtData, weights] = mydata_Heteronympha_merope

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Insecta'; 
metaData.order      = 'Lepidoptera'; 
metaData.family     = 'Nymphalidae';
metaData.species    = 'Heteronympha_merope'; 
metaData.species_en = 'Common Brown Butterfly'; 

metaData.ecoCode.climate = {'BWh', 'BSh', 'Csa'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTd', '0iTa', '0iTh'};
metaData.ecoCode.embryo  = {'Th'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjHl', 'eiHn'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'aj'; 'ae'; 'am'; 'E0'; 'L_t'; 'Wwb'; 'Wwj'; 'Wwe'; 'Ri'}; 
metaData.data_1     = {'t-Ww'; 'Ww-JO'; 'T-ab'; 't-N'}; 

metaData.COMPLETE = 3.0; % using criteria of LikaKear2011

metaData.author   = {'Michael Kearney'};    
metaData.date_subm = [2019 07 01];              
metaData.email    = {'mrke@unimelb.edu.au'};            
metaData.address  = {'Melbourne University'};   

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2019 07 01]; 

%% set data
% zero-variate data

data.t1 = 17.12; units.t1 = 'd'; label.t1 = 'duration of instar 1'; bibkey.t1 = 'Bris2012';   
  temp.t1 = C2K(15); units.temp.t1 = 'K'; label.temp.t1 = 'temperature'; 
data.t2 = 17.4; units.t2 = 'd'; label.t2 = 'duration of instar 2'; bibkey.t2 = 'Bris2012';   
  temp.t2 = C2K(15); units.temp.t2 = 'K'; label.temp.t2 = 'temperature'; 
data.t3 = 26.5; units.t3 = 'd'; label.t3 = 'duration of instar 3'; bibkey.t3 = 'Bris2012';   
  temp.t3 = C2K(15); units.temp.t3 = 'K'; label.temp.t3 = 'temperature'; 
data.t4 = 30.9; units.t4 = 'd'; label.t4 = 'duration of instar 4'; bibkey.t4 = 'Bris2012';   
  temp.t4 = C2K(15); units.temp.t4 = 'K'; label.temp.t4 = 'temperature'; 
data.t5 = 70.3; units.t5 = 'd'; label.t5 = 'duration of instar 5'; bibkey.t5 = 'Bris2012';   
  temp.t5 = C2K(15); units.temp.t5 = 'K'; label.temp.t5 = 'temperature'; 
data.tj = data.t1 + data.t2 + data.t3 + data.t4 + data.t5; units.tj = 'd'; label.tj = 'time since birth at pupation'; bibkey.tj = 'Bris2012';   
  temp.tj = C2K(15);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.te = 41.58; units.te = 'd'; label.te = 'time since pupation at emergence'; bibkey.te = 'Bris2012';
  temp.te = C2K(15); units.temp.te = 'K'; label.temp.te = 'temperature';
data.am = 135; units.am = 'd'; label.am = 'life span as imago'; bibkey.am = 'Bris2012';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.L1 = 0.051; units.L1 = 'cm'; label.L1 = 'length head capsule of instar 1'; bibkey.L1 = 'Bart2014';
data.L2 = 0.086; units.L2 = 'cm'; label.L2 = 'length head capsule of instar 2'; bibkey.L2 = 'Bart2014';
data.L3 = 0.137; units.L3 = 'cm'; label.L3 = 'length head capsule of instar 3'; bibkey.L3 = 'Bart2014';
data.L4 = 0.22; units.L4 = 'cm'; label.L4 = 'length head capsule of instar 4'; bibkey.L4 = 'Bart2014';
data.L5 = 0.35; units.L5 = 'cm'; label.L5 = 'length head capsule of instar 5'; bibkey.L5 = 'Bart2014';

data.Wwb = 0.409; units.Wwb = 'mg'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Bris2012';
data.Wwj = 356.6; units.Wwj = 'mg'; label.Wwj = 'wet weight of pupa';      bibkey.Wwj = 'Bris2012';
data.Wwe = 171.2; units.Wwe = 'mg'; label.Wwe = 'wet weight of imago';     bibkey.Wwe = 'Bris2012';

% uni-variate data

tW8 = csvread('tW8.csv');
data.tW8 =  cat(2,tW8(:,1),tW8(:,2)*1000);
units.tW8  = {'d', 'mg'}; label.tW8 = {'time since birth', 'wet weight'};  
temp.tW8   = C2K(8);  units.temp.tW8 = 'K'; label.temp.tW8 = 'temperature';
bibkey.tW8 = 'Bris2012';

tW12 = csvread('tW12.csv');
data.tW12 =  cat(2,tW12(:,1),tW12(:,2)*1000);
units.tW12  = {'d', 'mg'}; label.tW12 = {'time since birth', 'wet weight'};  
temp.tW12   = C2K(12);  units.temp.tW12 = 'K'; label.temp.tW12 = 'temperature';
bibkey.tW12 = 'Bris2012';

tW15 = csvread('tW15.csv');
data.tW15 =  cat(2,tW15(:,1),tW15(:,2)*1000);
units.tW15  = {'d', 'mg'}; label.tW15 = {'time since birth', 'wet weight'};  
temp.tW15   = C2K(15);  units.temp.tW15 = 'K'; label.temp.tW15 = 'temperature';
bibkey.tW15 = 'Bris2012';

data.Tab = [ ... % temperature (C), age at birth (d)
    8	40.1704545454545
    12	27.8923076923077
    15	18.5542168674699
    20	11.2098765432099
    25	9.81538461538462];
units.Tab  = {'C', 'd'}; label.Tab = {'temperature', 'age at birth'};  
bibkey.Tab = 'Bris2012';

% reproduction data		
data.tN =  [... % time since adult emergence (d), cumulative eggs (#), 
        0   0   
        37  0   
        38	2	
        40	4	
        41	5	
        43	58	
        46	109	
        49	123	
        50	130	
        57	183	
        60	197	
        62	237	
        63	249	
        66	262];
units.tN   = {'d', '#'};  label.tN = {'time', 'cumulative number of eggs'};  
temp.tN    = C2K(20);  units.temp.tN = 'K'; label.temp.tN = 'temperature';
bibkey.tN = 'Bart2014';
  
%% set weights for all real data
weights = setweights(data, []);
weights.Tab = 5 * weights.Tab;
weights.Wwb = 10 * weights.Wwb;
weights.tN = 3 * weights.tN;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.kap = 4 * weights.psd.kap;
weights.psd.v = 4 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;

%% Links
metaData.links.id_CoL = '3LB7Y'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '138167'; % Ency of Life
metaData.links.id_Wiki = 'Heteronympha_merope'; % Wikipedia
metaData.links.id_ADW = 'Heteronympha_merope'; % ADW
metaData.links.id_Taxo = '1111847'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_lepidoptera = '141009'; % lepidoptera

%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Bart2014'; type = 'Article'; bib = [ ... 
'author = {Barton, M. and Sunnucks, P. and Norgate, M. and Murray, N. D. and Kearney, M. R.}, ' ... 
'year = {1960}, ' ...
'title = {Co-gradient variation in growth rate and development time of a broadly distributed butterfly}, ' ...
'journal = {PLoS One}, ' ...
'volume = {9}, ' ...
'pages = {e95258}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Bris2012'; type = 'Article'; bib = [ ... 
'author = {Briscoe, N. J. and Porter, W. P. and Sunnucks, P. and Kearney, M. R.}, ' ... 
'year = {2012}, ' ...
'title = {Stage-dependent physiological responses in a butterfly cause non-additive effects on phenology}, ' ...
'journal = {Oikos}, ' ...
'volume = {121}, ' ...
'pages = {1464--1472}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

