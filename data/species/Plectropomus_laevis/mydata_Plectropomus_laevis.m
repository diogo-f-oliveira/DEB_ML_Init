function [data, auxData, metaData, txtData, weights] = mydata_Plectropomus_laevis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Plectropomus_laevis'; 
metaData.species_en = 'Blacksaddled coralgrouper'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.6); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 12 29];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 29];

%% set data
% zero-variate data

data.ab = 5; units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(27.6);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 20 * 365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(27.6); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 60;       units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 125;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 4.5e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.95 mm: pi/6*0.095^3';
data.Wwp = 2762;      units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.01000*Lp^3.06, see F1';
data.Wwi = 26094;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.06, see F1; max. published weight: 24.2 kg';

data.GSI = 0.045; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'guess';
  temp.GSI = C2K(27.6); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
8.074	78.318
8.111	80.122
10.000	88.978
10.074	96.795
11.926	72.784
11.926	90.419
12.000	92.024
13.037	82.826
13.963	97.073
14.963	104.308
15.000	95.090
15.037	98.498
15.963	98.516
15.963	103.526
16.000	82.886
18.111	98.960
20.000	95.591
20.037	101.203
20.074	109.020];
data.tL(:,1) = (0.95+data.tL(:,1)) * 365;
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(27.6);  units.temp.tL = 'K'; label.temp.tLW = 'temperature';
bibkey.tL = 'Gran2005'; 

% length-weight
data.LW = [ ... % total length (cm), weight (g)
75.965	6200.652
81.156	8550.684
82.702	8201.691
83.457	10292.010
84.236	9377.092
86.359	9245.660
91.734	12771.583
91.933	11987.540
94.432	13162.591
98.460	16166.355
98.843	16558.202
99.044	15469.278
100.409	13639.515
101.157	16731.578
101.164	15773.387
103.270	17863.215
104.423	18472.553
106.344	19560.706
106.734	18950.807
112.674	24305.794];    
units.LW   = {'cm', 'g'};  label.LW = {'total length', 'weight'};  
bibkey.LW = 'Gran2005'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;
weights.Wwp = 0 * weights.Wwp;
weights.Wwi = 0 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01000*(TL in cm)^3.06'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4K5TZ'; % Cat of Life
metaData.links.id_ITIS = '551115'; % ITIS
metaData.links.id_EoL = '46579750'; % Ency of Life
metaData.links.id_Wiki = 'Plectropomus_laevis'; % Wikipedia
metaData.links.id_ADW = 'Plectropomus_laevis'; % ADW
metaData.links.id_Taxo = '105914'; % Taxonomicon
metaData.links.id_WoRMS = '218260'; % WoRMS
metaData.links.id_fishbase = 'Plectropomus_laevis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Plectropomus_laevis}}';
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
bibkey = 'Gran2005'; type = 'article'; bib = [ ... 
'author = {Grandcourt, E.}, ' ... 
'year = {2005}, ' ...
'title = {Demographic characteristics of selected epinepheline groupers (Family: {S}erranidae; Subfamily: {E}pinephelinae) from {A}ldabra {A}toll, {S}eychelles}, ' ...
'journal = {Atoll Res. Bull.}, ' ...
'volume = {539}, '...
'pages = {200-216}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Plectropomus_laevis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

