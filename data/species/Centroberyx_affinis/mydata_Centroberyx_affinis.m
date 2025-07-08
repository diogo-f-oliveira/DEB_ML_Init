function [data, auxData, metaData, txtData, weights] = mydata_Centroberyx_affinis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Beryciformes'; 
metaData.family     = 'Berycidae';
metaData.species    = 'Centroberyx_affinis'; 
metaData.species_en = 'Redfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMpb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15.9); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 08 11];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 11];

%% set data
% zero-variate data

data.am = 69*365;    units.am = 'd';    label.am = 'life span';            bibkey.am = 'fishbase';   
  temp.am = C2K(15.9); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 22.5;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 51;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 7e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'LeisCars2000';
  comment.Wwb = 'based on egg diameter of 1.1 mm of Beryx_splendens: pi/6*0.11^3';
data.Wwp = 162.4;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01259*Lp^3.04, see F1';
data.Wwi = 1.95e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01259*Li^3.04, see F1; max published weight is 2 kg';

data.Ri = 2.6e5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
temp.Ri = C2K(15.9);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Beryx_splendens: 675e3*(51/70)^3';
  
% univariate data
% time-length
data.tL_fm = [ ... % time (yr), fork length (cm)
 3	15.551 15.025
 4	18.059 17.533
 5	19.778 19.120
 6	20.839 19.523
 7	22.163 20.978
 8	22.829 21.776
 9	23.232 22.048
10	24.029 22.451
11	24.696 21.801
12	24.441 21.941
13	24.844 22.607
14	25.115 23.141
15	25.781 23.808
16	25.921 23.816];
data.tL_fm(:,1) = 365 * (1.2+data.tL_fm(:,1)); % convert yr to d
data.tL_fm(:,2) = 1.16 * data.tL_fm(:,2); % convert FL to TL, see F2
units.tL_fm  = {'cm', 'cm'};  label.tL_fm = {'time since birth', 'fork length'};  
temp.tL_fm   = C2K(15.9);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'MoriRowl2001'; treat.tL_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {''}; subtitle1 = {''};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'I had to add 1 yr to age estimates in tL data to arrive at a good fit';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: W in g = 0.01259*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'from photo: TL = 1.16 * FL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'S9G6'; % Cat of Life
metaData.links.id_ITIS = '622131'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Centroberyx_affinis'; % Wikipedia
metaData.links.id_ADW = 'Centroberyx_affinis'; % ADW
metaData.links.id_Taxo = '166677'; % Taxonomicon
metaData.links.id_WoRMS = '276891'; % WoRMS
metaData.links.id_fishbase = 'Centroberyx-affinis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Centroberyx_affinis}}';
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
bibkey = 'MoriRowl2001'; type = 'Article'; bib = [ ... 
'author = {A. K. Morison and K. R. Rowling}, ' ... 
'year = {2001}, ' ...
'title = {Age, growth and mortality of redfish \emph{Centroberyx affinis}}, ' ...
'journal = {Marine Freshwater Research}, ' ...
'volume = {52}, ' ...
'pages = {637–649}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Centroberyx-affinis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

