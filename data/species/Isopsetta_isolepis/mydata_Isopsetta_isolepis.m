function [data, auxData, metaData, txtData, weights] = mydata_Isopsetta_isolepis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Pleuronectidae';
metaData.species    = 'Isopsetta_isolepis'; 
metaData.species_en = 'Butter sole'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jFe', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(4.7); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 08 20];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 20];

%% set data
% zero-variate data

data.ab = 24.5/24;    units.ab = 'd';  label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(4.7); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 11*365;    units.am = 'd';  label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(4.7); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 21;  units.Lp  = 'cm';  label.Lp  = 'length at puberty';  bibkey.Lp  = 'fishbase';
data.Li  = 55;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'fishbase';

data.Wwb = 5.4e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Forr1969';
  comment.Wwb = 'based on egg diameter 1.01 mm: pi/6*0.101^3';
data.Wwp = 114.5;  units.Wwp = 'g';   label.Wwp = 'wet weight puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00912*Lp^3.10, see F1';
data.Wwi = 2.3e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00912*Li^3.10, see F1';
  
data.Ri  = 1e6/365; units.Ri  = '#/d'; label.Ri  = 'reprod rate';   bibkey.Ri  = 'Forr1969';   
  temp.Ri = C2K(4.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-length
data.tL_fm = [ ... % yr class (yr), total length (cm)
 1  6.45  6.04
 2 13.49 12.89
 3 19.61 18.78
 4 24.46 23.26
 5 28.01 26.27
 6 31.09 28.56
 7 32.92 30.90 
 8 33.74 32.33
 9 34.11 33.63
10 34.79 NaN
11 35.89 NaN];
data.tL_fm(:,1) = 365 * (0+data.tL_fm(:,1)); 
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time', 'total length', 'female'};  
temp.tL_fm = C2K(4.7); units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'Kutt1963'; treat.tL_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.ab = 0 * weights.ab;

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
% set1 = {'tL_f', 'tL_m'};  subtitle1 = {'Data for female, male'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'tL data suggests that food density increases with age, which has been implemented';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight Ww in g = 0.00912*(TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6MZQZ'; % Cat of Life
metaData.links.id_ITIS = '172919'; % ITIS
metaData.links.id_EoL = '46570156'; % Ency of Life
metaData.links.id_Wiki = 'Isopsetta_isolepis'; % Wikipedia
metaData.links.id_ADW = 'Isopsetta_isolepis'; % ADW
metaData.links.id_Taxo = '177583'; % Taxonomicon
metaData.links.id_WoRMS = '281189'; % WoRMS
metaData.links.id_fishbase = 'Isopsetta-isolepis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Isopsetta_isolepis}}';
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
bibkey = 'Kutt1963'; type = 'phdthesis'; bib = [ ... 
'author = {Madasseri Krishnan Kutty}, ' ... 
'year = {1963}, ' ...
'title = {An ecological study and theoretical considerations of butter sole (\emph{Isopsetts isolepis}) population in {H}ecate {S}trait}, ' ...
'school = {Univ of Britisch Colmbia}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Forr1969'; type = 'techreport'; bib = [ ... 
'author = {Forrester, C. R. F.}, ' ... 
'year = {1969}, ' ...
'title = {Life history information on some groundfish species}, ' ...
'institution = {Fisheries Research Board of Canada}, ' ...
'number = {technical report 105}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Isopsetta-isolepis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

