  function [data, auxData, metaData, txtData, weights] = mydata_Pseudoplatystoma_punctifer
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Pimelodidae';
metaData.species    = 'Pseudoplatystoma_punctifer'; 
metaData.species_en = 'Spotted tiger sorubim'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnf'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCvf','biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 11 07];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 07];

%% set data
% zero-variate data
data.ab = 9; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(26);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 18*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(26);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 50;  units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'ArmaGarc2022';
data.Li = 100;  units.Li = 'cm';   label.Li = 'ultimate std length';  bibkey.Li = 'fishbase';

data.Wwb = 2.8e-3;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.74 mm of Hemisorubim_platyrhynchos: pi/6*0.174^3';
data.Wwp = 1e3;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00575*Lp^3.10, see F1';
data.Wwi = 9.1e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00575*Li^3.10, see F1';

data.Ri = 1.5e6/365; units.Ri = '#/d';  label.Ri = 'max reproduction rate';   bibkey.Ri = 'guess';
  temp.Ri = C2K(26);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Pseudoplatystoma_tigrinum: (100/130)^3*3.4e6';
  
% uni-variate data
% time-length
data.tL_Afm = [ ... % time since birth (yr), total length (cm)
    1 35.3 34.4
    2 46.6 44.2
    3 55.9 52.6
    4 63.5 59.7
    5 69.6 65.7
    6 74.7 70.8
    7 78.8 75.1
    8 82.2 78.8
    9 85.0 81.9
   10 87.2 84.6];
data.tL_Afm(:,1) = (data.tL_Afm(:,1) + 0.8) * 365; % convert yr to d
units.tL_Afm = {'d', 'cm'};  label.tL_Afm = {'time since birth', 'total length'};  
  temp.tL_Afm = C2K(21);  units.temp.tL_Afm = 'K'; label.temp.tL_Afm = 'temperature';
bibkey.tL_Afm = 'ArmaGarc2022'; title.tL_Afm = 'data from Amazon-Maranon-Ucayali system';
  treat.tL_Afm = {1 {'females','males'}}; label.treat.tL_Afm = 'AMU system';
%
data.tL_Pfm = [ ... % time since birth (yr), total length (cm)
    1 35.8 38.2
    2 46.0 46.9
    3 52.9 51.2
    4 57.7 53.3
    5 61.0 54.3
    6 63.2 54.8
    7 64.7 55.0
    8 65.8 55.2
    9 66.5 55.2
   10 67.0 55.3];
data.tL_Pfm(:,1) = (data.tL_Pfm(:,1) + 0.8) * 365; % convert yr to d
units.tL_Pfm = {'d', 'cm'};  label.tL_Pfm = {'time since birth', 'total length'};  
  temp.tL_Pfm = C2K(28);  units.temp.tL_Pfm = 'K'; label.temp.tL_Pfm = 'temperature';
bibkey.tL_Pfm = 'ArmaGarc2022'; title.tL_Pfm = 'data from Putumayo river';
  treat.tL_Pfm = {1 {'females','males'}}; label.treat.tL_Pfm = 'Putumayo river';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_Afm = weights.tL_Afm * 5;
weights.tL_Pfm = weights.tL_Pfm * 5;
weights.ab = weights.ab * 0;

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
txtData.title = title;

% %% Group plots
% set1 = {'tL_Af','tL_Am'}; subtitle1 = {'data for females, males from AMU system'};
% set2 = {'tL_Pf','tL_Pm'}; subtitl2 = {'data for females, males from Putumayo river'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'The Putumayo river is assumed to be somewhat warmer than the AMU system';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.00575*(TL in cm)^3.10'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4P84W'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '12109730'; % Ency of Life
metaData.links.id_Wiki = 'Pseudoplatystoma_punctifer'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '5623835'; % Taxonomicon
metaData.links.id_WoRMS = '1419317'; % WoRMS
metaData.links.id_fishbase = 'Pseudoplatystoma-punctifer'; % fishbase

%% ReferenPseudoplatystoma_fasciatumces
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Pseudoplatystoma_punctifer}}';  
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
bibkey = 'ArmaGarc2022'; type = 'Article'; bib = [ ...
'doi = {10.1590/1982-0224-2021-0099}, ' ...
'author = {Maricell Armas and Carmen Garc\''{i}a-D\''{a}vila and Jean-Fran\c{c}ois Renno and Hern\''{a}n Ortega and Aurea Garc\''{i}a-Vasquez and Gladys Vargas and Jesus Nu\~{n}ez and Fabrice Duponchelle}, ' ...
'year = {2022}, ' ...
'title = {Age validation and contrasted growth performances of \emph{Pseudoplatystoma punctifer} ({S}iluriformes: {P}imelodidae) in two river systems of the {W}estern {A}mazon}, ' ... 
'journal = {Neotrop. ichthyol.}, ' ...
'volume = {20(01)}, '...
'pages = {13-34}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Pseudoplatystoma-punctifer.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

