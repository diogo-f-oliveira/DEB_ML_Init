function [data, auxData, metaData, txtData, weights] = mydata_Pollachius_virens
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Gadidae';
metaData.species    = 'Pollachius_virens'; 
metaData.species_en = 'Saithe'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(6); % in K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'R_L'};  % tags for different types of zero-variate data
metaData.data_1     = {'t-L_f'}; % tags for different types of uni-variate data

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'}; 
metaData.date_subm = [2017 03 14]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University, Amsterdam'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 03 14]; 

%% set data
% zero-variate data
data.ab = 9;      units.ab = 'd';    label.ab = 'age at birth';                     bibkey.ab = 'fishbase';    
  temp.ab = C2K(9.4); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 4*365;  units.ap = 'd';    label.ap = 'age at puberty for female';        bibkey.ap = 'ICES'; 
  temp.ap = C2K(6); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 25*365;     units.am = 'd';    label.am = 'life span';                        bibkey.am = 'fishbase';  
  temp.am = C2K(6); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 39.1;   units.Lp = 'cm';   label.Lp = 'total length at puberty';          bibkey.Lp = 'fishbase';
data.Li = 130;    units.Li = 'cm';   label.Li = 'ultimate total length';            bibkey.Li = 'fishbase';

data.Wwb = 9e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1.15  mm: 4/3*pi*0.06^3';
data.Wwp = 543;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';           bibkey.Wwp = 'fishbase';  
  comment.Wwp = 'based on 0.0238 * Lp^2.7374, see F4';
data.Wwi = 32000; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';      bibkey.Wwi = 'fishbase';     
data.Ri = 2.6e6/365; units.Ri = '#/d';  label.Ri = 'reprod rate at 75 cm or 3.2 kg'; bibkey.Ri = 'Wiki';
  temp.Ri = C2K(6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data
% tL data for females
data.tL_1995 = [ ... % age (years) ~ Length (cm) 
0.988	14.359
2.010	27.050
3.010	36.616
4.021	46.529
4.988	56.442
5.999	65.140
7.020	72.625
8.019	79.067];
data.tL_1995(:,1) = 365 * data.tL_1995(:,1); % convert yr to d
units.tL_1995 = {'d', 'cm'}; label.tL_1995 = {'time since birth', 'total length'};  
temp.tL_1995 = C2K(6);  units.temp.tL_1995 = 'K'; label.temp.tL_1995 = 'temperature';
bibkey.tL_1995 = 'BollRijn2004';
comment.tL_1995 = 'Data for catches during 1995-1999 in the North Sea';
%
data.tL_1200 = [ ... % age (years), Length (cm)     
0.988	17.136
2.022	29.826
2.989	39.913
4.011	51.041
5.022	62.516
5.978	70.520
7.021	77.657
8.031	84.621];
data.tL_1200(:,1) = 365 * data.tL_1200(:,1); % convert a to d
units.tL_1200 = {'d', 'cm'}; label.tL_1200 = {'time since birth', 'total length'};  
temp.tL_1200 = C2K(6);  units.temp.tL_1200 = 'K'; label.temp.tL_1200 = 'temperature';
bibkey.tL_1200 = 'BollRijn2004';
comment.tL_1200 = 'Data for catches during 1200-1400 in the North Sea';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.kap = 5 * weights.psd.kap;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_1995','tL_1200'}; subtitle1 = {'Data for 1995, 1200'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'FEMALE total length at maturity is decreasing over time: we chose lowest in North Sea dataset (2008)';
D2 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1,'D2',D2);

%% Facts
F1 = 'Preferred temperature 6 C';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Females are slightly larger than males and mature later, but differences are small';
metaData.bibkey.F2 = 'ICES'; 
F3 = 'Semi-pelagic species that is not bound to a demersal life style';
metaData.bibkey.F3 = 'ICES'; 
F4 = 'Length-Weight relationship: W in g = 0.0238 * (L in cm)^2.7374';
metaData.bibkey.F4 = 'ICES'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4);

%% Links
metaData.links.id_CoL = '4KYQ9'; % Cat of Life
metaData.links.id_ITIS = '164727'; % ITIS
metaData.links.id_EoL = '46564428'; % Ency of Life
metaData.links.id_Wiki = 'Pollachius_virens'; % Wikipedia
metaData.links.id_ADW = 'Pollachius_virens'; % ADW
metaData.links.id_Taxo = '92961'; % Taxonomicon
metaData.links.id_WoRMS = '126441'; % WoRMS
metaData.links.id_fishbase = 'Pollachius-virens'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pollachius_virens}}';
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
bibkey = 'BollRijn2004'; type = 'article'; bib = [ ...
'author = {L. J. Bolle and A. D. Rijnsdorp and W. van Neer and R. S. Millner and P. I. van Leeuwen and A. Ervynck and R. Ayers and E. Ongenae}, ' ... 
'year   = {2004}, ' ...
'title  = {Growth changes in plaice, cod, haddock and saithe in the {N}orth {S}ea: a comparison of (post-)medieval and present-day growth rates based on otolith measurements}, ' ...
'journal = {Journal of Sea Research}, ' ...
'page = {313-328}, ' ...
'volume = {51}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/1343}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ICES'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.ices.dk/explore-us/projects/EU-RFP/EU~Repository/ICES~FIshMap/ICES~FishMap species~factsheet-Saithe.pdf}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

