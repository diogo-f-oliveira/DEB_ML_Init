function [data, auxData, metaData, txtData, weights] = mydata_Epinephelus_itajara

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Epinephelus_itajara'; 
metaData.species_en = 'Atlantic goliath grouper'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'R_i'}; 
metaData.data_1     = {'t-L'}; 

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

data.ab = 2.5; units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(26.3);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 37 * 365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(26.3); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 128;       units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 250;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 4.5e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.95 mm: pi/6*0.095^3';
data.Wwp = 26.6e3;      units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01096*Lp^3.03, see F1';
data.Wwi = 202e3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01096*Li^3.03, see F1; max. published weight: 455 kg';

data.Ri  = 56599306/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(26.3);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL_fm = [ ... % time since birth (yr), total length (cm)
    0  33.4  NaN
    1  51.7  NaN
    2  71.7  NaN
    3  70.8  86.3
    4  92.4 118.4
    5 121.8 108.0
    6 NaN   107.8
    7 NaN   131.8
    8 133.3 147.6
    9 139.9 140.0
   10 151.5 139.8
   11 163.2 166.0
   12 164.7 169.0
   13 165.3 162.0
   14 176.2 184.9
   15 191.3 182.8
   16 186.0 190.9
   17 187.8 177.0
   18 182.0 NaN
   19 NaN   NaN
   20 199.0 NaN
   21 202.3 NaN
   22 201.1 NaN
   23 NaN   NaN
   24 195.0 190.5
   25 NaN   195.5
   26 NaN   193.0
   27 206.5 NaN
   28 193.5 NaN
   29 NaN   NaN
   30 NaN   NaN
   33 201.5 NaN
   34 NaN   NaN
   36 NaN   NaN
   37 197.0 NaN];
data.tL_fm(:,1) = (0.8+data.tL_fm(:,1)) * 365;
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm    = C2K(26.3);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'BullMurp1992'; treat.tL_fm = {1 {'females','males'}};
      
%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 10 * weights.tL_fm;
weights.Li = 5 * weights.Li;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01096*(TL in cm)^3.03'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6FTP5'; % Cat of Life
metaData.links.id_ITIS = '167695'; % ITIS
metaData.links.id_EoL = '46579617'; % Ency of Life
metaData.links.id_Wiki = 'Epinephelus_itajara'; % Wikipedia
metaData.links.id_ADW = 'Epinephelus_itajara'; % ADW
metaData.links.id_Taxo = '45075'; % Taxonomicon
metaData.links.id_WoRMS = '159353'; % WoRMS
metaData.links.id_fishbase = 'Epinephelus-itajara'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Epinephelus_itajara}}';
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
bibkey = 'BullMurp1992'; type = 'Article'; bib = [ ... 
'doi = {10.1577/1548-8659(1984)113<607:gmaymf>2.0.co;2}, ' ...
'author = {Bullock, L.H. and M.D. Murphy and M.F. Godcharles and M.E. Mitchell}, ' ... 
'year = {1992}, ' ...
'title = {Age, growth, and reproduction of jewfish \emph{Epinephelus itjara} in the eastern {G}ulf of {M}exico}, ' ...
'journal = {Fish. Bull.}, ' ...
'volume = {90}, ' ...
'pages = {243-249}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Epinephelus-itajara.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

